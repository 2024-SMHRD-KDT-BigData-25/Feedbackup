<!DOCTYPE html>
<html>
<head>
<title>Simple TTS & STT</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#text {
	width: 900px;
	height: 400px;
	padding: 10px;
	font-size: 16px;
	box-sizing: border-box;
	resize: none;
}

#upload {
	margin-top: 20px;
}

#audioControls {
	margin-top: 20px;
}
</style>
</head>
<body>
	<h1>TTS & STT PAGE</h1>
	<!-- TTS Section -->
	<div>
		<h2>TTS Section</h2>
		<label for="text">Text:</label>
		<textarea id="text" name="text"></textarea>
		<button id="playButton">Play</button>
		<button id="saveButton">Save</button>
		<br>
		<audio id="ttsAudio" controls></audio>
	</div>

	<!-- Recording Section -->
	<div>
		<h2>Recording Section</h2>
		<button id="startRecordingButton">Start Recording</button>
		<button id="stopRecordingButton" disabled>Stop Recording</button>
		<audio id="recordedAudio" controls></audio>
		<button id="sendRecordedAudioButton" disabled>Send Recorded
			Audio to STT</button>
	</div>

	<!-- STT Section -->
	<div>
		<h2>STT Section</h2>
		<label for="audioFile">Upload Audio File:</label> <input type="file"
			id="audioFile" accept=".wav">
		<button id="sttButton">Convert to Text</button>
		<p>
			<b>STT Result:</b> <span id="sttResult"></span>
		</p>
		<p>
			<b>ANSWER Result:</b> <span id="answerResult"></span>
		</p>
	</div>


    <script>
        let mediaRecorder;
        let recordedChunks = [];

        $(document).ready(function() {
            // TTS Play Button
            $("#playButton").click(function() {
                var text = $("#text").val();
                if (text) {
                    var encodedText = encodeURIComponent(text);
                    var audioUrl = "http://localhost:5000/tts-server/api/infer-glowtts?text=" + encodedText;
                    $("#ttsAudio").attr("src", audioUrl); // TTS Audio 재생
                    $("#ttsAudio")[0].play();
                }
            });

            // TTS Save Button
            $("#saveButton").click(function() {
                var text = $("#text").val();
                if (text) {
                    var encodedText = encodeURIComponent(text);
                    var audioUrl = "http://localhost:5000/tts-server/api/infer-glowtts?text=" + encodedText;
                    var link = document.createElement("a");
                    link.href = audioUrl;
                    link.download = "audio.wav";
                    link.click();
                }
            });

            // STT Convert Button
            $("#sttButton").click(function() {
                var fileInput = $("#audioFile")[0];
                if (fileInput.files.length === 0) {
                    alert("Please upload an audio file.");
                    return;
                }

                var formData = new FormData();
                formData.append("file", fileInput.files[0]);

                // Send audio file to Flask STT server
                $.ajax({
                    url: "http://localhost:5001/stt", // STT Flask 서버 URL
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        if (response.text) {
                            $("#sttResult").text(response.text); // STT 결과 출력
                        } else {
                            $("#sttResult").text("Error: No text returned.");
                        }
                    
	                 
	                    if (response.similarity_score) {
	                        $("#answerResult").text(response.similarity_score); 
	                    } else {
	                        $("#answerResult").text("Error: No similarity score returned.");
	                    }
	                },
                    
                    error: function(xhr, status, error) {
                        $("#sttResult").text("Error: " + xhr.responseText);
                    }
                });
            });

            // Start Recording
            $("#startRecordingButton").click(function() {
                navigator.mediaDevices.getUserMedia({ audio: true })
                    .then(function(stream) {
                        mediaRecorder = new MediaRecorder(stream);
                        mediaRecorder.start();
                        recordedChunks = [];

                        mediaRecorder.ondataavailable = function(event) {
                            if (event.data.size > 0) {
                                recordedChunks.push(event.data);
                            }
                        };

                        mediaRecorder.onstop = function() {
                            const blob = new Blob(recordedChunks, { type: "audio/wav" });
                            const audioUrl = URL.createObjectURL(blob);
                            $("#recordedAudio").attr("src", audioUrl);
                            $("#sendRecordedAudioButton").prop("disabled", false);
                            $("#recordedAudio")[0].load();
                        };

                        $("#startRecordingButton").prop("disabled", true);
                        $("#stopRecordingButton").prop("disabled", false);
                    })
                    .catch(function(error) {
                        console.error("Error accessing microphone:", error);
                        alert("Could not access microphone.");
                    });
            });

            // Stop Recording
            $("#stopRecordingButton").click(function() {
                if (mediaRecorder) {
                    mediaRecorder.stop();
                }

                $("#startRecordingButton").prop("disabled", false);
                $("#stopRecordingButton").prop("disabled", true);
            });

            // Send Recorded Audio to STT
            $("#sendRecordedAudioButton").click(function() {
                const blob = new Blob(recordedChunks, { type: "audio/wav" });
                const formData = new FormData();
                formData.append("file", blob, "recorded_audio.wav");

                // Send audio blob to Flask STT server
                $.ajax({
                    url: "http://localhost:5001/stt", // STT Flask 서버 URL
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        if (response.text) {
                            $("#sttResult").text(response.text); // STT 결과 출력
                        } else {
                            $("#sttResult").text("Error: No text returned.");
                        }
                    },
                    error: function(xhr, status, error) {
                        $("#sttResult").text("Error: " + xhr.responseText);
                    }
                });
            });
        });
    </script>
</body>
</html>
</body>
</html>
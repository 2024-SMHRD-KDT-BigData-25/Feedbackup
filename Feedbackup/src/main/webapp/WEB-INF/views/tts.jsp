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

    <!-- STT Section -->
    <div>
        <h2>STT Section</h2>
        <label for="audioFile">Upload Audio File:</label>
        <input type="file" id="audioFile" accept=".wav">
        <button id="sttButton">Convert to Text</button>
        <p><b>STT Result:</b> <span id="sttResult"></span></p>
    </div>

    <script>
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
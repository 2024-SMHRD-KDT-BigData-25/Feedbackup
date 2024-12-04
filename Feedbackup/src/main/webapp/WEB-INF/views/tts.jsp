<!DOCTYPE html>
<html>
<head>
    <title>Simple TTS</title>
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
    </style>
</head>
<body>
    <h1>Simple TTS Interface</h1>
    <div>
        <label for="text">Text:</label>
        <textarea id="text" name="text"></textarea>
        <button id="playButton">Play</button>
        <button id="saveButton">Save</button>
    </div>
    <div>
        <audio id="audio" controls></audio>
    </div>
    <script>
        $(document).ready(function() {
            $("#playButton").click(function() {
                var text = $("#text").val();
                if (text) {
                    var encodedText = encodeURIComponent(text);
                    var audioUrl = "http://localhost:5000/tts-server/api/infer-glowtts?text=" + encodedText;
                    $("#audio").attr("src", audioUrl);
                    $("#audio")[0].play();
                }
            });

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
        });
    </script>
</body>
</html>
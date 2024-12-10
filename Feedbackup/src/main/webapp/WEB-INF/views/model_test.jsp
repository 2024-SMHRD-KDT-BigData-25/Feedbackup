<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>음성 및 비디오 캡처</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	text-align: center;
	margin-top: 50px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

#webcamContainer {
	width: 640px;
	height: 480px;
	position: relative;
	margin-bottom: 20px;
}

video {
	width: 100%;
	height: 100%;
	border: 2px solid #ccc;
	transform: scaleX(-1); /* 좌우 반전 */
}

.result {
	margin-top: 20px;
}

#captureBtn {
	margin-top: 20px;
}
</style>
<script src="/js/app3.js" defer></script>
<!-- 외부 스크립트 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>음성 및 비디오 캡처</h1>

	<!-- 웹캠 화면을 담을 div -->
	<div id="webcamContainer">
		<video id="webcam" autoplay></video>
	</div>

	<button id="captureBtn">음성 분석 시작</button>

	<div class="result">
		<h3>분석 결과:</h3>
		<p>
			<strong>변환된 텍스트:</strong> <span id="recognizedText"></span>
		</p>
		<p>
			<strong>평균 피치 (Hz):</strong> <span id="averagePitch"></span>
		</p>
		<p>
			<strong>상대적 떨림 (ΔF/F):</strong> <span id="relativeTremor"></span>
		</p>
		<p>
			<strong>머리를 만진 횟수:</strong> <span id="hairTouchCount">0번</span>
		</p>
		<p>
			<strong>코를 만진 횟수:</strong> <span id="noseTouchCount">0번</span>
		</p>
	</div>

	<script>
 // 웹캠 스트림 가져오기
    const webcam = document.getElementById("webcam");
    const captureBtn = document.getElementById("captureBtn");

    let audioStream = null;

    // 페이지 로드 시 자동으로 웹캠 시작
    window.onload = function() {
        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({ video: true, audio: true })
                .then(function(stream) {
                    webcam.srcObject = stream;
                    audioStream = stream; // 오디오 스트림도 저장
                })
                .catch(function(error) {
                    console.error("웹캠을 사용할 수 없습니다.", error);
                    alert("웹캠이나 마이크 권한을 허용해 주세요.");
                });
        } else {
            console.error("getUserMedia가 지원되지 않습니다.");
            alert("이 브라우저에서는 웹캠을 사용할 수 없습니다.");
        }
    };

    let isRecording = false;
    let mediaRecorder;
    let chunks = [];
    let motionDetectionInterval = null;

    // 음성 녹음 및 동작 인식 시작/중지
    captureBtn.addEventListener("click", function () {
        if (!isRecording) {
            // 녹음 시작
            if (!audioStream) {
                alert("웹캠이나 마이크를 사용할 수 없습니다.");
                return;
            }

            chunks = [];
            mediaRecorder = new MediaRecorder(audioStream);

            mediaRecorder.ondataavailable = function (e) {
                chunks.push(e.data);
            };

            mediaRecorder.onstop = function () {
                const blob = new Blob(chunks, { type: "audio/wav" });
                const file = new File([blob], "captured_audio.wav", { type: "audio/wav" });

                const formData = new FormData();
                formData.append("audio", file);

                fetch("/start_capture", {
                    method: "POST",
                    body: formData,
                })
                .then(response => response.json())
                .then(data => {
                    document.getElementById("recognizedText").textContent = data.recognized_text || "음성 분석 실패";
                    document.getElementById("averagePitch").textContent = data.average_pitch ? data.average_pitch.toFixed(2) : "N/A";
                    document.getElementById("relativeTremor").textContent = data.relative_tremor ? data.relative_tremor.toFixed(4) : "N/A";
                })
                .catch(error => {
                    console.error("Error:", error);
                    document.getElementById("recognizedText").textContent = "음성 분석 실패";
                    document.getElementById("averagePitch").textContent = "N/A";
                    document.getElementById("relativeTremor").textContent = "N/A";
                });
            };

            mediaRecorder.start(); 
            startMotionDetection(); 
            captureBtn.textContent = "녹음 중지 및 분석";
            isRecording = true;
        } else {
            // 녹음 중지
            if (mediaRecorder && mediaRecorder.state !== "inactive") {
                mediaRecorder.stop();
            }
            stopMotionDetection();
            captureBtn.textContent = "음성 분석 시작";
            isRecording = false;
        }
    });


        // 동작 인식 결과 처리
        function startMotionDetection() {
            if (motionDetectionInterval) {
                console.log("동작 인식이 이미 실행 중입니다.");
                return; // 이미 실행 중인 경우 아무 작업도 하지 않음
            }

            motionDetectionInterval = setInterval(() => {
                const video = document.getElementById("webcam");
                const canvas = document.createElement("canvas");
                const context = canvas.getContext("2d");

                canvas.width = video.videoWidth;
                canvas.height = video.videoHeight;
                context.drawImage(video, 0, 0, canvas.width, canvas.height);

                canvas.toBlob((blob) => {
                    const formData = new FormData();
                    formData.append("frame", blob);

                    fetch("/process_frame", { method: "POST", body: formData })
                        .then((response) => response.json())
                        .then((data) => {
                            console.log("서버 응답:", data);

                            // 분석 결과 업데이트
                            document.getElementById("hairTouchCount").textContent = `${data.hair_touch_count}번`;
                            document.getElementById("noseTouchCount").textContent = `${data.nose_touch_count}번`;
                        })
                        .catch((error) => console.error("프레임 처리 오류:", error));
                }, "image/jpeg");
            }, 1000); // 1초마다 실행
        }


        // 동작 인식 중지
        function stopMotionDetection() {
            if (motionDetectionInterval) {
                clearInterval(motionDetectionInterval);
                motionDetectionInterval = null; // 상태 초기화
                console.log("동작 인식이 중지되었습니다.");
            }
        }

    </script>

</body>
</html>

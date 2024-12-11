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
</head>
<body>
	<h1>음성 및 비디오 캡처</h1>

	<!-- 웹캠 화면을 담을 div -->
	<div id="webcamContainer">
		<video id="webcam" autoplay></video>
	</div>

	<button id="captureBtn">음성 분석 시작</button>

	<div class="result" hidden>
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
		<!-- hairTouchCount ID -->
		<p>
			<strong>코를 만진 횟수:</strong> <span id="noseTouchCount">0번</span>
		</p>
		<!-- noseTouchCount ID -->
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
    
        let isRecording = false; // 음성 녹음 상태
        let mediaRecorder;
        let chunks = [];
        let motionDetectionInterval = null; // 동작 인식 실행 간격 저장 변수
        
        let lastHairTouchCount = 0;  // 전역 변수로 선언
        let lastNoseTouchCount = 0;  // 전역 변수로 선언
        
     	// 버튼 클릭 시 음성 분석 및 동작 인식 시작/중지
		captureBtn.addEventListener("click", function () {
		    console.log("버튼 클릭됨. 현재 녹음 상태:", isRecording);
		    if (!isRecording) {
		        // 녹음 시작 전 카운트 초기화
		        document.getElementById("hairTouchCount").textContent = "0번";
		        document.getElementById("noseTouchCount").textContent = "0번";
		        lastHairTouchCount = 0;
		        lastNoseTouchCount = 0;
                console.log("녹음을 시작합니다.");
                // 녹음을 시작하려는 경우
                if (!audioStream) {
                    alert("웹캠이나 마이크를 사용할 수 없습니다.");
                    return;
                }

                // 녹음 준비
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

                    // 서버로 음성 데이터 전송
                    fetch("http://localhost:5700/start_capture", {
                        method: "POST",
                        body: formData,
                    })
                    .then((response) => {
                        if (!response.ok) {
                            throw new Error("서버 오류");
                        }
                        return response.json();
                    })
                    .then((data) => {
                        console.log("서버 응답:", data);
                        // 음성 분석 결과 출력
                        if (data.recognized_text) {
                            document.getElementById("recognizedText").textContent = data.recognized_text;
                        } else {
                            document.getElementById("recognizedText").textContent = "음성 분석 실패";
                        }
                        document.getElementById("averagePitch").textContent =
                            data.average_pitch ? data.average_pitch.toFixed(2) : "N/A";
                        document.getElementById("relativeTremor").textContent =
                            data.relative_tremor ? data.relative_tremor.toFixed(4) : "N/A";
                       
                       // 결과 저장
                       saveResults();
                    })
                    .catch((error) => {
                        console.error("Error:", error);
                        document.getElementById("recognizedText").textContent = "음성 분석 실패";
                        document.getElementById("averagePitch").textContent = "N/A";
                        document.getElementById("relativeTremor").textContent = "N/A";
                    });
                };

                mediaRecorder.start(); // 녹음 시작
                startMotionDetection(); // 동작 인식 시작
                
             	// 머리 만진 횟수와 코 만진 횟수 초기화
                lastHairTouchCount = 0; // 머리 만진 횟수 초기화
                lastNoseTouchCount = 0; // 코 만진 횟수 초기화

                captureBtn.textContent = "녹음 중지 및 분석"; // 버튼 텍스트 변경
                isRecording = true;
            
            } else {
                console.log("녹음을 중지합니다.");
                // 녹음을 중지하려는 경우
                if (mediaRecorder && mediaRecorder.state !== "inactive") {
                    mediaRecorder.stop(); // 녹음 중지
                }
                stopMotionDetection(); // 동작 인식 중지
                captureBtn.textContent = "음성 분석 시작"; // 버튼 텍스트 복원
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

                    fetch("http://localhost:5700/process_frame", { method: "POST", body: formData })
                        .then((response) => response.json())
                        .then((data) => {
                            console.log("서버 응답:", data);
                            
                            // 분석 결과 업데이트
                            document.getElementById("hairTouchCount").textContent = `${data.hair_touch_count}번`;
                            document.getElementById("noseTouchCount").textContent = `${data.nose_touch_count}번`;

                            // 마지막 값을 저장 (분석 종료 시 이 값만 필요)
                            lastHairTouchCount = data.hair_touch_count;
                            lastNoseTouchCount = data.nose_touch_count;
                        })
                        .catch((error) => console.error("프레임 처리 오류:", error));
                }, "image/jpeg");
            }, 1000); // 1초마다 실행
        }
        
     // 동작 인식 중지 및 값 초기화
        function stopMotionDetection() {
            if (motionDetectionInterval) {
                clearInterval(motionDetectionInterval);
                motionDetectionInterval = null; // 상태 초기화
                console.log("동작 인식이 중지되었습니다.");
                
                // 동작 인식 값을 초기화
                document.getElementById("hairTouchCount").textContent = "0번";
                document.getElementById("noseTouchCount").textContent = "0번";
                
                // 초기화된 값으로 서버로 데이터 보내기
                fetch("http://localhost:5700/reset_touch_counts", { method: "POST" })
                    .then((response) => response.json())
                    .then((data) => {
                        console.log("서버에서 초기화된 데이터:", data);
                    })
                    .catch((error) => console.error("초기화 오류:", error));
            }
        }

     // 결과 저장 및 초기화 함수
        function saveResults() {
            // 현재 분석 결과 가져오기
            const hairTouchCount = lastHairTouchCount;
            const noseTouchCount = lastNoseTouchCount;
            const recognizedText = document.getElementById("recognizedText").textContent;
            const averagePitch = parseFloat(document.getElementById("averagePitch").textContent) || 0;
            const relativeTremor = parseFloat(document.getElementById("relativeTremor").textContent) || 0;

            // 결과 저장 (로컬 스토리지 또는 서버)
            const result = {
                hairTouchCount,
                noseTouchCount,
                recognizedText,
                averagePitch,
                relativeTremor,
                timestamp: new Date().toISOString(),
            };

            // 서버에 저장
            fetch("http://localhost:5700/save_results", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(result),
            })
            .then((response) => {
                if (!response.ok) throw new Error("서버 저장 오류");
                return response.json();
            })
            .then((data) => {
                console.log("서버에 저장 완료:", data);
                // 값 초기화
                resetTouchCounts();
            })
            .catch((error) => console.error("결과 저장 중 오류:", error));
        }

        // 초기화 함수
        function resetTouchCounts() {
            lastHairTouchCount = 0;
            lastNoseTouchCount = 0;
            document.getElementById("hairTouchCount").textContent = "0번";
            document.getElementById("noseTouchCount").textContent = "0번";
            console.log("결과가 초기화되었습니다.");
        }
    </script>

</body>
</html>

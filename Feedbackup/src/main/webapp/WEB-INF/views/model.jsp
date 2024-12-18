<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Real_Interview</title>
<style>
    @font-face {
    font-family: 'SUIT-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
    }

    body {
        background-color: #FFFFFF;
        font-family: 'SUIT-Regular';
        align-content: center;
    }

  .top_btn {
    display: flex;
    justify-content: space-between;
    width: 850px;
    padding: 20px 0px;
    box-sizing: border-box;
    margin: 0px auto;
  }

  .top_btn .btn1 {
    border: 1px solid #D4C5FF;
    background-color: transparent;
    border-radius: 20px;
    padding: 10px 20px;
    font-size: 14px;
    font-weight: bold;
    color: #8071FC;
    cursor: pointer;
  }

  .top_btn .btn2 {
    border: 1px solid #D4C5FF;
    background-color: #8071FC;
    border-radius: 20px;
    padding: 10px 30px;
    font-size: 14px;
    font-weight: bold;
    color: #FFFFFF;
    cursor: pointer;
  }

  .top_btn .btn1:hover {
    background-color: #8071FC;
    color: #FFFFFF;
  }

  .top_btn .btn2:hover {
    background-color: #FFFFFF;
    color: #8071FC;
  }

  .title {
    text-align: center;
    font-weight: bold;
    font-size: 18px;
    color: #6C63FF;
  }

  .title img{
    width: 140px;
    height: auto; ;
  }

  .title_text {
    margin-top: 0px;
    margin-bottom: 20px;
    text-align: center;
    color: #64748B;
    font-size: 20px;
  }

  .content {
    text-align: center;
  }

  .content img {
    width: 850px; 
    height: auto;
  }

  .button-container {
    margin-top: 10px;
  }

  .button-container button {
    background-color: #6C63FF;
    color: white;
    border: none;
    padding: 15px 40px;
    border-radius: 25px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
  }

  .button-container button:hover {
    background-color: #554DBF;
  }
  
  .info {
	  position: absolute;
	  top: 26%; /* 사진 기준으로 위치 */
	  right: 17%;
	  transform: translate(-50%, -50%);
	  background-color: #ECEAFF;
	  color: #6C63FF;
	  font-size: 12px;
	  padding: 8px 15px;
	  border-radius: 20px;
	  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	}
	
	.recording-bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: white;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  border-radius: 50px;
  padding: 10px 20px;
  width: 80%;
  max-width: 400px;
  position: fixed;
  bottom: 45px;
  left: 540px;
}

.recording-bar .status {
  display: flex;
  align-items: center;
  gap: 10px;
}

.recording-bar .status .icon {
  width: 15px;
  height: 15px;
  background-color: red;
  border-radius: 50%;
}

.recording-bar .status .text {
  font-size: 14px;
  color: #6C63FF;
  font-weight: bold;
}

.recording-bar .waveform {
  display: flex;
  align-items: center;
  gap: 3px;
}

.recording-bar .waveform div {
  width: 4px;
  height: 15px;
  background-color: #D4C5FF;
  animation: wave 1.2s infinite ease-in-out;
  border-radius: 2px;
}

.recording-bar .waveform div:nth-child(2) {
  animation-delay: -1.1s;
}

.recording-bar .waveform div:nth-child(3) {
  animation-delay: -1s;
}

.recording-bar .waveform div:nth-child(4) {
  animation-delay: -0.9s;
}

.recording-bar .waveform div:nth-child(5) {
  animation-delay: -0.8s;
}

.recording-bar .waveform div:nth-child(6) {
  animation-delay: -0.7s;
}

.recording-bar .waveform div:nth-child(7) {
  animation-delay: -0.6s;
}

.recording-bar .waveform div:nth-child(8) {
  animation-delay: -0.5s;
}

.recording-bar .waveform div:nth-child(9) {
  animation-delay: -0.4s;
}

.recording-bar .waveform div:nth-child(10) {
  animation-delay: -0.3s;
}

.recording-bar .waveform div:nth-child(11) {
  animation-delay: -0.2s;
}

.recording-bar .waveform div:nth-child(12) {
  animation-delay: -0.1s;
}

.recording-bar .waveform div:nth-child(13) {
  animation-delay: 0s;
}

@keyframes wave {
  0%, 100% {
    height: 5px;
  }
  50% {
    height: 15px;
  }
}

.recording-bar button {
  background-color: #6C63FF;
  color: white;
  border: none;
  border-radius: 20px;
  padding: 10px 20px;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
}

.recording-bar button:hover {
  background-color: #554DBF;
}

<!-- 추가 --!>
#webcamContainer {
	width: 640px;
	height: 480px;
	position: relative;
	margin-bottom: 20px;
}
video {
	width: 50%;
	height: 50%;
	border: 2px solid #ccc;
	transform: scaleX(-1); /* 좌우 반전 */
}
#captureBtn {
	margin-top: 20px;
}

</style>
<script>
    // JavaScript를 사용하여 페이지를 변경
    function startInterview() {
        const body = document.body;

        // 새로운 페이지 컨텐츠 HTML
        const newContent = `
          <div class="top_btn">
            <button class="btn1">질문 다시 듣기</button>
          </div>
          <div class="title"><img src="img/feedbackup.png"></div>
          <div class="title_text">AI 면접 연습</div>
          <div class="content">
	          <!-- 웹캠 화면을 담을 div -->
		      	<div id="webcamContainer">
		      		<video id="webcam" autoplay></video>
		      	</div>
            <div class="info">본 질문은 삼성전자 기출 질문입니다.</div>
          </div>
          <div class="recording-bar">
            <div class="status">
              <div class="icon"></div>
              <div class="text">녹음중</div>
            </div>
            <div class="waveform">
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
            </div>
            <button id="captureBtn">시작하기</button>
          </div>
        `;

        // 페이지를 새로 작성
        body.innerHTML = newContent;
    }

<!-- 기능 관련 따로 빼놓기 -->

        // 웹캠 스트림 가져오기
        const webcam = document.getElementById("webcam");

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

                captureBtn.textContent = "분석하기"; // 버튼 텍스트 변경
                isRecording = true;
            
            } else {
                console.log("녹음을 중지합니다.");
                // 녹음을 중지하려는 경우
                if (mediaRecorder && mediaRecorder.state !== "inactive") {
                    mediaRecorder.stop(); // 녹음 중지
                }
                stopMotionDetection(); // 동작 인식 중지
                captureBtn.textContent = "시작하기"; // 버튼 텍스트 복원
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
</head>
<body>
  <div class="top_btn">
    <button class="btn1">질문 다시 듣기</button>
    <button class="btn2">나가기</button>
  </div>
  <div class="title"><img src="img/feedbackup.png"></div>
  <div class="title_text">AI 면접 연습</div>
  <div class="content">
    <!-- 웹캠 화면을 담을 div -->
	<div id="webcamContainer">
		<video id="webcam" autoplay></video>
	</div>
    <div class="button-container">
      <button onclick="startInterview()">시작하기</button>
    </div>
  </div>
<script>
//웹캠 스트림 가져오기
const webcam = document.getElementById("webcam");
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
</script>
</body>
</html>
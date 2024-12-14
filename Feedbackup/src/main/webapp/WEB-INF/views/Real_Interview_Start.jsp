<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Real_Interview_Start</title>
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

.top_btn .btn1:hover {
  background-color: #8071FC;
  color: #FFFFFF;
}

.title {
  text-align: center;
  font-weight: bold;
  font-size: 18px;
  color: #6C63FF;
}

  .title img{
    width: 140px;
    height: auto;
    margin-top: 50px;
  }

  .title_text {
    margin-top: 0px;
    margin-bottom: 50px;
    text-align: center;
    color: #64748B;
    font-size: 20px;
  }

.content {
  position: relative;
  width: 100%;
  height: auto;
  display: flex;
  justify-content: center;
  align-items: center;
}

.info {
    position: absolute;
    top: -5%;
    right: 20.5%;
    transform: translate(-50%, -50%);
    color: #6C63FF;
    font-size: 12px;
    padding: 8px 15px;
}

.recording-bar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: white;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 50px;
    padding: 10px 20px;
    width: 15%;
    max-width: 400px;
    position: fixed;
    bottom: 105px;
    left: 630px;
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

.recording{
 flex: display;
 flex-direction: row;
}

.recording button {
  background-color: #6C63FF;
  color: white;
  border: none;
  border-radius: 20px;
  padding: 10px 20px;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
}
.recording-bar .text {
  font-size: 14px;
  color: #6C63FF;
  font-weight: bold;
}

<!-- 모달 관련 --!>

/* 로딩 컨테이너 */
.loading-container {
    position: relative; /* 내부 자식 요소의 기준점 */
    width: 100%; /* 부모 크기에 맞춤 */
    height: 120px; /* 고정 크기 설정 */
    margin-top: 20px;
}

/* 회전하는 테두리 */
.rotating-border {
    position: absolute; /* loading-container 기준 */
    top: 5%; /* 부모 기준 중앙 */
    left: 39.5%; /* 부모 기준 중앙 */
    transform: translate(-50%, -50%);
    width: 100px;
    height: 100px;
    border-radius: 50%;
    border: 3px solid #D9D9D9;
    border-top: 6px solid #8071FC;
    animation: spin 1.2s linear infinite;
    z-index: 1;
}

/* 고정된 이미지 */
.static-image {
    position: absolute; /* 부모 기준으로 위치 설정 */
    top: 50%; /* 부모 기준 중앙 */
    left: 50%; /* 부모 기준 중앙 */
    transform: translate(-50%, -50%);
    width: 70px;
    height: 70px;
    background-color: #fff;
    border-radius: 50%;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
}

.static-image img {
   width: 100%;
   height: 100%;
   object-fit: cover;
}

@keyframes spin {
       0% {
           transform: rotate(0deg);
       }
       100% {
           transform: rotate(360deg);
       }
   }

/* 모달 배경 */
.modal {
   position: absolute;
   display: none;
   position: fixed;
   z-index: 1;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgb(0, 0, 0);
   background-color: rgba(0, 0, 0, 0.4);
}
/* 모달 콘텐츠 */
.modal-content {
   background-color: #fefefe;
   margin: 11% auto;
   padding: 20px;
   border: 1px solid #888;
   width: 500px;
   height: 250px;
   text-align: center;
   border: 2px solid #8071FC;
   border-radius: 30px;
}
/* 확인 버튼 */
.btn {
  border: 1px solid #D4C5FF;
  background-color: transparent;
  border-radius: 20px;
  padding: 10px 20px;
  font-size: 20px;
  font-weight: bold;
  color: #8071FC;
  cursor: pointer;
}

.btn:hover, .close:focus {
  background-color: #8071FC;
  color: #FFFFFF;
}


</style>
</head>
<body>
  <div class="title"><img src="../img/feedbackup.png"></div>
  <div class="title_text">AI 면접 연습</div>
  <div class="content">
    <!-- 웹캠 화면을 담을 div -->
	<div id="webcamContainer">
		<video id="webcam" autoplay></video>
		<div class="info">본 질문은 실제 ${jobCode} 기출 질문입니다.</div>
	</div>
	<div>
	
    </div>
  </div>
  <div class="recording-bar" style="display: none;">
    <div class="status" id="status" style="display: none;">
      <div class="icon" id="icon" style="display: none;"></div>
    </div>
      <div class="text" align="center">녹음중 . . .</div>
    <div class="waveform" id="waveform" style="display: none;">
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
    </div>

    <div class="recording" align = center>
    <div class="top_btn">
		   <button class="btn1">다시 듣기</button>
		   <button id="captureBtn">시작하기</button>
		</div>
		<!-- 오디오 플레이어 (숨겨져 있음) -->
    <audio id="ttsAudio" style="display: none;"></audio>

    <!-- 버튼 -->
    <button id="playTTSButton" style="display: none;">Play TTS</button>
	</div>
    
   <div class="result" hidden>
		<h3>분석 결과:</h3>
		<p><strong>변환된 텍스트:</strong> <span id="recognizedText"></span></p>
		<p><strong>평균 피치 (Hz):</strong> <span id="averagePitch"></span></p>
		<p><strong>상대적 떨림 (ΔF/F):</strong> <span id="relativeTremor"></span></p>
		<p><strong>머리를 만진 횟수:</strong> <span id="hairTouchCount">0번</span></p>
		<p><strong>코를 만진 횟수:</strong> <span id="noseTouchCount">0번</span></p>
		<p><strong>유사도 분석:</strong> <span id="similarity_score"></span></p>
		<p><strong>속도 분석:</strong> <span id="speech_rate"></span><p>
	</div>
	
	<div id="resultModal" class="modal" hidden>
	    <div class="modal-content">
	        <div class="loading-container" style="position: relative; width: 100%; height: 120px; margin-top: 20px;">
	            <div class="rotating-border"></div>
	            <div class="static-image">
	                <img id="modalImage" src="../img/logo1.png" alt="로고">
	            </div>
	        </div>
	        <p id="modalMessage" class="modal_text">분석 중입니다...</p>
	        <button class="btn" id="btn_confirm">확인</button>
	    </div>
	</div>
	
	<div id="resultModal2" class="modal" hidden>
	    <div class="modal-content">
	        <div class="loading-container" style="position: relative; width: 100%; height: 120px; margin-top: 20px;">         
	            <div class="static-image">
	                <img id="modalImage" src="../img/check.png" alt="로고">
	            </div>
	        </div>
	        <p id="modalMessage" class="modal_text">분석이 완료되었습니다.</p>
	        <button class="btn" id="btn_confirm">확인</button>
	    </div>
	</div>
	
	<script>
        // 웹캠 스트림 가져오기
        const webcam = document.getElementById("webcam");
        const captureBtn = document.getElementById("captureBtn");
        const recordingBar = document.querySelector(".recording-bar");  // recordingBar 정의 추가      
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
        
        <% MavenMember member = (MavenMember) session.getAttribute("member"); %>
        
        const questionNumbers = ["${firstNumber}", "${secondNumber}", "${thirdNumber}"];
        const user_id = "<%=member.getUser_id() %>";
        
		// 버튼 클릭 시 음성 분석 및 동작 인식 시작/중지
		
		let executionCount = 0; // 실행 횟수를 추적하는 변수
		let analysisCompleted = false; // 분석 완료 여부를 추적하는 변수

		captureBtn.addEventListener("click", function () {
			console.log("버튼 클릭됨. 현재 녹음 상태:", isRecording);
		
		    if (!isRecording) {
		        // 녹음 시작 전 카운트 초기화
		        document.getElementById("hairTouchCount").textContent = "0번";
		        document.getElementById("noseTouchCount").textContent = "0번";
		        lastHairTouchCount = 0;
		        lastNoseTouchCount = 0;
		        console.log("녹음을 시작합니다.");
			
		        document.getElementById("playTTSButton").click();
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
		            formData.append("questionNumber", questionNumbers[executionCount]);
		            formData.append("user_id", user_id);
		            
		            // 서버로 음성 데이터 전송
		            fetch("http://localhost:5700/start_capture", {
		                method: "POST",
		                body: formData,
		            })
		            .then((response) => response.json())
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
		                if (data.similarity_score) {
			                document.getElementById("similarity_score").textContent = data.similarity_score;
			            } else {
			                document.getElementById("similarity_score").textContent = "답변 분석 실패";
			            }
		                document.getElementById("speech_rate").textContent =
		                	data.relative_tremor ? data.speech_rate : "N/A";
						
		                 // 분석 결과를 서버에 저장
		                 saveResults();
		           	})
		            .catch((error) => {
		                console.error("Error:", error);
		                document.getElementById("recognizedText").textContent = "음성 분석 실패";
		                document.getElementById("averagePitch").textContent = "N/A";
		                document.getElementById("relativeTremor").textContent = "N/A";
		                document.getElementById("similarity_score").textContent = "답변 분석 실패";
		                document.getElementById("speech_rate").textContent = "속도 분석 실패";d
		            });
		        };
		
		        mediaRecorder.start(); // 녹음 시작
		        startMotionDetection(); // 동작 인식 시작
		
		        recordingBar.style.display = "flex"; // .recording-bar 보이기
		        document.getElementById("status").style.display = "block"; // 상태 텍스트 보이기
		        document.getElementById("waveform").style.display = "flex"; // 웨이브폼 보이기
		        document.getElementById("icon").style.display = "flex";
		        
		        captureBtn.textContent = "답변 마치기"; // 버튼 텍스트 변경
		        isRecording = true;
		
		    } else {
		        // 음성 녹음을 중지하려는 경우
		        if (mediaRecorder && mediaRecorder.state !== "inactive") {
		            mediaRecorder.stop(); // 녹음 중지
		        }
		        stopMotionDetection(); // 동작 인식 중지
		        
		        openModal("resultModal")
		        recordingBar.style.display = "none";  // .recording-bar 숨기기
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

     // 분석 결과 저장 및 페이지 이동
        function saveResults() {
            const hairTouchCount = lastHairTouchCount;
            const noseTouchCount = lastNoseTouchCount;
            const recognizedText = document.getElementById("recognizedText").textContent;
            const averagePitch = parseFloat(document.getElementById("averagePitch").textContent) || 0;
            const relativeTremor = parseFloat(document.getElementById("relativeTremor").textContent) || 0;

            const similarity_score = document.getElementById("similarity_score").textContent;        
            const questionNumbers = ["${firstNumber}", "${secondNumber}", "${thirdNumber}"];
            const user_id = "<%=member.getUser_id() %>";
            const questionnumber = questionNumbers[executionCount];
            const table_name = ['ANALYSIS_Q1','ANALYSIS_Q2','ANALYSIS_Q3'];
            const table = table_name[executionCount];



			const speech_rate = document.getElementById("speech_rate").textContent;

            
            const result = {
                hairTouchCount,
                noseTouchCount,
                recognizedText,
                averagePitch,
                relativeTremor,
                timestamp: new Date().toISOString(),
                similarity_score,

                questionnumber,
                user_id,
                table,

                speech_rate

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
                
				openModal("resultModal2")
				
                
            })
            .catch((error) => console.error("결과 저장 중 오류:", error));
            
            // 서버에 저장
            fetch("http://localhost:5700/get_all", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(result),
            })
            .then((response) => {
                if (!response.ok) throw new Error("서버 저장 오류");
                return response.json();
            })
            .then((data) => {
                console.log("저장 값:", data);
                
				openModal("resultModal2")
				
           
                // 분석이 끝났으면 페이지 이동
                executionCount++;
                if (executionCount >= 3) {
                    window.location.href = "/myapp/users/Result"; // 원하는 페이지 URL로 변경
                }
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
        
     	// 질문 리스트와 인덱스 전역 정의
        const questions = ["${firstqText}", "${secondqText}", "${thirdqText}"];
        let currentIndex = 0;

        // TTS 버튼 클릭 이벤트 리스너
        document.getElementById("playTTSButton").addEventListener("click", function () {
            if (currentIndex < questions.length) {
            	currentIndex++;
                const textToConvert = questions[currentIndex-1];

                if (textToConvert) {
                    const encodedText = encodeURIComponent(textToConvert);
                    const ttsServerUrl = "http://localhost:5000/tts-server/api/infer-glowtts?text=" + encodedText;
                    const audioElement = document.getElementById("ttsAudio");

                    audioElement.src = ttsServerUrl;
                    audioElement.play()
                        .then(() => {
                            console.log(`TTS 재생 중: ${textToConvert}`);
                        })
                        .catch((error) => console.error("TTS 오디오 재생 실패:", error));
                } else {
                    console.error("변환할 텍스트가 비어 있습니다.");
                }
            } else {
                console.log("모든 문장이 재생되었습니다.");
            }
        });

        // '질문 다시 듣기' 버튼 클릭 이벤트 리스너
        document.querySelector(".btn1").addEventListener("click", function () {
            const audioElement = document.getElementById("ttsAudio");

            if (audioElement.src) {
                audioElement.play()
                    .then(() => console.log("TTS 오디오 재생이 시작되었습니다."))
                    .catch((error) => console.error("TTS 오디오 재생 실패:", error));
            } else {
                console.error("TTS 오디오 소스가 설정되지 않았습니다.");
            }
        });
        
        
        
        
            function closeAllModals() {
                const modals = document.querySelectorAll(".modal");
                modals.forEach(modal => {
                    modal.style.display = "none"; // 모든 모달 숨기기
                });
            }
            
            //모달 열기
            function openModal(modalId) {
                // 모든 모달 닫기
                  closeAllModals()

                // 해당 모달 요소 가져오기
                const modal = document.getElementById(modalId);
                if (!modal) {
                    console.error(`Modal with ID ${modalId} not found.`);
                    return;
                }

                // 모달 표시
                modal.style.display = "block";

                // 확인 버튼 동작 설정
                const confirmButton = modal.querySelector("#btn_confirm");
                if (confirmButton) {
                    confirmButton.onclick = function () {
                        modal.style.display = "none"; // 모달 닫기
                    };
                }

                // 모달 외부를 클릭해도 닫히도록 설정
                modal.addEventListener("click", function (event) {
                    if (event.target === modal) {
                        modal.style.display = "none";
                    }
                });
            }
            
         // DOMContentLoaded에서 초기화 작업
            document.addEventListener("DOMContentLoaded", function () {
                // 필요 시 여기에 초기화 작업 추가
        }); 
    </script>
	
</body>
</html>
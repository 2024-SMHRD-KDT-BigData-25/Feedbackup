<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>AI_Interview</title>
<style>
@font-face {
	font-family: 'SUIT-Regular';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body {
	background-color: #F1F5F9;
	font-family: 'SUIT-Regular';
	align-content: center;
}



.text1 {
	font-size: 26px;
	font-weight: bold;
	margin-top: 40px;
	margin-bottom: 70px;
	text-align: center;
}

.container {
	display: flex;
	justify-content: center;
	gap: 20px;
}

.box1 {
	width: 385px; /* 원하는 너비 */
	height: 450px; /* 원하는 높이 */
	background-color: white; /* 임시 스타일 */
	border-radius: 30px;
	border: 1px solid #8071FC;
	padding: 30px;
}

.box2 {
	width: 260px; /* 원하는 너비 */
	max-height: 450px; /* 원하는 높이 */
	background-color: white; /* 임시 스타일 */
	border-radius: 30px;
	border: 1px solid #8071FC;
	padding: 30px;
}

h4 {
	margin: 0px;
	margin-bottom: 0px;
	font-size: 14px;
}

p {
	font-size: 10px;
}

li {
	font-size: 10px;
}

.underline {
	border-bottom: 1px solid #CEB3FF;
	margin-bottom: 15px;
}

.circle {
	display: inline-block; /* 인라인 요소로 취급 */
	width: 16px; /* 원의 너비 */
	height: 16px; /* 원의 높이 */
	line-height: 16px; /* 텍스트 수직 정렬 */
	text-align: center; /* 텍스트 중앙 정렬 */
	background-color: white; /* 파란색 배경 */
	border: #CEB3FF 1px solid;
	color: black;
	border-radius: 50%; /* 원형 만들기 */
	font-size: 10px; /* 텍스트 크기 */
	font-weight: bold;
}

.person_container {
	position: relative; /* 텍스트의 위치를 이미지에 상대적으로 설정 */
	width: 260px; /* 컨테이너 너비 */
	height: 260px; /* 컨테이너 높이 */
}

.person_img {
	width: 260px; /* 원하는 너비 */
	height: 260px; /* 원하는 높이 */
	object-fit: cover; /* 이미지 비율 유지 */
}

.person_text {
	position: absolute;
	bottom: 0%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: inline-block;
	background-color: #8071FC;
	color: white;
	text-align: center;
	font-size: 13px;
	width: 120px;
	border-radius: 50px;
	border: 0.5px #8071FC solid;
	padding: 10px;
	transition: all 0.3s ease;
}

.person_text:hover {
	color: #8071FC;
	background-color: white;
	border-color: #8071FC;
	cursor: pointer;
}

.mike {
	display: flex;
	align-items: center;
	margin-top: 50px;
	margin-bottom: 10px;
}

.mike>span {
	font-size: 13px;
	margin-bottom: 20px;
	color: #64748B;
}

.mike_text {
	font-size: 18px;
	font-weight: bold;
	line-height: 1.5;
	text-align: center;
}

#karaoke_text span {
	color: black;
	transition: color 0.15s ease;
}

#karaoke_text span.highlighted {
	color: #8071FC;
}

.recording_container {
	position: relative; /* 텍스트의 위치를 이미지에 상대적으로 설정 */
	width: 260px; /* 컨테이너 너비 */
	height: 260px; /* 컨테이너 높이 */
}

.recording_status {
	position: absolute;
	bottom: 0%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: flex;
	align-items: center;
	gap: 5px;
	height: 15px;
	width: 120px;
	border-radius: 50px;
	border: 0.5px #8071FC solid;
	padding: 10px;
	background-color: white;
}

.recording_icon {
	width: 8px;
	height: 8px;
	background-color: red;
	border-radius: 50%;
}

.recording_text {
	font-size: 8px;
	color: #666666;
}

.waveform {
	display: flex;
	align-items: center;
	gap: 3px;
}

.waveform div {
	width: 3px;
	height: 10px;
	background-color: #a97dff;
	border-radius: 2px;
	animation: wave 1.2s infinite ease-in-out;
}

.waveform div:nth-child(2) {
	animation-delay: -1.1s;
}

.waveform div:nth-child(3) {
	animation-delay: -1s;
}

.waveform div:nth-child(4) {
	animation-delay: -0.9s;
}

.waveform div:nth-child(5) {
	animation-delay: -0.8s;
}

@
keyframes wave { 0%, 100% {
	height: 5px;
}

50






%
{
height






:






15px




;
}
}

/* 모달 배경 */
.modal {
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
	width: 350px;
	text-align: center;
	border-radius: 30px;
}
/* 닫기 버튼 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 모달 메시지 */
.modal_text {
	font-size: 40px;
	color: #94A3B8;
}

#Result {
	font-weight: bold;
}

.highlight {
	color: #8071FC;
}

/* 버튼 스타일 */
.btn {
	display: inline-block;
	background-color: #8071FC;
	color: white;
	font-weight: 600;
	font-size: 13px;
	width: 120px;
	margin: 0 15px;
	margin-top: 20px;
	border-radius: 10px;
	border: 0.5px #CBD5E1 solid;
	padding: 10px;
}

.btn:hover {
	color: #8071FC;
	background-color: white;
	border-color: #8071FC;
}

#btn_pw {
	color: #64748B;
	background-color: #E2E8F0;
}

#btn_pw:hover {
	color: #64748B;
	background-color: white;
	border-color: #64748B;
}

.AI_Interview_wrapper {
	margin-top: 150px;
}
</style>
</head>


<body>

	 <!-- 푸터 불러오기 -->
    <div><jsp:include page="header.jsp"></jsp:include> </div>

	<div class="AI_Interview_wrapper">
		<div class="text1">연결된 기기를 확인해 주세요</div>
		<div class="container">
			<div class="box1" id="box1">
				<div class="underline">
					<h4>마이크 테스트 가이드</h4>
					<P>
						<span class="circle">1</span>&nbsp;&nbsp; 마이크가 pc(노트북)에 연결되어 있는지
						확인해 주세요.
					</P>
					<P>
						<span class="circle">2</span>&nbsp;&nbsp; 상단 팝업의 마이크 권한을 "허용"으로
						선택해 주세요.
					</P>
					<P>
						<span class="circle">3</span>&nbsp;&nbsp; 영상은 녹화되지 않으며 음성만 녹음됩니다.
					</P>
				</div>
				<div class="underline">
					<h4>소음</h4>
					<P>
						<span class="circle">1</span>&nbsp;&nbsp; 조용한 공간에서 면접을 진행해 주세요
					</P>
					<P>
						<span class="circle">2</span>&nbsp;&nbsp; 이어폰 사용 시 마이크에 닿은 옷 또는
						머리카락 때문에 소음이 생길수 있으니 주의해 주세요.
					</P>
					<P>
						<span class="circle">3</span>&nbsp;&nbsp; 다른 사람의 음성이 녹음되지 않도록 해
						주세요
					</P>
				</div>
				<div class="underline">
					<h4>오류를 일으키는 주요원인</h4>
					<P>
						<span class="circle">1</span>&nbsp;&nbsp; 마이크 사용 중 하울링(소리 증폭 현상)이
						발생하면 소리가 커져서 음성 검출이 어려워질 수 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;있습니다.
					</P>
					<P>
						<span class="circle">2</span>&nbsp;&nbsp; 이어폰 사용 시에는 마이크가 있는 기기를
						사용해 주세요.
					</P>
					<P>
						<span class="circle">3</span>&nbsp;&nbsp; 음성 전달에 영향을 미치는 마스크를 착용하지
						말아 주세요.
					</P>
				</div>
				<div>
					<h4>답변 주의사항</h4>
					<P>
						<span class="circle">1</span>&nbsp;&nbsp; 소리가 작거나 발음이 부정확하면 음성 인식이
						어려울 수 있습니다.
					</P>
					<P>
						<span class="circle">2</span>&nbsp;&nbsp; 답변할 때 정확한 음성과 크기로 답변해
						주세요.
					</P>
				</div>
			</div>
			<div class="box2" id="box2">
				<div class="person_container">
					<img src="img/person.png" alt="배경 이미지" class="person_img">
					<div class="person_text" onclick="startVoiceTest()">음성테스트 시작
					</div>
				</div>
				<div class="mike">
					<span>음성 테스트 시작 후에 아래 문구를 따라 읽어주세요</span>
				</div>
				<div class="mike_text">
					<div id="karaoke_text">
						<span>경</span><span>험</span><span>은</span><span> </span><span>만</span><span>들</span><span>어</span><span>
						</span> <span>낼</span><span> </span><span>수</span><span> </span><span>없</span><span>다</span>.<br>
						<span>그</span><span>것</span><span>은</span><span> </span><span>시</span><span>도</span><span>해</span><span>야</span><span>만</span>
						<span> </span><span>한</span><span>다</span>.
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="resultModal" class="modal">
		<div class="modal-content">
			<h3>분석 완료</h3>
			<p id="modalMessage" class="modal_text"></p>
			<button class="btn" id="btn_confirm">확인</button>
		</div>
	</div>
	
	<!-- 푸터 불러오기 -->
    <div><jsp:include page="footer.jsp"></jsp:include> </div>

	<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
    let isRecording = false; // 녹음 상태 플래그
    let mediaRecorder = null;
    let recordedChunks = [];
    let recordingTimeout = null;
    let currentIndex = 0;
    
    // 모달 열기 함수
   function openModal(message) {
    const modal = document.getElementById("resultModal");
    const modalMessage = document.getElementById("modalMessage");

    if (!modal || !modalMessage) {
        console.error("Modal elements not found.");
        return;
    }

    modalMessage.innerText = message; // 메시지 설정
    modal.style.display = "block"; // 모달 표시

 	// 확인 버튼 동작 설정
    const confirmButton = document.getElementById("btn_confirm");
    confirmButton.onclick = function () {
        modal.style.display = "none"; // 모달 닫기
    };

 	// 모달 외부를 클릭해도 닫히도록 설정
    modal.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
}

    const personContainer = document.querySelector(".person_container");
    const mikeTextContainer = document.querySelector(".mike_text");

    const initialHTML = `
    	<img src="img/person.png" alt="배경 이미지" class="person_img">
        <div class="person_text" onclick="startVoiceTest()"> 음성테스트 시작 </div>
    `;

    const recordingHTML = `
        <div class="recording_container">
    	 <img src="img/person.png" alt="배경 이미지" class="person_img">
            <div class="recording_status">
                <span class="recording_icon"></span>
                <span class="recording_text">녹음중...</span>
                <div class="waveform">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </div>
    `;

    const karaokeTextHTML = `
        <div id="karaoke_text">
            <span>경</span><span>험</span><span>은</span><span> </span><span>만</span><span>들</span><span>어</span><span> </span>
            <span>낼</span><span> </span><span>수</span><span> </span><span>없</span><span>다</span>.<br>
            <span>그</span><span>것</span><span>은</span><span> </span><span>시</span><span>도</span><span>해</span><span>야</span><span>만</span>
            <span> </span><span>한</span><span>다</span>.
        </div>
    `;

    // 초기 상태로 복원
    function resetToInitialState() {
        personContainer.innerHTML = initialHTML;
        if (mikeTextContainer) {
            mikeTextContainer.innerHTML = karaokeTextHTML;
        }
        isRecording = false;
        clearTimeout(recordingTimeout);
        stopWaveAnimation();
        resetHighlight();
    }

    // 녹음 시작
    window.startVoiceTest = function startVoiceTest() {
        if (isRecording) return; // 이미 녹음 중이면 실행하지 않음

        isRecording = true;
        recordedChunks = [];

        navigator.mediaDevices.getUserMedia({ audio: true })
            .then(function (stream) {
                mediaRecorder = new MediaRecorder(stream);
                mediaRecorder.ondataavailable = function (event) {
                    if (event.data.size > 0) {
                        recordedChunks.push(event.data);
                    }
                };
                
                
                
             // 텍스트 비교 및 결과 표시 함수
                function compareTranscription(transcribedText) {
                    // 기대하는 텍스트
                    const expectedText = "경험은 만들어낼수없다그것은시도해야만한다";

                    // 입력 텍스트를 정규화: 공백과 특수문자 제거
                    const normalizeText = (text) => text.replace(/[^가-힣]/g, "").trim();

                    const normalizedTranscribedText = normalizeText(transcribedText);
                    const normalizedExpectedText = normalizeText(expectedText);

                    // 결과 DIV 생성
                    const resultDiv = document.createElement("div");

                    // 결과 비교
                    if (normalizedTranscribedText === normalizedExpectedText) {
                    	openModal("일치합니다"); // 일치 시 모달 표시
                    } else {
                        openModal("일치하지 않습니다"); // 불일치 시 모달 표시
                    }

                    // 결과를 #karaoke_text 아래에 표시
                    const karaokeDiv = document.querySelector("#karaoke_text");
                    if (karaokeDiv) {
                        // 이전 결과 제거
                        const existingResult = document.querySelector("#karaoke_text + div");
                        if (existingResult) {
                            existingResult.remove();
                        }
                        // 새로운 결과 추가
                        karaokeDiv.parentNode.appendChild(resultDiv);
                    }
                }

                mediaRecorder.onstop = function () {
                    const blob = new Blob(recordedChunks, { type: "audio/wav" });
                    const formData = new FormData();
                    formData.append("file", blob, "recorded_audio.wav");

                    // 녹음 후 바로 초기화
                    resetToInitialState();

                    // STT 서버로 전송
                    $.ajax({
                        url: "http://localhost:5001/stt", // STT 서버 URL
                        type: "POST",
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            if (response.text) {
                                const transcribedText = response.text; // 결과를 변수에 저장
                                compareTranscription(transcribedText); // 비교 함수 호출
                            } else {
                                alert("STT 결과를 가져오지 못했습니다.");
                            }
                        },
                        error: function () {
                            alert("STT 전송 중 오류가 발생했습니다.");
                        }
                    });
                };

                // 녹음 시작 및 UI 변경
                mediaRecorder.start();
                personContainer.innerHTML = recordingHTML;
                startWaveAnimation();
                startTextHighlight();

                // 6초 후 녹음 자동 종료
                recordingTimeout = setTimeout(function () {
                    if (mediaRecorder && mediaRecorder.state === "recording") {
                        mediaRecorder.stop();
                    }
                }, 6000);
            })
            .catch(function () {
                alert("마이크 권한을 확인해주세요.");
                resetToInitialState();
            });
    };

    // 텍스트 강조 시작
    function startTextHighlight() {
        const spans = document.querySelectorAll("#karaoke_text span");
        if (!spans || spans.length === 0) return;

        function highlightNext() {
            if (currentIndex < spans.length) {
                spans[currentIndex].classList.add("highlighted");
                currentIndex++;
                setTimeout(highlightNext, 150);
            }
        }
        highlightNext();
    }

    // 텍스트 강조 초기화
    function resetHighlight() {
        const spans = document.querySelectorAll("#karaoke_text span.highlighted");
        spans.forEach((span) => span.classList.remove("highlighted"));
        currentIndex = 0;
    }

    // 파형 애니메이션 시작
    function startWaveAnimation() {
        const waveform = document.querySelector(".waveform");
        if (!waveform) return;

        for (let i = 0; i < 5; i++) {
            const wave = document.createElement("div");
            waveform.appendChild(wave);
        }
    }

    // 파형 애니메이션 중단
    function stopWaveAnimation() {
        const waveform = document.querySelector(".waveform");
        if (waveform) {
            waveform.innerHTML = "";
        }
    }
});

</script>







</body>
</html>
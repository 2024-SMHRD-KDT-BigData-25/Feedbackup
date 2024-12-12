<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>AI_Interview</title>
<link rel="stylesheet" href="css/Ai_Interview.css">
<style>


</style>
</head>


<body>

	 <!-- 헤더 불러오기 -->
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
						머리카락 때문에 소음이 생길수 있으니 
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주의해 주세요.
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
						발생하면 소리가 커져서 음성 검출이 
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어려워질 수 있습니다.
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
        <div class="loading-container">
            <div class="rotating-border"></div>
            <div class="static-image">
                <img id="modalImage" src="img/logo1.png" alt="로고">
            </div>
        </div>
        <p id="modalMessage" class="modal_text">분석중 입니다..</p>
        <button class="btn" id="btn_confirm">확인</button>
    </div>
</div>

<div id="resultModal2" class="modal">
    <div class="modal-content">
        <div class="loading-container">         
            <div class="static-image2">
                <img id="modalImage" src="img/voice-test-suc.svg" alt="일치">
            </div>
        </div>
        <p id="modalMessage" class="modal_text2">음성 인식에 성공했어요!</p><p id="modalMessage" class="modal_text4"> 연습중에도 목소리 크기를 유지해주세요.</p>
        <a href="users/Job_List" class="btn" id="btn_confirm">다음</a>
    </div>
</div>

<div id="resultModal3" class="modal">
    <div class="modal-content">
        <div class="loading-container">
            <div class="static-image3">
                <img id="modalImage" src="img/voice-test-fail.svg" alt="불일치">
            </div>
        </div>
        <p id="modalMessage" class="modal_text3">음성 인식에 실패했어요...</p><p id="modalMessage" class="modal_text4">발음을 더 명확히 하거나<br>조용한 환경에서 다시 시도해주세요.</p>
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
    
 	// 모든 모달 닫기 함수
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
                    const expectedText = "경험은만들어낼수없다그것은시도해야만한다";

                    // 입력 텍스트를 정규화: 공백과 특수문자 제거
                    const normalizeText = (text) => text.replace(/[^가-힣]/g, "").trim();

                    const normalizedTranscribedText = normalizeText(transcribedText);
                    const normalizedExpectedText = normalizeText(expectedText);

                    // 결과 비교하여 적절한 모달 열기
                    const modalId = (normalizedTranscribedText === normalizedExpectedText) 
                        ? "resultModal2"  // 일치하는 경우
                        : "resultModal3"; // 일치하지 않는 경우

                    openModal(modalId);
                }

                mediaRecorder.onstop = function () {
                    const blob = new Blob(recordedChunks, { type: "audio/wav" });
                    const formData = new FormData();
                    formData.append("file", blob, "recorded_audio.wav");

                    // 녹음 후 바로 초기화
                    resetToInitialState();
                    openModal("resultModal")

                    // STT 서버로 전송
                    $.ajax({
                        url: "http://localhost:5100/stt", // STT 서버 URL
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
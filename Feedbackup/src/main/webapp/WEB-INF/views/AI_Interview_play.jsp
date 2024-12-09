<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AI_Interview</title>
	<style>
		@font-face {
		    font-family: 'SUIT-Regular';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		        
		body {
		    background-color: #F1F5F9;
		    font-family: 'SUIT-Regular';
		    align-content: center;
		}
		
		.text1{
		    font-size: 26px;
		    font-weight: bold;
		    margin-top: 40px;
		    margin-bottom: 70px;
		    text-align: center;
		}
		
		.container{
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
		
		h4{ 
		    margin: 0px;
		    margin-bottom: 0px;
		    font-size: 14px;
		}
		
		p {
		    font-size: 10px;
		}
		
		li{
		    font-size: 10px;
		}
		
		.underline{
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
		    border:#CEB3FF 1px solid;
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
		  
		.person_img{
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
		  }
		  
		  .person_text:hover {
		    color: #8071FC;
		    background-color: white;
		    border-color: #8071FC;
		  }
		  
		  .mike {
		    display: flex;
		    align-items: center;
		    margin-top: 50px;
		    margin-bottom: 10px;
		  }
		  
		  .mike > span {
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
		  
		  .recording_container{
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
		  
		  @keyframes wave {
		    0%, 100% {
		      height: 5px;
		    }
		    50% {
		      height: 15px;
		    }
		  }
		      
	</style>
</head>
<body>
    <div class="AI_Interview_wrapper">
        <div class="text1">연결된 기기를 확인해 주세요</div>
        <div class="container">
            <div class="box1" id="box1">
                <div class="underline">
                    <h4>마이크 테스트 가이드</h4>
                    <P><span class="circle">1</span>&nbsp;&nbsp; 마이크가 pc(노트북)에 연결되어 있는지 확인해 주세요.</P>
                    <P><span class="circle">2</span>&nbsp;&nbsp; 상단 팝업의 마이크 권한을 "허용"으로 선택해 주세요.</P>
                    <P><span class="circle">3</span>&nbsp;&nbsp; 영상은 녹화되지 않으며 음성만 녹음됩니다.</P>
                </div>
                <div class="underline">
                    <h4>소음</h4>
                    <P><span class="circle">1</span>&nbsp;&nbsp; 조용한 공간에서 면접을 진행해 주세요</P>
                    <P><span class="circle">2</span>&nbsp;&nbsp; 이어폰 사용 시 마이크에 닿은 옷 또는 머리카락 때문에 소음이 생길수 있으니 주의해 주세요.</P>
                    <P><span class="circle">3</span>&nbsp;&nbsp; 다른 사람의 음성이 녹음되지 않도록 해 주세요</P>
                </div>
                <div class="underline">
                    <h4>오류를 일으키는 주요원인</h4>
                    <P><span class="circle">1</span>&nbsp;&nbsp; 마이크 사용 중 하울링(소리 증폭 현상)이 발생하면 소리가 커져서 음성 검출이 어려워질 수 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;있습니다.</P>
                    <P><span class="circle">2</span>&nbsp;&nbsp; 이어폰 사용 시에는 마이크가 있는 기기를 사용해 주세요.</P>
                    <P><span class="circle">3</span>&nbsp;&nbsp; 음성 전달에 영향을 미치는 마스크를 착용하지 말아 주세요.</P>
                </div>
                <div>
                    <h4>답변 주의사항</h4>
                    <P><span class="circle">1</span>&nbsp;&nbsp; 소리가 작거나 발음이 부정확하면 음성 인식이 어려울 수 있습니다.</P>
                    <P><span class="circle">2</span>&nbsp;&nbsp; 답변할 때 정확한 음성과 크기로 답변해 주세요.</P>
                </div>
            </div>
            <div class="box2" id="box2">
                <div class="person_container">
                    <img src="${pageContext.request.contextPath}/assets/img/person.png" alt="배경 이미지" class="person_img">
                    <div class="person_text" onclick="startVoiceTest()"> 음성테스트 시작 </div>
                </div>
                <div class="mike">
                    <span>음성 테스트 시작 후에 아래 문구를 따라 읽어주세요</span>
                </div>
                <div class="mike_text">
				  <div id="karaoke_text">
				    <span>경</span><span>험</span><span>은</span><span> </span><span>만</span><span>들</span><span>어</span><span> </span>
				    <span>낼</span><span> </span><span>수</span><span> </span><span>없</span><span>다</span>.<br>
				    <span>그</span><span>것</span><span>은</span><span> </span><span>시</span><span>도</span><span>해</span><span>야</span><span>만</span>
				    <span> </span><span>한</span><span>다</span>.
				  </div>
				</div>
            </div>
          </div>
    </div>
    
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
    let isRecording = false; // 녹음 상태를 추적
    let timeoutId = null; // 텍스트 강조 애니메이션 중단용 타이머 ID
    let currentIndex = 0; // 텍스트 강조 중인 인덱스

    const personContainer = document.querySelector(".person_container");

    // 녹음 상태와 초기 상태의 HTML 템플릿
    const recordingHTML = `
    <div class="recording_container">
      <img src="${pageContext.request.contextPath}/assets/img/person.png" alt="배경 이미지" class="person_img">
      <div class="recording_status">
        <span class="recording_icon"></span>
        <span class="recording_text">녹음중 00:03</span>
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

    const initialHTML = `
      <img src="${pageContext.request.contextPath}/assets/img/person.png" alt="배경 이미지" class="person_img">
      <div class="person_text" onclick="startVoiceTest()"> 음성테스트 시작 </div>
    `;

    const karaokeTextHTML = `
      <div id="karaoke_text">
        <span>경</span><span>험</span><span>은</span><span> </span><span>만</span><span>들</span><span>어</span><span> </span>
        <span>낼</span><span> </span><span>수</span><span> </span><span>없</span><span>다</span>.<br>
        <span>그</span><span>것</span><span>은</span><span> </span><span>시</span><span>도</span><span>해</span><span>야</span><span>만</span>
        <span> </span><span>한</span><span>다</span>.
      </div>
    `;

    const mikeTextDefaultHTML = `
      <span>음성 테스트 시작 후에 아래 문구를 따라 읽어주세요</span>
    `;

    const mikeTextContainer = document.querySelector(".mike_text");

    // 녹음 상태 전환 함수
    function startVoiceTest() {
        if (!isRecording) {
            // 녹음 시작
            personContainer.innerHTML = recordingHTML; // 녹음 상태로 변경
            if (mikeTextContainer) {
                mikeTextContainer.innerHTML = karaokeTextHTML; // #karaoke_text 복원
            }
            isRecording = true;
            currentIndex = 0; // 텍스트 강조 인덱스 초기화
            startWaveAnimation(); // 파형 애니메이션 시작
            highlightNext(); // 텍스트 강조 애니메이션 시작
        } else {
            // 초기 상태로 복원
            personContainer.innerHTML = initialHTML; // 초기 HTML 복원
            if (mikeTextContainer) {
                mikeTextContainer.innerHTML = mikeTextDefaultHTML; // 초기 안내 문구 복원
            }
            isRecording = false;
            stopWaveAnimation(); // 파형 애니메이션 중단
            clearTimeout(timeoutId); // 텍스트 강조 애니메이션 중단
            currentIndex = 0; // 텍스트 강조 인덱스 초기화
        }
    }

    // 텍스트 강조 애니메이션
    function highlightNext() {
        if (!isRecording) return; // 녹음 중이 아니면 중단
        const spans = document.querySelectorAll("#karaoke_text span");
        if (spans.length > 0 && currentIndex < spans.length) {
            spans[currentIndex].classList.add("highlighted"); // 강조
            currentIndex++;
            timeoutId = setTimeout(highlightNext, 150); // 다음 글자 강조
        }
    }

    // 파형 애니메이션 시작
    function startWaveAnimation() {
        const waveformContainer = document.querySelector(".waveform");
        if (waveformContainer) {
            for (let i = 0; i < 5; i++) {
                const wave = document.createElement("div");
                waveformContainer.appendChild(wave);
            }
        }
    }

    // 파형 애니메이션 중단
    function stopWaveAnimation() {
        const waveformContainer = document.querySelector(".waveform");
        if (waveformContainer) {
            waveformContainer.innerHTML = ""; // 파형 초기화
        }
    }

    // 이벤트 다시 연결 (HTML 변경 후 이벤트 복원)
    function rebindClickEvent() {
        const newPersonText = document.querySelector(".person_text");
        if (newPersonText) {
            newPersonText.addEventListener("click", startVoiceTest);
        }

        // #karaoke_text span에 텍스트 강조 애니메이션을 적용
        if (isRecording) {
            highlightNext(); // 강조 애니메이션 재시작
        }
    }

    // 초기화: 이벤트 연결
    rebindClickEvent();
});
</script>







</body>
</html>
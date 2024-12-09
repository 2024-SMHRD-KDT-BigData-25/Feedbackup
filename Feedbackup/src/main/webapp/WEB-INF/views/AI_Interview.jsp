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
		    position: absolute; /* 이미지 위에 텍스트 배치 */
		    bottom: 0%; /* 수직 가운데 */
		    left: 50%; /* 수평 가운데 */
		    transform: translate(-50%, -50%); /* 정확히 가운데 정렬 */
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
		
		.mike{
		    display: flex;
		    align-items: center; /* 수직 중앙 정렬 */
		    margin-top: 50px;
		    margin-bottom: 10px;
		}
		
		.mike > span{
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
		  color: black; /* 기본 텍스트 색상 */
		  transition: color 0.2s ease; /* 색상이 변경되는 애니메이션 */
		}
		
		#karaoke_text span.highlighted {
		  color: #8071FC; /* 글자 강조 색상 */
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
    let isAnimating = false; // 애니메이션 상태
    let currentIndex = 0; // 현재 강조 중인 글자 인덱스
    let timeoutId = null; // setTimeout ID

    const mikeTextInitialHTML = `
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

    function highlightNext() {
      const spans = document.querySelectorAll("#karaoke_text span");
      if (!isAnimating || currentIndex >= spans.length) {
        isAnimating = false;
        currentIndex = 0; // 초기화
        return;
      }

      if (currentIndex < spans.length) {
        spans[currentIndex].classList.add("highlighted");
        currentIndex++;
        timeoutId = setTimeout(highlightNext, 200); // 다음 글자 강조
      }
    }

    function startVoiceTest() {
      const personText = document.querySelector(".person_text");
      const mikeText = document.querySelector(".mike_text");
      const mike = document.querySelector(".mike");

      if (personText && personText.textContent.trim() === "음성테스트 시작") {
        // "음성테스트 시작" 상태에서 클릭
        personText.textContent = "녹음시간, 상태"; // 텍스트 변경
        if (mikeText) {
          mikeText.innerHTML = mikeTextInitialHTML; // mike_text 내용 변경
        }
        isAnimating = true;
        highlightNext(); // 애니메이션 시작
      } else if (personText && personText.textContent.trim() === "녹음시간, 상태") {
        // "녹음시간, 상태" 상태에서 클릭
        personText.textContent = "음성테스트 시작"; // 텍스트 변경
        if (mikeText) {
          mikeText.innerHTML = mikeTextInitialHTML; // mike_text를 초기 상태로 복원
        }
        isAnimating = false;
        clearTimeout(timeoutId); // 실행 중인 애니메이션 중단
        currentIndex = 0; // 초기화
      }
    }

    // 클릭 이벤트 위임
    document.addEventListener("click", function (e) {
      if (e.target && e.target.matches(".person_text")) {
        startVoiceTest();
      }
    });
  });
</script>


</body>
</html>
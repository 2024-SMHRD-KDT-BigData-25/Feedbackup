<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>One_Results</title>
<style>
@font-face {
  font-family: 'SUIT-Regular';
  src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
  font-weight: normal;
  font-style: normal;
}

body {
  font-family: 'SUIT-Regular', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #FFFFFF;
  color: #333;
}

.container {
  width: 80%;
  margin: 0 auto;
  padding: 20px;
  box-sizing: border-box;
}

.top-buttons {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 20px;
}

.top-buttons .btn {
  border: 1px solid #D4C5FF;
  background-color: #FFFFFF;
  color: #8071FC;
  border-radius: 20px;
  padding: 10px 20px;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
  margin-left: 10px;
}

.top-buttons .btn:hover {
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
  height: auto; ;
}

.title_text {
  margin-top: 0px;
  margin-bottom: 20px;
  text-align: center;
  color: #64748B;
  font-size: 20px;
}

.content-title {
  font-weight: bold;
}

.subtitle {
  text-align: center;
  color: #64748B;
  font-size: 30px;
  margin-bottom: 20px;
}

.subtitle2 {
  text-align: center;
  color: #64748B;
  font-size: 15px;
  margin-bottom: 80px;
}

.title_container {
  text-align: center; /* 수평 중앙 정렬 */
  margin-top: 20px; /* 버튼과 상단 여백 조정 */
}

.title_detail{
  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  color: white;
  background: linear-gradient(to right, #8071FC, #A4C8FF);
  border-radius: 20px;
  text-align: center;
  box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  margin: 0px auto;
}

.highlight {
  color: #8071FC;
  font-weight: bold;
}

.section {
  width: 100%; /* 전체 너비 */
  max-width: 800px; /* 최대 너비 제한 */
  min-height: 300px;
  margin: 0px auto; /* 상하 간격 20px, 가운데 정렬 */
  margin-top: 30px;
  margin-bottom: 100px;
  padding: 40px; /* 내부 여백 */
  background-color: #F8FAFC; /* 배경색 */
  border-radius: 12px; /* 모서리 둥글게 */
  border: #CBD5E1 1px solid;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 박스 그림자 */
}

.section-header {
  display: flex;
  justify-content: flex-start; /* 왼쪽 정렬 */
  align-items: center; /* 세로 가운데 정렬 */
  margin-bottom: 20px; /* 아래 요소와 간격 */
  gap: 20px; /* 타이틀과 버튼 사이 간격 */
}

.section-title {
  font-size: 20px;
  font-weight: bold;
  color: #333333;
}

.tabs {
  display: flex;
  gap: 10px; /* 버튼 간격 조정 */
}

.tabs button {
  border: none;
  background-color: #F1F5FF;
  color: #6C63FF;
  border-radius: 20px;
  padding: 8px 16px;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.tabs button.active {
  background-color: #8071FC;
  color: #FFFFFF;
}

.tabs button:hover {
  background-color: #8071FC;
  color: #FFFFFF;
}

.card {
  background-color: #FFFFFF;
  border-radius: 12px;
  padding: 50px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
  margin-bottom: 20px;
  min-height: 400px;
}

.key-points {
  font-size: 14px;
  margin-top: 20px;
  min-height: 100px;
}

.key-points span {
  display: inline-block;
  background-color: #ECEAFF;
  color: #8071FC;
  padding: 5px 10px;
  border-radius: 10px;
  margin-right: 5px;
  font-size: 12px;
}

.chart-container {
  text-align: center;
  margin-top: 20px;
}

.chart {
  width: 100%;
  max-width: 600px;
  height: 300px;
  margin: 0 auto;
  background-color: #F5F5F5;
  border-radius: 12px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.feedback {
  margin-top: 20px;
}

/* 음성 */
.voice_title {
  display: flex; /* Flexbox 활성화 */
  justify-content: center; /* 가로축 중앙 정렬 */
  align-items: center; /* 세로축 중앙 정렬 */
  gap: 10px; /* 각 div 사이 간격 */
  margin: 10px auto;
  max-width: 700px;
}

.voice_title div {
  flex: 1; /* 동일한 크기 할당 */
  height: 50px; /* 높이 설정 */
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 25px;
  font-weight: bold;
  border-radius: 5px;
}

.voice {
  display: flex; /* Flexbox 활성화 */
  justify-content: center; /* 가로축 중앙 정렬 */
  align-items: center; /* 세로축 중앙 정렬 */
  gap: 15px; /* 각 div 사이 간격 */
  margin: 20px auto;
  max-width: 700px;
}

.voice > .box1 {
  flex: 1; /* 동일한 크기 할당 */
  height: 230px; /* 높이 설정 */
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #6C63FF;
  color: white;
  font-size: 20px;
  font-weight: bold;
  border-radius: 10px;
}

.voice > .box2 {
  background-color: #8071FC;
}

.voice > .box3 {
  background-color: #A98BFF;
}

.voice_result{
  min-height: 200px;
  border-radius: 20px;
  border: 1px solid #A98BFF;
  padding: 30px;
  font-size: 20px;
}

/* 표 */
.graph-container {
  width: 240px;
  height: 230px;
  border: 2px solid #CBD5E1;
  border-radius: 10px;
  background-color: #FFFFFF;
  padding: 10px 10px; /* 내부 여백 설정 */
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  position: relative;
  box-sizing: border-box;
}

.y-axis {
  position: absolute;
  left: 20px;
  top: 20px;
  bottom: 50px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: flex-end;
}

.y-axis span {
  font-size: 12px;
  color: #6C63FF;
}

.grid-lines {
  position: absolute;
  left: 60px;
  right: 20px;
  top: 20px;
  bottom: 50px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.grid-line {
  width: 100%;
  height: 1px;
  background-color: #ECECEC;
}

.bar-container {
  position: absolute;
  left: 60px;
  bottom: 50px;
  width: calc(100% - 80px);
  height: calc(100% - 70px);
  display: flex;
  align-items: flex-end;
  justify-content: center;
}

@keyframes bar-grow {
  0% {
    height: 0;
  }
  100% {
    height: var(--target-height); /* JavaScript에서 동적으로 설정 */
  }
}

.bar {
  width: 50px;
  background: linear-gradient(to top, #74CAFF, #8071FC);
  border-radius: 5px;
  text-align: center;
  position: relative;
  height: 0; /* 초기 높이를 0으로 설정 */
  transition: height 1s ease-out; /* 부드러운 애니메이션 */
}

.bar span {
  position: absolute;
  top: -25px;
  right: 13px;
  font-size: 14px;
  color: #8071FC;
  font-weight: bold;
}

.x-axis {
  position: absolute;
  bottom: 20px;
  left: 60px;
  width: calc(100% - 80px);
  text-align: center;
  font-size: 14px;
  color: #6C63FF;
}

/* 제스쳐 */
.gesture-analysis-container {
  background-color: #FFFFFF;
  border-radius: 15px;
  padding: 20px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  max-width: 700px;
  min-height: 200px;;
  margin: 0 auto;
}

.gesture-content {
  display: flex;
  align-items: center; /* 상단 정렬 */
  gap: 20px; /* 두 섹션 간 간격 */
  min-height: 200px;
}

.gesture-bars {
  flex: 1; 
}

.gesture-bar-container {
  display: flex;
  align-items: center;
  margin-bottom: 30px;
}

.label {
  width: 120px; /* 라벨 영역 크기 */
  font-size: 16px;
  color: #64748B;
  text-align: center; 
  margin-right: 20px; /* 라벨과 막대 간격 */
}

.gesture-bar-wrapper {
  flex-grow: 1;
  position: relative;
}

.gesture-bar {
  height: 15px;
  background: linear-gradient(to right, #80BFFF, #A98BFF);
  border-radius: 15px;
  position: relative;
  width: 0; /* 초기 길이 */
  transition: width 1s ease-in-out; /* 부드러운 애니메이션 */
}

.gesture-value {
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 14px;
  color: #FFFFFF;
  font-weight: bold;
}

.gesture-summary {
  flex: 1; /* 전체 공간의 1/4 */
}

.gesture-summary ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.gesture-summary li {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 30px;
}

.gesture-summary li::before {
  content: "● ";
  font-size: 20px;
  color: #CBD5E1;
  margin-right: 5px;
}

#topButton {
    position: fixed;
    bottom: 20px;
    right: 20px;
    display: none;
    background-color: #8071FC;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

#topButton:hover {
    background-color: white;
    color: #8071FC;
}
</style>
</head>
<body>
  
  <div class="container">
    <div class="top-buttons">
      <button class="btn" onclick="window.location.href='/myapp/';">나가기</button>
    </div>

    <div class="title"><img src="../img/feedbackup.png"></div>
    <div class="title_text">자기소개 분석 결과</div>
    
    <div hidden>
    <!-- AI 답변 분석 -->
    <div class="title_container">
      <div class="title_detail">AI 답변 분석</div>
    </div>
    <div class="section">
      <div class="section-header">
        <div class="section-title">AI 답변 분석 상세결과</div>
      </div>
    
      <div class="card">
        <div class="content-title">핵심 키워드</div>
        <div class="key-points">
            <span>#개발이슈</span>
            <span>#A/B 테스트 결과</span>
            <span>#MVP 수정</span>
            <span>#프로젝트 현황</span>
            <span>#POC 검증</span>
        </div>

        <div class="content-title">모범답안과의 유사도 결과 및 개선점</div>
        <div class="feedback">분석 결과</div><br>
        
        인식된 테스트<div id="recognizedText"></div><br>
        
      </div>
    </div>
	</div>
    <!-- AI 음성 분석 -->
    <div class="title_container">
      <div class="title_detail">AI 음성 분석</div>
    </div>
    <div class="section"> 
      <div class="section-header">
        <div class="section-title">AI 음성 분석 상세 결과</div>
      </div>
      <div class="card">
        <div class="voice_title box1">
          <div>높낮이</div>
          <div>떨림</div>
          <div>속도</div>
        </div>
        <div class="voice">
          <!-- 그래프 1: 높낮이 -->
          <div class="graph-container">
            <div class="y-axis">
              <span>275</span>
              <span>200</span>
              <span>125</span>
              <span>50</span>
            </div>
            <div class="grid-lines">
              <div class="grid-line"></div>
              <div class="grid-line"></div>
              <div class="grid-line"></div>
              <div class="grid-line"></div>
            </div>
            <div class="bar-container">
              <div class="bar" id="bar1">
                <span id="bar-value1"></span>
              </div>
            </div>
            <div class="x-axis">높낮이</div>
          </div>
      
          <!-- 그래프 2: 떨림 -->
          <div class="graph-container">
            <div class="y-axis">
              <span>0.01</span>
              <span>0.006</span>
              <span>0.003</span>
              <span>0</span>
            </div>
            <div class="grid-lines">
              <div class="grid-line"></div>
              <div class="grid-line"></div>
              <div class="grid-line"></div>
              <div class="grid-line"></div>
            </div>
            <div class="bar-container">
              <div class="bar" id="bar2">
                <span id="bar-value2"></span>
              </div>
            </div>
            <div class="x-axis">떨림</div>
          </div>
          <!--  그래프 3: 속도 -->
          <div class="graph-container">
            <div class="y-axis">
              <span>1.5</span>
              <span>1</span>
              <span>0.5</span>
              <span>0</span>
            </div>
            <div class="grid-lines">
              <div class="grid-line"></div>
              <div class="grid-line"></div>
              <div class="grid-line"></div>
              <div class="grid-line"></div>
            </div>
            <div class="bar-container">
              <div class="bar" id="bar3">
                <span id="bar-value3"></span>
              </div>
            </div>
            <div class="x-axis">속도</div>
          </div>
        </div>
        <div class="voice_result">음성 평가 내용<br><br>

		평균 피치 (Hz)<div id="averagePitch"></div><br>
		상대적 떨림 (ΔF/F)<div id="relativeTremor"></div><br>
		속도 분석<div id="speech_rate"></div><br>
		
		<div id="pitchDescription"></div><br>
		
		<div id="tremorDescription"></div><br>
		
		<div id="speechAnalysis"></div><br>
		
        <div id="timestamp" hidden></div>
        
        </div>
      </div>
    </div>
    
<!-- 있어야 페이지가 돌아감 (더미 데이터)   -->
<div id="hairTouchCount" style="display: none;"></div>
<div id="noseTouchCount" style="display: none;"></div>

  <!-- AI 제스처 분석 -->
  <div class="title_container">
    <div class="title_detail">AI 제스처 분석</div>
  </div>
  <div class="section">
    <div class="section-header">
      <div class="section-title">AI 제스쳐 분석 상세 결과</div>
    </div>
    <div class="gesture-analysis-container">
      <div class="gesture-content">
        <div class="gesture-bars">
          <!-- Bar 1 -->
          <div class="gesture-bar-container">
            <span class="label">머리카락 만짐</span>
            <div class="gesture-bar-wrapper">
              <div class="gesture-bar" id="gesture-bar1">
                <span class="gesture-value" id="gesture-value1"></span>
              </div>
            </div>
          </div>
          <!-- Bar 2 -->
          <div class="gesture-bar-container">
            <span class="label">코 만짐</span>
            <div class="gesture-bar-wrapper">
              <div class="gesture-bar" id="gesture-bar2">
                <span class="gesture-value" id="gesture-value2"></span>
              </div>
            </div>
          </div>
        </div>
        <div class="gesture-summary">
          <ul>
            <li>결과 내용<div id="gestureAnalysis"></div></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>

   <button id="topButton"><i class="fa-solid fa-chevron-up"></i></button>

	<script src="js/index.js"></script>
<script src="https://kit.fontawesome.com/eefb1e8780.js" crossorigin="anonymous"></script>

<script>

document.addEventListener("DOMContentLoaded", () => {
    const topButton = document.getElementById("topButton");

    // 스크롤 이벤트 처리
    window.addEventListener("scroll", () => {
        // 스크롤 위치가 200px 이상일 때 버튼 표시
        if (window.scrollY > 200) {
            topButton.style.display = "block"; // 버튼 표시
        } else {
            topButton.style.display = "none"; // 버튼 숨기기
        }
    });

    // 버튼 클릭 시 페이지 상단으로 스크롤
    topButton.addEventListener("click", () => {
        window.scrollTo({
            top: 0,
            behavior: "smooth", // 부드럽게 스크롤
        });
    });
});

//막대 그래프 높이를 설정하는 함수
function setBarHeight(barId, valueId, value) {
console.log(`Attempting to set height for ${barId} with value: ${value}`);

const bar = document.getElementById(barId);
const barValue = document.getElementById(valueId);

if (!bar || !barValue) {
    console.error(`DOM element not found: barId=${barId}, valueId=${valueId}`);
    return;
}

if (value === undefined || value === null || value === "") {
    console.error(`Invalid value provided for ${barId}: ${value}`);
    return;
}

const maxHeight = 275;
const minHeight = 50;
const normalizedHeight = ((value - minHeight) / (maxHeight - minHeight)) * 100;

bar.style.height = normalizedHeight+'%';
barValue.innerText = value;
console.log(`Successfully set height for ${barId} to ${normalizedHeight}%`);
}

function setBarHeight2(barId, valueId, value) {
	console.log(`Attempting to set height for ${barId} with value: ${value}`);

	const bar = document.getElementById(barId);
	const barValue = document.getElementById(valueId);

	if (!bar || !barValue) {
	    console.error(`DOM element not found: barId=${barId}, valueId=${valueId}`);
	    return;
	}

	if (value === undefined || value === null || value === "") {
	    console.error(`Invalid value provided for ${barId}: ${value}`);
	    return;
	}

	const maxHeight = 0.015;
	const minHeight = 0;
	const normalizedHeight = ((value - minHeight) / (maxHeight - minHeight)) * 100;

	bar.style.height = normalizedHeight+'%';
	barValue.innerText = value;
	console.log(`Successfully set height for ${barId} to ${normalizedHeight}%`);
	}
	
function setBarHeight3(barId, valueId, value) {
	console.log(`Attempting to set height for ${barId} with value: ${value}`);

	const bar = document.getElementById(barId);
	const barValue = document.getElementById(valueId);

	if (!bar || !barValue) {
	    console.error(`DOM element not found: barId=${barId}, valueId=${valueId}`);
	    return;
	}

	if (value === undefined || value === null || value === "") {
	    console.error(`Invalid value provided for ${barId}: ${value}`);
	    return;
	}

	const maxHeight = 1.5;
	const minHeight = 0;
	const normalizedHeight = ((value - minHeight) / (maxHeight - minHeight)) * 100;

	bar.style.height = normalizedHeight+'%';
	barValue.innerText = value;
	console.log(`Successfully set height for ${barId} to ${normalizedHeight}%`);
	}

//각 막대의 길이를 설정하는 함수
function setGestureBarWidth(barId, valueId, value, maxValue) {
  const barElement = document.getElementById(barId);
  const valueElement = document.getElementById(valueId);

  if (!barElement || !valueElement) {
    console.error(`Element with ID ${barId} or ${valueId} not found`);
    return;
  }

  // 값에 따른 비율 계산 (최대 100%)
  let widthPercentage = (value / maxValue) * 100;
  
  // 막대의 길이와 값 설정 (애니메이션 적용)
  setTimeout(() => {
    barElement.style.width = widthPercentage+'%';
  }, 100); // 애니메이션 지연 시간 추가
 
  //0일 경우 텍스트 색상 변경 (흰색이 아니라 잘 보이는 색으로)
  if (value === 0) {
    valueElement.innerText = '0회';
    valueElement.style.color = '#999'; // 0일 경우 회색으로 표시
  } else {
    valueElement.innerText = +value + '회';
    valueElement.style.color = '#FFFFFF'; // 값이 있을 때 기본 텍스트 색상 (검정)
  }
}

document.addEventListener('DOMContentLoaded', () => {
	// 초기 상태로 막대 높이를 0으로 설정
	function resetBarHeight(barId) {
	    const bar = document.getElementById(barId);
	    bar.style.height = '0'; // 초기 높이 설정
	}
	
	// IntersectionObserver 설정
	const options = {
	    root: null, // 뷰포트를 기준으로 관찰
	    rootMargin: '0px',
	    threshold: 0.1 // 10% 이상 보이면 트리거
	};
	
	const observerCallback = (entries, observer) => {
	    entries.forEach(entry => {
	        if (entry.isIntersecting) {
	            console.log('Element is in view');
				
	         	// 명확한 데이터 전달
                const averagePitchValue = parseFloat(document.getElementById("averagePitch").textContent) || 0;
				const relativeTremorValue = parseFloat(document.getElementById("relativeTremor").textContent) || 0;
				const speech_rateValue = parseFloat(document.getElementById("speech_rate").textContent) || 0;
				
	            const bars = [
	                { barId: 'bar1', valueId: 'bar-value1', value: averagePitchValue },
	                { barId: 'bar2', valueId: 'bar-value2', value: relativeTremorValue  },
	                { barId: 'bar3', valueId: 'bar-value3', value: speech_rateValue  }
	            ];

	            // 디버깅 로그 추가
	            bars.forEach(({ barId, valueId, value }) => {
	                console.log('Preparing to set height: barId='+barId+','+'valueId='+valueId+','+'value='+value);
	                setBarHeight(barId, valueId, value);
	            });

	            observer.unobserve(entry.target);
	        }
	    });
	};
	
	// 초기화: 모든 막대를 높이 0으로 설정
	resetBarHeight('bar1');
	resetBarHeight('bar2');
	resetBarHeight('bar3');
	
	// 관찰할 대상 요소
	const target = document.querySelector('.voice');
	if (target) {
	    const observer = new IntersectionObserver(observerCallback, options);
	    observer.observe(target);
	} else {
	    console.error('.voice 요소를 찾을 수 없습니다.');
	}
	
	// 초기 상태로 막대 길이를 0으로 설정
	function resetGestureBars(barId) {
	  const barElement = document.getElementById(barId);
	  if (barElement) {
	    barElement.style.width = '0'; // 초기 길이 설정
	  }
	}
	
	// IntersectionObserver 설정
	const gestureObserverOptions = {
	  root: null, // 뷰포트를 기준으로 관찰
	  rootMargin: '0px',
	  threshold: 0.1, // 10% 이상 보이면 트리거
	};
	
	// gestureBarData 업데이트
    const gestureBarData = [
        { label: "머리카락 만짐", value: hairTouchCount },
        { label: "코 만짐", value: noseTouchCount },
    ];
	
 	// 최대값 계산 (그래프 비율 조정용)
    const maxGestureBarValue = Math.max(...gestureBarData.map(item => item.value));
	
	const gestureObserverCallback = (entries, observer) => {
	  entries.forEach(entry => {
	    if (entry.isIntersecting) {
	      console.log('Bars are in view'); // 뷰포트에 들어올 때 실행 확인
	
	      // 데이터 기반으로 막대 설정
	      setGestureBarWidth(
	        'gesture-bar1',
	        'gesture-value1',
	        gestureBarData[0].value,
	        maxGestureBarValue
	      );
	      setGestureBarWidth(
	        'gesture-bar2',
	        'gesture-value2',
	        gestureBarData[1].value,
	        maxGestureBarValue
	      );
	
	      observer.unobserve(entry.target); // 한 번 실행 후 관찰 중지
	    }
	  });
	};
	
	// 초기화: 모든 막대를 길이 0으로 설정
	resetGestureBars('gesture-bar1');
	resetGestureBars('gesture-bar2');
	
	// 관찰할 대상 요소
	const gestureBarsContainer = document.querySelector('.gesture-bars'); // 막대 그래프 컨테이너
	if (gestureBarsContainer) {
	  const gestureObserver = new IntersectionObserver(gestureObserverCallback, gestureObserverOptions);
	  gestureObserver.observe(gestureBarsContainer); // 관찰 시작
	} else {
	  console.error('.gesture-bars 요소를 찾을 수 없습니다.');
	}
});


// 백엔드 스크립트 코드 추가
let savedResults2 = [];

window.onload = function() {
    getSavedResults2(); // 데이터를 가져온 후 loadResult 호출
};

function loadResult(index) {
    const resultIndex = savedResults2.length - 1 - index;
    const selectedResult = savedResults2[resultIndex];
    
 	// 로컬 스토리지에서 값 가져오기
    const selectedGender = localStorage.getItem('selectedGender');
    if (selectedGender) {
        console.log('선택된 성별:', selectedGender);
    }
    
    if (!selectedResult) {
        console.error("선택된 데이터가 없습니다.");
        return;
    }

    console.log("선택된 결과:", selectedResult);
    
    // 피치 설명 문구 생성
    const averagePitch = selectedResult.averagePitch || 0; // averagePitch 값 확인 및 초기화
    let pitchDescription = ""; // pitchDescription 변수 명확히 선언

    if (selectedGender === "male") {
	    // 남성 피치 설명 문구 생성
	    if (averagePitch < 100) {
	    	pitchDescription = "남성 기준으로, 면접자님의 목소리는 낮은 피치로 분석되었습니다. 차분하고 안정적인 인상을 주지만, 때로는 너무 낮게 들릴 수 있어 상대방에게 다소 침체된 느낌을 줄 수 있습니다. 목소리의 톤을 조금 더 높여 긍정적인 이미지를 전달하는 것이 좋습니다.";
	    } else if (100 <= averagePitch && averagePitch < 180) {
	    	pitchDescription = "남성 기준으로, 면접자님의 목소리는 중간 피치로 분석되었습니다. 일반적으로 안정적이고 자연스러운 톤으로, 면접 시 적합한 목소리 톤입니다. 다만, 일정 부분 더 강렬하고 명확한 표현을 위해 목소리를 조금 더 강조해 보세요.";
	   	} else if (180 <= averagePitch && averagePitch < 250) {
	    	pitchDescription = "남성 기준으로, 면접자님의 목소리는 높은 피치로 분석되었습니다. 밝고 경쾌한 인상을 주지만, 너무 높으면 긴장하거나 불안해 보일 수 있습니다. 목소리 톤을 적절히 낮춰 안정감을 더하는 것이 중요합니다.";
	    } else if (averagePitch => 250) {
	    	pitchDescription = "남성 기준으로, 면접자님의 목소리는 매우 높은 피치로 분석되었습니다. 지나치게 높은 목소리는 불안정하거나 긴장한 인상을 줄 수 있습니다. 목소리의 톤을 낮추어 좀 더 안정적이고 신뢰감을 주는 톤을 유지하는 것이 좋습니다.";
	    }
    } else {
    	// 여성 피치 설명 문구 생성
        if (averagePitch < 200) {
            pitchDescription = "여성 기준으로, 면접자님의 목소리는 낮은 피치로 분석되었습니다. 차분하고 안정적인 인상을 주지만, 때로는 너무 낮게 들릴 수 있어 상대방에게 다소 침체된 느낌을 줄 수 있습니다. 목소리의 톤을 조금 더 높여 긍정적인 이미지를 전달하는 것이 좋습니다.";
        } else if (200 <= averagePitch && averagePitch < 250) {
            pitchDescription = "여성 기준으로, 면접자님의 목소리는 중간 피치로 분석되었습니다. 일반적으로 안정적이고 자연스러운 톤으로, 면접 시 적합한 목소리 톤입니다. 다만, 일정 부분 더 강렬하고 명확한 표현을 위해 목소리를 조금 더 강조해 보세요.";
        } else if (250 <= averagePitch && averagePitch < 350) {
            pitchDescription = "여성 기준으로, 면접자님의 목소리는 높은 피치로 분석되었습니다. 밝고 경쾌한 인상을 주지만, 너무 높으면 긴장하거나 불안해 보일 수 있습니다. 목소리 톤을 적절히 낮춰 안정감을 더하는 것이 중요합니다.";
        } else if (averagePitch >= 350) {
            pitchDescription = "여성 기준으로, 면접자님의 목소리는 매우 높은 피치로 분석되었습니다. 지나치게 높은 목소리는 불안정하거나 긴장한 인상을 줄 수 있습니다. 목소리의 톤을 낮추어 좀 더 안정적이고 신뢰감을 주는 톤을 유지하는 것이 좋습니다.";
        }
    }

    const hairTouchCount = selectedResult.hairTouchCount || 0;
    const noseTouchCount = selectedResult.noseTouchCount || 0;
    const totalTouches = hairTouchCount + noseTouchCount;

    const formattedTotalTouches = totalTouches.toFixed(2);

    // 상대적 떨림 분석
    const relativeTremor = selectedResult.relativeTremor || 0;
    let tremorDescription = '';

    if (relativeTremor < 0.03) {
    	tremorDescription = "떨림 분석 결과, 면접자님의 목소리는 매우 안정적입니다. 떨림이 거의 없으며, 자신감 있고 차분한 인상을 주어 면접에 적합합니다. 이러한 안정감 있는 톤을 계속 유지하면 더 긍정적인 영향을 줄 수 있습니다.";
    } else if (0.03 <= relativeTremor && relativeTremor < 0.07) {
        tremorDescription = "떨림 분석 결과, 면접자님의 목소리는 자연스러운 수준의 떨림을 보입니다. 떨림이 있지만 일반적으로 자연스럽게 느껴지며, 과도한 긴장 없이 잘 표현되고 있습니다. 떨림을 더 줄이려고 노력하면 더 자신감 있는 인상을 줄 수 있습니다.";
    } else if (0.07 <= relativeTremor && relativeTremor < 0.12) {
        tremorDescription = "떨림 분석 결과, 면접자님의 목소리에는 약간의 긴장 또는 미세한 떨림이 있습니다. 이는 긴장 상태를 나타낼 수 있으며, 면접에 불안감이 반영될 수 있습니다. 더 깊은 호흡과 안정적인 발음 연습을 통해 떨림을 줄여 보세요.";
    } else if (relativeTremor >= 0.12) {
        tremorDescription = "떨림 분석 결과, 면접자님의 목소리는 과도한 떨림을 보입니다. 강한 떨림은 불안감을 드러낼 수 있으며, 면접관에게 부정적인 인상을 줄 수 있습니다. 긴장 완화와 차분한 목소리 톤을 연습하면 떨림을 효과적으로 줄일 수 있습니다.";
    }
	
    // 움직임 분석
    let gestureAnalysis = '';
    if (totalTouches >= 7) {
        gestureAnalysis = '제스처 분석 결과, 면접자님의 제스처는 ‘미흡’입니다. 면접 중 손으로 머리나 코를 자주 만지셨습니다. 면접에서 긴장이나 불안의 신호로 해석될 수 있으니, 신경 쓰셔야 할 부분입니다.';
	} else if (totalTouches >= 4) {
        gestureAnalysis = '제스처 분석 결과, 면접자님의 제스처는 ‘보통’입니다. 손으로 머리나 코를 만지신 횟수가 보통입니다. 조금의 긴장감을 가졌지만 나름 자연스러운 면접을 진행하신 것으로 보입니다.';
    } else {
        gestureAnalysis = '제스처 분석 결과, 면접자님의 제스처는 ‘우수’입니다. 손으로 머리나 코를 만지신 횟수가 매우 적었습니다. 면접 중 안정감과 자신감을 잘 표현하셨습니다.';
    }
    
    //그래프 업데이트
    setBarHeight('bar1', 'bar-value1', selectedResult.averagePitch); // 피치 값 반영
	setBarHeight2('bar2', 'bar-value2', selectedResult.relativeTremor); // 떨림 값 반영
	setBarHeight3('bar3', 'bar-value3', parseFloat(selectedResult.speech_rate).toFixed(2));
	
	// 속도 분석
	const speech_rate = selectedResult.speech_rate || 0;
	let speechAnalysis = '';
	
	if (speech_rate < 0.5) {
		speechAnalysis = "면접자님의 말하기 속도는 '느림'입니다. 답변이 다소 천천히 진행되고 있어, 때때로 긴장이나 불안이 느껴질 수 있습니다. 조금 더 자연스럽고 자신감 있게 답변을 이어가며 속도를 조절해보세요. 이렇게 하면 답변이 더 매끄럽고 청중이 지루함을 느끼지 않을 수 있습니다.";
    } else if (0.5 <= speech_rate && speech_rate < 1) {
    	speechAnalysis = "면접자님의 말하기 속도는 '보통'입니다. 적당한 속도로 생각을 정리하면서도 청중이 이해하기 쉽게 말하고 계십니다. 이 속도는 좋은 균형을 이룬 속도입니다. 다만, 중요한 포인트를 강조하고 싶을 때는 약간 더 느리게 말하거나, 강조할 부분에서 속도를 조절하는 것도 효과적일 수 있습니다.";
    } else if (speech_rate >= 1) {
    	speechAnalysis = "면접자님의 말하기 속도는 '빠름'입니다. 빠른 속도로 답변을 진행하셔서, 답변이 다소 급하게 느껴질 수 있습니다. 이 속도는 자신감을 보여줄 수 있지만, 너무 빠르면 청중이 내용을 따라가기 어려울 수 있습니다. 중요한 부분에서는 속도를 조금 늦추어 강조하는 연습이 필요할 것 같습니다.";
    }
	
	// UI에 반영
	// document.getElementById("recognizedText").textContent = selectedResult.recognizedText || "데이터 없음";
    document.getElementById("averagePitch").textContent = selectedResult.averagePitch ? selectedResult.averagePitch.toFixed(2) : "0";
    document.getElementById("relativeTremor").textContent = selectedResult.relativeTremor ? selectedResult.relativeTremor.toFixed(4) : "0";
    document.getElementById("hairTouchCount").textContent = selectedResult.hairTouchCount || "0";
    document.getElementById("noseTouchCount").textContent = selectedResult.noseTouchCount || "0";
    document.getElementById("timestamp").textContent = selectedResult.timestamp || "타임스탬프 없음";
    document.getElementById("pitchDescription").textContent = pitchDescription;
    document.getElementById("gestureAnalysis").textContent = gestureAnalysis;
    document.getElementById("tremorDescription").textContent = tremorDescription;
    document.getElementById("speech_rate").textContent = selectedResult.speech_rate
    ? parseFloat(selectedResult.speech_rate).toFixed(2)
    : "0.00";
    document.getElementById("speechAnalysis").textContent = speechAnalysis;
    
    
    // gestureBarData 업데이트
    const gestureBarData = [
    	{ label: "머리카락 만짐", value: hairTouchCount },
    	{ label: "코 만짐", value: noseTouchCount },
	];
	
	console.log("업데이트된 제스처 데이터:", gestureBarData);
	    
	// 최대값 계산 (그래프 비율 조정용)
	const maxGestureBarValue = Math.max(...gestureBarData.map(item => item.value));
	
	// 막대 그래프 업데이트
	setGestureBarWidth('gesture-bar1', 'gesture-value1', gestureBarData[0].value, maxGestureBarValue);
	setGestureBarWidth('gesture-bar2', 'gesture-value2', gestureBarData[1].value, maxGestureBarValue);
	}
	

	
// 서버에서 데이터를 가져오기
function getSavedResults2() {
	fetch("http://localhost:5700/get_results2")
		.then(response => response.json())
		.then(data => {
			console.log("서버에서 가져온 결과:", data.saved_results2);
			savedResults2 = data.saved_results2; // 데이터를 전역 변수에 저장
			loadResult(0); // 기본적으로 0번 데이터를 로드
		})
		.catch(error => {
			console.error("서버에서 데이터를 가져오는 중 오류 발생:", error);
		});
	}
	
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>One Results</title>
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
  cursor: pointer;
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
  gap: 20px; /* 각 div 사이 간격 */
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
  max-height: 500px;
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
</style>
</head>
<body>
	 <!-- 헤더 불러오기 -->
    <div><jsp:include page="header.jsp"></jsp:include> </div>
  
  <div class="container">
    <div class="top-buttons">
      <button class="btn">나가기</button>
    </div>

    <div class="title"><img src="../img/feedbackup.png"></div>

    <!-- AI 음성 분석 -->
    <div class="title_container">
      <div class="title_detail">AI 음성 분석</div>
    </div>
    <div class="section"> 
      <div class="section-header">
        <div class="section-title">AI 음성 분석 상세 결과</div>
        <div class="tabs">
          <button class="active">Q1</button>
          <button>Q2</button>
          <button>Q3</button>
        </div>
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
              <span>300</span>
              <span>200</span>
              <span>100</span>
              <span>90</span>
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
              <span>300</span>
              <span>200</span>
              <span>100</span>
              <span>90</span>
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
      
          <!-- 그래프 3: 속도 -->
          <div class="graph-container">
            <div class="y-axis">
              <span>300</span>
              <span>200</span>
              <span>100</span>
              <span>90</span>
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
        <div class="voice_result">음성 평가 내용</div>
      </div>
    </div>

  <!-- AI 제스처 분석 -->
  <div class="title_container">
    <div class="title_detail">AI 제스처 분석</div>
  </div>
  <div class="section">
    <div class="section-header">
      <div class="section-title">AI 제스쳐 분석 상세 결과</div>
      <div class="tabs">
        <button class="active">Q1</button>
        <button>Q2</button>
        <button>Q3</button>
      </div>
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
            <li>머리 움직임이 다소 산만합니다.</li>
            <li>불필요한 제스처의 움직임이 보통입니다.</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>

	<!-- 푸터 불러오기 -->
    <div><jsp:include page="footer.jsp"></jsp:include> </div>
<script>
document.addEventListener('DOMContentLoaded', () => {
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

    const maxHeight = 300;
    const minHeight = 90;
    const normalizedHeight = ((value - minHeight) / (maxHeight - minHeight)) * 100;

    bar.style.height = normalizedHeight+'%';
    barValue.innerText = value;
    console.log(`Successfully set height for ${barId} to ${normalizedHeight}%`);
}

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
	            const bars = [
	                { barId: 'bar1', valueId: 'bar-value1', value: 150 },
	                { barId: 'bar2', valueId: 'bar-value2', value: 200 },
	                { barId: 'bar3', valueId: 'bar-value3', value: 250 },
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
	
	// 제스쳐
	// 데이터 값 설정
	const gestureBarData = [
	  { label: "머리카락 만짐", value: 4 },
	  { label: "코 만짐", value: 1 },
	];
	
	// 최대값 기준으로 막대 비율 계산
	const maxGestureBarValue = Math.max(...gestureBarData.map(item => item.value)); // 최대값 계산
	
	// 각 막대의 길이를 설정하는 함수
	function setGestureBarWidth(barId, valueId, value, maxValue) {
	  const barElement = document.getElementById(barId);
	  const valueElement = document.getElementById(valueId);
	
	  if (!barElement || !valueElement) {
	    console.error(`Element with ID ${barId} or ${valueId} not found`);
	    return;
	  }
	
	  // 값에 따른 비율 계산 (최대 100%)
	  const widthPercentage = (value / maxValue) * 100;
	
	  // 막대의 길이와 값 설정 (애니메이션 적용)
	  setTimeout(() => {
	    barElement.style.width = widthPercentage+'%';
	  }, 100); // 애니메이션 지연 시간 추가
	 
	  valueElement.innerText = +value+'회';
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

</script>
</body>
</html>

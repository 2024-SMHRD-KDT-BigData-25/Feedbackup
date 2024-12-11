<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job_List</title>
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
		    text-align: center;
		}
		
		.text2{
			font-size: 10px;
		    margin-top: 10px;
		    margin-bottom: 20px;
		    text-align: center;
		    color: #64748B;
		}

/* Main Container */
.category-container {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 20px;
  width: 800px;
  background-color: #FFFFFF;
  border: 1px solid #8071FC;
  border-radius: 30px;
  padding: 40px 40px;
  margin: 0px auto;
  margin-top: -10px;
}

/* Step Circle */
.category-step {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-right: 30px;
}

.step-circle {
  width: 40px;
  height: 40px;
  background-color: #8071FC;
  color: white;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 25px;
  font-weight: 900;
}

/* Category Grid */
.category-grid {
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  gap: 20px;
}

/* Buttons */
.category-button {
  background-color: #F3F3F3;
  color: #333333;
  border: 1px solid white;
  border-radius: 10px;
  font-size: 10px;
  text-align: center;
  cursor: pointer;
  transition: all 0.2s ease-in-out;
  font-weight: 550;
  width: 100px;
  height: 30px;
  
}

.category-button:hover {
  box-sizing: border-box;
  background-color: #F3EDFF;
  color: #8071FC;
  border: 2px solid #8071FC;
  font-weight: bold;
}

.category-button.active {
  background-color: #8071FC;
  color: white;
  border: 2px solid #8071FC;
  font-weight: bold;
}

.category-button.active:hover {
  /* 호버 상태가 유지되도록 추가 스타일 지정 */
  background-color: #8071FC;
  color: white;
}

.sex_container{
  text-align: center;
  align-items: center;
  gap: 20px;
  width: 800px;
  height: 100px;
  background-color: #FFFFFF;
  border: 1px solid #8071FC;
  border-radius: 30px;
  padding: 30px 40px;
  margin: 30px auto;
  color: #8071FC;
  font-size: 11px;
  font-weight: bold;
}

.sex_select{
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 20px;
  width: 1000px;
  margin: 0px auto;
}

.sex{
  display: flex;
  justify-content: center;
  gap: 20px;
  font-size: 18px;
  width: 615px;
}

.box{
  display: flex;
  justify-content: center; /* 수평 정렬 */
  align-items: center;  
  background-color: #FFFFFF;
  border: 1px solid #8071FC;
  width: 130px;
  height: 70px;
  margin-top:20px;
  border-radius: 15px;
  font-size: 15px;
}

.box:hover{
  box-sizing: border-box;
  background-color: #F3EDFF;
  color: #8071FC;
  border: 2px solid #8071FC;
  font-weight: bold;
}

.box.active{
  background-color: #8071FC;
  color: white;
  border: 2px solid #8071FC;
  font-weight: bold;
}

.search-container {
  display: flex;
  justify-content: right;
  margin: 0px 320px;
  gap: 10px;

}

.search-input {
  width: 180px;
  height: 30px;
  padding: 3px;
  border: 1px solid #8071FC;
  border-radius: 5px;
  font-size: 14px;
}

.search-button {
  background-color: #8071FC;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 9px 10px;
  font-size: 14px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.search-button:hover {
  background-color: #6a5ecc;
}

.search-result {
  margin: 20px auto;
  text-align: center;
  font-size: 16px;
  color: #333;
}

.next{
	display: flex;
	justify-content: center;
	align-items: center;
}

.next_btn{
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	border: 1px solid #8071FC;
 	border-radius: 5px;
 	width: 160px;
  	height: 65px;
  	background-color: #8071FC;
  	color: white;
  	border-radius: 50px; 
  	font-size: 20px;
  	font-weight: bold; 
}

.sex_select .step-circle{
	margin-bottom:20px;
}

  .error-message {
    color: red;
    font-weight: bold;
    text-align: center;
    margin-top: 20px;
  }
  .search-result {
    text-align: center;
    margin-top: 20px;
  }
</style>

</head>
<body>
<div class="Job_list_wrapper">
  <div class="text1">희망하시는 기업을 선택해 주세요</div>
  <div class="text2">* 확실한 면접 준비를 위해 각각 한가지만 선택가능 합니다.</div>
<div class="search-container">
  <form id="search-form" action="/myapp/users/Job_List" method="POST">
    <input 
      type="text" 
      id="search-input" 
      name="jobCode" 
      placeholder="기업명을 검색하세요" 
      class="search-input" 
    />
    <button type="submit" class="search-button">검색</button>
  </form>
</div>
	<div id="search-result" class="search-result"></div>
  <div class="category-container">
    <div class="category-step">
      <div class="step-circle">1</div>
    </div>
    <div class="category-grid">
      <button class="category-button">카카오</button>
      <button class="category-button">현대자동차</button>
      <button class="category-button">삼성전자</button>
      <button class="category-button">SKT</button>
      <button class="category-button">SK 하이닉스</button>
      <button class="category-button">KT</button>
      <button class="category-button">LG</button>
      <button class="category-button">포스코</button>
      <button class="category-button">롯데</button>
      <button class="category-button">한화</button>
      <button class="category-button">GS</button>
      <button class="category-button">농협</button>
      <button class="category-button">두산</button>
      <button class="category-button">LS</button>
      <button class="category-button">한진</button>
      <button class="category-button">CJ</button>
      <button class="category-button">신세계</button>
      <button class="category-button">셀트리온</button>
      <button class="category-button">쿠팡</button>
      <button class="category-button">금호아시아나</button>
      <button class="category-button">하림</button>
      <button class="category-button">SM</button>
    </div>
  </div>
  <div class="sex_container">
  	<div>정확한 음성 분석을 위해 성별을 선택해 주세요</div>
  	<div class="sex_select">
  		<div class="category-step">
      		<div class="step-circle">2</div>
    	</div>
      	<div class="sex">
  		<div class="box" data-gender="male">남성</div>
  		<div class="box" data-gender="woman">여성</div>
  	</div>
  	</div>
  </div>
  <div class="next">
  	<a href="/myapp/AI_Interview" style="text-decoration: none;"><div class="next_btn">다음</div></a>
  </div>
</div>

<script>

//성별 선택 클릭 이벤트 처리
document.querySelectorAll('.box').forEach(box => {
  box.addEventListener('click', function () {
    // 모든 성별 버튼에서 active 클래스 제거
    document.querySelectorAll('.box').forEach(btn => btn.classList.remove('active'));

    // 현재 클릭된 성별 버튼에 active 클래스 추가
    this.classList.add('active');
  });
});

//검색 폼 제출 이벤트 처리
document.getElementById('search-form').addEventListener('submit', function (event) {
  event.preventDefault(); // 기본 제출 동작 중단
  searchCompany(); // 검색 로직 실행
  this.submit(); // 폼 데이터 제출
});

// 검색 입력 필드에서 Enter 키 처리
document.getElementById('search-input').addEventListener('keydown', function (event) {
  if (event.key === 'Enter') { // 엔터 키 확인
    event.preventDefault(); // 기본 엔터 동작(폼 제출) 중단
    searchCompany(); // 검색 실행
    document.getElementById('search-form').submit(); // 폼 데이터 제출
  }
});


function searchCompany() {
	  const input = document.getElementById('search-input').value.trim().toLowerCase(); // 검색어 가져오기
	  const buttons = document.querySelectorAll('.category-button'); // 모든 버튼 가져오기
	  let result = '';
	  const activeCompanies = []; // 활성화된 버튼 저장 배열

	  buttons.forEach(button => {
	    const companyName = button.textContent.trim().toLowerCase(); // 버튼 텍스트 가져오기

	    // 검색어가 버튼 텍스트에 포함되어 있는지 확인
	    if (companyName.includes(input)) {
	      result += `${button.textContent} `;
	      button.classList.add('active');
	      activeCompanies.push(companyName); // 활성화된 버튼 이름 저장
	    } else {
	      button.classList.remove('active');
	    }
	  });

	  if (!input) {
	    result = '검색어를 입력하세요.';
	  } else if (result === '') {
	    result = '일치하는 기업이 없습니다.';
	  }

	  document.getElementById('search-result').textContent = result;

	  // 로컬 스토리지에 활성화된 버튼 저장
	  localStorage.setItem('activeCompanies', JSON.stringify(activeCompanies));
	}

// 페이지 로드 시 로컬 스토리지에서 버튼 상태 복원
window.addEventListener('DOMContentLoaded', function () {
  const activeCompanies = JSON.parse(localStorage.getItem('activeCompanies')) || [];
  const buttons = document.querySelectorAll('.category-button');

  buttons.forEach(button => {
    const companyName = button.textContent.toLowerCase();

    if (activeCompanies.includes(companyName)) {
      button.classList.add('active'); // 로컬 스토리지에 저장된 버튼 복원
    }
  });
});

// 클릭 이벤트로 active 상태 유지
document.querySelectorAll('.category-button').forEach(button => {
  button.addEventListener('click', function () {
    document.querySelectorAll('.category-button').forEach(btn => btn.classList.remove('active'));
    this.classList.add('active');
  });
});

</script>

</body>
</html>
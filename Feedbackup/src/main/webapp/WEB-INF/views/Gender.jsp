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
		    margin-top: 100px;
		    text-align: center;
		}
		
		.text2 {
	        font-size: 10px;
	        margin-top: 10px;
	        margin-bottom: 20px;
	        text-align: center;
	        color: #64748B;
    	}
.sex_container{
  text-align: center;
  align-items: center;
  width: 800px;
  padding: 30px 40px;
  margin: 30px auto;

}

.sex_select{
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 20px;
  margin: 0px auto;
}

.sex{
  display: flex;
  gap: 20px;
  font-size: 18px;
}

.box{
  background-color: #FFFFFF;
  border: 1px solid #CBD5E1;
  width: 250px;
  height: 250px;
  border-radius: 15px;
  font-size: 15px;
  display: flex; /* 플렉스 컨테이너 */
  flex-direction: column; /* 세로 방향 정렬 */
  justify-content: center; /* 수직 가운데 정렬 */
  align-items: center; /* 수평 가운데 정렬 */
  box-shadow: 0 1px 20px 0 rgb(220, 220, 220);
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

.box div{
	margin-top: 20px;
	font-size: 20px;
	font-weight: bold;
}

.man{
	width: 150px;
}

.woman{
	width: 130px;
	margin-top: 20px; 
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
	 <!-- 헤더 불러오기 -->
    <div><jsp:include page="header.jsp"></jsp:include> </div>

<div class="Gender_wrapper">
  <div class="text1">성별을 선택해주세요</div>
  <div class="text2">정확한 음성분석을 위해 사용됩니다.</div>
  <div class="sex_container">
  	<div class="sex_select">
      	<div class="sex">
	  		<div class="box" data-gender="male">
		  		<img src="../img/man.png" class="man">
		  		<div>남성</div>
	  		</div>
	  		<div class="box" data-gender="woman">
	  			<img src="../img/woman.png" class="woman">
		  		<div>여성</div>
	  		</div>
  		</div>
  	</div>
  </div>
  <div class="next">
  	<button type="submit" style="text-decoration: none;" class="next_btn">다음</button>
  </div>
</div>
	<!-- 푸터 불러오기 -->
    <div><jsp:include page="footer.jsp"></jsp:include> </div>
    
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FeedbackUp | AI Interview</title>
	<style>
		@font-face {
		    font-family: 'SUIT';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
		}
		        
		body {
		    background-color: #F1F5F9;
		    font-family: 'SUIT-Regular';
		    align-content: center;
		}
		
		.Interview_wrapper{
		    text-align: center;
		    margin-top: 150px;
		    margin-bottom: 80px;
		}
		
		.text1{
		    font-size: 35px;
		    font-weight: 800;
		    margin-top: 40px;
		    margin-bottom: 70px;
		}
		
		.text2{
		    font-size: 32px;
		    font-weight: 800;
		    margin: 0px auto;
		}
		
		.text3{
		    font-size: 20px;
		    font-weight: 150px;
		    line-height: 1.5;
		}
		
		.container{
		    display: flex;
		    justify-content: center;
		    gap: 20px;
		}
		
		.box {
		    width: 390px; /* 원하는 너비 */
		    height: 390px; /* 원하는 높이 */
		    background-color: white; /* 임시 스타일 */
		    margin: 5px; /* 간격 */
		    border-radius: 30px;
		    box-shadow: 0 1px 20px 0 rgb(180, 180, 180);
		    box-sizing: border-box; /* 패딩과 테두리 포함 */
		    transition: all 0.3s ease;
		}
		
		.one_img{
		    width: 180px; /* 원하는 너비 */
		    height: 180px; /* 원하는 높이 */
		    margin-top: 40px;
		}
		
		.AI_img{
		    width: 180px; /* 원하는 너비 */
		    height: 180px; /* 원하는 높이 */
		    margin-top: 60px;
		    margin-bottom: -20px;
		}
		
		/* 클릭 상태 스타일 */
		.box:hover {
		    border: 6px solid #8071FC; 
		    color: #8071FC;
		    background-color: #F3EDFF; 
		    trainsition: 0.5s;
		}
		
		a:link {
			color: black;
			text-decoration: none;
		}
		
		a:visited {
			color: black;
			text-decoration: none;
		}
		  

	</style>
</head>

<body>

     <!-- 푸터 불러오기 -->
    <div><jsp:include page="header.jsp"></jsp:include> </div>

	<div class="Interview_wrapper">
		<div class="text1">원하는 연습을 선택하세요.</div>
		<div class="container">
			<a href="/myapp/One_Interview"><div class="box" id="box1">
				<img src="img/one.png" class="one_img">
				<p class="text2">자기소개</p>
				<p class="text3">나만의 이야기를 완성하는<br>1분 자기소개 연습</p>
			</div></a>
			
			<a href="/myapp/AI_Interview">
			<div class="box" id="box2">
				<img src="img/AI.png" class="AI_img">
				<p class="text2">AI 면접</p>
				<p class="text3">희망 기업의 예상 질문과<br>면접 분석을 통한 연습</p>
			</div>
			</a>
		</div>
	</div>

	<!-- 푸터 불러오기 -->
    <div><jsp:include page="footer.jsp"></jsp:include> </div>

</body>
</html>
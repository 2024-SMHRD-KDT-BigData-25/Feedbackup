<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인</title>

	<style>
        @font-face {
            font-family: 'SUIT-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        .logo {
            width: 365px;
            height: 79px;
            display: block;
            margin: 0 auto;
            margin-top: 40px;
            margin-bottom: -50px;
            max-width: 160px;
            max-height: 35px;
        }
        
        .naverlogo {
            width: 20px;
            height: 20px;
            border-radius: 5px;
        }

        body {
            background-color: #F1F5F9;
            font-family: 'SUIT-Regular';
            align-content: center;
        }
        
        .login_wrapper{
        	width: 330px;
            height: 430px;
        	background-color: white;
            padding: 30px;
            border-radius: 5px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 40px;
            box-shadow: 0 1px 20px 0 rgb(232, 232, 232);
            align-content: center;
        }
        
        h1 {
          font-size: 20px;
          margin-left: 17px;  
        }
        
       input {
            border-radius: 10px;
            border: 0.5px #CBD5E1 solid;
            margin-left: 15px;
            margin-bottom: 18px;
            padding: 13px;
       }

       input::placeholder {
        color: #94A3B8;
       }

       input:focus{
        outline-color: #8071FC;
       }
       
        .checkbox_wrapper {
            display: flex; /* Flexbox를 사용하여 수평 정렬 */
            justify-content: space-between; /* 요소 간 공간을 최대한 띄움 */
            align-items: center; /* 수직 가운데 정렬 */
            margin-top: -5px;
            margin-bottom: 30px;
            gap: 5px;
        }

        .checkbox_container {
            float: left;
            font-size: 12px;
        }
        
        .signup {
            float: right; /* 오른쪽 정렬 */
            margin-right: 40px;
        }

        .checkbox_label {
            color: #94A3B8;
        }
        
        .container {
            overflow: hidden; /* float로 인해 컨테이너 높이 문제를 해결 */
        }

        a {
            font-weight: 300;
            font-size: 12px;
            color: #334155;
        }
        
        a:visited {
            color: #334155; /* 클릭 후에도 색상이 변하지 않도록 설정 */
        }
        
        #auto_login {
           	accent-color: #8071FC; 
            border: 0.5px #CBD5E1 solid; /* 색상 변화 안됨, 색상 변화시키면 기능이 사라짐 */
            margin-bottom: 0px; 
            vertical-align: -3px; 
        }
        
        #loginBtn {
        background-color: #8071FC;
        color: white;
        font-weight: 600;
        width: 287.6px;
        height: 43.6px;
        margin-left: 15px;
        margin-bottom: 10px;
       }

       #loginBtn:hover {
        color: #8071FC;
        background-color: white;
        border-color: #8071FC;
       }
       
       #naverloginBtn {
        display: flex; /* Flexbox로 내부 요소 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
        background-color: white;
        font-weight: 550;
        width: 287.6px;
        height: 43.6px;
        margin-left: 15px;
        border-radius: 10px;
        border: 0.5px #CBD5E1 solid;
        gap: 10px; /* 이미지와 텍스트 간격 */
       }
       
        .link-container {
            text-align: center; 
            font-size: 14px; /* 텍스트 크기 */
            margin-bottom: 20px;
        }

        .link-container a {
            margin: 0 auto; /* 좌우 여백 */
        }

        .link-container a::after {
            content: "|"; /* 구분 기호 추가 */
            margin: 0 10px; /* 구분 기호 간격 */
        }

        .link-container a:last-child::after {
            content: ""; /* 마지막 링크에는 구분 기호 제거 */
        }
       
	</style>

</head>
<body>
	<img src="${pageContext.request.contextPath}/assets/img/logo2.png" alt="logo" class="logo"><br><br><br><br>
	<div class="login_wrapper">
	<h1>로그인</h1><br>
	<form action="/myapp/login" method="post">
		<input type="text" name="id" placeholder="아이디" required style="width: 260px"><br> 
		<input type="password" name="pw" placeholder="비밀번호" required style="width: 260px"><br>
			
		<div class="checkbox_wrapper">
		    <div class="checkbox_container">
		        <input type="checkbox" id="auto_login" name="auto_login">
		        <label class="checkbox_label" for="auto_login">다음부터 자동으로 로그인하기</label>
		    </div>
		    <a href="/myapp/users/signup" class="signup">가입하기</a>
		</div>
		
		<input type="submit" value="로그인" id="loginBtn"><br>
					
		<a href="/myapp/users/naverlogin" style="text-decoration: none;">
		<button type="button" id="naverloginBtn"><img src="${pageContext.request.contextPath}/assets/img/naverlogo.jpg" alt="naverlogo" class="naverlogo">네이버 계정으로 로그인</button></a><br> 
			
	    <div class="link-container">
	        <a href="/myapp/users/idfind">아이디 찾기</a>
	        <a href="/myapp/users/pwfind">비밀번호 찾기</a>
	    </div>
	
	</form>
	</div>
</body>
</html>
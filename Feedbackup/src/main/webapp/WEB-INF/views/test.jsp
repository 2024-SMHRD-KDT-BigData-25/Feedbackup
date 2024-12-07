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

        body {
            background-color: #F1F5F9;
            font-family: 'SUIT-Regular';
            align-content: center;
        }
        
        .login_wrapper{
        	width: 330px;
            height: 450px;
        	background-color: white;
        	margin-left: 1px;
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
            margin-bottom: 20px;
            gap: 5px;
        }

        .checkbox_container {
            float: left;
        }
        
        .signup-link {
            float: right; /* 오른쪽 정렬 */
            margin-right: 40px;
        }

        .checkbox_label {
            margin-left: 8px; /* 체크박스와 텍스트 간격 */
        }
        
        .container {
            overflow: hidden; /* float로 인해 컨테이너 높이 문제를 해결 */
        }

        a {
            color: blue; /* 링크 색상 */
            font-weight: bold;
        }
        
        #auto_login{
        	accent-color: #5344D4;
    		border: #5344D4 solid 1px;
    		margin-bottom: 0px;
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
		        <label class="checkbox-label" for="auto-login">다음부터 자동으로 로그인하기</label>
		    </div>
		    <a href="/myapp/users/signup" class="signup-link">가입하기</a>
		</div>
		
		<input type="submit" value="로그인"><br>
					
		<a href="/myapp/users/naverlogin" style="text-decoration: none;">
		<button type="button">네이버 로그인</button></a><br> 
			
		<button><a href="/myapp/users/idfind">아이디 찾기</a></button>
		<button><a href="/myapp/users/pwfind">비밀번호 찾기</a></button>
	
	</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedbackup | 회원가입 성공</title>
<style>
	@font-face {
	    font-family: 'SUIT-Regular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	    }
	    
	.signup_success-logo {
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
        letter-spacing: -1px; /* 글자 사이 간격을 2px로 설정 */
	}
        
    .success {
	    max-width: 600px;
	    height: 280px;
	    background-color: #ffff;
	    margin: 0 auto;
	    padding-top: 35px;
	    border-radius: 10px;
	    box-shadow: 0 1px 20px 0 rgb(232, 232, 232);
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
    }
    
    
    h1 {
    	font-size: 15px;
    	font-weight: 600;
    	margin-top: 20px;
    	margin-bottom: 20px;
    }
    
    h2{
    	font-size: 21px;
    	font-weight: bold;
    	margin-top: 50px;
    }
    
    p{
    	font-size: 14px;
    	margin: 5px 0;
    	font-weight: 500;
    }
    
    .login {
	    display: inline-block; /* a 태그를 블록처럼 보이게 */
	    padding: 19px 265px;
	    text-align: center;
	    background-color: #8071FC;
	    color: white;
	    text-decoration: none;
	    border-radius: 10px;
	    white-space: nowrap;
	    font-weight:bold;
	    font-size: 25px;
	    margin-top: 50px;
	}
	
	.login:hover {
      background-color: #8071FC;
      border: 1px solid #8071FC;
      color: white;
      cursor: pointer;
}
	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

</style>
</head>
<body>

	<a href="/myapp"><img src="../img/logo2.png" alt="logo" class="signup_success-logo"></a><br><br><br><br>
	<div class="success">
		<h2 class="1st">피드백업 회원가입 완료</h1>
		<h1>저희 피드백업의 가족이 되신 것을 진심으로 환영합니다!</h1>
		<p>당신의 꿈을 향한 첫 단계를 축하합니다.</p>
		<p>AI 면접 연습으로 성공을 향해 나아가세요!</p>
		
		<a href="/myapp/login" class="login">로그인</a>	
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FeedbackUp | 로그인</title>
<link rel="stylesheet" href="/myapp/css/loginStyle.css">
</head>
<body>
	<img src="/myapp/assets/img/logo2.png" alt="logo" class="logo">
	<br>
	<br>
	<br>
	<br>
	<div class="signin-box">
		<h1>로그인</h1>
		<br>
		<form action="/myapp/login" method="post">
			<input type="text" name="id" placeholder="아이디"><br> <input
				type="password" name="pw" placeholder="비밀번호"><br>
			<button>
				<a href="/myapp/users/signup">가입하기</a>
			</button>
			<br> <a href="/myapp/users/naverlogin"
				style="text-decoration: none;">
				<button type="button">네이버 로그인</button>
			</a> <br> <input type="submit" value="로그인" id="submitBtn"><br>
			<button>
				<a href="/myapp/users/idfind">아이디 찾기</a>
			</button>
			<button>
				<a href="/myapp/users/pwfind">비밀번호 찾기</a>
			</button>
		</form>
	</div>
</body>
</html>
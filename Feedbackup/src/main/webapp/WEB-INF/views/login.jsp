<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="/myapp/login" method="post">
      <input type="text" name="id" placeholder="아이디"><br>
      <input type="password" name="pw" placeholder="비밀번호"><br>
      <button><a href="/myapp/users/signup" >가입하기</a></button><br>
      <input type="submit" value="로그인"><br>
      <button><a href="/myapp/users/idfind" >아이디 찾기</button>
      <button><a href="/myapp/users/pwfind" >비밀번호 찾기</button>
   </form>
</body>
</html>
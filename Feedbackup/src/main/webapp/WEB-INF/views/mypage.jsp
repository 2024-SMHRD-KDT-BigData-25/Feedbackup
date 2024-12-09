<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MavenMember member = (MavenMember) session.getAttribute("member");
	%>
	<h1>My Page</h1> <br>
	<%=member.getName()%>님
	<button onclick="location.href='/myapp/logout'">로그아웃</button>
	
</body>
</html>
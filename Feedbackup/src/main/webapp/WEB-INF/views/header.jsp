<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Header</title>
  </head>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

  <body>
    <header class="header">
      <div class="logo">
        <a href="${pageContext.request.contextPath}/">
          <img src="${pageContext.request.contextPath}/img/logo2.png" title="logo" width="165">
        </a>
      </div>
      <nav class="nav">
        <ul class="nav-list">
          <li><a href="/myapp/Interview_Select">AI 면접</a></li>
          <li><a href="/myapp/users/result_list">AI 분석결과</a></li>
          <li><a href="/myapp/QandA">합격자 답안</a></li>
          <li><a href="#">고객지원</a></li>
        </ul>
      </nav>
      <div class="auth-btn">
      
	   <%
	   MavenMember member = (MavenMember) session.getAttribute("member");
	%>
	
	<%
	   if (member == null) {
	%>
	   <!-- 절대 경로로 수정 -->
	   <button class="btn btn-login" onclick="location.href='<%=request.getContextPath()%>/login'">로그인</button>
	   <button class="btn btn-sign" onclick="location.href='<%=request.getContextPath()%>/users/signup'">회원가입</button>
	<%
	   } else {
	%>
	   <div class="btn btn-user"><a onclick="location.href='<%=request.getContextPath()%>/users/mypage'"><strong><%=member.getName()%></strong>&nbsp;&nbsp;님 마이페이지</a></div>
	   <button class="btn btn-logout" onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button>
	<%
	   }
	%>
      </div>  
    </header>
    
       <script>
      function deleteMember(id) {
         let choice = confirm("정말 탈퇴하시겠습니까?")

         if (choice) {
            location.href = "/myapp/users/" + id + "/delete";
         }
      }
   </script>
    
  </body>
</html>

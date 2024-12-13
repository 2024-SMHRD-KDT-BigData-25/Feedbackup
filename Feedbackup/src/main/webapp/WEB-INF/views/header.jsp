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
		<div class="btn btn-user"><strong><%=member.getName()%></strong>&nbsp;&nbsp;님</div>

		<div class="dropdown-container">
		    <div class="dropdown-header" onclick="toggleDropdown()">
		        <svg id="dropdown-icon" class="gear-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
		            <circle cx="12" cy="12" r="3"></circle>
		            <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V20a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-.09a1.65 1.65 0 0 0-1-.33 1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H4a2 2 0 0 1-2-2v-1a2 2 0 0 1 2-2h.09a1.65 1.65 0 0 0 1-.33 1.65 1.65 0 0 0 .33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33h.09a1.65 1.65 0 0 0 1-.33 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82v.09a1.65 1.65 0 0 0 .33 1.82 1.65 1.65 0 0 0 1.51 1H20a2 2 0 0 1 2 2v1a2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
		        </svg>
		    </div>
		    <div class="dropdown-menu" id="dropdown-menu">
		        <a href="<%=request.getContextPath()%>/users/mypage">내 정보</a>
		        <a href="<%=request.getContextPath()%>/logout">로그아웃</a>
		    </div>
		</div>
	<%
	   }
	%>
      </div>  
    </header>
    
       <script>
       function toggleDropdown() {
    	    const dropdownMenu = document.getElementById("dropdown-menu");
    	    const dropdownIcon = document.getElementById("dropdown-icon");
    	    const isVisible = dropdownMenu.style.display === "block";

    	    // 토글 기능
    	    if (isVisible) {
    	        dropdownMenu.style.display = "none";
    	        dropdownIcon.classList.remove("open"); // 회전 취소
    	    } else {
    	        dropdownMenu.style.display = "block";
    	        dropdownIcon.classList.add("open"); // 회전 추가
    	    }
    	}

    	// 페이지 외부를 클릭하면 닫히도록 설정
    	document.addEventListener("click", function (event) {
    	    const dropdownContainer = document.querySelector(".dropdown-container");
    	    const dropdownMenu = document.getElementById("dropdown-menu");
    	    const dropdownIcon = document.getElementById("dropdown-icon");

    	    if (!dropdownContainer.contains(event.target)) {
    	        dropdownMenu.style.display = "none";
    	        dropdownIcon.classList.remove("open"); // 초기화
    	    }
    	});
   </script>
    
  </body>
</html>

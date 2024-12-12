<%@ page import="com.smhrd.basic.model.MavenMember" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FeedbackUp | 마이페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
</head>
<body>

	 <!-- 헤더 불러오기 -->
    <div><jsp:include page="header.jsp"></jsp:include> </div>

    <%
    MavenMember member = (MavenMember) session.getAttribute("member");
    if (member == null) {
        response.sendRedirect("/login");  // 로그인하지 않았다면 로그인 페이지로 리다이렉트
        return;
    }
    %>
    <div class="mp-wrap">
        <div class="mp-box">
            <div class="mp-user">
                <h2>My Page</h2>
                <div class="mp-text">
                    <p class="mp-uname"><%= member.getName() %></p>
                    &nbsp;<p class="mp-nim">님</p>
                    &nbsp;&nbsp;<img src="../img/logo4.svg">
                    <button class="btn-mylogout" onclick="location.href='/myapp/logout'">로그아웃</button>
                </div>
            </div>
            <div class="mp-content-box">
                <div class="interview-result">
                    <p>면접 분석 결과</p>
                    <span>${nameCount}</span>
                </div>
                <div class="introduce-result">
                    <p>자기소개 분석 결과</p>
                    <span>${nameCount}</span>
                </div>
            </div>
            <button class="btn-out" onclick="deleteMember('<%= member.getUser_id() %>')">탈퇴하기</button>
        </div>
    </div>

	<!-- 푸터 불러오기 -->
    <div><jsp:include page="footer.jsp"></jsp:include> </div>
    
    
    <script>
        // 회원 탈퇴 함수
        function deleteMember(id) {
            let choice = confirm("정말 탈퇴하시겠습니까?");
            if (choice) {
                location.href = "/myapp/users/" + id + "/delete";  // 탈퇴 처리 URL로 이동
            }
        }
    </script>
</body>
</html>

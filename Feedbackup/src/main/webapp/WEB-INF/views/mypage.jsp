<%@ page import="com.smhrd.basic.model.MavenMember" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Page</title>
</head>
<body>
    <%
    MavenMember member = (MavenMember) session.getAttribute("member");
    if (member == null) {
        response.sendRedirect("/login");  // 로그인하지 않았다면 로그인 페이지로 리다이렉트
        return;
    }
    %>
    <h1>My Page</h1>
    <br>
    <%= member.getName() %>님  <!-- 로그인한 사용자의 이름 출력 -->
    
    <!-- 로그아웃 버튼 -->
    <button onclick="location.href='/myapp/logout'">로그아웃</button>
    
    <!-- 회원탈퇴 버튼 -->
    <button onclick="deleteMember('<%= member.getId() %>')">회원탈퇴</button>
    
    <br><br>
    자기소개 피드백 
    <br><br>
    면접 피드백
    <br>

    <!-- 이름으로 센 개수 출력 -->
    <p>면접 피드백 수 : ${nameCount}</p>  <!-- 컨트롤러에서 전달된 nameCount 출력 -->
    
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

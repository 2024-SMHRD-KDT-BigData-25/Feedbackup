<%@page import="java.util.List"%>
<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <title>FeedbackUp | AI 분석결과</title>
    <link rel="stylesheet" href="../css/result_list.css">
</head>

<body>
    <%
    MavenMember member = (MavenMember) session.getAttribute("member");
    if (member == null) {
        response.sendRedirect("/myapp/login");  // 로그인하지 않았다면 로그인 페이지로 리다이렉트
        return;
    }

    // "users"는 Controller에서 전달된 모델 속성
    List<MavenMember> users = (List<MavenMember>) request.getAttribute("users");

    %>

    <div><jsp:include page="header.jsp"></jsp:include></div>

    <div class="list-wrap">
        <h2>AI 분석 결과</h2>
        <div class="tab">
            <button class="tab-btn active" data-target="interview">AI 면접</button>
            <button class="tab-btn" data-target="introduce">자기소개</button>
        </div>
        <div class="list-result">
            <%-- users 리스트를 반복문으로 출력 --%>
            <%
                if (users != null && !users.isEmpty()) {
                    for (MavenMember user : users) {
            %>
                <div class="result-box" data-category="interview" onclick="location.href='#'">
                    <h2>AI 면접 결과</h2>
                    <p><%= user.getId() %> 면접 연습</p> <!-- 사용자 이름 -->
                    <span><%= user.getPw() %></span> <!-- 사용자 아이디 -->
                </div>
            <%
                    }
                } else {
            %>
                <p>등록된 사용자가 없습니다.</p>
            <%
                }
            %>
        </div>
    </div>

    <div><jsp:include page="footer.jsp"></jsp:include> </div>

    <script src="../js/result_list.js"></script>
</body>
</html>

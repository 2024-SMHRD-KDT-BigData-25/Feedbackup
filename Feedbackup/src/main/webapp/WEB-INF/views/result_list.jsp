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
    List<MavenMember> users1 = (List<MavenMember>) request.getAttribute("users1");
    List<MavenMember> users2 = (List<MavenMember>) request.getAttribute("users2");
    List<MavenMember> users3 = (List<MavenMember>) request.getAttribute("users3");
    
    List<String> jobcodes1 = (List<String>) request.getAttribute("jobcodes1");
    List<String> jobcodes2 = (List<String>) request.getAttribute("jobcodes2");
    List<String> jobcodes3 = (List<String>) request.getAttribute("jobcodes3");

    %>

    <div><jsp:include page="header.jsp"></jsp:include></div>

    <div class="list-wrap">
        <h2>AI 분석 결과</h2>
		<div class="list-container">
	        <div class="list-result">
	        <%-- 첫번째 분석 --%>
            <%
                if (users1 != null && !users1.isEmpty() && jobcodes1 != null && jobcodes1.size() == users1.size()) {
                    for (int i = 0; i < users1.size(); i++) {
                        MavenMember user1 = users1.get(i);
                        String job_code1 = jobcodes1.get(i); // 인덱스로 job_code1 가져오기
            %>
                <div class="result-box" data-category="interview" onclick="location.href='/myapp/users/Result_Replay'">
               	 	
                    <h2 class="result1">AI 면접 결과</h2>
                    <p class="result2"><%= job_code1 %> 면접연습</p> <!-- 사용자 직업 코드 -->
                    <span class="result3"><%= user1.getCreated() %></span> <!-- 사용자 생성 일시 -->
                </div>
            <%
                    }
                } else {
            %>
                <p>분석된 AI 면접이 없습니다.</p>
            <%
                }
            %>
            
            <div class="question-separator"></div> <!-- 첫 번째 분석과 두 번째 분석 사이에 줄바꿈 추가 -->
	            
	         <%-- 두번째 분석 --%>
            <%-- <%
                if (users2 != null && !users2.isEmpty() && jobcodes2 != null && jobcodes2.size() == users2.size()) {
                    for (int i = 0; i < users2.size(); i++) {
                        MavenMember user2 = users2.get(i);
                        String job_code2 = jobcodes2.get(i); // 인덱스로 job_code1 가져오기
            %>
                <div class="result-box" data-category="interview" onclick="location.href='#'">
                	<span class="question-title">두번째 질문!</span>  <!-- 첫번째 질문 제목 -->
                    <h2>AI 면접 결과</h2>
                    <p><%= job_code2 %> 면접연습</p> <!-- 사용자 직업 코드 -->
                    <span><%= user2.getCreated() %></span> <!-- 사용자 생성 일시 -->
                </div>
            <%
                    }
                } else {
            %>
                <p>분석된 AI 면접이 없습니다.</p>
            <%
                }
            %> --%>
            
            <div class="question-separator"></div> <!-- 첫 번째 분석과 두 번째 분석 사이에 줄바꿈 추가 -->
            
            <%-- 세번째 분석 --%>
            <%-- <%
                if (users3 != null && !users3.isEmpty() && jobcodes3 != null && jobcodes3.size() == users3.size()) {
                    for (int i = 0; i < users3.size(); i++) {
                        MavenMember user3 = users3.get(i);
                        String job_code3 = jobcodes3.get(i); // 인덱스로 job_code1 가져오기
            %>
                <div class="result-box" data-category="interview" onclick="location.href='#'">
                	<span class="question-title">세번째 질문!</span>  <!-- 첫번째 질문 제목 -->
                    <h2>AI 면접 결과</h2>
                    <p><%= job_code3 %> 면접연습</p> <!-- 사용자 직업 코드 -->
                    <span><%= user3.getCreated() %></span> <!-- 사용자 생성 일시 -->
                </div>
            <%
                    }
                } else {
            %>
                <p>분석된 AI 면접이 없습니다.</p>
            <%
                }
            %> --%>
	        </div>
        </div>
    </div>

    <div><jsp:include page="footer.jsp"></jsp:include> </div>

    <script src="../js/result_list.js"></script>
</body>
</html>

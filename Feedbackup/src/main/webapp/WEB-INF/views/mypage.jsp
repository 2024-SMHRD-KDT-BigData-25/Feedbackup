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
                <h2>내 정보</h2>
                <div class="mp-text">
                <img src="../img/male.png">
                    <p class="mp-uname"><%= member.getName() %></p>
                    &nbsp;<p class="mp-nim">님</p>                   
                </div>
            </div>
            
            <div class="edit-container">
        		<h2></h2>
		        <form action="#" method="post">
		            <div class="edit-group">
		                <label for="email">이메일</label>
		                <input class="email-input" type="email" id="email" name="email" value="<%= member.getEmail() %>" readonly>
		            </div>
		            <div class="edit-group">
			            <div class="pw-group">
			                <label for="new-password">새 비밀번호</label>
			                <input type="password" id="new-password" name="new-password" placeholder="새 비밀번호를 입력하세요" required>
		            	</div>
	            </div>
            <div class="edit-group">
	            <div class="pw-group2">
	                <label for="confirm-password">새 비밀번호 확인</label>
	                <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호를 다시 입력하세요" required>
	                <div class="error-message" id="error-message" style="display: none;">비밀번호가 일치하지 않습니다.</div>
	            </div>
             </div>
		            <div class="btn-save">
		                <button type="submit">저장하기</button>
		            </div>
		        </form>
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
    
    
    
        document.getElementById('update-form').addEventListener('submit', function(event) {
            const newPassword = document.getElementById('new-password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            const errorMessage = document.getElementById('error-message');

            if (newPassword !== confirmPassword) {
                errorMessage.style.display = 'block';
                event.preventDefault(); // 폼 제출 방지
            } else {
                errorMessage.style.display = 'none';
            }
        });
    </script>
</body>
</html>

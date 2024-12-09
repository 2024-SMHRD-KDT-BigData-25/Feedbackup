<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FeedbackUp</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>


<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />

</head>

<body>
	
	<%
	MavenMember member = (MavenMember) session.getAttribute("member");
	%>

	<%
	if (member == null) {
	%>

	<button onclick="location.href='users/signup'">회원가입</button>
	<button onclick="location.href='login'">로그인</button>
	<%
	} else {
	%>
	<%=member.getName()%>님 안녕하세요!
	<br>

	<button onclick="location.href='users'">전체회원정보</button>

	<button onclick="location.href='users/<%=member.getId()%>/edit'">회원정보수정</button>

	<button onclick="deleteMember('<%=member.getId()%>')">회원탈퇴</button>
	<button onclick="location.href='logout'">로그아웃</button>


	<%
	}
	%>

	<button onclick="location.href='tts'">TTS 페이지</button>


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
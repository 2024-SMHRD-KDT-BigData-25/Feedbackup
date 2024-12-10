<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FeedbackUp</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<link rel="stylesheet" href="css/index.css">
    <script src="js/header.js"></script>
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    <script src="https://kit.fontawesome.com/eefb1e8780.js" crossorigin="anonymous"></script>


<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />

</head>

<body>

	 <!-- 푸터 불러오기 -->
    <div><jsp:include page="header.jsp"></jsp:include> </div>


	<button onclick="location.href='tts'">TTS 페이지</button>


	 <!-- 메인 -->
    <div class="container">
        <div class="index-one-page">
            <div class="subpic">
                <img class="img1" src="img/main1.svg">
                <span class="imtext">AI 면접 연습을 통한 <br> 당신만을 위한 스마트한 솔루션</span>
                <span class="imtext2">음성 분석 부터 제스처까지, 가장 정확한 맞춤형 피드백</span>
                <%
                MavenMember member = (MavenMember) session.getAttribute("member");
                %>
                <%
                if (member == null) {
                %>
                <a class="start" href="/myapp/login">무료로 시작하기&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-arrow-right"></i></a>
                <%
                } else {
                %>
                <a class="start" href="/myapp">무료로 시작하기&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-arrow-right"></i></a>
                <%
                }
                %>
                <img class="img2" src="img/main2.png">
            </div>
        </div>

        <!-- 인덱스 2번째 섹션 -->
        <div class="index-two-page">
            <p class="idx2">
                <span class="idx2-title">면접 준비, 혼자 하려니 막막하지 않나요?</span><br><br>
                <span class="idx2-sub">면접 준비에서 자기 경험을 효과적으로 표현하는 방법을 몰라 어려움을 겪고 있어요.</span><br><br><br><br>
            </p>
            <div class="squer">
                <div class="overlap1">
                    <img src="img/main3.svg">
                    <p class="text-wrapper">제가 했던 행동이나 참여했던<br />프로젝트가 기억이 안 나요.</p>
                    <p class="text-wrapper2">
                        이전에 참여했던 활동의 구체적인 내용이 잘 <br />기억나지 않아 면접 질문에 당황할까 봐 걱정돼요.
                    </p>
                </div>
                <div class="overlap2">
                    <img src="img/main4.svg">
                    <p class="text-wrapper">면접관 앞에서만 서면<br />긴장해서 말을 잘 못해요.</p>
                    <p class="text-wrapper2">
                        아무리 연습해도 실제 상황에서는 긴장감으로 <br />실력을 발휘하지 못해요. 실전과 비슷한 환경에서 <br />반복
                        연습할 기회가 부족해요.
                    </p>
                </div>
                <div class="overlap3">
                    <img src="img/main5.svg">
                    <p class="text-wrapper">면접에서 어떤 활동을<br />물어볼지 감도 안 와요.</p>
                    <p class="text-wrapper2">
                        어떤 경험과 활동을 면접에서 중요하게 생각할지 알기가 <br />어려워요.&nbsp;&nbsp;준비해야 할질문이 너무 많아
                        보여서 <br />어떻게 해야 할지 모르겠어요.
                    </p>
                </div>
            </div>
      </div>
	

	<!-- 푸터 불러오기 -->
    <div><jsp:include page="footer.jsp"></jsp:include> </div>
   



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
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
      
      <!-- 인덱스 3번째 -->
      <div class="index-three-page">
            <p class="idx3">
                <span class="idx3-title">이제 면접 준비도 스마트하고, 철저하게</span>
            </p>

  
    <section class="all-card">
        <!-- 카드 1 -->
        <div class="card" data-index="1">
            <div class="card-content">
                <div class="card-number">01</div>
                <h2 class="card-title">계정 만들기</h2>
                <p class="card-description">
                    회원가입 또는 소셜 계정으로 30초면 간단하게 회원가입이 가능하며,<br>
                    가입 즉시 무료 서비스를 바로 이용할 수 있습니다.
                </p>
            </div>
            <img src="img/main6.svg" alt="계정 만들기 이미지">
            
        </div>

        <!-- 카드 2 -->
        <div class="card" data-index="2">
            <div class="card-content">
                <div class="card-number">02</div>
                <h2 class="card-title">희망 기업 선택</h2>
                <p class="card-description">
                    카카오, 삼성, SK 등 자신의 관심 직군을 선택하면, 해당 분야에 최적화된<br>
                    맞춤형 면접 질문을 제공받을 수 있습니다.
                </p>
            </div>
            <img src="img/main7.svg" alt="희망 기업 선택 이미지">
        </div>

        <!-- 카드 3 -->
        <div class="card" data-index="3">
            <div class="card-content">
                <div class="card-number">03</div>
                <h2 class="card-title">AI 면접 연습</h2>
                <p class="card-description">
                    실제 면접장같은 긴장감 속에서 AI와 함께 음성/텍스트 기반 모의<br>
                    면접을 진행하고, 실시간으로 개인별 맞춤 피드백을 받을 수 있습니다.
                </p>
            </div>
            <img src="img/main8.svg" alt="AI 면접 연습 이미지">
        </div>
    </section>


    <!-- 4번째 인덱스 -->
    <section class="pricing-section">
        <div>
        <h1 class="pricing-title">요금제 및 가격</h1>
        <p class="pricing-subtitle">간단하고 투명한 가격, 설정 수수료나 계약이 없습니다.<br>신용카드 없이 시도하고 언제든지 취소하세요.</p>
        
        <div class="pricing-cards">
            <!-- Welcome Card -->
            <div class="pricing-card">
                <h2 class="plan-name">Welcome</h2>
                <p class="plan-price"><strong>무료</strong> / 가입 직후 24시간</p>
                <ul class="plan-features">
                    
                    <li>✔ 예상 질문 3개 제공</li>
                    <li>✔ 분석 결과 1회</li>
                </ul>
                <a href="#" class="start-button">지금 시작하기</a>
            </div>

            <!-- Premium Card -->
            <div class="pricing-card premium">
                <h2 class="plan-name">Premium</h2>
                <p class="plan-price"><strong>6,000원</strong> / 1회당</p>
                <ul class="plan-features">
                    
                    <li>✔ 예상 질문 무제한 제공</li>
                    <li>✔ 분석 결과 무제한</li>
                    <li>✔ 분석 결과 히스토리 보관</li>
                </ul>
                <a href="#" class="start-button">지금 시작하기</a>
            </div>
        </div>
    </section>

    <!-- 5번째 인덱스 -->
     <section class="hero-container">
        <div class="hero-content">
            <img src="img/main9.svg">
            <h1 class="hero-title">정확하고 스마트한 면접준비,<br>지금 시작하세요</h1>
            <p class="hero-subtitle">
                간단하고 투명한 가격, 설정 수수료나 계약이 없습니다.<br>
                신용카드 없이 시도하고 언제든지 취소하세요.
            </p>
            <button class="hero-button">무료로 시작하기&nbsp;<i class="fa-solid fa-arrow-right"></i></button>
        </div>
    </section>
	

	<!-- 푸터 불러오기 -->
    <div><jsp:include page="footer.jsp"></jsp:include> </div>
   
	<script src="js/index.js"></script>


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
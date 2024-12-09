<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FeedbackUp | 회원가입</title>
<link rel="stylesheet" href="/myapp/css/signupStyle.css">
</head>
<body>
	<img src="/myapp/assets/img/logo2.png" alt="logo" class="logo">
	<br>
	<br>
	<br>
	<br>
	<div class="signin-box">
		<h1>회원가입</h1>
		<br>
		<form action="/myapp/users" method="post" id="signupForm">
			<input type="text" name="name" placeholder="이름" required
				style="width: 260px"><br> <input type="text" id="id"
				name="id" placeholder="아이디" required style="width: 181px">
			<button type="button" class="idcheck" style="width: 75px">중복확인</button>
			<div id="idError" class="error" style="display: none;"></div>
			<!-- 아이디 오류 메시지 -->

			<input type="password" name="pw" id="pw" placeholder="비밀번호" required
				style="width: 260px"><br> <input type="password"
				name="pwcheck" id="pwcheck" placeholder="비밀번호 확인" required
				style="width: 260px"><br>
			<div id="pwError" class="error" style="display: none;"></div>
			<!-- 비밀번호 오류 메시지 -->

			<input type="text" name="email" placeholder="이메일 주소" required
				style="width: 260px"><br> <input type="text"
				name="phone" placeholder="휴대폰 번호" required style="width: 260px"><br>

			<div class="agree" style="padding: 20px; box-sizing: border-box">
				<p class="title">약관동의</p>
				<span class="chk chkall"> <span class="cbx"> <input
						id="chkall" type="checkbox" name="cbx01"> <label
						class="check1" for="chkall">모든 약관을 확인하고 전체 동의합니다.</label> <br>
				</span>
				</span> <span class="chk chklist"> <span class="cbx"> <input
						type="checkbox" name="cbx02" id="term"> <label
						class="check2" for="term1">[필수] 이용약관 동의</label><br>
				</span>
				</span> <span class="chk chklist"> <span class="cbx"> <input
						type="checkbox" name="cbx02" id="term"> <label
						class="check2" for="term2">[필수] 개인정보 수집 및 이용 동의</label>
				</span>
				</span>
			</div>
			<br> <input type="submit" value="회원가입" id="submitBtn" disabled>
			<!-- 기본적으로 버튼 비활성화 -->
		</form>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script>
		let isIdAvailable = false; // 아이디 사용 가능 여부를 추적하는 변수
		let passwordsMatch = false; // 비밀번호 일치 여부를 추적하는 변수
		let termsAgreed = false; // 약관 동의 여부를 추적하는 변수

		// 아이디 중복 확인 함수
		$(".idcheck").on(
				"click",
				function(event) {
					const userId = $("#id").val(); // 입력된 아이디 가져오기

					// 아이디가 4자 미만인 경우 오류 메시지 처리
					if (userId.trim() === "") {
						alert("아이디를 입력해주세요.");
						return;
					} else if (userId.length < 4) {
						$("#idError").text("아이디는 4자 이상이어야 합니다.").css("color",
								"red").show();
						$("#idCheckResult").hide(); // 4자 미만일 때는 v 표시 숨기기
						$("#submitBtn").prop("disabled", true); // 4자 미만일 때는 회원가입 버튼 비활성화
						isIdAvailable = false; // 아이디 사용 불가 상태로 설정
						return;
					} else {
						// 아이디가 4자 이상일 때 중복 체크
						$.ajax({
							url : "/myapp/users/check-id",
							data : {
								userId : userId
							},
							type : "post",
							success : function(response) {
								if (response.exists) {
									// 아이디가 중복되었을 때
									$("#idError").text("중복된 아이디입니다.").css(
											"color", "red").show();
									$("#idCheckResult").hide(); // 중복일 경우 v 표시 숨기기
									$("#submitBtn").prop("disabled", true); // 중복되면 회원가입 버튼 비활성화
									isIdAvailable = false; // 아이디 사용 불가 상태로 설정
								} else {
									// 아이디가 사용 가능할 때
									$("#idError").text("사용 가능한 아이디입니다.").css(
											"color", "green").show();
									$("#idCheckResult").show(); // 사용 가능하면 v 표시 보이기
									isIdAvailable = true; // 아이디 사용 가능 상태로 설정
									checkFormCompletion(); // 폼이 모두 충족되었는지 체크
								}
							},
							error : function() {
								alert("서버와 연결이 실패했습니다. 다시 시도해주세요.");
							}
						});
					}
				});

		// 아이디 입력 변경 시, 중복 체크 다시 진행
		$("#id").on("input", function() {
			const userId = $("#id").val(); // 현재 입력된 아이디를 가져옴
			if (userId !== userIdPrevious) {
				$("#submitBtn").prop("disabled", true); // 회원가입 버튼 비활성화
				isIdAvailable = false; // 아이디가 사용 가능한지 여부를 다시 false로 설정
				$("#idCheckResult").hide(); // v 표시 숨기기
				$("#idError").text(""); // 아이디 오류 메시지 초기화
			}
		});

		$("#pw, #pwcheck").on(
				"input",
				function() {
					const password = $("#pw").val();
					const passwordCheck = $("#pwcheck").val();

					if (password !== passwordCheck) {
						// 비밀번호가 불일치할 경우
						$("#pwError").text("비밀번호가 일치하지 않습니다.").css("color",
								"red").show();
						passwordsMatch = false;
					} else {
						// 비밀번호가 일치할 경우
						$("#pwError").text("비밀번호가 일치합니다.")
								.css("color", "green").show();
						passwordsMatch = true;
					}

					checkFormCompletion(); // 폼이 모두 충족되었는지 체크
				});

		// 약관 동의 여부 체크
		$("#chkall").on("change", function() {
			const isChecked = $(this).is(":checked");
			$(".chklist input").prop("checked", isChecked);
			checkFormCompletion(); // 폼이 모두 충족되었는지 체크
		});

		$(".chklist input")
				.on(
						"change",
						function() {
							const allChecked = $(".chklist input").length === $(".chklist input:checked").length;
							$("#chkall").prop("checked", allChecked); // 전체 동의 체크박스 상태 업데이트
							checkFormCompletion(); // 폼이 모두 충족되었는지 체크
						});

		// 폼 상태를 점검하여 버튼 활성화 여부를 결정
		function checkFormCompletion() {
			if (isIdAvailable && passwordsMatch
					&& $(".chklist input:checked").length === 2) {
				$("#submitBtn").prop("disabled", false); // 모든 조건을 만족하면 버튼 활성화
			} else {
				$("#submitBtn").prop("disabled", true); // 조건을 만족하지 않으면 버튼 비활성화
			}
		}

		// 회원가입 폼 제출 시 아이디 중복 여부를 체크하여 제출 막기
		$("#signupForm").on(
				"submit",
				function(event) {
					if (!isIdAvailable || !passwordsMatch
							|| $(".chklist input:checked").length !== 2) {
						event.preventDefault(); // 아이디 중복 확인, 비밀번호 불일치, 약관 동의가 완료되지 않으면 회원가입 진행되지 않도록 막음
						alert("아이디 중복 확인, 비밀번호 확인, 약관 동의를 완료해주세요.");
					}
				});
	</script>

</body>
</html>

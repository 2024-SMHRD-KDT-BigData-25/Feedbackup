<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
</head>
<body>

    <h1>회원가입</h1>
    <form action="/myapp/users" method="post" id="signupForm">
        <input type="text" name="name" placeholder="이름" required><br>
        
        <input type="text" id="id" name="id" placeholder="아이디" required>
        <button type="button" class="idcheck">중복 확인</button>
        <span id="idCheckResult" style="margin-left: 10px; display: none; color: green;">✔</span><br>
        
        <input type="password" name="pw" id="pw" placeholder="비밀번호" required><br>
        <input type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호 확인" required><br>
        <input type="text" name="email" placeholder="이메일" required><br>
        
        <img src="" alt="logo" class="logo">
        <div style="padding: 20px; box-sizing: border-box">
            <p class="title">약관동의</p>
            <span class="chk chkall">
                <span class="cbx">
                    <input type="checkbox" name="cbx01" id="chkall">
                    <label for="chkall">모든 약관을 확인하고 전체 동의합니다.</label><br>
                </span>
            </span>

            <span class="chk chklist">
                <span class="cbx">
                    <input type="checkbox" name="cbx02" id="term1">
                    <label for="term1">[필수] 이용약관 동의</label><br>
                </span>
            </span>

            <span class="chk chklist">
                <span class="cbx">
                    <input type="checkbox" name="cbx02" id="term2">
                    <label for="term2">[필수] 개인정보 수집 및 이용 동의</label>
                </span>
            </span>
        </div>
        <input type="submit" value="회원가입" id="submitBtn" disabled> <!-- 기본적으로 버튼 비활성화 -->
    </form>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    let isIdAvailable = false; // 아이디 사용 가능 여부를 추적하는 변수
    let passwordsMatch = false; // 비밀번호 일치 여부를 추적하는 변수
    let termsAgreed = false; // 약관 동의 여부를 추적하는 변수
    let userIdPrevious = ''; // 이전에 입력된 아이디를 저장하는 변수

    // 아이디 중복 확인 함수
    $(".idcheck").on("click", function(event) {
        const userId = $("#id").val(); // 입력된 아이디 가져오기

        if (userId.trim() === "") {
            alert("아이디를 입력해주세요.");
            return;
        } else {
            $.ajax({
                url: "/myapp/users/check-id",
                data: { userId: userId },
                type: "post",
                success: function(response) {
                    if (response.exists) {
                        alert("중복된 아이디입니다.");
                        $("#idCheckResult").hide(); // 중복일 경우 v 표시 숨기기
                        $("#submitBtn").prop("disabled", true); // 중복되면 회원가입 버튼 비활성화
                        isIdAvailable = false; // 아이디 사용 불가 상태로 설정
                    } else {
                        alert("사용 가능한 아이디입니다.");
                        $("#idCheckResult").show(); // 사용 가능하면 v 표시 보이기
                        isIdAvailable = true; // 아이디 사용 가능 상태로 설정
                        checkFormCompletion(); // 폼이 모두 충족되었는지 체크
                    }
                },
                error: function() {
                    alert("서버와 연결이 실패했습니다. 다시 시도해주세요.");
                }
            });
        }
    });

    // 아이디 변경 시, 회원가입 버튼 비활성화 처리
    $("#id").on("input", function() {
        const userId = $("#id").val(); // 현재 입력된 아이디를 가져옴
        if (userId !== userIdPrevious) {
            $("#submitBtn").prop("disabled", true); // 회원가입 버튼 비활성화
            isIdAvailable = false; // 아이디가 사용 가능한지 여부를 다시 false로 설정
            $("#idCheckResult").hide(); // v 표시 숨기기
        }
    });

    // 비밀번호 확인 필드와 비밀번호 필드가 일치하는지 체크
    $("#pw, #pwcheck").on("input", function() {
        const password = $("#pw").val();
        const confirmPassword = $("#pwcheck").val();

        if (password !== confirmPassword) {
            passwordsMatch = false; // 비밀번호가 일치하지 않으면 false
            $("#submitBtn").prop("disabled", true); // 회원가입 버튼 비활성화
        } else {
            passwordsMatch = true; // 비밀번호가 일치하면 true
            checkFormCompletion(); // 폼이 모두 충족되었는지 체크
        }
    });

    // 약관 동의 여부 체크
    $("#chkall").on("change", function() {
        const isChecked = $(this).is(":checked");
        $(".chklist input").prop("checked", isChecked);
        checkFormCompletion(); // 폼이 모두 충족되었는지 체크
    });

    $(".chklist input").on("change", function() {
        const allChecked = $(".chklist input").length === $(".chklist input:checked").length;
        $("#chkall").prop("checked", allChecked); // 전체 동의 체크박스 상태 업데이트
        checkFormCompletion(); // 폼이 모두 충족되었는지 체크
    });

    // 폼 상태를 점검하여 버튼 활성화 여부를 결정
    function checkFormCompletion() {
        // 비밀번호 일치, 아이디 중복 확인, 약관 동의 상태를 모두 확인
        if (isIdAvailable && passwordsMatch && $(".chklist input:checked").length === 2) {
            $("#submitBtn").prop("disabled", false); // 모든 조건을 만족하면 버튼 활성화
        } else {
            $("#submitBtn").prop("disabled", true); // 조건을 만족하지 않으면 버튼 비활성화
        }
    }

    // 회원가입 폼 제출 시 아이디 중복 여부를 체크하여 제출 막기
    $("#signupForm").on("submit", function(event) {
        if (!isIdAvailable || !passwordsMatch || $(".chklist input:checked").length !== 2) {
            event.preventDefault();  // 아이디 중복 확인, 비밀번호 불일치, 약관 동의가 완료되지 않으면 회원가입 진행되지 않도록 막음
            alert("아이디 중복 확인, 비밀번호 확인, 약관 동의를 완료해주세요.");
        }
    });
</script>

</body>
</html>

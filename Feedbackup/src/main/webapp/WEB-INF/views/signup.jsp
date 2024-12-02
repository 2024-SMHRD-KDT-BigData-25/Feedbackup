<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FeedbackUp | 회원가입</title>
    
    <style>
        @font-face {
            font-family: 'SUIT-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        .logo {
            width: 365px;
            height: 79px;
            display: block;
            margin: 0 auto;
            margin-top: 40px;
            margin-bottom: -50px;
            max-width: 160px;
            max-height: 35px;
        }

        body {
            background-color: #F1F5F9;
            font-family: 'SUIT-Regular';
            align-content: center;
        }

        h1 {
          font-size: 20px;
          margin-left: 17px;  
        }

       .signin-box{
            width: 330px;
            height: 650px;
            background-color: white;
            margin-left: 1px;
            padding: 30px;
            border-radius: 5px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 40px;
            box-shadow: 0 1px 20px 0 rgb(232, 232, 232);
            align-content: center;
       } 

       input {
            border-radius: 10px;
            border: 0.5px #CBD5E1 solid;
            margin-left: 15px;
            margin-bottom: 18px;
            padding: 13px;
       }

       input::placeholder {
        color: #94A3B8;
       }

       input:focus{
        outline-color: #8071FC;
       }

       .idcheck{
        border: 0.5px #CBD5E1 solid;
        border-radius: 10px;
        color: #8071FC;
        background-color: white;
        margin-left: 1px;
        padding: 13px;
       }

      .idcheck:hover{
        background-color: #8071FC;
        color: white;
      } 

       .agree {
            margin: 5px;
            width: 295px;
            height: 200px;
            background-color: #F9F8FF;
            border-radius: 10px;
            font-size: 12px;
       }

       .title {
        color: #5344D4;
        font-weight: 700;
        margin-left: 14px;
        margin-top: 0px;
       }

       .check1 {
        color: #968BEF;
       }

       .check2 {
        color: #5344D4;
       }

       #chkall {
        accent-color:#5344D4;
        border: #5344D4 solid 1px;
        vertical-align: -3px;
       }

       #term {
        accent-color:#5344D4;
        vertical-align: -3px;
       }

       hr {
        border: solid #8071FC 1px;
        margin-left: 15px;
        transform: scaleY(0.3);
       }

       #submitBtn {
        background-color: #8071FC;
        color: white;
        font-weight: 600;
        width: 295px;
        margin-left: 8px;
       }

       #submitBtn:hover {
        color: #8071FC;
        background-color: white;
        border-color: #8071FC;
       }

       /* 오류 메시지 스타일 */
       .error {
            color: red;
            font-size: 12px;
            margin-top: -10px;
            margin-bottom: 15px;
       }

    </style>
  </head>

  <body>
    <img src="../assets/img/logo2.png" alt="logo" class="logo"><br><br><br><br>
	<div class="signin-box">
    <h1>회원가입</h1><br>
    <form action="/myapp/users" method="post" id="signupForm">
        <input type="text" name="name" placeholder="이름" required style="width: 260px"><br>
        
        <input type="text" id="id" name="id" placeholder="아이디" required style="width: 181px">
        <button type="button" class="idcheck" style="width: 75px">중복확인</button>
        <div id="idError" class="error" style="display: none;"></div> <!-- 아이디 오류 메시지 -->
        
        <input type="password" name="pw" id="pw" placeholder="비밀번호" required style="width: 260px"><br>
        <input type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호 확인" required style="width: 260px"><br>
        <div id="pwError" class="error" style="display: none;"></div> <!-- 비밀번호 오류 메시지 -->
        
        <input type="text" name="email" placeholder="이메일 주소" required style="width: 260px"><br>
        <input type="text" name="phone" placeholder="휴대폰 번호" required style="width: 260px"><br>
        
        <div class="agree" style="padding: 20px; box-sizing: border-box">
            <p class="title">약관동의</p>
            <span class="chk chkall">
                <span class="cbx">
                    <input id="chkall" type="checkbox" name="cbx01" >
                    <label class="check1" for="chkall">모든 약관을 확인하고 전체 동의합니다.</label><hr><br>
                </span>
            </span>

            <span class="chk chklist">
                <span class="cbx">
                    <input type="checkbox" name="cbx02" id="term">
                    <label class="check2" for="term1">[필수] 이용약관 동의</label><br>
                </span>
            </span>

            <span class="chk chklist">
                <span class="cbx">
                    <input type="checkbox" name="cbx02" id="term">
                    <label class="check2" for="term2">[필수] 개인정보 수집 및 이용 동의</label>
                </span>
            </span>
        </div>
        <br>
        <input type="submit" value="회원가입" id="submitBtn" disabled> <!-- 기본적으로 버튼 비활성화 -->
    </form>
   </div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
    let isIdAvailable = false; // 아이디 사용 가능 여부를 추적하는 변수
    let passwordsMatch = false; // 비밀번호 일치 여부를 추적하는 변수
    let termsAgreed = false; // 약관 동의 여부를 추적하는 변수

 // 아이디 중복 확인 함수
    $(".idcheck").on("click", function(event) {
        const userId = $("#id").val(); // 입력된 아이디 가져오기

        // 아이디가 4자 미만인 경우 오류 메시지 처리
        if (userId.trim() === "") {
            alert("아이디를 입력해주세요.");
            return;
        } else if (userId.length < 4) {
            $("#idError").text("아이디는 4자 이상이어야 합니다.").css("color", "red").show();
            $("#idCheckResult").hide(); // 4자 미만일 때는 v 표시 숨기기
            $("#submitBtn").prop("disabled", true); // 4자 미만일 때는 회원가입 버튼 비활성화
            isIdAvailable = false; // 아이디 사용 불가 상태로 설정
            return;
        } else {
            // 아이디가 4자 이상일 때 중복 체크
            $.ajax({
                url: "/myapp/users/check-id",
                data: { userId: userId },
                type: "post",
                success: function(response) {
                    if (response.exists) {
                        // 아이디가 중복되었을 때
                        $("#idError").text("중복된 아이디입니다.").css("color", "red").show();
                        $("#idCheckResult").hide(); // 중복일 경우 v 표시 숨기기
                        $("#submitBtn").prop("disabled", true); // 중복되면 회원가입 버튼 비활성화
                        isIdAvailable = false; // 아이디 사용 불가 상태로 설정
                    } else {
                        // 아이디가 사용 가능할 때
                        $("#idError").text("사용 가능한 아이디입니다.").css("color", "green").show();
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
    
    $("#pw, #pwcheck").on("input", function() {
        const password = $("#pw").val();
        const passwordCheck = $("#pwcheck").val();

        if (password !== passwordCheck) {
            // 비밀번호가 불일치할 경우
            $("#pwError").text("비밀번호가 일치하지 않습니다.").css("color", "red").show();
            passwordsMatch = false;
        } else {
            // 비밀번호가 일치할 경우
            $("#pwError").text("비밀번호가 일치합니다.").css("color", "green").show();
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

    $(".chklist input").on("change", function() {
        const allChecked = $(".chklist input").length === $(".chklist input:checked").length;
        $("#chkall").prop("checked", allChecked); // 전체 동의 체크박스 상태 업데이트
        checkFormCompletion(); // 폼이 모두 충족되었는지 체크
    });

    // 폼 상태를 점검하여 버튼 활성화 여부를 결정
    function checkFormCompletion() {
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

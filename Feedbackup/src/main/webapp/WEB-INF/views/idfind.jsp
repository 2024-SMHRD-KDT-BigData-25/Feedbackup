<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <style>
        /* 모달 배경 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
        }
        /* 모달 콘텐츠 */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        /* 닫기 버튼 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* 버튼 스타일 */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f2f2f2;
            color: #333;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h2>아이디 찾기</h2>
    <h3>가입 시 입력한 이름과 이메일주소로 인증하여 아이디를 확인하실 수 있습니다.</h3>
    <form action="/myapp/users/idfind" method="post">
        <input type="email" name="email" placeholder="이메일" required><br>
        <input type="text" name="phone" placeholder="휴대폰 번호" required><br>
        <button type="submit">확인</button>
    </form>

    <!-- 모달 -->
    <div id="idModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h3>아이디 찾기 완료</h3>

            <!-- 아이디와 이름을 한 문장으로 출력 -->
            <p id="idNameResult">
                <c:if test="${success}">
                    ${name}님의 아이디는 ${id}입니다.
                </c:if>
            </p>

            <!-- 실패 메시지 출력 -->
            <p id="errorMessage">
                <c:if test="${not success}">
                    ${message}
                </c:if>
            </p>
            
            <h3>*회원정보 보호를 위해 아이디의 일부만 보여지며 전체 아이디는 고객센터를 통해서 확인 부탁드립니다.</h3>

            <!-- 비밀번호 찾기 및 로그인 버튼 -->
            <a href="/myapp/users/pwfind" class="btn">비밀번호 찾기</a>
            <a href="/myapp/login" class="btn">로그인</a>
        </div>
    </div>

    <script>
        window.onload = function() {
            // success가 true이면 모달을 띄운다
            var success = ${success != null ? success : 'false'};
            if (success) {
                document.getElementById('idModal').style.display = "block";
            }

            // 모달 닫기
            document.querySelector('.close').onclick = function() {
                document.getElementById('idModal').style.display = "none";
            }

            // 페이지 외부를 클릭하면 모달 닫기
            window.onclick = function(event) {
                if (event.target == document.getElementById('idModal')) {
                    document.getElementById('idModal').style.display = "none";
                }
            }
        };
    </script>
</body>
</html>

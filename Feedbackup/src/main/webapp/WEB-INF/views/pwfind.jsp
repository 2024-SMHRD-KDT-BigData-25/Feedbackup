<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
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
        
        .check{
           width: 100px;
           height: auto;
            display: block;
            margin: 0 auto;
            margin-top: 36px;
            margin-bottom: -50px;
            max-width: 160px;
            max-height: 100px;
        }
            
        body {
            background-color: #F1F5F9;
            font-family: 'SUIT-Regular';
            align-content: center;
        }
        
        /* 페이지 */
        .find_wrapper{
            width: 430px;
            max-height: 600px;
            background-color: white;
            margin-left: 1px;
            border-radius: 5px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 30px;
            box-shadow: 0 1px 20px 0 rgb(232, 232, 232);
            text-align: center;
        }
        
        .find_top {
           display: flex; /* Flexbox 활성화 */
           justify-content: space-between; /* 좌우로 나란히 정렬 */
           width: 100%; /* 부모 요소의 너비 사용 */
           box-sizing: border-box; /* 패딩과 테두리를 포함한 크기 계산 */
           
      }
        
      .find_top div {
           flex: 1; /* 동일한 비율로 나누기 */
          text-align: center; /* 텍스트 중앙 정렬 */
           padding: 20px 0; /* 상하 패딩 */
           margin: 0; /* 기본 여백 제거 */
           cursor: pointer; /* 클릭 가능한 UI 표시 */
           transition: background-color 0.3s; /* 배경색 변화 애니메이션 */
           font-size: 15px;
      }

      h2{
         font-size: 20px;
      }
      
      .find_text {
         font-size: 10px;
         margin-bottom: 25px;
      }
      
      .find_top div.active {
           background-color: #8071FC; /* 활성 상태 배경 */
           color: white;
      }
      
      .find_top div:not(.active) {
           background-color: white; /* 비활성화된 항목 배경 */
           color: black; /* 비활성화된 항목 텍스트 색상 */
      }
      
      #find_id {
         border-top-left-radius: 30px;
         border-top-right-radius: 30px;
         font-weight:bold;
      }
      
      #find_pw{
         color : white;
         border-top-right-radius: 30px;
         border-top-left-radius: 30px;
         font-weight:bold;
      }
      
      a {
          text-decoration: none;
          color : #94A3B8;
      }
      
      .find_bottom {
         width: 100%;
         border-top: 0.5px #BCB4FE solid;
         padding-top: 40px;
      }
      
      input {
            border-radius: 10px;
            border: 0.5px #CBD5E1 solid;
            margin-left: 15px;
            margin-bottom: 25px;
            padding: 13px;
            width: 250px;
                   }

       input::placeholder {
             color: #94A3B8;
       }

       input:focus{
            outline-color: #8071FC;
       }
       
       #submitBtn {
            background-color: #8071FC;
            color: white;
            font-weight: 600;
            width: 160px;
            margin-left: 8px;
            margin-bottom: 40px;
       }

       #submitBtn:hover {
           color: #8071FC;
           background-color: white;
           border-color: #8071FC;
       }
       
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
            margin: 11% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 350px;
            text-align: center;
            border-radius: 30px;
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
        
       /* 모달 메시지 */       
        .modal_text{
           font-size: 10px;
           color : #94A3B8;
        }
        
        #pwNameResult{
           font-weight: bold;
        }
        
        .highlight {
          color: #8071FC;
      }
      
        /* 버튼 스타일 */
        .btn {
          display: inline-block;
          background-color: #8071FC;
          color: white;
          font-weight: 600;
          font-size: 13px;
          width: 120px;
          margin: 0 15px;
          margin-top: 20px;
          border-radius: 10px;
          border: 0.5px #CBD5E1 solid;
          padding: 10px;
        }

        .btn:hover {
            color: #8071FC;
           background-color: white;
           border-color: #8071FC;
        }
        
        #btn_pw{
           color: #64748B;
           background-color: #E2E8F0;
        }
        
        #btn_pw:hover{
           color: #64748B;
           background-color: white;
           border-color: #64748B;
        }
           
    </style>
</head>
<body>
    <img src="../img/logo2.png" alt="logo" class="logo"><br><br><br><br>
    <div class="find_wrapper">
        <div class="find_top">
            <div id="find_id"><a href="/myapp/users/idfind" style="display: block; width: 100%; height: 100%;">아이디 찾기</a></div>
            <div id="find_pw" class="active">비밀번호 찾기</div>
        </div>
        <div class="find_bottom">
            <div>
                <h2>비밀번호 찾기</h2>
            </div>
            <p class="find_text">가입 시 입력한 이름과 이메일 주소와 아이디를 통해 비밀번호를 확인하실 수 있습니다.</p>
            <form action="/myapp/users/pwfind" method="post">
                <input type="text" name="name" placeholder="이름" required><br>
                <input type="email" name="email" placeholder="이메일 주소" required><br>
                <input type="text" name="user_id" placeholder="아이디" required><br>
                <input type="submit" value="확인" id="submitBtn"></input>
            </form>
        </div>
    </div>

    <!-- 이름과 이메일과 아이디가 일치하는 경우 이름과 비밀번호를 출력하는 모달 -->
    <div id="successModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close">&times;</span>
            <img src="../img/check.png" alt="check" class="check"><br><br><br>
            <h3>비밀번호 찾기 완료</h3>
            <p id="pwNameResult">
                <c:if test="${success}">
                    ${name}님의 비밀번호는 <span class="highlight">${pw}</span>입니다.
                </c:if>
            </p>
            <a href="/myapp/login" class="btn">로그인</a>
        </div>
    </div>

    <!-- 이름이나 이메일이나 아이디가 일치하지 않는 경우 모달 -->
    <div id="errorModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close">&times;</span>
            <img src="../img/check.png" alt="check" class="check"><br><br><br>
            <p id="errorMessage"></p>
            <a href="javascript:void(0);" class="btn" onclick="closeModal()">확인</a> <!-- 확인 버튼 클릭 시 closeModal() 호출 -->
        </div>
    </div>

    <script>
        window.onload = function() {
            var success = '${success != null ? success : 'false'}' === 'true'; // 성공 여부 확인
            var message = '${message}'; // 전달된 메시지

            // 페이지 로드 시 모달을 자동으로 표시하지 않음
            if (success) {
                // 이름과 이메일이 일치하는 경우 성공 모달 표시
                document.getElementById('successModal').style.display = "block";
            } else if (message) {
                // 실패 시, 실패 메시지가 있을 때만 실패 모달 표시
                document.getElementById('errorModal').style.display = "block";
                document.getElementById('errorMessage').textContent = message;  // 통합된 message 사용
            }

            // 모달 닫기 이벤트
            document.querySelectorAll('.close').forEach(function(element) {
                element.onclick = function() {
                    element.closest('.modal').style.display = "none";
                }
            });

            // 모달 외부 클릭 시 닫기
            window.onclick = function(event) {
                if (event.target.classList.contains('modal')) {
                    event.target.style.display = "none";
                }
            }
        };

        // 확인 버튼 클릭 시 모달 닫기
        function closeModal() {
            document.getElementById('errorModal').style.display = "none";
        }
    </script>
</body>
</html>

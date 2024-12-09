<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>패스워드 찾기</title>
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
            margin-bottom: -70px;
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
		
		.find_text{
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
		
		#find_pw {
			border-top-left-radius: 30px;
			border-top-right-radius: 30px;
			font-weight:bold;
		}
		
		#find_id{
			color : #94A3B8;
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
          
    </style>
</head>
<body>
    <img src="../assets/img/logo2.png" alt="logo" class="logo"><br><br><br><br>
    <div class="find_wrapper">
        <div class="find_top">
            <div id="find_id"><a href="/myapp/users/idfind" style="display: block; width: 100%; height: 100%;">아이디 찾기</a></div>
            <div id="find_pw" class="active">비밀번호 찾기</div>
        </div>
        <div class="find_bottom" id="pw_section">
            <h2>비밀번호 찾기</h2>
            <p class="find_text">가입 시 입력한 이름, 이메일 주소와 아이디를 통해 비밀번호를 확인하실 수 있습니다.</p>
            <form action="/myapp/users/pwfind" method="post">
                <input type="text" name="name" placeholder="이름" required><br>
                <input type="email" name="email" placeholder="이메일 주소" required><br>
                <input type="text" name="id" placeholder="아이디" required><br>
                <input type="submit" value="확인" id="submitBtn"></input>
            </form>
        </div>
    </div>

    <!-- 모달 -->
    <div id="pwModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <img src="../assets/img/check.png" alt="check" class="check"><br><br><br><br>
            <h3>비밀번호 찾기 완료</h3>

            <!-- 아이디와 이름을 한 문장으로 출력 -->
            <p id="pwNameResult">
                <c:if test="${success}">
                    ${name}님의 비밀번호는 <span class="highlight">${pw}</span>입니다.
                </c:if>
            </p>

            <!-- 실패 메시지 출력 -->
            <p id="errorMessage">
                <c:if test="${not success}">
                    ${message}
                </c:if>
            </p>
            
            <p class="modal_text">※회원정보 보호를 위해 비밀번호의 일부만 보여지며<br> 전체 비밀번호는 고객센터를 통해서 확인 부탁드립니다.</p>

            <!-- 로그인 버튼 -->
            <a href="/myapp/login" class="btn">로그인</a>
        </div>
    </div>

    <script>
        window.onload = function() {
            // success가 true이면 모달을 띄운다
            var success = ${success != null ? success : 'false'};
            if (success) {
                document.getElementById('pwModal').style.display = "block";
            }

            // 모달 닫기
            document.querySelector('.close').onclick = function() {
                document.getElementById('pwModal').style.display = "none";
            }

            // 페이지 외부를 클릭하면 모달 닫기
            window.onclick = function(event) {
                if (event.target == document.getElementById('pwModal')) {
                    document.getElementById('pwModal').style.display = "none";
                }
            }
        };
    </script>
</body>
</html>

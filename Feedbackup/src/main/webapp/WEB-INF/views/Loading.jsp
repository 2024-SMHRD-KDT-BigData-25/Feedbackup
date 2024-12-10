<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loading</title>
<style>
	@font-face {
	    font-family: 'SUIT-Regular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	    }
	
	    body {
	        background-color: #FFFFFF;
	        font-family: 'SUIT-Regular';
	        align-content: center;
	    }
	
	
	    .title {
	        text-align: center;
	        font-weight: bold;
	        font-size: 18px;
	        color: #6C63FF;
	        margin-top: 81px;
	      }
	    
	      .title img{
	        width: 100px;
	        height: auto;;
	      }
	
	      .title_text{
	        margin-top: 0px;
	        margin-bottom: 20px;
	        text-align: center;
	      }
	
	.loading-container {
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	
	/* 회전하는 테두리 */
	.rotating-border {
	    width: 100px;
	    height: 100px;
	    border-radius: 50%;
	    border: 3px solid #D9D9D9;
	    border-top: 6px solid #8071FC;
	    animation: spin 1.2s linear infinite;
	    position: relative;
	}
	
	/* 고정된 이미지 */
	.static-image {
	    position: absolute;
	    top: 49%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 70px;
	    height: 70px;
	    background-color: #fff;
	    border-radius: 50%;
	    overflow: hidden;
	}
	
	.static-image img {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	
	.text-container {
	    margin-top: 40px;
	    font-size: 16px;
	    color: #8071FC;
	    text-align: center;
	    position: relative;
	    height: 20px; /* 고정된 높이 */
	}
	
	.text-container span {
	    position: absolute;
	    top: 0;
	    left: 50%;
	    transform: translateX(-50%);
	    opacity: 0; /* 기본 상태에서 숨김 */
	    transition: opacity 0.5s ease-in-out;
	}
	
	.text-container span.active {
	    opacity: 1; /* 활성화된 텍스트는 표시 */
	}
	
	@keyframes spin {
	    0% {
	        transform: rotate(0deg);
	    }
	    100% {
	        transform: rotate(360deg);
	    }
	}
</style>
</head>
<body>
    <div class="title"><img src="../img/feedbackup.png"></div>
    <div class="title_text">AI 면접 연습</div>
    
    <div class="loading-container">
        <!-- 회전 테두리 -->
        <div class="rotating-border"></div>
        <!-- 고정 이미지 -->
        <div class="static-image">
            <img src="../img/logo1.png" alt="로고">
        </div>
    </div>
    
    <div class="text-container">
        <span class="main-text active">AI 면접관이 답변을 분석하고 있어요</span>
        <span class="sub-text">답변한 내용을 모두 확인하고 있어요</span>
    </div>

    <script>
        // 텍스트 요소 선택
        const mainText = document.querySelector('.main-text');
        const subText = document.querySelector('.sub-text');

        // 애니메이션 순환
        function toggleText() {
            if (mainText.classList.contains('active')) {
                mainText.classList.remove('active'); // 메인 텍스트 숨김
                subText.classList.add('active'); // 서브 텍스트 표시
            } else {
                subText.classList.remove('active'); // 서브 텍스트 숨김
                mainText.classList.add('active'); // 메인 텍스트 표시
            }

            setTimeout(toggleText, 2000); // 2초마다 반복
        }

        // 초기 애니메이션 시작
        setTimeout(toggleText, 2000);
    </script>
</body>
</html>
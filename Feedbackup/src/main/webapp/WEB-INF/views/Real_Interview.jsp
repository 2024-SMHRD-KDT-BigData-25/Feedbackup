<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Real_Interview</title>
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

  .top_btn {
 	display: flex;
    justify-content: flex-end;
    width: 850px;
    padding: 20px 0px;
    box-sizing: border-box;
    margin: 0px auto;
  }

  .top_btn .btn2 {
    border: 1px solid #D4C5FF;
    background-color: #8071FC;
    border-radius: 20px;
    padding: 10px 30px;
    font-size: 14px;
    font-weight: bold;
    color: #FFFFFF;
    cursor: pointer;
    
  }

  .top_btn .btn2:hover {
    background-color: #FFFFFF;
    color: #8071FC;
  }

  .title {
    text-align: center;
    font-weight: bold;
    font-size: 18px;
    color: #6C63FF;
  }

  .title img{
    width: 140px;
    height: auto; ;
  }

  .title_text {
    margin-top: 0px;
    margin-bottom: 20px;
    text-align: center;
    color: #64748B;
    font-size: 20px;
  }

  .content {
    text-align: center;
  }

  .content img {
    width: 850px; 
    height: auto;
  }

  .button-container {
    margin-top: 7px;
  }

  .button-container button {
    background-color: #6C63FF;
    color: white;
    border: none;
    padding: 15px 40px;
    border-radius: 25px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
  }

  .button-container button:hover {
    background-color: #554DBF;
  }
  
  <!-- 추가 --!>
	#webcamContainer {
		width: 640px;
		height: 480px;
		position: relative;
		margin-bottom: 20px;
	}
	video {
		width: 40%;
		height: 30%;
		border: 2px solid #ccc;
		transform: scaleX(-1); /* 좌우 반전 */
	}
	.result {
		margin-top: 20px;
	}
	#captureBtn {
		margin-top: 20px;
	}  

</style>
</head>
<body>
  <div class="top_btn">
    <button class="btn2" onclick="window.location.href='/myapp/AI_Interview';">나가기</button>
  </div>
  <div class="title"><img src="../img/feedbackup.png"></div>
  <div class="title_text">AI 면접 연습</div>
  <div class="content">
<div>
  </div>
    <!-- 웹캠 화면을 담을 div -->
	<div id="webcamContainer">
		<video id="webcam" autoplay></video>
	</div>
    <div class="button-container">
    <form action="/myapp/users/Real_Interview_Start" method="POST">
    <input type="hidden" name="firstqText" value="${firstqText}">
    <input type="hidden" name="secondqText" value="${secondqText}">
    <input type="hidden" name="thirdqText" value="${thirdqText}">
    <input type="hidden" name="firstaText" value="${firstaText}">
    <input type="hidden" name="secondaText" value="${secondaText}">
    <input type="hidden" name="thirdaText" value="${thirdaText}">
    <input type="hidden" name="firstNumber" value="${firstNumber}">
    <input type="hidden" name="secondNumber" value="${secondNumber}">
    <input type="hidden" name="thirdNumber" value="${thirdNumber}">
    <button type="submit" class="button-container">시작하기</button>
	</form>
    </div>
  </div>
  
<script>
//웹캠 스트림 가져오기
const webcam = document.getElementById("webcam");

let audioStream = null;

// 페이지 로드 시 자동으로 웹캠 시작
window.onload = function() {
    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({ video: true, audio: true })
            .then(function(stream) {
                // 비디오 스트림 설정
                webcam.srcObject = stream;

                // 오디오 스트림 비활성화
                audioStream = stream.getAudioTracks();
                if (audioStream && audioStream.length > 0) {
                    audioStream.forEach(track => track.enabled = false); // 오디오 트랙 비활성화
                }
            })
            .catch(function(error) {
                console.error("웹캠을 사용할 수 없습니다.", error);
                alert("웹캠이나 마이크 권한을 허용해 주세요.");
            });
    } else {
        console.error("getUserMedia가 지원되지 않습니다.");
        alert("이 브라우저에서는 웹캠을 사용할 수 없습니다.");
    }
};

</script>
</body>
</html>
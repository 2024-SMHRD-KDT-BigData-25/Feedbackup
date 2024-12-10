<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Real_Interview_Start</title>
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
  justify-content: space-between;
  width: 850px;
  padding: 20px 0px;
  box-sizing: border-box;
  margin: 0px auto;
}

.top_btn .btn1 {
  border: 1px solid #D4C5FF;
  background-color: transparent;
  border-radius: 20px;
  padding: 10px 20px;
  font-size: 14px;
  font-weight: bold;
  color: #8071FC;
  cursor: pointer;
}

.top_btn .btn1:hover {
  background-color: #8071FC;
  color: #FFFFFF;
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
  position: relative;
  width: 100%;
  height: auto;
  display: flex;
  justify-content: center;
  align-items: center;
}

.content img {
  width: 850px;
  height: auto;
}

.info {
  position: absolute;
  top: 7%; /* 사진 기준으로 위치 */
  right: 17%;
  transform: translate(-50%, -50%);
  background-color: #ECEAFF;
  color: #6C63FF;
  font-size: 12px;
  padding: 8px 15px;
  border-radius: 20px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.recording-bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: white;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  border-radius: 50px;
  padding: 10px 20px;
  width: 80%;
  max-width: 400px;
  position: fixed;
  bottom: 45px;
  left: 540px;
}

.recording-bar .status {
  display: flex;
  align-items: center;
  gap: 10px;
}

.recording-bar .status .icon {
  width: 15px;
  height: 15px;
  background-color: red;
  border-radius: 50%;
}

.recording-bar .status .text {
  font-size: 14px;
  color: #6C63FF;
  font-weight: bold;
}

.recording-bar .waveform {
  display: flex;
  align-items: center;
  gap: 3px;
}

.recording-bar .waveform div {
  width: 4px;
  height: 15px;
  background-color: #D4C5FF;
  animation: wave 1.2s infinite ease-in-out;
  border-radius: 2px;
}

.recording-bar .waveform div:nth-child(2) {
  animation-delay: -1.1s;
}

.recording-bar .waveform div:nth-child(3) {
  animation-delay: -1s;
}

.recording-bar .waveform div:nth-child(4) {
  animation-delay: -0.9s;
}

.recording-bar .waveform div:nth-child(5) {
  animation-delay: -0.8s;
}

.recording-bar .waveform div:nth-child(6) {
  animation-delay: -0.7s;
}

.recording-bar .waveform div:nth-child(7) {
  animation-delay: -0.6s;
}

.recording-bar .waveform div:nth-child(8) {
  animation-delay: -0.5s;
}

.recording-bar .waveform div:nth-child(9) {
  animation-delay: -0.4s;
}

.recording-bar .waveform div:nth-child(10) {
  animation-delay: -0.3s;
}

.recording-bar .waveform div:nth-child(11) {
  animation-delay: -0.2s;
}

.recording-bar .waveform div:nth-child(12) {
  animation-delay: -0.1s;
}

.recording-bar .waveform div:nth-child(13) {
  animation-delay: 0s;
}

@keyframes wave {
  0%, 100% {
    height: 5px;
  }
  50% {
    height: 15px;
  }
}

.recording-bar button {
  background-color: #6C63FF;
  color: white;
  border: none;
  border-radius: 20px;
  padding: 10px 20px;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
}

.recording-bar button:hover {
  background-color: #554DBF;
}
</style>
</head>
<body>
  <div class="top_btn">
    <button class="btn1">질문 다시 듣기</button>
  </div>
  <div class="title"><img src="../img/feedbackup.png"></div>
  <div class="title_text">AI 면접 연습</div>
  <div class="content">
    <img src="../img/real_person.png" alt="AI 면접 이미지">
    <div class="info">본 질문은 삼성전자 기출 질문입니다.</div>
  </div>
  <div class="recording-bar">
    <div class="status">
      <div class="icon"></div>
      <div class="text">녹음중 00:03</div>
    </div>
    <div class="waveform">
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
            <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
    </div>
    <button>답변 마치기</button>
   </div>
</body>
</html>
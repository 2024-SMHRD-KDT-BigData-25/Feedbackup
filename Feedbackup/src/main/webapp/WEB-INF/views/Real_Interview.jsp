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

  .top_btn .btn1:hover {
    background-color: #8071FC;
    color: #FFFFFF;
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
</style>
</head>
<body>
  <div class="top_btn">
    <button class="btn1">질문 다시 듣기</button>
    <button class="btn2">나가기</button>
  </div>
  <div class="title"><img src="../img/feedbackup.png"></div>
  <div class="title_text">AI 면접 연습</div>
  <div class="content">
    <img src="../img/real_person.png" alt="AI 면접 이미지">
    <div class="button-container">
      <a href="/myapp/users/Real_Interview_Start"><button>시작하기</button></a>
    </div>
  </div>
</body>
</html>
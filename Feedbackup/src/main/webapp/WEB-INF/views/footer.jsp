<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Footer</title>

    <style>
      #wrap {
        min-height: 100vh;
        position: relative;
        width: 100%;
       
      }

      footer {
        width: 100%;
        height: 500px;
        bottom: 0px;
        position: absolute;
        border-top: 1px solid white;
        background-color: black;
        font-size: 11px;
        color: #8071FC;
        
      }

      .footerdiv {
        margin-top: 50px;
        margin-left: 40px;
      }

      ul {
        float: left;
      }

      li {
        list-style: none;
      }

      hr {
        border-color: #8071FC;
      }

      html, body {
        margin: 0;
        padding: 0;
      }

      

      .address {
        margin-left: 15px;
      }

      h3 {
        display: flex;
        align-items: baseline;
        width: 100%;
        justify-content: flex-start;
        font-size: 20px;
        margin-top: 100px;
        margin-left: 40px;
      }

      .address2 {
        display: flex;
        margin-top: 15px;
        margin-left: 40px;
        font-size: 15px;
      }

      .contact {
        display: flex;
        align-items: baseline;
        width: 100%;
        justify-content:  flex-end;
        margin-right: 40px;
        margin-top: 100px;
      }

      .r-title {
        font-weight: 800;
        font-size: 15px;
        margin-bottom: 20px;
      }

      .r-text {
        font-size: 15px;
        margin-bottom: 8px;
      }

      hr {
        margin-left: 20px;
        margin-right: 20px;
        transform: scaleY(0.5);
      }

      footer p {
        margin-top: 0;
        
        vertical-align: bottom;
        align-items: baseline;
        display: flex;
      }

      .footer-last1 {
        display: inline-block;
        margin-right: 20px;
        margin-bottom: 40px;
        margin-left: 30px;
        margin-top: 30px;
      }

      .footer-last2 {
        margin-left: 30px;
        font-size: 13px;
      }
    </style>
  </head>

  <body>
    <div id="wrap">
      <footer>
        <div class="footerdiv">
          <img id="logo" src="${pageContext.request.contextPath}/img/logo3.svg" alt="logo" />
        </div>
        <div class="container" style="display: flex;">
            <div class="address">
              <h3>주소</h3><br>
              <div class="address2">전라남도 순천시 중앙로 260(석현동, KT 북순천지점)</div>
            </div>

              <div class="contact">
                <ul>
                  <li class="r-title">FeedbackUp</li>
                  <li class="r-text">About</li>
                  <li class="r-text">Blog</li>
                </ul>
                <ul>
                  <li class="r-title">서비스</li>
                  <li class="r-text">AI 면접</li>
                  <li class="r-text">AI 분석결과</li>
                  <li class="r-text">훈련</li>
                </ul>
                <ul>
                  <li class="r-title">팀</li>
                  <li class="r-text">팀소개</li>
                </ul>
              </div>
              </div>
              <hr>
               <div>
                <p>
                  <span class="footer-last1">이용약관</span><br>
                  <span class="footer-last1">개인정보처리방침</span><br>
                  <span class="footer-last1">공지사항</span>
                </p>
                <span class="footer-last2">Ⓒ 2024. FeedbackUp. All Rights Reserved.</span>
              
            </div>
          </div>
      </footer>
  </div>
  </body>
</html>

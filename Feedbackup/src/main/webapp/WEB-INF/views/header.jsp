<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Header</title>
  </head>

  <style>
     body {
      font-family: 'SUIT-Regular';
      position: relative; 
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      height: 130px;
      background-color: white;
    }

    .logo {
      object-fit: cover;
      margin-left: 20px;
    }

    .nav {
      display: block;
      margin: 0 auto;
      
    }
    
    .nav-list {
      list-style: none;
      display: flex;
      align-items: center;
      background-color: black;
      color: white;
      width: 580px;
      height: 60px;
      border-radius: 200px;
    }




    .nav-list li {
      margin: auto;
      margin-left: 20px;
    }

    .nav-list a {
      text-decoration: none;
      color: white;
      font-size: 20px;
      
      transition: 0.35s;
      border-radius: 35px;
    }


.nav-list a:hover {
  background-color: #8071FC;
  color: #fff;
  font-weight: 600;
  transition: 0.35s;
  display: block;
  padding: 10px;
 
}



    .auth-btn {
      display: flex;
      gap: 20px;
      width: 250px;
    }

    .auth-btn button {
      padding: 10px;
      font-size: 16px;
      font-weight: 600;
      border-radius: 50px;
    }

    .btn-login {
      background-color: white;
      width: 800px;
      border-width: 1px;
    }

    .btn-login:hover {
      background-color: #8071FC;
      color: white;
      transition: 0.35s;
      border-color: #8071FC;
      cursor: pointer;
    }

    .btn-sign {
      background: linear-gradient(to right, #8071FC, #ACA4F0);
      border: none;
      color: white;
      width: 1000px;
    }

    .btn-sign:hover {
      background: white;
      border: 1px solid #8071FC;
      color: #8071FC;
      transition: 0.38s;
      cursor: pointer;
    }
    
    .btn-user {
      font-size: 20px;
      margin-top: 40px;
      width: 600px;
      margin-left: -70px;
      margin-top: 25px;
    }
  
    .btn-user strong {
       color: #8071FC;
       font-size: 23px;
       font-weight: 700;
    }
    
    .btn-user strong:hover {
       color: black;
       cursor: pointer;
    }
    
    .btn-logout {
      background: linear-gradient(to right, #8071FC, #ACA4F0);
      border: none;
      color: white;
      width: 500px;
      height: 50px;
      margin-top: 20px;
      display: inline-block;
      margin-left: 10px;
      vertical-align: middle;
    }
    
    .btn-logout:hover {
      background: white;
      border: 1px solid #8071FC;
      color: #8071FC;
      transition: 0.38s;
      cursor: pointer;
    }
    

    /* 반응형 스타일 */
    @media (max-width: 1024px) {
      .header {
        margin-left: 20px;
        margin-right: 20px;
        flex-direction: column;
        justify-content: center;
        text-align: center;
      }

      .nav {
        width: 100%;
        margin-top: 20px;
        margin-left: 100px;
      }

      .nav-list {
        width: 60%;
        flex-direction: column;
        align-items: center;
      }

      .nav-list li {
        margin: 10px;
        
      }

      .auth-btn {
        width: 30%;
        justify-content: center;
        margin-top: 20px;
        margin-left: 40px;
      }

      .btn-login, .btn-sign {
        width: 30%;
        font-size: 14px;
        padding: 12px;
      }
    }
    
    .btn-user {
       font-size: 14px;
       font-weight: 500;
       
    }

    @media (max-width: 768px) {
      .logo {
        width: 100%;
        text-align: center;
      }

      .nav {
        width: 100%;
      }

      .nav-list {
        flex-direction: column;
        align-items: center;
        padding: 0;
      }

      .nav-list a {
        font-size: 18px;
        padding: 10px;
        text-align: center;
      }

      .auth-btn {
        flex-direction: column;
        gap: 10px;
      }

      .btn-login, .btn-sign {
        width: 100%;
        font-size: 16px;
        padding: 12px;
      }
    }

    @media (max-width: 480px) {
      .header {
        margin-left: 10px;
        margin-right: 10px;
        padding: 10px;
      }

      .logo {
        width: 80%;
      }

     

      .nav-list {
        width: 100%;
        flex-direction: column;
        padding: 0;
      }

      .nav-list a {
        font-size: 16px;
        padding: 8px;
      }

      .auth-btn {
        flex-direction: column;
        gap: 10px;
      }

      .btn-login, .btn-sign {
        width: 100%;
        font-size: 14px;
        padding: 10px;
      }
    }
  </style>

  <body>
    <header class="header">
      <div class="logo">
        <a href="/myapp">
          <img src="img/logo2.png" title="logo" height="59" width="265">
        </a>
      </div>
      <nav class="nav">
        <ul class="nav-list">
          <li><a href="/myapp/Interview_Select">AI 면접</a></li>
          <li><a href="/myapp/users/result_list">AI 분석결과</a></li>
          <li><a href="/myapp/QandA">합격자 답안</a></li>
          <li><a href="#">고객지원</a></li>
        </ul>
      </nav>
      <div class="auth-btn">
      
      <%
   MavenMember member = (MavenMember) session.getAttribute("member");
   %>

   <%
   if (member == null) {
   %>

   <button class="btn-sign" onclick="location.href='login'">로그인</button>
   <button class="btn-login" onclick="location.href='users/signup'">시작하기</button>
   
   <%
   } else {
   %>
   <a class="btn-user" onclick="location.href='/myapp/users/mypage'"><strong><%=member.getName()%></strong>&nbsp;&nbsp;님</a>
   
   <button class="btn-logout" onclick="location.href='/myapp/logout'">로그아웃</button>


   <%
   }
   %>
      </div>  
    </header>
    
       <script>
      function deleteMember(id) {
         let choice = confirm("정말 탈퇴하시겠습니까?")

         if (choice) {
            location.href = "/myapp/users/" + id + "/delete";
         }
      }
   </script>
    
  </body>
</html>

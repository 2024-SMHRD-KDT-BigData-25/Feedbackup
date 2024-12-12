<%@page import="java.util.List"%>
<%@page import="com.smhrd.basic.model.MavenMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
		body {
		    background-color: #F1F5F9;
			font-family: 'Pretendard', sans-serif;
		}
        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid #e0e0e0;
            border-top: 2px solid #999;
            padding-bottom: 10px;
            width: 1000px;
            margin: 40px auto;
            padding: 40px;
            box-sizing: border-box;
            background-color: white;
        }
        .top h1 {
            font-size: 30px;
		    margin: 0px;
		    margin-left: 80px;
        }
        
        .top > p{
        	margin-left: 450px;
        }
        
        .top > form{
        	margin-right: 80px;
        	height: 28px;
        }
        
        .tab-title{
        	width: 1000px;
        	margin: 0 auto;
        	font-size: 20px;
        	font-weight: bold;
        	margin-bottom: 10px;
        }
        
   	    .tab-content {
	        margin-top: 20px;
	        width: 1000px;
            margin: 0 auto;
            border: 1px solid #e0e0e0;
            border-top: 1px solid #999;
            padding: 40px;
            box-sizing: border-box;
            background-color: white;
	    }
    
        .question {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
        }
        .question .meta {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }
        .question .text {
            font-size: 16px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination button {
            padding: 5px 10px;
            margin: 0 5px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
            cursor: pointer;
        }
        .pagination button.active {
            background-color: #007bff;
            color: #fff;
        }
        .back-button {
            margin-top: 20px;
            text-align: right;
        }
        .back-button a {
            text-decoration: none;
            padding: 10px 20px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
            color: #333;
            border-radius: 5px;
        }
        
   .question {
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 15px;
        padding: 15px;
        background-color: #f9f9f9;
    }
    
    .text {
        font-size: 16px;
        margin-bottom: 10px;
    }
	    .answer {
	        margin-top: 10px;
	        padding: 10px;
	        background-color: #eef5ff;
	        border-left: 3px solid #007bff;
	        border-radius: 3px;
	    }
	    .answer-text {
	        font-size: 14px;
	        color: #333;
	    }
	    
	    .toggle-button {
	        margin-top: 10px;
	        padding: 5px 10px;
	        font-size: 14px;
	        background-color: #007bff;
	        color: white;
	        border: none;
	        border-radius: 3px;
	        cursor: pointer;
	    }
	    .toggle-button:hover {
	        background-color: #0056b3;
	    }
	    
	        .meta {
        font-size: 14px;
        color: #555;
        margin-bottom: 10px;
    }
    </style>
</head>
<body>


<%
    // 리스트 가져오기
    List<MavenMember> list = (List<MavenMember>) request.getAttribute("list"); 

    // request에서 선택된 값을 가져옵니다.
    String selectedJobCode = request.getParameter("selectedJobCode");

    // selectedJobCode가 없으면 리스트의 첫 번째 값으로 설정
    if ((selectedJobCode == null || selectedJobCode.isEmpty()) && list != null && !list.isEmpty()) {
        selectedJobCode = list.get(0).getJob_code(); // 리스트의 첫 번째 jobCode 값
    }
%>

<div class="top">
    <h1><%= selectedJobCode %></h1>
    <p>그룹사별 전체</p>
    <form method="get" action="">
        <select name="selectedJobCode" onchange="this.form.submit()">
            <% 
                if (list != null) {
                    List<String> processedJobCodes = new ArrayList<>();
                    for (MavenMember m : list) {
                        String jobCode = m.getJob_code();
                        if (!processedJobCodes.contains(jobCode)) { // 중복 제거
                            processedJobCodes.add(jobCode);
            %>
            <option value="<%= jobCode %>" <%= jobCode.equals(selectedJobCode) ? "selected" : "" %>>
                <%= jobCode %>
            </option>
            <% 
                        }
                    }
                }
            %>
        </select>
    </form>
</div>

<div class="tab-title">면접 질문 및 합격자 답변</div>

<div class="tab-content" id="tab1">
    <% 
        if (list != null) {
            int index = 0; // 고유 ID를 위한 변수
            for (MavenMember m : list) {
                if (m.getJob_code().equals(selectedJobCode)) { // 선택된 기업만 출력
    %>
    <div class="question">
        <div class="meta">2021년 하반기 | 일반면접 - 백엔드개발자</div>
        <div class="text">
            <p class="question-text"><%= m.getQ_text() %></p>
            <!-- 토글 버튼 -->
            <button class="toggle-button" type="button" onclick="toggleAnswer('<%= index %>')">답변 보기</button>
        </div>
        <!-- 답변 텍스트 -->
        <div class="answer" id="answer-<%= index %>" style="display: none;">
            <p class="answer-text"><%= m.getA_text() %></p>
        </div>
    </div>
    <%
                    index++; // ID 증가
                }
            }
        } else {
    %>
    <p>질문 데이터가 없습니다.</p>
    <% 
        }
    %>
</div>

<div class="pagination">
    <button class="active">1</button>
</div>

<div class="back-button">
    <a href="#">목록보기</a>
</div>

<script>
    function showTab(tabId) {
        const tabs = document.querySelectorAll('.tab-content');
        const buttons = document.querySelectorAll('.tab-button');

        tabs.forEach(tab => tab.style.display = 'none');
        buttons.forEach(button => button.classList.remove('active'));

        document.getElementById(tabId).style.display = 'block';
        event.target.classList.add('active');
    }

    // 기본 탭 설정
    document.querySelectorAll('.tab-content').forEach((tab, index) => {
        tab.style.display = index === 0 ? 'block' : 'none';
    });
    
    // 토글 기능 구현
    function toggleAnswer(index) {
        const answerElement = document.getElementById('answer-' + index);
        if (answerElement.style.display === 'none') {
            answerElement.style.display = 'block'; // 답변을 보이게 함
        } else {
            answerElement.style.display = 'none'; // 답변을 숨김
        }
    }
</script>

	<table border=1>
      <tr>
         <th>기업</th>
         <th>질문</th>
         <th>답변</th>
      </tr>
		<%for(MavenMember m : list) {%>
      <tr>
         <td><%=m.getJob_code() %></td>
         <td><%=m.getQ_text()%></td>
         <td><%=m.getA_text()%></td>
      </tr>
	<%} %>
   </table>
</body>
</html>
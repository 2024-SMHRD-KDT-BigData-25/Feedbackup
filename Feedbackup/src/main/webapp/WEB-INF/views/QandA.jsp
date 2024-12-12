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
		    
        }
        
    .top .right {
        display: flex; /* <p>와 <form>을 가로로 배치 */
        align-items: center; /* 수직 가운데 정렬 */
    }

    .top .right > p {
        margin: 0 10px 0 0; /* 오른쪽 여백 10px */
    }

    .top .right > form {
        margin: 0; /* 불필요한 기본 여백 제거 */
    }
    
            .tabs {
            display: flex;
            border-bottom: 1px solid #ddd;
            margin-top: 20px;
            width: 1000px;
            margin: 0 auto;
            margin-bottom: 30px;
        }
        
        .tabs button {
            flex: 1;
            padding: 10px;
            background-color: white;
            border: none;
            border-bottom: 2px solid transparent;
            cursor: pointer;
        }
        .tabs button.active {
            border-bottom: 2px solid #8071FC;
            font-weight: bold;
        }
        
        .tab-title{
        	width: 1000px;
        	margin: 0 auto;
        	font-size: 20px;
        	font-weight: bold;
        	margin-bottom: 40px;
        	margin-left: 15PX;
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
    
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination button {
            padding: 5px 10px;
            margin: 0 5px;
            border: 1px solid #ddd;
            background-color: white;
            cursor: pointer;
        }
        .pagination button.active {
            background-color: #ddd;
            color: #fff;
        }
        
   .question {
        border-bottom: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 15px;
        padding: 15px;
        background-color: white;
    }
    
    .text {
        font-size: 16px;
        margin-bottom: 10px;
    }
	    .answer {
	        margin-top: 10px;
	        padding: 10px;
	        background-color: #F1F5F9;
	        border-left: 3px solid #CEB3FF;
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
	        background-color: white;
	        border: none;
	        border-radius: 3px;
	        cursor: pointer;
	    }
	    .toggle-button:hover {
	        background-color: white;
	    }
	    
	        .meta {
        font-size: 14px;
        color: #555;
        margin-bottom: 10px;
    }
    </style>
</head>
<body>
	 <!-- 헤더 불러오기 -->
    <div><jsp:include page="header.jsp"></jsp:include> </div>

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
    <div class="right">
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
</div>

<div class="tabs">
    <button class="tab-button active" onclick="showTab('tab1', event)">면접 질문 (5)</button>
	<button class="tab-button" onclick="showTab('tab2', event)">면접 후기 (0)</button>
	<button class="tab-button" onclick="showTab('tab3', event)">최종 합격 후기 (0)</button>
</div>



<div class="tab-content" id="tab1">
<div class="tab-title">면접 질문 및 합격자 답변</div>
    <% 
        if (list != null) {
            int index = 0; // 고유 ID를 위한 변수
            for (MavenMember m : list) {
                if (m.getJob_code().equals(selectedJobCode)) { // 선택된 기업만 출력
    %>
    <div class="question">
	    <div class="meta">2021년 하반기 | 일반면접 - 개발</div>
	    <div class="text">
	        <p class="question-text"><%= m.getQ_text() %></p>
	        <!-- 토글 버튼 -->
	        <button class="toggle-button" type="button" data-open="false" onclick="toggleAnswer('<%= index %>', this)">
	            ▶ 답변 보기
	        </button>
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
	<!-- 푸터 불러오기 -->
    <div><jsp:include page="footer.jsp"></jsp:include> </div>

<script>
function showTab(tabId, event) {
    const tabs = document.querySelectorAll('.tab-content');
    const buttons = document.querySelectorAll('.tab-button');

    // 모든 탭 콘텐츠를 숨기고, 버튼에서 active 클래스 제거
    tabs.forEach(tab => tab.style.display = 'none');
    buttons.forEach(button => button.classList.remove('active'));

    // 선택된 탭 콘텐츠를 보이고, 클릭한 버튼에 active 클래스 추가
    const targetTab = document.getElementById(tabId);
    if (targetTab) {
        targetTab.style.display = 'block';
    } else {
        console.error(`Tab with id '${tabId}' not found.`);
    }

    if (event && event.target) {
        event.target.classList.add('active');
    }
}

    // 기본 탭 설정
    document.querySelectorAll('.tab-content').forEach((tab, index) => {
        tab.style.display = index === 0 ? 'block' : 'none';
    });
    
    // 토글 기능 구현
    function toggleAnswer(index, button) {
        const answerElement = document.getElementById('answer-' + index);
        const isOpen = button.getAttribute('data-open') === 'true'; // 현재 열림 상태 확인

        if (isOpen) {
            answerElement.style.display = 'none'; // 답변을 숨김
            button.textContent = '▶ 답변 보기'; // 화살표와 텍스트 변경
            button.setAttribute('data-open', 'false');
        } else {
            answerElement.style.display = 'block'; // 답변을 보이게 함
            button.textContent = '▼ 답변 숨기기'; // 화살표와 텍스트 변경
            button.setAttribute('data-open', 'true');
        }
    }
</script>

</body>
</html>
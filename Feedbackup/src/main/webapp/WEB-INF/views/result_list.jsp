<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <title>FeedbackUp | AI 분석결과</title>
    <link rel="stylesheet" href="css/result_list.css">
</head>

<body>
    
    <!-- 헤더 불러오기 -->
    <div><jsp:include page="header.jsp"></jsp:include> </div>

    <div class="list-wrap">
        <h2>AI 분석 결과</h2>
        <div class="tab">
            <button class="tab-btn active" data-target="interview">AI 면접</button>
            <button class="tab-btn" data-target="introduce">자기소개</button>
        </div>
        <div class="list-result">
            <div class="result-box" data-category="interview" onclick="location.href='#'">
                <h2>AI 면접 결과</h2>
                <p>카카오 면접 연습</p>
                <span>2024년 12월 4일</span>
            </div>
            <div class="result-box" data-category="interview" onclick="location.href='#'">
                <h2>AI 면접 결과</h2>
                <p>현대자동차 면접 연습</p>
                <span>2024년 12월 3일</span>
            </div>
            <div class="result-box" data-category="interview" onclick="location.href='#'">
                <h2>AI 면접 결과</h2>
                <p>토스뱅크 면접 연습</p>
                <span>2024년 12월 1일</span>
            </div>
            <div class="result-box" data-category="interview" onclick="location.href='#'">
                <h2>AI 면접 결과</h2>
                <p>LG전자 면접 연습</p>
                <span>2024년 11월 30일</span>
            </div>
           <div class="result-box" data-category="introduce" style="display: none;" onclick="location.href='#'">
                <h2>자기소개 결과</h2>
                <p>자기소개 1</p>
                <span>2024년 12월 4일</span>
            </div>
            <div class="result-box" data-category="introduce" style="display: none;" onclick="location.href='#'">
                <h2>자기소개 결과</h2>
                <p>자기소개 2</p>
                <span>2024년 12월 4일</span>
            </div>
            <div class="result-box" data-category="introduce" style="display: none;" onclick="location.href='#'">
                <h2>자기소개 결과</h2>
                <p>자기소개 3</p>
                <span>2024년 12월 4일</span>
            </div>
            <div class="result-box" data-category="introduce" style="display: none;" onclick="location.href='#'">
                <h2>자기소개 결과</h2>
                <p>자기소개 4</p>
                <span>2024년 12월 4일</span>
            </div>
        </div>
    </div>

    <!-- 푸터 불러오기 -->
    <div><jsp:include page="footer.jsp"></jsp:include> </div>


    <script src="js/result_list.js"></script>
</body>
</html>
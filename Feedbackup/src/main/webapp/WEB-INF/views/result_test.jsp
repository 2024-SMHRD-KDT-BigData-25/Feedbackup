<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AJAX 데이터 결과</title>
</head>
<body>
    <h3>Question 1:</h3>
    <p><strong>변환된 텍스트:</strong> <span id="recognizedText"></span></p>
    <p><strong>평균 피치 (Hz):</strong> <span id="averagePitch"></span></p>
    <p><strong>상대적 떨림 (ΔF/F):</strong> <span id="relativeTremor"></span></p>
    <p><strong>머리를 만진 횟수:</strong> <span id="hairTouchCount"></span>번</p>
    <p><strong>코를 만진 횟수:</strong> <span id="noseTouchCount"></span>번</p>
    <p><strong>타임스탬프:</strong> <span id="timestamp"></span></p>
	
	<div id="resultsContainer"></div>
    <button id="resetButton">데이터 초기화</button>
	
    <script>
    function getSavedResults() {
        fetch("http://localhost:5700/get_results")
            .then(response => response.json())
            .then(data => {
                console.log("서버에서 가져온 결과:", data.saved_results);
                
                // 만약 데이터가 여러 개 있다면 첫 번째 항목을 사용
                const firstResult = data.saved_results[0]; // 첫 번째 항목을 가져옴
                
                // 데이터가 있을 경우 UI에 반영
                if (firstResult) {
                    document.getElementById("recognizedText").textContent = firstResult.recognizedText || "데이터 없음";
                    document.getElementById("averagePitch").textContent = firstResult.averagePitch ? firstResult.averagePitch.toFixed(2) : "0";
                    document.getElementById("relativeTremor").textContent = firstResult.relativeTremor ? firstResult.relativeTremor.toFixed(4) : "0";
                    document.getElementById("hairTouchCount").textContent = firstResult.hairTouchCount || "0";
                    document.getElementById("noseTouchCount").textContent = firstResult.noseTouchCount || "0";
                    document.getElementById("timestamp").textContent = firstResult.timestamp || "타임스탬프 없음";
                }
            })
            .catch(error => {
                console.error("서버에서 데이터를 가져오는 중 오류 발생:", error);
            });
    }

    // 페이지가 로드될 때 저장된 결과를 가져오기
    window.onload = function() {
        getSavedResults();  // 저장된 결과를 서버에서 가져옵니다
    };
    
 	// 초기화 함수
    function resetResults() {
        fetch("http://localhost:5700/reset_results", {
            method: "POST"
        })
        .then(response => response.json())
        .then(data => {
            console.log("초기화 응답:", data.message);
            // UI에서도 데이터 초기화
            document.getElementById("resultsContainer").innerHTML = "<p>데이터가 초기화되었습니다.</p>";
        })
        .catch(error => {
            console.error("초기화 요청 중 오류 발생:", error);
        });
    }

    // 초기화 버튼 이벤트 연결
    document.getElementById("resetButton").addEventListener("click", resetResults);

    
    </script>
</body>
</html>

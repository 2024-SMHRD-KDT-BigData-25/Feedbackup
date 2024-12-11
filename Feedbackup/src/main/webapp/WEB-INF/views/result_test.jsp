<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AJAX 데이터 결과</title>
</head>
<body>
    <h3>분석 결과:</h3>
    <!-- 결과를 표시할 컨테이너 -->
    <div id="resultsContainer"></div>
    <button id="resetButton">데이터 초기화</button>

    <script>
        function getSavedResults() {
            fetch("http://localhost:5700/get_results")
                .then(response => response.json())
                .then(data => {
                    console.log("서버에서 가져온 결과:", data.saved_results);
                    
                    const resultsContainer = document.getElementById("resultsContainer");
                    resultsContainer.innerHTML = ""; // 기존 결과 초기화

                    // 첫 3개 결과만 가져오기
                    data.saved_results.slice(0, 3).forEach((result, index) => {
                        const resultDiv = document.createElement("div");
                        resultDiv.innerHTML = `
                            <h4>결과 ${index + 1}</h4>
                            <p><strong>변환된 텍스트:</strong> ${result.recognizedText || "데이터 없음"}</p>
                            <p><strong>평균 피치 (Hz):</strong> ${result.averagePitch ? result.averagePitch.toFixed(2) : "0"}</p>
                            <p><strong>상대적 떨림 (ΔF/F):</strong> ${result.relativeTremor ? result.relativeTremor.toFixed(4) : "0"}</p>
                            <p><strong>머리를 만진 횟수:</strong> ${result.hairTouchCount || "0"}번</p>
                            <p><strong>코를 만진 횟수:</strong> ${result.noseTouchCount || "0"}번</p>
                            <p><strong>타임스탬프:</strong> ${result.timestamp || "타임스탬프 없음"}</p>
                        `;
                        resultsContainer.appendChild(resultDiv); // 결과를 컨테이너에 추가
                    });
                })
                .catch(error => {
                    console.error("서버에서 데이터를 가져오는 중 오류 발생:", error);
                });
        }

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

        // 페이지가 로드될 때 저장된 결과를 가져오기
        window.onload = function() {
            getSavedResults();
        };
    </script>
</body>
</html>

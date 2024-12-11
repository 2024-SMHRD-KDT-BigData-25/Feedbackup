<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AJAX 데이터 결과</title>
</head>
<body>
    <h3>Question:</h3>
    <p><strong>변환된 텍스트:</strong> <span id="recognizedText"></span></p>
    <p><strong>평균 피치 (Hz):</strong> <span id="averagePitch"></span></p>
    <p><strong>상대적 떨림 (ΔF/F):</strong> <span id="relativeTremor"></span></p>
    <p><strong>머리를 만진 횟수:</strong> <span id="hairTouchCount"></span>번</p>
    <p><strong>코를 만진 횟수:</strong> <span id="noseTouchCount"></span>번</p>
    <p><strong>타임스탬프:</strong> <span id="timestamp"></span></p>
    <p><strong>움직임 분석:</strong> <span id="gestureAnalysis"></span></p>
    <p><strong>피치 분석:</strong> <span id="pitchDescription"></span></p>
    <p><strong>떨림 분석:</strong> <span id="tremorDescription"></span></p>
    
    <div id="resultsContainer"></div>

    <!-- 선택된 결과를 보여줄 버튼 추가 -->
    <button id="loadResult0">0번 데이터 보기</button>
    <button id="loadResult1">1번 데이터 보기</button>
    <button id="loadResult2">2번 데이터 보기</button>
    
    <button id="resetButton">데이터 초기화</button>
    
    <script>
    let savedResults = [];

    // 서버에서 데이터를 가져오기
    function getSavedResults() {
        fetch("http://localhost:5700/get_results")
            .then(response => response.json())
            .then(data => {
                console.log("서버에서 가져온 결과:", data.saved_results);
                savedResults = data.saved_results; // 데이터를 전역 변수에 저장
                loadResult(0); // 기본적으로 0번 데이터를 로드
            })
            .catch(error => {
                console.error("서버에서 데이터를 가져오는 중 오류 발생:", error);
            });
    }

    // 선택된 결과를 화면에 출력하는 함수
    function loadResult(index) {
        const firstResult = savedResults[index];
        
        if (firstResult) {
            const averagePitch = firstResult.averagePitch || 0;
            let pitchDescription = '';

            // 피치 설명 문구 생성
            if (averagePitch < 120) {
                pitchDescription = "낮은 피치: 목소리가 차분하거나 낮게 들릴 수 있습니다.";
            } else if (120 <= averagePitch && averagePitch <= 180) {
                pitchDescription = "중간 피치: 일반적인 남성 음성 톤입니다.";
            } else if (180 <= averagePitch && averagePitch <= 250) {
                pitchDescription = "높은 피치: 음성이 밝거나 높은 톤으로 들릴 수 있습니다.";
            } else if (averagePitch > 250) {
                pitchDescription = "매우 높은 피치: 음성이 지나치게 높은 톤으로 들릴 수 있습니다.";
            }

            const hairTouchCount = firstResult.hairTouchCount || 0;
            const noseTouchCount = firstResult.noseTouchCount || 0;
            const totalTouches = (hairTouchCount + noseTouchCount) / 2;

            const formattedTotalTouches = totalTouches.toFixed(2);

            // 상대적 떨림 분석
            const relativeTremor = firstResult.relativeTremor || 0;
            let tremorDescription = '';

            if (relativeTremor < 0.03) {
                tremorDescription = "매우 안정적: 떨림이 거의 없는 상태입니다.";
            } else if (0.03 <= relativeTremor && relativeTremor < 0.07) {
                tremorDescription = "자연스러운 수준의 떨림: 떨림이 있지만 일반적으로 자연스럽게 느껴집니다.";
            } else if (0.07 <= relativeTremor && relativeTremor < 0.12) {
                tremorDescription = "약간의 긴장 또는 미세한 떨림: 긴장 가능성이 있습니다.";
            } else if (relativeTremor >= 0.12) {
                tremorDescription = "과도한 떨림: 긴장감이나 불안정한 음성이 뚜렷이 느껴집니다.";
            }

            // 움직임 분석
            let gestureAnalysis = '';
            if (totalTouches >= 10) {
                gestureAnalysis = '면접 제스처 분석 결과, 면접자님의 제스처는 ‘미흡’입니다.';
            } else if (10 < totalTouches && totalTouches <= 7) {
                gestureAnalysis = '면접 제스처 분석 결과, 면접자님의 제스처는 ‘보통’입니다.';
            } else if (7 < totalTouches && totalTouches <= 4) {
                gestureAnalysis = '면접 제스처 분석 결과, 면접자님의 제스처는 ‘양호’입니다.';
            } else if (totalTouches < 4) {
                gestureAnalysis = '면접 제스처 분석 결과, 면접자님의 제스처는 ‘우수’입니다.';
            }

            // UI에 반영
            document.getElementById("recognizedText").textContent = firstResult.recognizedText || "데이터 없음";
            document.getElementById("averagePitch").textContent = firstResult.averagePitch ? firstResult.averagePitch.toFixed(2) : "0";
            document.getElementById("relativeTremor").textContent = firstResult.relativeTremor ? firstResult.relativeTremor.toFixed(4) : "0";
            document.getElementById("hairTouchCount").textContent = firstResult.hairTouchCount || "0";
            document.getElementById("noseTouchCount").textContent = firstResult.noseTouchCount || "0";
            document.getElementById("timestamp").textContent = firstResult.timestamp || "타임스탬프 없음";
            document.getElementById("pitchDescription").textContent = pitchDescription;
            document.getElementById("gestureAnalysis").textContent = gestureAnalysis;
            document.getElementById("tremorDescription").textContent = tremorDescription;
        }
    }

    // 페이지가 로드될 때 저장된 결과를 가져오기
    window.onload = function() {
        getSavedResults();
    };

    // 버튼 클릭 시 결과 로드
    document.getElementById("loadResult0").addEventListener("click", function() {
        loadResult(0);
    });
    document.getElementById("loadResult1").addEventListener("click", function() {
        loadResult(1);
    });
    document.getElementById("loadResult2").addEventListener("click", function() {
        loadResult(2);
    });

    // 초기화 함수
    function resetResults() {
        fetch("http://localhost:5700/reset_results", {
            method: "POST"
        })
        .then(response => response.json())
        .then(data => {
            console.log("초기화 응답:", data.message);
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

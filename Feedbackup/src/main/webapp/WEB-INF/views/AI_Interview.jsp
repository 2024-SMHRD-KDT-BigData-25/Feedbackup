<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AI_Interview</title>
<link rel="stylesheet" type="text/css" href="css/AI_InterviewStyle.css">
</head>
<body>
    <div class="AI_Interview_wrapper">
        <div class="text1">연결된 기기를 확인해 주세요.</div>
        <div class="container">
            <div class="box1" id="box1">
                <div class="underline">
                    <h4>마이크 테스트 가이드</h4>
                    <P><span class="circle">1</span>&nbsp;&nbsp; 마이크가 pc(노트북)에 연결되어 있는지 확인해 주세요.</P>
                    <P><span class="circle">2</span>&nbsp;&nbsp; 상단 팝업의 마이크 권한을 "허용"으로 선택해 주세요.</P>
                    <P><span class="circle">3</span>&nbsp;&nbsp; 영상은 녹화되지 않으며 음성만 녹음됩니다.</P>
                </div>
                <div class="underline">
                    <h4>소음</h4>
                    <P><span class="circle">1</span>&nbsp;&nbsp; 조용한 공간에서 면접을 진행해 주세요</P>
                    <P><span class="circle">2</span>&nbsp;&nbsp; 이어폰 사용 시 마이크에 닿은 옷 또는 머리카락 때문에 소음이 생길수 있으니 주의해 주세요.</P>
                    <P><span class="circle">3</span>&nbsp;&nbsp; 다른 사람의 음성이 녹음되지 않도록 해 주세요</P>
                </div>
                <div class="underline">
                    <h4>오류를 일으키는 주요원인</h4>
                    <P><span class="circle">1</span>&nbsp;&nbsp; 마이크 사용 중 하울링(소리 증폭 현상)이 발생하면 소리가 커져서 음성 검출이 어려워질 수 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;있습니다.</P>
                    <P><span class="circle">2</span>&nbsp;&nbsp; 이어폰 사용 시에는 마이크가 있는 기기를 사용해 주세요.</P>
                    <P><span class="circle">3</span>&nbsp;&nbsp; 음성 전달에 영향을 미치는 마스크를 착용하지 말아 주세요.</P>
                </div>
                <div>
                    <h4>답변 주의사항</h4>
                    <P><span class="circle">1</span>&nbsp;&nbsp; 소리가 작거나 발음이 부정확하면 음성 인식이 어려울 수 있습니다.</P>
                    <P><span class="circle">2</span>&nbsp;&nbsp; 답변할 때 정확한 음성과 크기로 답변해 주세요.</P>
                </div>
            </div>
            <div class="box2" id="box2">
                <div clas="person_container">
                    <img src="${pageContext.request.contextPath}/assets/img/person.png" alt="배경 이미지" class="person_img">
                    <div class="person_text"> 음성 인식 칸?</div>
                </div>
                <div class="mike">
                    <span>마이크</span>
                    <div>기기칸</div>
                    <div class="check_circle">
                        <span>✔</span>
                    </div>
                    <P>연결됨</P>
                </div>
                <div class="connect">
                    <div class="btn" id="btn_jump">건너띄기</div>
                    <div class="btn">연결확인</div>
                </div>
            </div>
          </div>
    </div>
</body>
</html>
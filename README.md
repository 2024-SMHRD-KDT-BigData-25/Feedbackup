![logo2](https://github.com/user-attachments/assets/cbe8c2e2-b810-42ca-ae1d-93fbf0a030c5)

## 서비스 소개
서비스명 : 피드백업
소개
- 취업준비에 AI를 활용하는 취업자의 수가 많아지고 있는 상황으로 그 중 가장 빠르게 AI를 도입하고 있는 전형은 면접으로 AI 면접 준비를 따로 할 정도로 점점 보편화 되고 있어, 맞춤형 AI 면접 연습 서비스가 절실하다. 이런 어려움을 해결하기 위해서 면접 응시자들의 면접 태도와 답변을 분석하여 면접을 평가하는 서비스를 제공하는 플랫폼을 개발하고자 한다.
- 사용자가 희망하는 기업의 예상질문을 제공하며, 면접 연습시 면접관의 음성으로 질문을 하여 실제 면접장과 같은 환경을 제공한다.
- 면접시 사용자의 면접 태도와 답변을 분석하여 면접을 분석 및 평가하여 제공한다.


##  📅 프로젝트 기간
2024.11.01 - 2024.12.16 (6주)


## 주요기능
- AI 기반 음성 및 제스처 분석을 통한 맞춤형 면접 피드백 제공
- 기업별 예상 질문 제공
- 사용자 친화적이고 직관적인 UI/UX 제공
- 실제 면접 환경을 모사한 AI 면접 시뮬레이션 서비스 제공
- AI 면접관의 음성질문 제공


## 개발내용
데이터 수집  
- 전자책 및 합격자 데이터 수집
-  직접 녹음한 목소리 데이터 수집

데이터 전처리  
-  수집된 데이터 정제 및 중복 제거
-  면접 질문 및 답변 카테고리화
-  음성 노이즈 제거

딥러닝
- Librosa 라이브러리를 이용한 음성 분석 모델 개발
- OpenCV, Mediapipe 라이브러리를 이용한 제스처 분석 모델 개발
- Whisper 모델을 이용한 TTS/STT 변환 모델 개발
- GPT API : 답변 평가 및 피드백 시스템

웹 구축 및 기능 구현
- UI 디자인 툴 Figma를 이용한 웹 디자인
- HTML / CSS / JS를 활용하여 웹 구현
- JSP / Servlet을 활용하여 웹페이지 기능 구현
- Python, JavaScript, Flask 활용하여 딥러닝 모델과 실시간 연동

서버 구축
- Spring Boot 내장 Apache Tomcat을 이용한 JSP 서버 구축
- Servlet을 이용한 MySql DB 접근
- Python Flask와 Apache Tomcat의 쿼리스트링 방식의 데이터 통신


## 🛠️ 기술스택
### ✔️Frond-end
<img src="https://img.shields.io/badge/Css-1572B6?style=for-the-badge&logo=Css&logoColor=white"><img src="https://img.shields.io/badge/Html-E34F26?style=for-the-badge&logo=Html&logoColor=white"><img src="https://img.shields.io/badge/Js-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white">
### ✔️Back-end
<img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=for-the-badge&logo=Spring Boot&logoColor=yellow"><img src="https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=Flask&logoColor=white">
### ✔️IDE
<img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white"><img src="https://img.shields.io/badge/jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white"><img src="https://img.shields.io/badge/VSCode-1572B6?style=for-the-badge&logo=VSCode&logoColor=white">
### ✔️Collaboration
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"><img src="https://img.shields.io/badge/figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white"><img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white">
### ✔️Database
<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">



## 시스템 아키텍처(구조)
![스크린샷 2024-12-17 092317](https://github.com/user-attachments/assets/ce7b3708-cd2e-4283-9f6f-18518294461e)


## 플로우 차트
![flow](https://github.com/user-attachments/assets/58bb7ed5-2983-4bc9-86f6-9fba4858a5b8)


## ER-다이어그램
![스크린샷 2024-12-17 092255](https://github.com/user-attachments/assets/4631a440-d91e-4f72-9d96-c5053e447f79)


## 화면구성
![발표집1](https://github.com/user-attachments/assets/40fe6e6d-ab0e-4110-b8eb-125dbb35d35f)
<img width="1441" alt="발표집2" src="https://github.com/user-attachments/assets/aab0d3e6-b413-4f86-ad52-f2e288c358f4" />
<img width="1441" alt="발표집3" src="https://github.com/user-attachments/assets/53c81b0e-3d90-47f5-8bfc-6665daed2d30" />
![KakaoTalk_20241215_174027267](https://github.com/user-attachments/assets/8ba3f53b-e068-4632-b92a-739cc5d59509)
![KakaoTalk_20241215_174524782](https://github.com/user-attachments/assets/a167e832-adad-476b-85e7-cc4981174d8e)


## 트러블슈팅
![스크린샷 2024-12-17 092534](https://github.com/user-attachments/assets/a68a97d7-c277-477c-9c6b-4faca8ad01e3)
![스크린샷 2024-12-17 092545](https://github.com/user-attachments/assets/f0b2d47a-f30f-402e-a947-a455f84deb85)


## 팀원 소개 및 역할
![스크린샷 2024-12-17 092453](https://github.com/user-attachments/assets/6dfeb37b-02d5-4f10-9bb0-34ecd0502dd1)
<table>
  <tbody>
    <tr>
      <td align="center"><a href=""><img src="width="100px;" alt=""/><br /><sub><b>FE 팀장 : 김유경</b></sub></a><br /></td>
      <td align="center"><a href=""><img src="" width="100px;" alt=""/><br /><sub><b>FE 부팀장 : 방승완</b></sub></a><br /></td>
      <td align="center"><a href=""><img src="" width="100px;" alt=""/><br /><sub><b>FE 팀원 : 박현우</b></sub></a><br /></td>
      <td align="center"><a href=""><img src="" width="100px;" alt=""/><br /><sub><b>FE 팀원 : 권국성</b></sub></a><br /></td>
      <td align="center"><a href=""><img src="" width="100px;" alt=""/><br /><sub><b>FE 팀원 : 김진우</b></sub></a><br /></td>
  </tbody>
</table>

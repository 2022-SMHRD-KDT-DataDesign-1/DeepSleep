# ILEM
SAM(Segment Anything Model)과 GROUNDING DINO를 활용한 이미지 오토라벨링 서비스

<img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/5c67e11c-d22f-49ef-80b5-82821e9c40be" style="width:700px; height: 350px" />
<br><br><br><br>

## 프로젝트 소개
### 🕰개발 기간
  - 2023.5 ~ 2023.6.20. (약 5주)
<br>

### ⚙ 개발 환경
- FrontEnd
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black"/> <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white"/> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white"/>
<img src="https://img.shields.io/badge/Chart.js-FF6384?style=flat-square&logo=Chart.js&logoColor=black"/>

- BackEnd
<img src="https://img.shields.io/badge/java-007396?style=flat-square&logo=java&logoColor=white"/> <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/> <img src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=Python&logoColor=white"/>  <img src="https://img.shields.io/badge/Flask-000000?style=flat-square&logo=flask&logoColor=white"/>  <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat-square&logo=apachetomcat&logoColor=black"/>  <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/>

- Model <img src="https://img.shields.io/badge/PyCharm-000000?style=flat-square&logo=PyCharm&logoColor=white"/>

- Tool
<img src="https://img.shields.io/badge/Eclipse%20IDE-2C2255.svg?&style=flat-square&logo=Eclipse%20IDE&logoColor=white"/> <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=flat-square&logo=Visual Studio Code&logoColor=white"/> <img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/>

<br>

## 📌 주요 기능
### 1. 객체 탐지
  업로드한 이미지에서 탐지한 객체와 그에 맞는 라벨로 분류해 반환
  <br>
  
  | 이미지 업로드 | 객체 탐지 결과 |
  | :------------: | :-------------: |
  | <img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/b07afa9b-2968-4473-80ae-3c7f5688c3e7" /> | <img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/6a0ef24a-b427-4708-aaeb-818000e1b658" /> |

<br><br>
### 2. 키워드 입력
  이미지와 키워드를 입력하면 입력한 키워드와 일치하는 라벨 분류
    <br>
  
  | 이미지 업로드 및 키워드 입력 | 객체 탐지 결과 |
  | :------------: | :-------------: |
  | <img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/913a3285-a3c6-4795-a1fb-4fadce9abdb0" /> | <img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/9d4739cf-a0da-44e8-bbe6-992a9ea668b6" /> |

<br><br>
### 3. 저장
  #### 3-1. 보관함 저장
  회원가입 시 자동 생성되는 보관함에 라벨링 결과와 함께 저장<br>
  | 차트 | 라벨링 결과 카테고리화 |
  | :------------: | :-------------: |
  | <img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/17373db2-113b-4d93-bf52-9cddac8cdb4f" /> |<img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/2426a085-51d5-46f9-b745-89787dd6948c" />|

  #### 3-2. zip 저장
  사용자의 로컬 컴퓨터에 zip 파일로 저장
  | 이미지 선택 | 로컬 저장 |
  | :------------: | :-------------: |
  | <img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/e706dfbb-81c8-4266-96c4-4d73e2e2f8ff" /> | <img style="width:1900px;" src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/4820d270-f340-4627-906c-a5357cf9a35a" /> |
  
<br><br>
## 🖥 시스템 아키텍처
<img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/ce29ca27-4103-4358-ac26-577bdc538867" style="width:700px; height: 350px" />


## 📋 ERD
<img src="https://github.com/2022-SMHRD-KDT-DataDesign-1/DeepSleep/assets/122238744/6ccfa51c-059a-4c9c-8a13-ad9ebabba5d2" style="width:700px; height: 350px" />

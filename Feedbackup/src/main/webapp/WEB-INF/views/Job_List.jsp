<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job_List</title>
<style>
    @font-face {
        font-family: 'SUIT-Regular';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    
    body {
        background-color: #F1F5F9;
        font-family: 'SUIT-Regular';
        align-content: center;
    }

    .text1 {
        font-size: 26px;
        font-weight: bold;
        margin-top: 40px;
        text-align: center;
    }

    .text2 {
        font-size: 10px;
        margin-top: 10px;
        margin-bottom: 20px;
        text-align: center;
        color: #64748B;
    }

    .category-container {
        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 20px;
        width: 800px;
        background-color: #FFFFFF;
        border: 1px solid #8071FC;
        border-radius: 30px;
        padding: 40px 40px;
        margin: 0px auto;
        margin-top: -10px;
    }

    .category-step {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-right: 30px;
    }

    .step-circle {
        width: 40px;
        height: 40px;
        background-color: #8071FC;
        color: white;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 25px;
        font-weight: 900;
    }

    .category-grid {
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        gap: 20px;
    }

    .category-button {
        background-color: #F3F3F3;
        color: #333333;
        border: 1px solid white;
        border-radius: 10px;
        font-size: 10px;
        text-align: center;
        cursor: pointer;
        transition: all 0.2s ease-in-out;
        font-weight: 550;
        width: 100px;
        height: 30px;
    }

    .category-button:hover {
        box-sizing: border-box;
        background-color: #F3EDFF;
        color: #8071FC;
        border: 2px solid #8071FC;
        font-weight: bold;
    }

    .category-button.active {
        background-color: #8071FC;
        color: white;
        border: 2px solid #8071FC;
        font-weight: bold;
    }

    .sex_container {
        text-align: center;
        align-items: center;
        gap: 20px;
        width: 800px;
        height: 180px;
        background-color: #FFFFFF;
        border: 1px solid #8071FC;
        border-radius: 30px;
        padding: 30px 40px;
        margin: 30px auto;
        color: #8071FC;
        font-size: 11px;
        font-weight: bold;
    }

    .sex_select {
        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 20px;
        margin: 0px auto;
    }

    .sex {
        justify-content: center;
        display: flex;
        gap: 20px;
        font-size: 18px;
        width: 620px;
    }

    .box {
        background-color: #FFFFFF;
        border: 1px solid #CBD5E1;
        width: 140px;
        height: 140px;
        margin-top: 20px;
        border-radius: 15px;
        font-size: 15px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        box-shadow: 0 1px 20px 0 rgb(220, 220, 220);
    }

    .box:hover {
        background-color: #F3EDFF;
        color: #8071FC;
        border: 2px solid #8071FC;
        font-weight: bold;
    }

    .box.active {
        background-color: #8071FC;
        color: white;
        border: 2px solid #8071FC;
        font-weight: bold;
    }
    
	.man{
		width: 90px;
	}
	
	.woman{
		width: 78px;
		margin-top: 12px; 
	}
    
    .box > div{
    	margin-top: 5px;
    }

    .next {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .next_btn {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        border: 1px solid #8071FC;
        border-radius: 50px;
        width: 160px;
        height: 65px;
        background-color: #8071FC;
        color: white;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
    }

    .next_btn:hover {
        background-color: #6a5ecc;
    }
    
    .search-container {
	  display: flex;
	  justify-content: right;
	  margin: 0px 320px;
	  gap: 10px;
	
	}
	
	.search-input {
	  width: 180px;
	  height: 30px;
	  padding: 3px;
	  border: 1px solid #8071FC;
	  border-radius: 5px;
	  font-size: 14px;
	}
	
	.search-button {
	  background-color: #8071FC;
	  color: white;
	  border: none;
	  border-radius: 5px;
	  padding: 9px 10px;
	  font-size: 14px;
	  cursor: pointer;
	  transition: background-color 0.2s;
	}
	
	.search-button:hover {
	  background-color: #6a5ecc;
	}
	
	.search-result {
	  margin: 20px auto;
	  text-align: center;
	  font-size: 16px;
	  color: #333;
	}
</style>
</head>
<body>
<div class="Job_list_wrapper">
    <div class="text1">희망하시는 기업을 선택해 주세요</div>
    <div class="text2">* 확실한 면접 준비를 위해 각각 한가지만 선택가능 합니다.</div>
    <form id="main-form" action="/myapp/users/Job_List" method="POST">
        <!-- Hidden Inputs -->
        <input type="hidden" id="selected-gender" name="gender" value="">
        <input type="hidden" id="selected-company" name="company" value="">
        
        <!-- 검색창 -->
        <div class="search-container">
            <input 
                type="text" 
                id="search-input" 
                name="jobCode" 
                placeholder="기업명을 검색하세요" 
                class="search-input" 
            />
            <button type="button" id="search-button" class="search-button">검색</button>
        </div>
        <div id="search-result" class="search-result"></div>
        
        <!-- 기업 선택 -->
        <div class="category-container">
            <div class="category-step">
                <div class="step-circle">1</div>
            </div>
            <div class="category-grid">
                <button type="button" class="category-button">카카오</button>
                <button type="button" class="category-button">현대자동차</button>
                <button type="button" class="category-button">삼성전자</button>
                <button type="button" class="category-button">SKT</button>
                <button type="button" class="category-button">SK 하이닉스</button>
                <button type="button" class="category-button">KT</button>
                <button type="button" class="category-button">LG</button>
                <button type="button" class="category-button">포스코</button>
                <button type="button" class="category-button">롯데</button>
                <button type="button" class="category-button">한화</button>
                <button type="button" class="category-button">GS</button>
                <button type="button" class="category-button">농협</button>
                <button type="button" class="category-button">두산</button>
                <button type="button" class="category-button">LS</button>
                <button type="button" class="category-button">한진</button>
                <button type="button" class="category-button">CJ</button>
                <button type="button" class="category-button">신세계</button>
                <button type="button" class="category-button">셀트리온</button>
                <button type="button" class="category-button">쿠팡</button>
                <button type="button" class="category-button">금호아시아나</button>
                <button type="button" class="category-button">하림</button>
                <button type="button" class="category-button">SM</button>
                <!-- Add more companies as needed -->
            </div>
        </div>
        
        <!-- 성별 선택 -->
        <div class="sex_container">
            <div>정확한 음성 분석을 위해 성별을 선택해 주세요</div>
            <div class="sex_select">
	            <div class="category-step">
		      		<div class="step-circle">2</div>
		    	</div>	
                <div class="sex">
			  		<div class="box" data-gender="male">
				  		<img src="../img/man.png" class="man">
				  		<div>남성</div>
			  		</div>
			  		<div class="box" data-gender="woman">
			  			<img src="../img/woman.png" class="woman">
				  		<div>여성</div>
			  		</div>
                </div>
            </div>
        </div>
        
        <!-- 다음 버튼 -->
        <div class="next">
            <button type="button" class="next_btn">다음</button>
        </div>
    </form>
</div>

<script>
    // 검색 로직
    document.getElementById('search-button').addEventListener('click', searchCompany);
    document.getElementById('search-input').addEventListener('keydown', function (event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            searchCompany();
        }
    });

    function searchCompany() {
        const input = document.getElementById('search-input').value.trim().toLowerCase();
        const buttons = document.querySelectorAll('.category-button');
        let result = '';
        const activeCompanies = []; // 활성화된 버튼 저장 배열

        buttons.forEach(button => {
            const companyName = button.textContent.trim().toLowerCase();

            // 검색어가 버튼 텍스트에 포함되어 있는지 확인
            if (companyName.includes(input)) {
                result += `${button.textContent} `;
                button.classList.add('active');
                activeCompanies.push(companyName);
            } else {
                button.classList.remove('active');
            }
        });

        if (!input) {
            result = '검색어를 입력하세요.';
        } else if (result === '') {
            result = '일치하는 기업이 없습니다.';
        }

        document.getElementById('search-result').textContent = result;
    }

    // 성별 선택
    document.querySelectorAll('.box').forEach(box => {
        box.addEventListener('click', function () {
            document.querySelectorAll('.box').forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            document.getElementById('selected-gender').value = this.dataset.gender;
        });
    });

    // 기업 선택
    document.querySelectorAll('.category-button').forEach(button => {
        button.addEventListener('click', function () {
            document.querySelectorAll('.category-button').forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            document.getElementById('selected-company').value = this.textContent.trim();
        });
    });

    // 다음 버튼 클릭
    document.querySelector('.next_btn').addEventListener('click', function () {
        const gender = document.getElementById('selected-gender').value;
        const company = document.getElementById('selected-company').value;

        if (!gender) {
            alert('성별을 선택해 주세요.');
            return;
        }

        if (!company) {
            alert('기업을 선택해 주세요.');
            return;
        }

        document.getElementById('main-form').submit();
    });
</script>
</body>
</html>

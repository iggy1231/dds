<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 후기 작성하기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .body-container {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .post-title {
            text-align: center;
            color: #18A8F1;
            font-size: 30px;
            font-weight: 600;
            margin-top: 20px;
        }

        .form-container {
            margin: 20px 0;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .form-container form input, 
        .form-container form textarea,
        .form-container form button,
        .form-container form input[type="file"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
        }

        .form-container form textarea {
            resize: vertical;
            height: 150px;
        }

        .form-container form button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #18A8F1;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-container form button:hover {
            background-color: #0d6efd;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="body-container">
            <div class="post-title">
                ${mode=="create"?"여행 후기 작성하기":"여행 후기 수정하기"}
            </div>

            <div class="form-container">
                <form name="travelreviewForm" action="${pageContext.request.contextPath}/travelreview/${mode}" method="post" enctype="multipart/form-data">
                	<div>지역을 선택하세요
                		<select name="region_main">
							<option class="select" value="선택" selected>선택</option>
							<option value="서울">서울</option>
							<option value="인천">인천</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="광주">광주</option>
							<option value="부산">부산</option>
							<option value="울산">울산</option>
							<option value="세종">세종</option>
							<option value="경기">경기</option>
							<option value="강원">강원</option>
							<option value="충북">충북</option>
							<option value="충남">충남</option>
							<option value="경북">경북</option>
							<option value="경남">경남</option>
							<option value="전북">전북</option>
							<option value="전남">전남</option>
							<option value="제주">제주</option>	
						</select>
						<select name="region_sub">
							<option value="선택">선택</option>
						</select>
                	</div>
                    <input type="text" name="subject" placeholder="제목을 입력하세요" required value='${mode=="create"?"":dto.subject}'>
                    <textarea name="content" placeholder="내용을 입력하세요" required>${mode=="create"?"":dto.content}</textarea>
                    <input type="file" name="selectFile"  accept="image/*" multiple >
                    <input type="hidden" name="num" value="${dto.num}">
                    <input type="hidden" name="page" value="${page}">
                    <button type="button" onclick="submit();">${mode=="create"?"작성하기":"수정하기"}</button>
                </form>
            </div>
        </div>
    </div>
<script type="text/javascript">
function submit() {
	const f=document.travelreviewForm;
	
	if(f.area.value=='선택') {
		alert('지역을 선택해주세요');
		f.area.focus();
		return;
	}	
	
	f.submit();
}

$(document).on("change", "select[name=region_main]", function(){
	let area=$(this).val();
	let sigungu=$(this).closest('div').children().last();
	sigungu.html('');
	
	let arr;
	switch(area) {
		case "서울" : {
			arr=['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구',
				'서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];
			break;
		}
		case "인천" : {
			arr=['강화군', '계양구', '미추홀구', '남동구', '동구', '부평구', '서구', '연수구', '옹진군', '중구'];
			break;
		}
		case "대전" : {
			arr=['대덕구', '동구', '서구', '유성구', '중구'];
			break;
		}
		case "대구" : {
			arr=['남구', '달서구', '달성군', '동구', '북구', '서구', '수성구', '중구', '군위군'];
			break;
		}
		case "광주" : {
			arr=['광산구', '남구', '동구', '북구', '서구'];
			break;
		}
		case "부산" : {
			arr=['강서구', '금정구', '기장군', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구',
				'해운대구'];
			break;
		}
		case "울산" : {
			arr=['중구',	'남구', '동구', '북구', '울주군'];
			break;
		}
		case "세종" : {
			arr=['세종시'];
			break;
		}
		case "경기" : {
			arr=['가평군', '고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시',
				'안산시', '안성시', '안양시', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시',
				'포천시', '하남시', '화성시'];
			break;
		}
		case "강원" : {
			arr=['강릉시', '고성군', '동해시', '삼척시', '속초시', '양구군', '양양군', '영월군', '원주시', '인제군', '정선군', '철원군', '춘천시', '태백시', 
				'평창군', '홍천군', '화천군', '횡성군'];
			break;
		}
		case "충북" : {
			arr=['괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '제천시', '진천군', '청원군', '청주시', '충주시', '증평군'];
			break;
		}
		case "충남" : {
			arr=['공주시', '금산군', '논산시', '당진시', '보령시', '부여군', '서산시', '서천군', '아산시', '예찬군', '천안시', '청양군', '태안군', '홍성군', 
				'계룡시'];
			break;
		}
		case "경북" : {
			arr=['경산시', '경주시', '고령군', '구미시', '김천시', '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', 
				'예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군', '포항시'];
			break;
		}
		case "경남" : {
			arr=['거제시', '거창군', '고성군', '김해시', '남해군', '마산시', '밀양시', '사천시', '산청군', '양산시', '의령군', '진주시', '진해시', '창녕군', 
				'창원시', '통영시', '하동군', '함안군', '함양군', '합천군'];
			break;
		}
		case "전북" : {
			arr=['고창군', '군산시', '김제시', '남원시', '무주군', '부안군', '순창군', '완주군', '익산시', '임실군', '장수군', '전주시', '정읍시', '진안군'];
			break;
		}
		case "전남" : {
			arr=['강진군', '고흥군', '곡성군', '광양시', '구례군', '나주시', '담양군', '목포시', '무안군', '보성군', '순천시', '신안군', '여수시', '영광군', 
				'영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'];
			break;
		}
		case "제주" : {
			arr=['남제주군', '북제주군', '서귀포시', '제주시'];
			break;
		}
	}

	if(arr!=null) {
		$(this).children('.select').remove();
		for(let s of arr) {
			let opt=document.createElement('option');
			opt.text=s;
			opt.value=s;
			sigungu.append(opt);
		}
	}
});
</script>
</body>
</html>


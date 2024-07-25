<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
*	{
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
}
 * @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
} 
.container {
	background-color: white;
}
.body-container {
	max-width: 800px;
}
</style>

<script type="text/javascript">
function companionSubmit() {
	const f=document.companionForm;
	
	let mainRegion=document.querySelectorAll('select[name=areaCode]');
	let area=mainRegion[0].value;
	
	if(area=='선택') {
		$('#alertModal .modal-title').text('지역을 선택해주세요');
		mainRegion[0].focus();
		return;
	}

	if(mainRegion.length>1) {
		for(let s of mainRegion) {
			if(area!=s.value) {
				$('#alertModal .modal-title').text('동일한 지역을 선택해주세요');
				s.focus();
				return;
			}
			area=s.value;
		}
	}
	
	if(f.sdate.value.trim()=='') {
		$('#alertModal .modal-title').text('출발일을 선택해주세요');
		f.sdate.focus();
		return;
	}
	
	if(f.edate.value.trim()=='') {
		$('#alertModal .modal-title').text('종료일을 선택해주세요');
		f.edate.focus();
		return;
	}
	
	const sdate=new Date(f.sdate.value);
	const edate=new Date(f.edate.value);
	const ndate=new Date();
	
	if(sdate<ndate) {
		$('#alertModal .modal-title').text('출발일은 오늘 이전일 수 없습니다');
		f.sdate.focus();
		return;
	}
	
	if(edate<sdate) {
		$('#alertModal .modal-title').text('종료일은 출발일 이전일 수 없습니다');
		f.edate.focus();
		return;
	}
	
	if(f.theme.value=='선택') {
		$('#alertModal .modal-title').text('카테고리를 선택해주세요');
		f.theme.focus();
		return;
	}
	
	if(f.age.value=='') {
		$('#alertModal .modal-title').text('연령대를 선택해주세요');
		f.age.focus();
		return;
	}
	
	if(f.gender.value=='') {
		$('#alertModal .modal-title').text('성별을 선택해주세요');
		f.gender.focus();
		return;
	}
	
	if(f.estimate_cost.value=='') {
		$('#alertModal .modal-title').text('예상 비용을 입력해주세요');
		f.estimate_cost.focus();
		return;
	}

	if(f.estimate_cost.value<0) {
		$('#alertModal .modal-title').text('예상 비용은 0 미만일 수 없습니다');
		f.estimate_cost.focus();
		return;
	}

	if(f.subject.value.trim()=='') {
		$('#alertModal .modal-title').text('제목을 입력홰주세요');
		f.subject.focus();
		return;
	}
	
	if(f.content.value.trim()=='') {
		$('#alertModal .modal-title').text('내용을 입력해주세요');
		f.content.focus();
		return;
	}
	
	$('#alertModal').html('');

	f.submit();
}

$(function(){
	$('#cntSub').click(function(){
		let cnt=$('#cntPeople').text();
		if(cnt==1) {
			alert('최대 인원은 1명 이상이어야 합니다.');
			return;
		}
		$('#cntPeople').text(cnt-1);
		const f=document.companionForm;
		f.total_people.value=$('#cntPeople').text();
	});
	
	$('#cntAdd').click(function(){
		let cnt=$('#cntPeople').text();
		if(cnt==20) {
			alert('최대 인원은 20명 이하여야 합니다.');
			return;
		}
		$('#cntPeople').text(1+Number(cnt));
		const f=document.companionForm;
		f.total_people.value=$('#cntPeople').text();
	});
	
	$(document).on("change", "select[name=areaCode]", function(){
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
	
	$('.addRegion').click(function(){
		var newArea = $('.selectArea').first().clone();
		$('.addRegion').before(newArea);
	});
});

</script>

<div class="container">
	<div class="body-container">
		<div class="body-title">
	    	<h3>동행 구인 작성</h3>
			<form name="companionForm" action="${pageContext.request.contextPath}/companion/${mode}" method="post" enctype="multipart/form-data">
				<div class="accordion" id="accordionPanelsStayOpenExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
				        지역을 선택하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
				      <div class="accordion-body">
				      	<div class="selectArea">
							<select name="areaCode">
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
							<select name="sigunguCode">
								<option value="선택">선택</option>
							</select>
						</div>
						<button type="button" class="addRegion btn btn-outline-secondary">지역 추가</button>
				      </div>
				      </div>
				    </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
				        날짜를 선택하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
				      <div class="accordion-body">
							시작 날짜<input type="date" name="sdate" value="${dto.sdate}">
							종료 날짜<input type="date" name="edate" value="${dto.edate}">
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
				        카테고리를 선택하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
				      <div class="accordion-body">
				      	<select name="theme">
								<option selected>선택</option>
								<option>맛집/카페</option>
								<option>같이 여행</option>
								<option>술/친목</option>
								<option>액티비티/투어</option>
								<option>전시회/공연</option>
								<option>기타</option>
						</select>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
				        성별을 선택하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse">
				      <div class="accordion-body">
				      	<input type="radio" name="gender" value="male">남자
						<input type="radio" name="gender" value="female">여자
						<input type="radio" name="gender" value="all">모두
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
				        연령대를 선택하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse">
				      <div class="accordion-body">
				      	<input type="radio" name="age" value="all">모두
						<input type="radio" name="age" value="10">10대
						<input type="radio" name="age" value="20">20대
						<input type="radio" name="age" value="30">30대
						<input type="radio" name="age" value="40">40대
						<input type="radio" name="age" value="50">50대
						<input type="radio" name="age" value="60">60대 이상
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSix" aria-expanded="false" aria-controls="panelsStayOpen-collapseSix">
				      	최대 인원 수를 입력하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseSix" class="accordion-collapse collapse">
				      <div class="accordion-body">
				      	<button id="cntSub" type="button" class="btn btn-outline-secondary">-</button>
				      	<span id="cntPeople">${dto.total_people==null?1:dto.total_people}</span>
				      	<button id="cntAdd" type="button" class="btn btn-outline-secondary">+</button>
				      	<input name="total_people" type="hidden" value="${dto.total_people==null?1:dto.total_people}">
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSeven" aria-expanded="false" aria-controls="panelsStayOpen-collapseSeven">
				      	예상 경비를 입력하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseSeven" class="accordion-collapse collapse">
				      <div class="accordion-body">
				      	<input type="text" name="estimate_cost" value="${dto.estimate_cost}">
				      </div>
				    </div>
				  </div>
				<div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseEight" aria-expanded="false" aria-controls="panelsStayOpen-collapseEight">
				      	제목을 입력하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseEight" class="accordion-collapse collapse">
				      <div class="accordion-body">
				      	<input type="text" name="subject" value="${dto.subject}">
				      </div>
				    </div>
				  </div>
				<div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseNine" aria-expanded="false" aria-controls="panelsStayOpen-collapseNine">
				      	내용을 입력하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseNine" class="accordion-collapse collapse">
				      <div class="accordion-body">
				      	<textarea rows="" cols="" name="content">${dto.content}</textarea>
				      </div>
				    </div>
				  </div>
				<div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTen" aria-expanded="false" aria-controls="panelsStayOpen-collapseTen">
				      	이미지를 선택하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseTen" class="accordion-collapse collapse">
				      <div class="accordion-body">
				      	<input type="file" name="imgFiles" accept="image/*" multiple>
				      </div>
				    </div>
				  </div>
				</div>
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#alertModal" onclick="companionSubmit();">${mode=='update'?'수정완료':'등록하기'}</button>
							<button type="reset" class="btn btn-outline-secondary">다시입력</button>
							<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/companion/list';">${mode=='update'?'수정취소':'등록취소'}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="modal fade" id="alertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</div>
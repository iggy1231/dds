<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">
.body-main {
	max-width: 900px;
	margin: 0 auto;
}

.rank-plus, .rank-minus {
	cursor: pointer;
	padding: 7px;
	border: 1px solid #ddd;
	border-radius: 5px;
}
.rank-plus:hover, .rank-minus:hover {
	color: blue;
}

.span-rank {
	display: inline-block; width: 45px;
}

.winnerList-container {
	display: grid;
	grid-gap: 5px;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
}

.winnerList-container .item {
   border: 1px solid #333;
   border-radius: 3px;
   padding: 5px;
   text-align: center;
}

.btn {
	margin: 5px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

.button-container {
	display: flex;
	justify-content: space-between;
}
</style>

<script type="text/javascript">
function deleteOk() {
	let query = 'num=${dto.num}&${query}';
	let url = '${pageContext.request.contextPath}/admin/eventManage/${category}/delete?' + query;

	if(confirm('위 자료를 삭제 하시겠습니까 ? ')) {
		location.href = url;
	}
}

$(function(){
	$('#tab-${category}').addClass('active');

	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/admin/eventManage/'+category+'/list';
	});
});
</script>

<div class="body-container">
    <div class="body-title">
		<h2><i class="fa-regular fa-calendar"></i> 이벤트 </h2>
    </div>
    
    <div class="body-main">
		<div>
			<ul class="tabs">
				<li id="tab-all" data-category="all">전체 이벤트</li>
				<li id="tab-progress" data-category="progress">진행중인 이벤트</li>
				<li id="tab-winner" data-category="winner">당첨자 발표</li>
				<li id="tab-ended" data-category="ended">종료된 이벤트</li>
				<li id="tab-upcoming" data-category="upcoming">진행 예정인 이벤트</li>
			</ul>
		</div>
		<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
			<table class="table table-border table-article">
				<thead>
					<tr>
						<th colspan="2" align="center">
							${dto.title}
						</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%" align="left">
							작성자 : ${dto.userName}
						</td>
						<td width="50%" align="right">
							조회 / 출력여부 : ${dto.hitCount} / ${dto.showEvent == 1 ? "표시" : "숨김" }
						</td>
					</tr>
	
					<tr>
						<td width="50%" align="left">
							이벤트 기간 : ${dto.startDate} ~ ${dto.endDate} 
						</td>
						<td width="50%" align="right">
							응모한 인원 : ${dto.winnerNumber == 0 ? "-" : listEventTakers.size()}
						</td>
					</tr>
					
					<c:if test="${dto.winnerNumber != 0}">
						<tr>
							<td width="50%" align="left">
								발표일자 : ${dto.winningDate}
							</td>
							<td width="50%" align="right">
								<c:choose>
									<c:when test="${category == 'winner' || category == 'ended'}">
										당첨할 인원 / 당첨 인원 : ${dto.winnerNumber} / ${listEventWinner.size()}명
									</c:when>
									<c:otherwise>
										당첨할 인원 : ${dto.winnerNumber}
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:if>
					
					<tr style="border-bottom: none;">
						<td colspan="2" valign="top" height="200">
							${dto.content}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<c:if test="${listEventWinner.size() == 0 && (category == 'winner' || category == 'ended')}">
								<button type="button" class="btn btnEventWinnerInsert">이벤트 당첨자 발표</button>		
							</c:if>
							<c:if test="${ listEventWinner.size() != 0 && (category == 'winner' || category == 'ended') }">
								<button type="button" class="btn btnEventWinnerList">이벤트 당첨자 확인</button>		
							</c:if>								
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							이전글 :
							<c:if test="${not empty prevDto}">
								<a href="${pageContext.request.contextPath}/admin/eventManage/${category}/article?${query}&num=${prevDto.num}">${prevDto.title}</a>
							</c:if>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							다음글 :
							<c:if test="${not empty nextDto}">
								<a href="${pageContext.request.contextPath}/admin/eventManage/${category}/article?${query}&num=${nextDto.num}">${nextDto.title}</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
				
			<div class="button-container">
				<div>
					<c:choose>
						<c:when test="${sessionScope.member.user_num == dto.user_num}">
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/update?num=${dto.num}&page=${page}';">수정</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn" disabled>수정</button>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${listEventTakers.size() != 0}">
							<button type="button" class="btn" disabled>삭제</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn" onclick="deleteOk();">삭제</button>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div>
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list?${query}';">리스트</button>
				</div>
			</div>
		</div>		
	</div>
</div>

<script type="text/javascript">
$(function(){
	// 이벤트 당첨자 발표
	$('.btnEventWinnerInsert').click(function(){
		$('#event-WinnerInsertdialog').dialog({
			  modal: true,
			  minHeight: 100,
			  maxHeight: 450,
			  width: 550,
			  title: '이벤트 당첨자 발표',
			  close: function(event, ui) {
				   $(this).dialog("destroy"); // 이전 대화상자가 남아 있으므로 필요
			  }
		  });
	});
	
	$('form input[name=winEvent]').click(function(){
		const $tb = $(this).closest('tbody');
		let winEvent = $(this).val();
		
		if(winEvent === '1') {
			$('form .rank-numbers').remove();
		} else {
			let out = '<tr class="rank-numbers">';
			out += '<td valign="top" style="padding-top:12px;">순위별인원</td>';
			out += '<td>';
			out += '  <p>';
			out += '    <span class="span-rank">1등 : </span>';
			out += '    <input type="hidden" name="rankNum" value="1">';
			out += '    <input type="text" name="rankCount" class="form-control" style="width:100px;">&nbsp;';
			out += '    <i class="fa-solid fa-plus rank-plus"></i>&nbsp;';
			out += '    <i class="fa-solid fa-minus rank-minus"></i>';
			out += '  </p>';
			out += '</td>';
			out += '</tr>';
			
			$tb.append(out);
		}
	});
	
	$('#event-WinnerInsertdialog').on('click', '.rank-plus', function(){
		let $td = $(this).closest('td');
		let $p = $(this).closest('p');
		$p.clone(true).appendTo($td);
		$(".rank-numbers p").last().find('input[name=rankCount]').val('');
		
		rankCalc();
	});
	
	$('#event-WinnerInsertdialog').on('click', '.rank-minus', function(){
		let $minus = $(this);
		let $td = $(this).closest('td');
		
		if($td.find('p').length === 1) {
			return false;
		}
		
		$minus.closest('p').remove();
		
		rankCalc();
	});

	function rankCalc() {
		let rank = 0;

		$('.rank-numbers p').each(function(){
			let $span = $(this).find('span');
			let $rankEL = $(this).find('input[name=rankNum]');
			
			rank++;
			$span.text(rank+"등 : ");
			$rankEL.val(rank);
		});
	}
	
	// 당첨자 발표버튼
	$(".btnSendWinner").click(function(){
		const f = document.winnerForm;
		
		let winEvent = $('form input[name=winEvent]:checked').val();
		if(winEvent === '2') {
			let winnerNumber = ${dto.winnerNumber};
			let tot = 0;
			
			let b = true;
			$('form input[name=rankCount]').each(function(){
				if(! /^[0-9]+$/.test($(this).val()) || parseInt($(this).val()) === 0) {
					b = false;
					return false;
				}
			});
			
			if(! b ) {
				alert('당첨 인원은 1이상의 숫자만 가능합니다.');
				return false;
			}
			
			$('form input[name=rankCount]').each(function(){
				tot += parseInt($(this).val());
			});
			
			if(winnerNumber !== tot) {
				alert('당첨 인원수의 합이 일치하지 않습니다.');
				return false;
			}
		}
		
		if(! confirm('이벤트 당첨을 진행하시겠습니까 ? ')) {
			return false;
		}
		
		f.action = '${pageContext.request.contextPath}/admin/eventManage/${category}/win';
		f.submit();
	});
	
});

$(function(){
	// 이벤트 당첨자 리스트
	$('.btnEventWinnerList').click(function(){
		$('#event-WinnerListdialog').dialog({
			  modal: true,
			  minHeight: 100,
			  maxHeight: 650,
			  width: 800,
			  title: '이벤트 당첨자 리스트',
			  close: function(event, ui) {
				   $(this).dialog("destroy"); // 이전 대화상자가 남아 있으므로 필요
			  }
		  });
	});
});
</script>

<!-- 이벤트 당첨자 발표 대화상자 -->
<c:if test="${listEventWinner.size() == 0 && category == 'winner'}">
	<div id="event-WinnerInsertdialog" style="display: none;">
		<form name="winnerForm" method="post">
			<table class="table table-border table-form">
				<tbody>
					<tr>
						<td>당첨할 인원</td>
						<td>${dto.winnerNumber}</td>
					</tr>
					<tr>
						<td>당첨 방식</td>
						<td>
							<input type="radio" name="winEvent" value="1" id="winEvent1" class="form-control" checked> <label for="winEvent1">순위 없음</label>
							&nbsp;&nbsp;
							<input type="radio" name="winEvent" value="2" id="winEvent2" class="form-control"> <label for="winEvent2">순위별 당첨</label>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table">
				<tr>
					<td align="center">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="winnerNumber" value="${dto.winnerNumber}">
						<input type="hidden" name="page" value="${page}">
						<button type="button" class="btn btnSendWinner">당첨자 발표</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</c:if>

<!-- 이벤트 당첨자 리스트 대화상자 -->
<c:if test="${listEventWinner.size() != 0}">
	<div id="event-WinnerListdialog" style="display: none;">
		<div class="winnerList-container">
			<c:forEach var="vo" items="${listEventWinner}" varStatus="status">
				<div class="item">
					<c:if test="${vo.rank != 0}">
						<span>
							${vo.rank}등 :
						</span>
					</c:if>
					<span style="font-weight: 500;">
						${vo.userName}(${vo.user_num})
					</span>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>

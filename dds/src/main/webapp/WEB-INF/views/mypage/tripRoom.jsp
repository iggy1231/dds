<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h5 class="mt-3">두둥! 여행가자!</h5>
<c:forEach var="list1" items="${currentTrips}">
<div class="row justify-content-center">
	<div class="col-md-12 wow fadeInUp" data-wow-delay="0.3s">
		<div class="property-item rounded overflow-hidden">
			<div class="flex-container">
				<div class="flex-item">
					<div>
						<img
							src="${list1.thumbnail}"
							class="img-fluid rounded" alt="숙소 이미지">
					</div>
				</div>

				<div class="flex-item">
					<div class="px-1 py-2 pb-3">
						<a class="d-block h4 mb-2 mt-2" href=""
							style="font-size: 24px; font-weight: 600;">${list1.subject}</a>
						<h6 class="display-10" style="color: #666565;">${list1.name} • ${list1.days}박</h6>

					</div>
				</div>

				<div class="flex-item"
					style="margin-left: auto; display: flex; align-items: top;">
					<a href="#" style="color: #18A8F1; font-size: 14px;">예약상세 &gt;</a>
				</div>
			</div>

			<div class="flex-item"
				style="display: flex; justify-content: space-evenly; margin-top: 10px;">
				<div>
					<span>체크인</span><br> <span>${list1.sdate}</span>
				</div>
				<div>
					<span>|</span>
				</div>
				<div>
					<span>체크아웃</span><br> <span>${list1.edate}</span>
				</div>

			</div>
			<!-- 예약 취소 버튼과 더보기 버튼을 오른쪽 하단에 배치 -->
			<div class="flex-item"
				style="display: flex; justify-content: flex-end; margin-top: 10px;">
				        <button class="btn btn-primary" style="margin-right: 5px;" onclick="cancelReservation(${list1.saleNum}, ${list1.detailNum}, ${list1.userNum})">예약 취소</button>
				<div class="dropdown">
					<button onclick="toggleDropdown()"
						class="btn btn-outline-secondary">...</button>
					<div id="myDropdown" class="dropdown-content">
						<a href="#">문의</a> <a href="#">리뷰</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</c:forEach>
<hr>
<h5 class="mt-3">두둥! 추억!</h5>
<c:forEach var="list2" items="${pastTrips}">
<div class="row justify-content-center">
	<div class="col-md-12 wow fadeInUp" data-wow-delay="0.3s">
		<div class="property-item rounded overflow-hidden">
			<div class="flex-container">
				<div class="flex-item">
					<div>
						<img
							src="${list2.thumbnail}"
							class="img-fluid rounded" alt="숙소 이미지">
					</div>
				</div>

				<div class="flex-item">
					<div class="px-1 py-2 pb-3">
						<a class="d-block h4 mb-2 mt-2" href=""
							style="font-size: 24px; font-weight: 600;">${list2.subject}</a>
						<h6 class="display-10" style="color: #666565;">${list2.name} • ${list2.days}박</h6>

					</div>
				</div>

				<div class="flex-item"
					style="margin-left: auto; display: flex; align-items: top;">
					<a href="#" style="color: #18A8F1; font-size: 14px;">예약상세 &gt;</a>
				</div>
			</div>

			<div class="flex-item"
				style="display: flex; justify-content: space-evenly; margin-top: 10px;">
				<div>
					<span>체크인</span><br> <span>${list2.sdate}</span>
				</div>
				<div>
					<span>|</span>
				</div>
				<div>
					<span>체크아웃</span><br> <span>${list2.edate}</span>
				</div>

			</div>
			<!-- 예약 취소 버튼과 더보기 버튼을 오른쪽 하단에 배치 -->
			<div class="flex-item"
				style="display: flex; justify-content: flex-end; margin-top: 10px;">
				<button class="btn btn-secondary" style="margin-right: 5px;">다시예약</button>
				<button class="btn btn-primary" style="margin-right: 5px;">리뷰작성</button>
				<div class="dropdown">
					<button onclick="toggleDropdown()"
						class="btn btn-outline-secondary">...</button>
					<div id="myDropdown" class="dropdown-content">
						<a href="#">문의</a> <a href="#">리뷰</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</c:forEach>


<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

                <!-- 투어 탭 콘텐츠 -->
                <div class="row">
                <c:forEach var="list2" items="list">
                    <div class="col-md-4">
                        <div class="wishlist-item position-relative">
                            <span class="badge-top-left">최저가보장제</span>
                            <i class="bi bi-heart-fill heart-icon"></i>
                            <img src="https://ppss.kr/wp-content/uploads/2023/02/1-2.jpeg" alt="Item Image">
                            <div class="wishlist-item-body">
                                <p class="wishlist-item-title">[순천] 봉화산에 가서 고라니 만나기 챌린지</p>
                                <div class="wishlist-item-rating">
                                    <i class="bi bi-star-fill"></i>
                                    <span>4.7 (4053)</span>
                                </div>
                                <p class="wishlist-item-price">150,000원</p>
                            </div>
                            <div class="wishlist-item-footer">
                                순천 • 봉화산 투어
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
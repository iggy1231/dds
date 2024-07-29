<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            	<!-- Hoverable Table rows -->
              <div class="card">
                <h5 class="card-header">회원관리</h5>
                <p> 회원수 : ${dataCount} </p>
                <div class="table-responsive text-nowrap">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>user_num</th>
                        <th>userId</th>
                        <th>nickname</th>
                        <th>reg_date</th>
                        <th>email</th>
                        <th>gender</th>
                        <th>tel</th>
                        <th>계정 상태</th>
                      </tr>
                    </thead>
                    
                    <c:forEach var="list" items="${list}">
                    <tbody class="table-border-bottom-0">
                      <tr>
                    <form name="banForm" action="${pageContext.request.contextPath}/admin/memberManage/ban" method="post">
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${list.user_num}</strong></td>
                        <td>${list.userId}</td>
                        <td>${list.nickName}</td>
                        <td>${list.reg_date}</td>
                        <td>${list.email }</td>
                        <td>${list.gender }</td>
                        <td>${list.tel }</td>
                        <td> 
                         <c:choose>
                    <c:when test="${list.enabled == 0}">
                        <span class="badge bg-warning me-1"><strong>탈 &nbsp;&nbsp;&nbsp;&nbsp; 퇴</strong></span>
                    </c:when>
                    <c:when test="${list.ban_state == 1}">
                        <span class="badge bg-danger me-1"><strong>차 &nbsp;&nbsp;&nbsp;&nbsp; 단</strong></span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge bg-success me-1"><strong>정 &nbsp;&nbsp;&nbsp;&nbsp; 상</strong></span>
                    </c:otherwise>
                </c:choose>
                </td>
                        <td>
               				    <select name="ban_date">
                                	<option value="1"> 1일 </option>
                                	<option value="7"> 7일 </option>
                                	<option value="9999"> 영구 </option>
                                </select>
                        </td>
                        <td>
                        	<input type="text" name="reason"> <input type="hidden" name="user_num" value="${list.user_num}">
                        </td>
                        <td> <button type="submit"> 차단</button> </td>
                    </form>
                      </tr>
                    </tbody>
                    </c:forEach>
                    
                    
                  </table>
                </div>
              </div>
              <!--/ Hoverable Table rows -->
            </div>
          </div>
          
          
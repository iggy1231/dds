<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
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
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i> Edit</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i> Delete</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                    </c:forEach>
                    
                    
                  </table>
                </div>
              </div>
            </div>
          </div>
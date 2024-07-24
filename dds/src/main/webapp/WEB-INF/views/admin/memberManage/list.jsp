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
                        <th>enabled</th>
                        <th>ban_state</th>
                        <th>num</th>
                        <th>현재상태</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>user_num</strong></td>
                        <td>userId</td>
                        <td>nickname</td>
                        <td>reg_date</td>
                        <td>email</td>
                        <td>gender</td>
                        <td>tel</td>
                        <td>enabled</td>
                        <td>ban_state</td>
                        <td>num</td>
                        <td><span class="badge bg-label-primary me-1">Active</span></td>
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
                  </table>
                </div>
              </div>
              <!--/ Hoverable Table rows -->
            </div>
          </div>
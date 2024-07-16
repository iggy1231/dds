<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            	<h4 class="py-3 mb-4">
            		<span class="text-muted fw-light">상품관리 /</span>
            		 상품 리스트
            	</h4>
            	<div class="card mb-4">
            		<div class="card-widget-separator-wrapper">
            			<div class="card-body card-widget-separator">
            				<div class="row gy-4 gy-sm-1">
            					<div class="col-sm-6 col-lg-3">
            						<div class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
            							<div>
            								<p class="mb-1">In-store Sales</p>
            								<h4 class="mb-1">$5,132.34</h4>
            								<p class="mb-0">
            									<span class="me-2">5k orders</span>
            									<span class="badge bg-label-success">+5.7%</span>
            								</p>
            							</div>
            							<span class="avatar me-sm-6">
            								<span class="avatar-initial rounded w-px-44 h-px-44">
            									<i class="bi bi-shop"></i>
            								</span>
            							</span>
            						</div>
            						<hr class="d-none d-sm-block d-lg-none me-6">
            					</div>
            					<div class="col-sm-6 col-lg-3">
            						<div class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-4 pb-sm-0">
            							<div>
            								<p class="mb-1">Website Sales</p>
            								<h4 class="mb-1">$674,347.12</h4>
            								<p class="mb-0">
            									<span class="me-2">21k orders</span>
            									<span class="badge bg-label-success">+12.4%</span>
            								</p>
            							</div>
            							<span class="avatar p-2 me-lg-6">
            								<span class="avatar-initial rounded w-px-44 h-px-44">
            									<i class="bi bi-shop"></i>
            								</span>
            							</span>
            						</div>
            						<hr class="d-none d-sm-block d-lg-none">
            					</div>
            					<div class="col-sm-6 col-lg-3">
            						<div class="d-flex justify-content-between align-items-start border-end pb-4 pb-sm-0 card-widget-3">
            							<div>
            								<p class="mb-1">Discount</p>
            								<h4 class="mb-1">$14,132.34</h4>
            								<p class="mb-0">
            									<span class="me-2">6k orders</span>
            									<span class="badge bg-label-success">+5.7%</span>
            								</p>
            							</div>
            							<span class="avatar p-2 me-sm-6">
            								<span class="avatar-initial rounded w-px-44 h-px-44">
            									<i class="bi bi-shop"></i>
            								</span>
            							</span>
            						</div>
            					</div>
            					<div class="col-sm-6 col-lg-3">
            						<div class="d-flex justify-content-between align-items-start">
            							<div>
            								<p class="mb-1">Affiliate</p>
            								<h4 class="mb-1">$8,132.34</h4>
            								<p class="mb-0">
            									<span class="me-2">150 orders</span>
            									<span class="badge bg-label-danger">-3.5%</span>
            								</p>
            							</div>
            							<span class="avatar p-2">
            								<span class="avatar-initial rounded w-px-44 h-px-44">
            									<i class="bi bi-shop"></i>
            								</span>
            							</span>
            						</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            	<div class="card">
            		<div class="card-header">
            			<h5 class="card-title">Filter</h5>
            			<div class="d-flex justify-content-between align-items-center row pt-4 gap-6 gap-md-0 g-md-6">
            				<div class="col-md-4 product_status">
            					<select id="ProductStatus" class="form-select text-capitalize">
            						<option value>Status</option>
            						<option value="Scheduled">Scheduled</option>
            						<option value="Publish">Publish</option>
            						<option value="Inactive">Inactive</option>
            					</select>
            				</div>
            				<div class="col-md-4 product_category">
            					<select id="ProductCategory" class="form-select text-capitalize">
            						<option value>Category</option>
            						<option value="Room">숙소</option>
            						<option value="Tour">투어</option>
            					</select>
            				</div>
            				<div class="col-md-4 product_stock">
            					<select id="ProductStock" class="form-select text-capitalize">
            						<option value>Stock</option>
            						<option value="Room">Room</option>
            						<option value="Tour">Tour</option>
            					</select>
            				</div>
            			</div>
            		</div>
            		<div class="card-datatable table-responsive">
            			<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
            				<div class="card-header d-flex border-top rounded-0 flex-wrap py-0 flex-column flex-md-row align-items-start">
            					<div class="me-5 ms-n4 pe-5 mb-n6 mb-md-0">
            						<div id="DataTables_Table_0_filter" class="dataTables_filter">
            							<label>
            								<input type="search" class="form-control" placeholder="Search Product" aria-controls="DataTables_Table_0">
            							</label>
            						</div>
            					</div>
            					<div class="d-flex justify-content-start justify-content-md-end align-items-baseline">
            						<div class="dt-action-buttons d-flex flex-column align-items-start align-items-sm-center justify-content-sm-center pt-0 gap-sm-4 gap-sm-0 flex-sm-row">
            							<div class="dataTables_length mx-n2" id="DataTables_Table_0_length">
            								<label>
            									<select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-select">
            										<option value="7">7</option>
            										<option value="10">10</option>
            										<option value="20">20</option>
            										<option value="50">50</option>
            										<option value="70">70</option>
            										<option value="100">100</option>
            									</select>
            								</label>
            							</div>
            							<div class="dt-buttons btn-group flex-wrap d-flex mb-6 mb-sm-0">
            								<div class="btn-group">
            									<button class="btn btn-secondary buttons-collection dropdown-toggle btn-label-secondary me-4" tabindex="0" aria-controls="DataTables_Table_0" type="button" aria-haspopup="dialog" aria-expanded="false">
            										<span>
            											<i class="bx bx-export me-2 bx-xs"></i>
            											Export
            										</span>
            									</button>
            									<div class="dt-button-background" style></div>
            									<div class="dropdown-menu dt-button-collection" aria-model="true" role="dialog" style="display: block; top: 184.832px; left: 24px;">
            										<div role="menu">
            											<a class="dt-button dropdown-item buttons-print" tabindex="0" aria-controls="DataTables_Table_0" href="#">
            												<span>
            													<i class="bx bx-printer me-2">
            													</i>
            													Print
            												</span>
            											</a>
            											<a class="dt-button dropdown-item buttons-csv buttons-html5 " tabindex="0" aria-controls="DataTables_Table_0" href="#">
            												<span>
            													<i class="bx bx-file me-2">
            													</i>
            													Csv
            												</span>
            											</a>
            											<a class="dt-button dropdown-item buttons-excel buttons-html5 " tabindex="0" aria-controls="DataTables_Table_0" href="#">
            												<span>
            													<i class="bx bx-file-export me-2">
            													</i>
            													Excel
            												</span>
            											</a>
            											<a class="dt-button dropdown-item buttons-excel buttons-html5 " tabindex="0" aria-controls="DataTables_Table_0" href="#">
            												<span>
            													<i class="bx bx-file-pdf me-2">
            													</i>
            													Pdf
            												</span>
            											</a>
            											<a class="dt-button dropdown-item buttons-copy buttons-html5 " tabindex="0" aria-controls="DataTables_Table_0" href="#">
            												<span>
            													<i class="bx bx-copy me-2">
            													</i>
            													Copy
            												</span>
            											</a>
            										</div>
            									</div>
            								</div>
            								<button class="btn btn-secondary add-new btn-primary" tabindex="0" aria-controls=DataTables_Table_0" type="button">
            									<span>
            										<i class="bx bx-plus me-0 me-sm-1 bx-xs"></i>
            										<span class="d-done d-sm-inline-block">상품 추가</span>
            									</span>
            								</button>
            							</div>
            						</div>
            					</div>
            				</div>
            				<table class="datatables-products table dataTable no-footer dtr-column collapsed" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" style="width: 398px;">
            					<thead class="border-top">
            						<tr>
            							<th class="control sorting_disabled" rowspan="1" colspan="1" style="width: 14px;" aria-label></th>
            							<th class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all dtr-hidden" rowspan="1" colspan="1" style="width: 0px; display: none;" data-col="1" aria-label>
            								<input type="checkbox" class="form-check-input">
            							</th>
            							<th class="sorting sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 433px;" aria-label="product: activate to sort column descending" aria-sort="ascending">
            							product
            							</th>
            							<th class="sorting dtr-hidden" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 137px; display:none;" aria-label="category:activate to sort column ascending">
            							category
            							</th>
            							<th class="sorting dtr-hidden" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 55px; display:none;" aria-label="stock">
            							stock
            							</th>
            							<th class="sorting dtr-hidden" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 0px; display:none;" aria-label="sku: activate to sort column ascending">
            							sku
            							</th>
            							<th class="sorting dtr-hidden" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 0px; display:none;" aria-label="price: activate to sort column ascending">
            							price
            							</th>
            							<th class="sorting dtr-hidden" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 36px; display:none;" aria-label="qty: activate to sort column ascending">
            							qty
            							</th>
            							<th class="sorting dtr-hidden" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 36px; display:none;" aria-label="status: activate to sort column ascending">
            							status
            							</th>
            							<th class="sorting_disabled dtr-hidden" rowspan="1" colspan="1" style="width: 0px; display:none;" aria-label="Actions">
            							Actions
            							</th>
            						</tr>
            					</thead>
            					<tbody>
            						<tr class="odd parent">
            							<td class="control" tabindex="0" style></td>
            							<td class="dt-checkboxes-cell dtr-hidden" style="display:none;">
            								<input type="checkbox" class="dt-checkboxes form-check-input">
            							</td>
            							<td class="sorting_1 dtr-hidden" style="display: none;">
            								<div class="d-flex justify-content-start align-items-center product-name">
            									<div class="avatar-wrapper">
            										<div class="avatar avatar me-4 rounded-2 bg-label-secondary">
            											<img src="" alt="Product-9" class="rounded">
            										</div>
            									</div>
            									<div class="d-flex flex-column">
            										<h6 class="text-nowrap mb-0">Air Jordan</h6>
            										<small class="text-truncate d-none d-sm-block">Air Jordan is a line of basketball shoes produced by Nike</small>
            									</div>
            								</div>
            							</td>
            						</tr>
            					</tbody>
            				</table>
            				<div class="row">
            					<div class="col-sm-12 col-md-6">
            						<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Displaying 1 to 7 of 100 entries</div>
            					</div>
            				</div>
            			</div>
            		
            		</div>
            	
            	</div>
            </div>
          </div>

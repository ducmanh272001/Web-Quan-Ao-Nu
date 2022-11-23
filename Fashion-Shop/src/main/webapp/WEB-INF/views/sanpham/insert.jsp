<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="stag" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<stag:url value="/" var="rootpath" />
<fmt:setLocale value="${lag}" />
<fmt:setBundle basename="language.mess_lag" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${rootpath}public/css/admin.css">
<link rel="stylesheet"
	href="${rootpath}public/plugin/dist/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${rootpath}public/plugin/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="${rootpath}public/css/fontawesome-free-6.1.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.menusanpham li i {
	padding-right: 15px;
}
</style>
</head>
<body>
	<header>
		<div class="header-admin d-flex">
			<div class="dropdown chonngonngu">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					data-toggle="dropdown" aria-expanded="false"
					style="text-transform: capitalize;">Lựa chọn ngôn ngữ</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${rootpath}Admin?lag=vi">Vietnamese</a>
					<a class="dropdown-item" href="${rootpath}Admin?lag=en">English</a>
					<a class="dropdown-item" href="${rootpath}Admin?lag=ja">Japan</a> <a
						class="dropdown-item" href="${rootpath}Admin?lag=ko">Korean</a> <a
						class="dropdown-item" href="${rootpath}Admin?lag=lo">Lào</a>
				</div>
			</div>
			<div class="top-headerdanhmuc">
				<a style="color: black;">Xin chào <b>${sessionScope.acc.fullName}</b>
				</a>
			</div>
			<div class="dangxuat">
				<a href="${rootpath}log-out">Đăng xuất</a>
			</div>
		</div>
		<div class="left-header w20 float">
			<ul class="menusanpham">
				<li><a class="a1" href=""><i class="fa-brands fa-sellcast"></i>
						Pos Bán Hàng</a></li>
				<li><a class="a2" href="${rootpath}Admin"><i
						class="fa-solid fa-house-user"></i> Trang Chủ</a></li>
				<li><a class="a3" href="${rootpath}list-hoa-don"><i
						class="fa-solid fa-cart-shopping"></i> Đơn hàng</a></li>
				<li><a class="a4" href="${rootpath}ql-san-pham"><i
						class="fa-brands fa-product-hunt"></i> Sản phẩm</a></li>
				<li><a class="a5" href="${rootpath}khach-hang"><i
						class="fa-solid fa-user-group"></i>Khách hàng</a></li>
				<li><a class="a6" href="${rootpath}tin-tuc"><i
						class="fa-regular fa-newspaper"></i> Tin tức</a></li>
				<li><a class="a7" href="${rootpath}danh-muc"><i
						class="fa-solid fa-boxes-stacked"></i>Danh mục</a></li>
				<li><a class="a8" href=""><i
						class="fa-brands fa-salesforce"></i> Doanh số</a></li>
				<li><a class="a9" href=""><i class="fa-solid fa-file-lines"></i>
						Thu chi</a></li>
				<li><a class="a10" href="loinhuan.html"><i
						class="fa-solid fa-dollar-sign"></i> Lợi nhuận</a></li>
				<li><a class="a11" href="thietlap.html"><i
						class="fa-solid fa-list-check"></i> Thiết lập</a></li>
			</ul>
		</div>
		<div class="right-header w80 float">
			<div class="form-body">
				<div class="row">
					<div class="form-holder">
						<div class="form-content">
							<div class="form-items">
								<h3>Thêm sản phẩm</h3>
								<p style="text-decoration: underline;color: red;">${tb.text}</p>
								<p style="text-decoration: underline; color: red;">${loinl}</p>
								<form style="padding: 0px 133px" action="${rootpath}them-san-phamok" method="post" enctype="multipart/form-data"
									class="requires-validation them-san-pham">
									<div class="col-md-12">
										<input class="form-control" type="text" name="tensp" value="${spok.name}"
											placeholder="Nhập tên sản phẩm.." required>
										<div class="valid-feedback">Username field is valid!</div>
										<div class="invalid-feedback">Username field cannot be
											blank!</div>
									</div>

									<div class="col-md-12" style="padding-bottom: 16px;">
										<input class="form-control" type="text" name="descripe" value="${spok.descripe}"
											placeholder="Nhập mô tả..." required>
										<div class="valid-feedback">Email field is valid!</div>
										<div class="invalid-feedback">Email field cannot be
											blank!</div>
									</div>
									<div class="col-md-12">
										<textarea name="information"  placeholder="Nhập thông tin........" 
											style="margin-top: 16px; margin-bottom: 0px;">${spok.information}</textarea>
									</div>
									<div class="col-md-12" style="padding-top: 16px;">
										<input class="form-control" type="number" step="1000"
											name="gianhap" value="${spok.price_import}" placeholder="Nhập giá nhập sản phẩm..."
											required>
									</div>
									<div class="col-md-12" style="padding-top: 16px;">
										<input class="form-control" type="number" step="1000"
											name="giacu" value="${spok.price_old}" placeholder="Nhập giá cũ sản phẩm..." required>
									</div>
									<div class="col-md-12" style="padding-top: 16px;">
										<input class="form-control" type="number" step="1000"
											name="giamoi" value="${spok.price_new}" placeholder="Nhập giá mới sản phẩm..." required>
									</div>
									<div class="col-md-12" style="padding-top: 16px;">
										<input class="form-control" type="number" step="1"
											name="nguoixem" value="${spok.sp_view}" placeholder="Người xem" required>
									</div>
									<div class="col-md-12">
										<select class="form-select mt-3" required name="loaisanpham">
											<c:forEach items="${lsp}" var="l">
												<option value="${l.id}">${l.loai_sp}</option>
											</c:forEach>
										</select>
										<div class="valid-feedback">You selected a position!</div>
										<div class="invalid-feedback">Please select a position!</div>
									</div>
									<div class="col-md-12">
										<select class="form-select mt-3" required name="nhanhieu">
											<c:forEach items="${list}" var="l">
												<option value="${l.id}">${l.name_brand}</option>
											</c:forEach>
										</select>
										<div class="valid-feedback">You selected a position!</div>
										<div class="invalid-feedback">Please select a position!</div>
									</div>
									<div class="col-md-12" style="padding-top: 16px;">
										<input type="file" name="uploadFile">
									</div>
									<div class="col-md-12 mt-3">
										<label class="mb-3 mr-1" for="gender">Nhập status: </label> <input
											type="radio" class="btn-check" value="true" name="status"
											id="male" autocomplete="off" required> <label
											class="btn btn-sm btn-outline-secondary" for="male">Đang
											hiển thị</label> <input type="radio" class="btn-check" value="false"
											name="status" id="female" autocomplete="off" required>
										<label class="btn btn-sm btn-outline-secondary" for="female">Đang
											ẩn</label>
										<div class="valid-feedback mv-up">You selected a gender!</div>
										<div class="invalid-feedback mv-up">Please select a
											gender!</div>
									</div>
									<div class="form-button mt-3">
										<button id="submit" type="submit" class="btn btn-primary"
											style="width: 100%;">Thêm sản phẩm</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
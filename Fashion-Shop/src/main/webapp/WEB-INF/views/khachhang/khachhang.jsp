<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="stag" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<stag:url value="/" var="rootpath" />
<fmt:setLocale value="${lag}"/>
<fmt:setBundle basename="language.mess_lag"/>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rootpath}public/css/admin.css">
    <link rel="stylesheet" href="plugin/dist/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="plugin/dist/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style type="text/css">
        .menusanpham li i{
           padding-right: 15px;
        }
    </style>
</head>
<body>
	<header>
		<div class="header-admin d-flex">
			   <div class="dropdown chonngonngu">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-toggle="dropdown" aria-expanded="false" style="text-transform: capitalize;">Lựa chọn ngôn ngữ</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${rootpath}Admin?lag=vi">Vietnamese</a> 
						<a class="dropdown-item" href="${rootpath}Admin?lag=en">English</a> 
						<a class="dropdown-item" href="${rootpath}Admin?lag=ja">Japan</a>
						<a class="dropdown-item" href="${rootpath}Admin?lag=ko">Korean</a>
						<a class="dropdown-item" href="${rootpath}Admin?lag=lo">Lào</a>
					</div>
				</div>
			<div class="top-headerdanhmuc">
				<a style="color: black;" >Xin chào <b>${sessionScope.acc.fullName}</b>
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
				<li><a class="a6" href="${rootpath}tin-tuc"><i class="fa-regular fa-newspaper"></i>
						Tin tức</a></li>
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
			<div class="right-headermanh">
				<div class="logo-ok">
				<div class="right-header-danhsachsanpham w66 float">
					<h3>
					    Danh sách khách hàng
					</h3>
				</div>
				<div class="right-header-taosanpham w33 float">
					<ul style="margin-left: 65px">
						<li style="float: right;"><a href=""><i class="fa-solid fa-download"></i> Xuất
								exel</a></li>
					</ul>
				</div>
				</div>
			</div>
			<span>${xoatc}</span>
			<div class="bangsanpham cols">
				<table class="sanphamadmin">
					<tr>
						<th>Tên khách hàng</th>
						<th>Số điện thoại</th>
						<th>Địa chỉ</th>
						<th>Email</th>
						<th>Giới tính</th>
						<th>Trạng thái</th>
						<th>Sửa</th>
						<th>Xóa</th>
					</tr>
					<c:forEach items="${lok}" var="l">
						<tr>
							<td>${l.name}</td>
							<td title="${l.call}">${l.call}</td>
							<td title="${l.address}">${l.address}</td>
							<td title="${l.email}">${l.email}</td>
							<td>${l.gender ? 'Nam' : 'Nữ'}</td>
							<c:if test="${l.status == 1}">
							<td>Hoạt động</td>
							</c:if>
							<c:if test="${l.status == 0}">
							<td>Không hoạt động</td>
							</c:if>
							<td>
							 <a href="${rootpath}sua-khach-hang/${l.id}"><img style="width: 30px;height: 30px" src="${rootpath}public/img/pencil-icon.png"></a>
							</td>
							<td>
							<a href="${rootpath}delete-khach-hang/${l.id}"><img style="width: 30px;height: 30px" src="${rootpath}public/img/Delete-group-icon.png"></a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<ul class="sotrangadmin">
					<c:forEach begin="1" end="${Math.ceil(sl / 8)}" var="i">
						<li><a href="${rootpath}khach-hang?page=${i}">${i}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</header>
   <script src="https://code.jquery.com/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <script src="plugin/dist/owl.carousel.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="stag" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function xoaTc(tenXoa) {
		var xoaOk = confirm("Bạn có muốn xóa " + tenXoa
				+ " ra khỏi danh sách không")
		if (xoaOk) {
			return true;
		} else {
			return false;
		}
	}
</script>
<stag:url value="/" var="rootpath" />
<fmt:setLocale value="${lag}" />
<fmt:setBundle basename="language.mess_lag" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${rootpath}public/css/admin.css">
<link rel="stylesheet"
	href="plugin/dist/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="plugin/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
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
				<li><a class="a6" href=""><i
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
			<div class="right-headermanh">
				<div class="logo-ok">
					<div class="right-header-danhsachsanpham w66 float">
						<h3>${tintuc}</h3>
					</div>
					<div class="right-header-taosanpham w33 float">
						<ul>
							<li><a href="${rootpath}insert-tin-tuc"><i
									class="fa-solid fa-plus"></i>${title}</a></li>
							<li><a href=""><i class="fa-solid fa-download"></i> Xuất
									exel</a></li>
						</ul>
					</div>
				</div>
			</div>
			<span class="okclass">${oco}</span>
			<c:if test="${tctintuc != null}">
				<span
					style="display: flex; justify-content: center; text-decoration: underline; color: green; font-size: 20px; font-weight: bold;">${tctintuc}</span>
			</c:if>
			<c:if test="${tb.macode == 1}">
				<span
					style="display: flex; justify-content: center; text-decoration: underline; color: green; font-size: 20px; font-weight: bold;">${tb.text}</span>
			</c:if>
			<c:if test="${tb.macode == 0}">
				<span
					style="display: flex; justify-content: center; text-decoration: underline; color: red; font-size: 20px; font-weight: bold;">${tb.text}</span>
			</c:if>
			<div class="bangsanpham cols">
				<table class="sanphamadmin">
					<tr>
						<th>ID</th>
						<th>Tiêu đề</th>
						<th>Mô tả</th>
						<th>Nội dung</th>
						<th>Thuộc tính tin</th>
						<th>Ngày đăng</th>
						<th>Ảnh</th>
						<th>Trạng thái</th>
						<th>Sửa</th>
						<th>Xóa</th>
					</tr>
					<c:forEach items="${list}" var="ltim">
						<tr>
							<td>${ltim.id}</td>
							<td title="${ltim.title}">${ltim.title}</td>
							<td title="${ltim.descripe}">${ltim.descripe}</td>
							<td title="${ltim.content}">${ltim.content}</td>
							<td>${ltim.type_tin}</td>
							<td><fmt:formatDate value="${ltim.day_tin}"
									dateStyle="short" /></td>
							<td><img class="anhtintuc"
								src="${rootpath}public/img/${ltim.img}"></td>
							<td>${ltim.status}</td>
							<td><a href="${rootpath}search-tin-tuc/${ltim.id}"> <img
									src="${rootpath}public/img/edit-validated-icon.png">
							</a></td>
							<td><a href="${rootpath}delete-tin-tuc/${ltim.id}"> <img
									src="${rootpath}public/img/Close-2-icon.png">
							</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<ul class="sotrangadmin">
					<c:forEach begin="1" end="${Math.ceil(sl / 8)}" var="i">
						<li><a href="${rootpath}ql-san-pham?page=${i}">${i}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="footersanpham cols">
				<p>
					SL tin tức: <span style="font-size: 15px; font-weight: bold;">${sl}</span>
				</p>
			</div>
		</div>
	</header>
	<script src="https://code.jquery.com/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="plugin/dist/owl.carousel.min.js"></script>
</body>
</html>
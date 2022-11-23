<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="stag" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<stag:url value="/" var="rootpath" />
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>
			Xin chào <b>${sessionScope.acc.fullName}</b> <br> <b>Bạn đã
				thêm :</b><span class="successok">${tb.text}</span> <br> <span>${tb2}</span>
		</h1>
		<hr>
		<sform:form action="${rootpath}them-danhmuc-tc" method="post" modelAttribute="lsp">
		<span style="color: red;text-decoration: underline;">${tb.text}</span>
			<table class="" border="1">
				<caption>
					<h1>Thêm danh mục</h1>
				</caption>
				<tr>
					<th>Nhập tên danh mục:</th>
					<td><sform:input type="text" path="loai_sp"
							placeholder="Nhập tên danh mục..." maxlength="50" /></td>
				</tr>
				<tr>
				<tr>
					<th>Chọn trạng thái:</th>
					<td><sform:radiobutton path="status" value="1" />Đang hiển thị
						<sform:radiobutton path="status" value="0" />Đang ẩn</td>
				</tr>
				<tr>
					<td><input type="reset" value="Làm lại"></td>
					<td><input type="submit" value="Thêm danh mục"></td>
				</tr>
			</table>
		</sform:form>
	</div>
	<hr>
	<a href="${rootpath}danh-muc">Trở về</a>
</body>
</html>
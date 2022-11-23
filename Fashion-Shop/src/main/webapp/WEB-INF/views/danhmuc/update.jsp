<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="stag" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<stag:url value="/" var="rootpath" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<sform:form action="${rootpath}sua-danhmuc-tc" method="post"
			modelAttribute="lsp">
			<span style="color: red;text-decoration: underline;">${tb.text}</span>
			<table border="1">
			<caption>
			 <h1>Sửa danh mục</h1>
			</caption>
				<tr>
					<th>Id</th>
					<td>
					 <sform:input path="id" type="number" readonly="true"/>
					</td>
				</tr>
				<tr>
					<th>Tên danh mục</th>
					<td><sform:input path="loai_sp" type="text" /></td>
				</tr>
				<tr>
					<th>Trạng thái</th>
					<td><sform:radiobutton path="status" value="true" />Đang hiển thị
					 <sform:radiobutton path="status" value="false" />Không hiển thị
					</td>
				</tr>
				<tr>
				<td>
				 <input type="reset" value="Làm lại">
				</td>
				<td>
				 <input type="submit" value="Sửa danh mục">
				</td>
				</tr>
			</table>
		</sform:form>
	</div>
    <hr>
	<a href="${rootpath}danh-muc">Trở về</a>
</body>
</html>
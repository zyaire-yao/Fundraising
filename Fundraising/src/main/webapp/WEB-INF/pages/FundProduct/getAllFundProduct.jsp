<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>思思募募</title>
</head>
<body>
	<table border="1">
		<tr>
			<td width="120px">募資商品貨號:</td>
			<td width="120px">募資商品貨號:</td>
			<td width="120px">募資商品名稱:</td>
			<td width="120px">募資商品金額:</td>
			<td width="120px">募資商品狀態:</td>
			<td width="120px">照片:</td>
			<td width="40px">更改:</td>
		</tr>
	</table>

	<c:forEach items="${test}" var="b" varStatus="st">
		<form action="getUpdateFundProject" method="post">
			<input type="hidden" value="${b.fundProductId}" name="fundProductId">
			<table border="1">
				<tr>
					<td width="120px">${b.fundProductId}</td>
					<td width="120px">${b.fundProductItemNO}</td>
					<td width="120px">${b.fundProductName}</td>
					<td width="120px">${b.fundProductPrice}</td>
					<td width="120px">${b.fundProductStatus}</td>
					<td width="120px"><img width="100" height="100"
						src="${b.fundProductPic}"></td>
					<td width="40px"><input type="submit" value="更改"></td>
				</tr>
			</table>

		</form>
	</c:forEach>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商店訂單查詢系統</title>
</head>
<body>
	<input type="button" value="首頁"
		onclick="location.href='${pageContext.request.contextPath}'">

	<table border="1" >
		<tr align="center">
			<td>編號</td>
			<td>訂單日期</td>
			<td>收件人</td>
			<td>聯絡方式</td>
			<td>寄送地址</td>
			<td>訂單狀態</td>
			<td>狀態更改</td>
			<td>儲存</td>
		</tr>
		<c:forEach items="${orderList}" var="o" varStatus="ol">
			<form action="updateDelivery" method="post">
				<table >
					<tr align="left">
						<td>${ol.count }</td>
						<td><fmt:formatDate value="${o.orderDate}" type="both" /></td>
						<td>${o.orderName }</td>
						<td>${o.orderPhone }</td>
						<td>${o. orderAddress}</td>
						<td>${o. orderStatus}</td>
						<td><select name="status" id="status">
								<option value="">請選擇</option>
								<option value="prepare">備貨中</option>
								<option value="ship">已出貨</option>
						</select></td>
						<td><input type="hidden" value="${o.orderId}" name="orderId">
							<input type="submit" value="修改"></td>
					</tr>
				</table>
			</form>
		</c:forEach>
	</table>
	<h1 align="center">${noItemsOrders }</h1>
</body>
</html>
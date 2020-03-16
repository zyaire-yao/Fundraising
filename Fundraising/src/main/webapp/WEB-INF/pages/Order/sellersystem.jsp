<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>賣家查詢系統</title>

<script type="text/javascript">
	
</script>

<style type="text/css">
.tablestyle {
	border-collapse: collapse
}
</style>

</head>
<body>
	<table border="2" align="center" valign="center" class="tablestyle">
		<tr>
			<th>商品</th>
			<th>訂單編號</th>
			<th>買家</th>
			<th>寄送方式</th>
			<th>寄送地址</th>
			<th>訂單狀態</th>
		</tr>
		<c:forEach items="${ listStroe}" var="s" varStatus="st">
			<tr align="center">
				<td>${s.orderDetailName}</td>
				<td>${s.orderDetailId }</td>
				<td></td>
				<td>${s.orderDeliveryMethod }</td>
				<td></td>
				<td>${s.orderDeliveryStatus }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
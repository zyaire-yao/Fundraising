<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商店退貨審核系統</title>
</head>
<body>
	<input type="button" value="首頁"
		onclick="location.href='${pageContext.request.contextPath}'">

	<table border="1" align="center">
		<tr align="center">
			<td>編號</td>
			<td>商品名稱</td>
			<td>商品數量</td>
			<td>商品單價</td>
			<td>商品總額</td>
			<td>退貨狀態</td>
			<td>退貨原因</td>
			<td>退款方式</td>
			<td>退貨日期</td>
			<td>EDIT</td>
		</tr>
		<c:forEach items="${storeCheck }" var="sc" varStatus="sct">
			<form action="replyReturnStatus" method="post">
				<table border="1">
					<tr align="center">
						<td>${sct.count}</td>
						<td>${sc.productReturnDetailName}</td>
						<td><fmt:formatNumber
								value="${sc.productReturnDetailAmount }" pattern="#,###,###" /></td>
						<td><fmt:formatNumber value="${sc.productReturnDetailPrice }"
								pattern="#,###,###" /></td>
						<td><fmt:formatNumber value="${sc.productReturnTotal }"
								pattern="#,###,###" /></td>
						<td>${sc.productReturnStatus }</td>
						<td>${sc.productReturnReason }</td>
						<td>${sc.productReturnMethod }</td>
						<td><fmt:formatDate value="${sc.productReturnDate }"
								pattern="yyyy-MM-dd" /></td>
						<td><select name="returnSelect" id="returnSelect">
								<option>請選擇</option>
								<option value="yes">允許退貨</option>
								<option value="no">拒絕退貨</option>
						</select><input type="hidden" value="${sc.ordersDetail}"
							name="test">|<input type="submit" value="SUBMIT"></td>
					</tr>
				</table>
			</form>

		</c:forEach>
	</table>

</body>
</html>
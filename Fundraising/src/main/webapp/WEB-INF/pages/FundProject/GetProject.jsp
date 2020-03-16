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
	<form action="getFundProject" method="get"
		enctype="multipart/form-data">
		<input type="submit" value="提案查詢">
	</form>
	<table>
		<tr>
			<td>提案名稱:</td>
			<td>提案內容:</td>
			<td>提案金額:</td>
			<td>提案天數:</td>
			<!-- <td>提案檔案:</td> -->
			<td>提案狀態:</td>
		</tr>

		<c:forEach items="${test}" var="b" varStatus="st">
			<tr>
				
				<td><c:out value="${b.fundProjectTitle}" /></td>
				<td><c:out value="${b.fundProjectPf}" /></td>
				<td><c:out value="${b.fundProjectTotal}" /></td>
				<td><c:out value="${b.fundProjectDate}" /></td>
				<!-- <td><c:out value="${b.fundProjectProject}" /></td> -->
				<td><c:out value="${b.fundProjectStatus}" /></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
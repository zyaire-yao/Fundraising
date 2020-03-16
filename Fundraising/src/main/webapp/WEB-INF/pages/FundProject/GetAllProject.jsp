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
	<div>
		<table border="1">
			<tr>
				<td width="120px">提案名稱:</td>
				<td width="120px">提案內容:</td>
				<td width="120px">提案金額:</td>
				<td width="120px">提案天數:</td>
				<td width="120px">提案狀態:</td>
				<td width="40px">更改:</td>
				<td width="40px">下載:</td>
			</tr>
		</table>

		<c:forEach items="${test}" var="b" varStatus="st">
			<form action="getUpdateFundProject" method="get">
			<input type="hidden" value="${b.fundProjectId}" name="fundProjectId"> 
				<table style="float: left" border="1">
					<tr>
						<td width="120px"><c:out value="${b.fundProjectTitle}" /></td>
						<td width="120px"><c:out value="${b.fundProjectPf}" /></td>
						<td width="120px"><c:out value="${b.fundProjectTotal}" /></td>
						<td width="120px"><c:out value="${b.fundProjectDate}" /></td>
						<td width="120px"><c:out value="${b.fundProjectStatus}" /></td>
						<td width="40px"><input type="submit" value="更改"></td>
					</tr>
				</table>
			</form>
			<form action=downloadFile method="get">
				<input type="hidden" value="${b.fundProjectProject}"
					name="fundProjectProject">
				<table border="1">
					<tr>
						<td width="40px"><input type="submit" value="下載"></td>
					</tr>
				</table>
			</form>
		</c:forEach>
		<input type="button" value="首頁" onclick="location.href='${pageContext.request.contextPath}'"> 
	</div>

</body>
</html>
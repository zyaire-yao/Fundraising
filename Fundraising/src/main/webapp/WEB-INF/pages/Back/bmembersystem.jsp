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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript"
	src="http://www.pureexample.com/js/lib/jquery.ui.touch-punch.min.js"></script>

</head>
<!-- CSS -->
<style type="text/css">

#accordion {
	width: auto;
	margin: auto;
}

.accordion {
	width: auto;
	margin: auto;
}

.tablestyle {
	border-collapse: collapse;
	border-color: black;
}

.tr1 {
	background-color: orange;
	text-align: center;
}

.tablestyle tr td {
	width: a
}
table {
	border-collapse: collapse;
	width: 770px;
	table-layout: fixed;
}
td{

white-space:nowrap;
overflow:hidden; 
text-overflow:ellipsis; 
border:black solid 1px;

}
</style>
<body>

	   
	<script>
		$(function() {
			$("#accordion").accordion({
				//heightStyle : "fill",
				collapsible : true
			});
		});

		function check() {

			if (confirm("確定封鎖會員 ? ")) {
				alert("成功");
				return true;
			} else {
				return false;
			}
		}
	</script>

	<div align="center" valign="center">
		<h1>會員查詢系統</h1>

		<h1>
			<input type="button" value="查詢所有會員"
				onclick="location.href='getBMember'" />

		</h1>
	</div>

	<div class="accordion">

		<form action="updateStatus" method="post" onsubmit="return check()">

			<table border="1" class="tablestyle" align="center" valign="center">

				<tr class="tr1">
				<td>信箱</td>
				<td>密碼</td>
				<td>姓名</td>
				<td>綽號</td>
				<td>身份證字號</td>
				<td>生日</td>
				<td>性別</td>
				<td>行動電話</td>
				<td>電話</td>
				<td>照片</td>
				<td>狀態</td>
				<td>選項</td>
				</tr>


				<c:forEach items="${id}" var="b" varStatus="st">

					<c:if test="${st.count eq 1 || (st.count-1) % 11 eq 0}">
						<tr>
					</c:if>
					<td>${b.value}</td>
					<c:if test="${st.count % 11 eq 0 || st.count eq 11}">
						<td><input type="submit" value="封鎖會員"></td>
							</tr>
					</c:if>

				</c:forEach>

			</table>
		</form>
	</div>

</body>
</html>
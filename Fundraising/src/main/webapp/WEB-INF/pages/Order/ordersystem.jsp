<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客訂單查詢系統</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript"
	src="http://www.pureexample.com/js/lib/jquery.ui.touch-punch.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	text-align: center;
}

.tr1 {
	background-color: orange;
	text-align: center;
}

.tablestyle tr td {
	width: a
}
</style>
<body>

	   
	<script>
		// 		$(function() {
		// 			$("#accordion").accordion({
		// 				//heightStyle : "fill",
		// 				collapsible : true
		// 			});
		// 		});

		function check() {

			if (confirm("確定取消訂單 ? ")) {
				alert("期待您下次光臨");
				return true;
			} else {
				return false;
			}
		}

		// 		$('#buttonSubmit').click(function() {
		// 			$('#formSubmit').submit();
		// 		});

		// 		function buttonSubmit() {
		// 			document.getElementById("formSubmit").submit();
		// 			此""綁的是form的id"
		// 		}

		// 		同按鈕開關function
		// 		var isShow = false;
		// 		function change() {
		// 			if (!isShow) {
		// 				isShow = true;
		// 				document.getElementById('d1').style.display = '';
		// 				document.getElementById('a1').innerText = "隱藏xxx資料";
		// 			} else {
		// 				isShow = false;
		// 				document.getElementById('d1').style.display = 'none';
		// 				document.getElementById('a1').innerText = "檢視xxx資料";
		// 			}
		// 		}
	</script>

	<input type="button" value="首頁"
		onclick="location.href='${pageContext.request.contextPath}'">

	<div class="accordion">

		<table border="1" class="tablestyle" align="center" valign="center">
			<caption align="center">我的訂單</caption>
			<tr class="tr1">
				<td>編號</td>
				<td>商品名稱</td>
				<td>單價</td>
				<td>數量</td>
				<td>總金額</td>
				<td>配送方式</td>
				<td>貨運公司</td>
				<td>物流狀態</td>
				<td>我要退貨</td>

			</tr>
			<c:forEach items="${listOrderDetail}" var="od" varStatus="odd">
				<form action="itemReturnedSystem" method="post">
				<tr>
					<td>${odd.count}</td>
					<td>${od.orderDetailName }</td>
					<td><fmt:formatNumber value="${od.orderDetailPrice}"
							pattern="###,###,###" />元</td>
					<td><fmt:formatNumber value="${od.orderDetailAmount}"
							pattern="###,###,###" />件</td>
					<td><fmt:formatNumber
							value="${od.orderDetailPrice*od.orderDetailAmount}"
							pattern="###,###,###" />元</td>
					<td>${od.orderDeliveryMethod}</td>
					<td>${od.orderDeliveryName}</td>

					<td>${od.orderDeliveryStatus }</td>
					<td><input type="hidden" value="${od.orderDetailId}"
						name="itemOrderId"> <input type="submit" value="我要退貨"></td>

				</tr>

				</form>
			</c:forEach>
		</table>
		<h1 align="center">${noOrder }</h1>
	</div>



	<!-- 同按扭開關資料 -->
	<!-- 	TEST1 -->
	<!-- 	<br> -->
	<!-- 	<a id="a1" href="javascript:;" onclick="change()">檢視xxx資料</a> -->
	<!-- 	<br> -->
	<!-- 	<div id="d1" style="display: none"> -->
	<!-- 		TEST2<br> TEST3 -->
	<!-- 	</div> -->
	<!-- 	TEST4 -->
	<br>
</body>
</html>
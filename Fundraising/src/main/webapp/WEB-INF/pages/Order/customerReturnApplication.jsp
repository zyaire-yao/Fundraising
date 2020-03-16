<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退貨申請單</title>
<link href="${pageContext.request.contextPath}/css/form.css"
	rel="stylesheet">
	
	<style type="text/css">

		body{
			background-image: url("images/travel.png");
			background-repeat: no-repeat;
		}
		.items{
		font-size: 25px;
		}
		body input{
		font-size: 20px;
		padding-left: 5px;
		}
	</style>

</head>
<body>
	<div class="wrapper">
		<div class="contact-form	">
			<div class="title" style="font-size: 60px;letter-spacing: 5px;">退貨申請單</div>
			<form action="updateItemReturned" method="post" class="input-fields">
				<div class="items">
					<label class="label">商品名稱：</label> 
						<input type="text"	id="odItemName" name="odItemName" value="${odItemName}${errorOdItemName}" readonly>			
				</div>

				<div class="items">
					<label class="label">退貨單價： </label>
						<input type="text"	id="odItemPrice" name="odItemPrice" value="${odItemPrice}${errorOdItemPrice}"readonly>	
				</div>
				<div class="items">
					<label class="label">退貨數量：</label>  
						<input type="text"	id="odItemAmount" name="odItemAmount" value="${odItemAmount}${errorOdItemAmount}"readonly>				
				</div>
				<c:if test="${empty errorodItemPriceMultiplyodItemAmount}">
				<div class="items">
					<label class="label">退貨總額：</label> 
						<input type="text"	value="${odItemPrice*odItemAmount}" readonly>				
				</div>
				</c:if>
				<c:if test="${not empty errorodItemPriceMultiplyodItemAmount}">
				<div class="items">
					<label class="label">
						退貨總額： <input type="text"	value="${errorodItemPriceMultiplyodItemAmount}" readonly>
					</label>
				</div>
				</c:if>
				
				<div class="items">
					<label class="label">退款方式：</label>
					 <select name="returnMethod"	id="returnMethod" style="font-size: 20px">
						<option value="請選擇">請選擇</option>
						<option value="creditCar">信用卡</option>
					</select>
					
				</div>

				<div class="items">
					<label class="label">退貨原因：</label>
						 <select name="reason"id="reason" style="font-size: 20px"> 
						<option value="請選擇">請選擇</option>
						<option value="itemOld">商品損壞/老舊</option>
						<option value="itemUnbelieve">商品與實體不符</option>
						<option value="itemBuyWrong">商品購買錯誤</option>
					</select>
					
				</div>
				<div class="row ">
					<div align="center">
						<input type="hidden" value="${orderDetailId}${errorOrderDetailId}" name="orderDetailId" class="btn">
						<input type="submit" value="送出">
						<button  type="button" onclick="location.href='${pageContext.request.contextPath}'" style="font-size: 20px;">首頁</button>
					</div>
					<h3 style="color: red;">${error}</h3>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
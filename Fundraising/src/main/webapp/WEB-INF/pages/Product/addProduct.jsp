<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap-->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<meta charset="UTF-8">
<title>思思募募</title>
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet">
</head>
<style>
body {
	background-color: #f5f5f5;
}


@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<body>



	<form action="addProduct" method="post" enctype="multipart/form-data"
		class="form-signin">

		<div class="text-center mb-4">
			<!--     <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h1 class="h3 mb-3 font-weight-normal">上架商品</h1>
		</div>

		<div class="form-label-group">
			<input type="text" id="inputNO" class="form-control"
				placeholder="商品編號" name="productItemNO"> 
				<label  for="inputNO">商品編號</label>${errorIremNO1}${errorIremNO2}
		</div>

		<div class="form-label-group">
			<input type="text" id="inputname" class="form-control"
				placeholder="商品名稱" name="productName"> 
				<label  for="inputname">商品名稱</label>${errorName}
		</div>
		

		<div class="form-label-group">
			<input type="text" id="inputM" class="form-control"
				placeholder="商品價格" name="productPrice" value="0" size="10"
				onkeyup="value=value.replace(/[^\d]/g,'') "> 
				<label for="inputM">商品價格</label>${errorPrice}
		</div>

		<div class="form-label-group">
			<input type="text" id="inputS" class="form-control"
				placeholder="商品庫存" name="stockAmount" value="0" size="10"
				onkeyup="value=value.replace(/[^\d]/g,'') "> 
				<label for="inputS" >商品數量</label>${errorStock}
		</div>

		<div>
		<input type="file" class="form-control" name="file">${errorPic}${errorPicSize}
		</div>
		<div class="form-group">
				<label>商品簡介</label>${errorPf}
				<textarea class="form-control" style="height: 100px;width: 390px" name="productPf"></textarea>
				
		</div>
	    
	
		<div class="container  my-3">
			<div class="row">
				<div class="col-md-6">
					<button class="btn btn-lg btn-success btn-block" type="submit">送出</button>
				</div>
		

			<div class="col-md-6">
				<button class="btn btn-lg btn-warning btn-block" type="button"
					
					onclick="location.href='ProductEdit'" >上一頁</button>
			</div>
				</div>
		</div>

	</form>




</body>
</html>
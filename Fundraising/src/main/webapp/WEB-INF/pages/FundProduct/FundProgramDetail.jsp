<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.0/css/all.css"
	integrity="sha384-REHJTs1r2ErKBuJB0fCK99gCYsVjwxHrSU0N7I1zl9vZbggVJXRMsv/sLlOAGb4M"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Sriracha&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ProductDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<title>思思募募</title>
</head>
<style>
.btn {
	border-width: 2px;
}

.form-control {
	border-width: 2px;
}

.header-carousel-item {
	height: 450px;
}

.bg-cover {
	background-size: cover;
	background-position: center center;
}

.carousel-caption {
	background-color: rgba(0, 0, 0, .6); /* 用RGB 來調整   .6讓他有些透明度*/
}

@media ( min-width : 768px) {
	.text-md-dark {
		color: #333;
	}
}
</style>


<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src='${pageContext.request.contextPath}/images/HomePagePic/thumbs-up.svg'
				width="40px" height="30px" alt=""> 人客趕緊來
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#"
						onclick="location.href='${pageContext.request.contextPath}'">首頁
							<span class="sr-only">(current)</span>
					</a></li>
					<c:if test="${not empty sessionScope.memberSession}">
						<!-- 如果不為空 才顯示 -->
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="location.href='findMember'">會員專區</a></li>

						<c:if test="${empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<li class="nav-item"><a class="nav-link" href="#"
								onclick="location.href='registerStore'">註冊商家</a></li>
						</c:if>

						<c:if test="${not empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<li class="nav-item"><a class="nav-link" href="#"
								onclick="location.href='findStore'">查詢商家資料</a></li>
						</c:if>
					</c:if>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 商品 </a>

						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#" onclick="location.href='getAllFundProductForCustomer'">募資商品</a> <a
								class="dropdown-item" href="#"
								onclick="location.href='getAllProduct'">商品選購</a>
						</div></li>
				</ul>
				<form class="form-inline">


					<c:if test="${sessionScope.memberSession == null}">
						<!-- 如果不為空 才顯示 -->
						<a href="#" class="btn btn-outline-primary mr-1"
							onclick="location.href='loginSystem'">登入</a>
					</c:if>

					<c:if test="${sessionScope.memberSession != null}">
						<!-- 如果不為空 才顯示 -->
						<a href="#" class="btn btn-outline-primary mr-1"
							onclick="location.href='outSystem'">登出</a>
					</c:if>

					<a href="#" class="btn btn-primary"
						onclick="location.href='register'">註冊</a>

					<!-- -----會員頭貼-------- --> 
<c:if test="${not empty sessionScope.get('memberSession')}">
  <!-- 如果不為空 才顯示 -->
  <div  class="nav-link">
  <img onerror="nofind()"
   src="${sessionScope.get('memberSession').memberPic}"
   style="height: 29px; width: 29px; border-radius: 50%  ">
   </div>
        <div style="color: white;" >  ${sessionScope.get('memberSession').memberSname}</div>
  
 </c:if>
<!-- ------------------- -->	
				</form>
			</div>
		</div>
	</nav>
	<!-- ---- 導覽列----- -->
	<!-- ---- 商品明細----- -->
<div class="container">
<nav aria-label="breadcrumb">
  <ol class="breadcrumb bg-transparent pl-0" style="font-family: 'Sriracha', cursive;">
    <li class="breadcrumb-item"><a href="#" onclick="location.href='${pageContext.request.contextPath}'">首頁</a></li>
    <li class="breadcrumb-item active" aria-current="page">${fundProductDetail.fundProductName }</li>
  </ol>
</nav>
	<div class="row">
		<div class="col-md-8">
			<img src="${fundProductDetail.fundProductPic}"
								class="card-img-top" alt="">
		</div>


		<div class="col-md-4">
		<form action=""  >
		 <div class="sticky-center">
		 	<h2>${fundProductDetail.fundProductName }</h2>
   				
  				 <div class="d-flex justify-content-end align-items-end">
<!--   				 	<span class="text-muted">199</span> -->
  				 	<div class="h3 ml-auto mb-0 text-danger">
  				 		<small>募款達標金額NT$</small>
  				 		<strong>${fundProductDetail.fundProductPrice}</strong>
  				 	</div>
  				 </div>
  				 <div class="d-flex justify-content-end align-items-end">
  				 <div class="h3 ml-auto mb-0 text-danger">
  				 		<small>現在金額:</small>
  				 		<strong>30000</strong>
  				 	</div>
  				 	</div>
  				 	<div class="d-flex justify-content-end align-items-end">
  				 	<div class="h3 ml-auto mb-0 text-danger">
  				 		<small>贊助人數:</small>
  				 		<strong>50</strong>
  				 	</div>
  				 	</div>
  				 	<div class="d-flex justify-content-end align-items-end">
  				 	<div class="h3 ml-auto mb-0 text-danger">
  				 		<small>結束天數:</small>
  				 		<strong>10</strong>
  				 	</div>
  				 	</div>
  				
  				<hr>
  			<div class="input-group mr-3">
<!--   				<select name="counts" id="" class="form-control mr-1"> -->
<!--   					<option value="500">500</option> -->
<!--   					<option value="1000">1000</option> -->
<!--   					<option value="1500">1500</option> -->
<!--   				</select> -->
  				
  				
  				<input type="hidden" value="${fundProductDetail.fundProductPic}" name="fundProductPic">
  				<input type="hidden" value="${fundProductDetail.fundProductName}" name="fundProductName">
  				<input type="hidden" value="${fundProductDetail.fundProductPrice}" name="fundProductPrice">
  				<input type="hidden" value="${fundProductDetail.fundProductId}" name="fundProductId">
               
                  <p>${fundProductDetail.fundProductPf}</p>

  			</div>
  			收件人姓名:<input type="text" name="fundOrderName"><br/>
			收件地址:<input type="text"  name="fundOrderAddress"><br/>
			連絡電話:<input type="text" name="fundOrderPhone"><br/>
			<input type="submit" value="進行結帳">
		 </div>	 
		 </form>
		</div>
		
	</div>
</div>

	<!-- ---- 商品明細----- -->
	<!-- ---- 商家資料----- -->
<div class="container">
	
</div>
	<!-- ---- 商家資料----- -->
</body>
</html>
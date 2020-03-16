<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" integrity="sha384-REHJTs1r2ErKBuJB0fCK99gCYsVjwxHrSU0N7I1zl9vZbggVJXRMsv/sLlOAGb4M" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
<title>思思募募</title>
</head>
<style>
.jumbotron-bg {
	background-color: rgba(0, 0, 0, .6); /* 用RGB 來調整   .6讓他有些透明度*/
}


body {
background-image: url('${pageContext.request.contextPath}/images/storePic/background-2.jpg'); 
background-size: cover;
background-repeat: no-repeat;
font-family: 'Noto Sans TC', sans-serif;
}
</style>


<body>
	<!-- ---- 導覽列----- -->
	<nav class="navbar navbar-expand-lg navbar-dark" style="border-bottom: solid;">
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
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="location.href='findMember'">會員專區</a></li>
					<li class="nav-item"><c:if
							test="${empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<a class="nav-link" href="#"
								onclick="location.href='registerStore'">註冊商家</a>
						</c:if></li>
					<li class="nav-item"><c:if
							test="${not empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<a class="nav-link" href="#" onclick="location.href='findStore'">查詢商家資料</a>
						</c:if></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 商品 </a>

						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a
								class="dropdown-item" href="#"
								onclick="location.href='getAllProduct'">商品選購</a> 
						</div></li>
				</ul>
			</div>
			
			<!--  form  -->		
				<form class="form-inline">
	
					<c:if test="${sessionScope.memberSession == null}"><!-- 如果不為空 才顯示 -->
					<a href="#" class="btn btn-outline-primary mr-1" onclick="location.href='loginSystem'">登入</a> 
				   </c:if>
				   
				   <c:if test="${sessionScope.memberSession != null}"><!-- 如果不為空 才顯示 -->
					<a href="#" class="btn btn-outline-primary mr-1" onclick="location.href='outSystem'">登出</a> 
				   </c:if>
				   
				   <c:if test="${sessionScope.memberSession == null}"><!-- 如果不為空 才顯示 -->
				   <a href="#"   class="btn btn-primary"  onclick="location.href='register'">註冊</a>
				   </c:if>
				   
				<!-- -----會員頭貼-------- --> 
				<c:if test="${not empty sessionScope.get('memberSession')}">
				  <!-- 如果不為空 才顯示 -->
				  <div  class="nav-link">
				  <img onerror="nofind()"
				   src="${sessionScope.get('memberSession').memberPic}"
				   style="height: 29px; width: 29px; border-radius: 50%  ">
				   </div>
				        <div style="color: white; font-family: 'Acme', sans-serif;font-size:15px" >
				             
				              <i style="margin-left: 2px"></i> <i style="margin-left: 5px"></i> 
				         ${sessionScope.get('memberSession').memberSname}</div>
				 </c:if>
				<!-- ------------------- -->				   
				</form>
			<!-- 購物車裡面的數量(BUTTON內包含ICON ，數量 badge) -->
			<div class="dropdown ml-auto" >
				<button class="btn btn-sm btn-cart" data-toggle="dropdown"
					data-flip="false">
					<i class="fas fa-shopping-cart btn-cart text-light fa-2x" ></i> 
					
				</button>
				<div class="dropdown-menu dropdown-menu-right"
					style="min-width: 300px">
					<div class="px-4 py-3">
						<h6>已選擇商品</h6>
						<table class="table table-sm">
							<tbody>
								<tr>
									<td class="align-middle text-center">
										<!-- Delete購物車 --> <a herf="#removeModel" class="text-muted"
										data-toggle="dropdown"> <i class="fa fa-trash-alt"
											aria-hidden="true"></i>
									</a>
									</td>
									<td class="align-middle">金牌</td>
									<td class="align-middle">1件</td>
									<td class="align-middle text-right">$222</td>
								</tr>
							</tbody>
						</table>
						<a href="#" class="btn btn-primary btn-block" onclick="location.href='FindMemberShoppingCart'">付錢去</a>
					</div>
				</div>
			</div>
				
		</div>
	</nav>
	<!-- ---- 導覽列----- -->
	<!-- ---- 廣告大屏幕----- -->
	<div class="carousel-inner">
		<div
			class="jumbotron jumbotron-bg bg-cover carousel-item  d-flex justify-content-center "
			style="background-image: url('${pageContext.request.contextPath}/images/HomePagePic/item7.jpg')">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 font-weight-normal">Punny headline</h1>
				<p class="lead font-weight-normal">And an even wittier
					subheading to boot. Jumpstart your marketing efforts with this
					example based on Apple’s marketing pages.</p>
				<a class="btn btn-outline-secondary" href="#">Coming soon</a>
			</div>
		</div>
	</div>

	<!-- ---- 廣告大屏幕----- -->
	<!-- ---- 卡片排版----- -->
	<div class="col-md-10" style="margin:0 auto;">
		<div class="row">
			<c:forEach items="${AllFundProduct}" var="allFundProduct">
				<div  class="col-md-3 mb-4" style="opacity:0.9;">
					<form action="getFundProductDetail" method="get">
						<input type="hidden" value="${allFundProduct.fundProductId}" name="fundProductId">
						<div class="card text-center">
						
							<img src="${allFundProduct.fundProductPic}" class="card-img-top  header-carousel-item" style="object-fit:cover" alt="" width="100%" height="255px">
							
							<div class="card-body">
								<h5 class="card-title">${allFundProduct.fundProductName}</h5>
								<p class="card-text">${allFundProduct.fundProductPf}</p>
								<div class="progress">
  									<div class="progress-bar progress-bar-striped" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<input class="btn btn-outline-primary btn-lg btn-block"
									data-toggle="button" aria-pressed="false" type="submit"
									value="View">
							</div>
						</div>
					</form>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- ---- 卡片排版----- -->
</body>
</html>




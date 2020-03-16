<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>思思募募購物網</title>
</head>
<style>
#box {
	margin:0 auto;
	background:rgba(0,0,0,0.6);
	border-radius:1%;
	font-family: 'Noto Sans TC', sans-serif;
	padding-top: 10px;
	padding-bottom: 5px;
	width: 900px;
	margin-top: 10%;
}

.imgbg{	
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg4.jpg') no-repeat 0% 20%/ cover;
font-family: 'Noto Sans TC', sans-serif;
	}
.bgMsg {
	background-color: rgba(0,0,0,.6)
}
</style>


<body class="imgbg">

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src='${pageContext.request.contextPath}/images/HomePagePic/thumbs-up.svg'
				width="40px" height="30px" alt=""> 思思募募
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
		  </ol>
		</nav>
		<!-- --------------------------------------------------------- -->
<main class="page-content" >
			<form action="addFundProduct"  method="post" enctype="multipart/form-data">
				<div id="box" style="font-size: 18px">
					<div class="container"	style=" color: white; margin: 0 auto;">
						<div class="text-center mb-4">
							<h1 class=" mb-3">募資商品上架內容</h1>
						</div>								
						<div class="container">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>募資商品名稱 :</label> ${fundProject.fundProjectTitle}${getFundProduct.fundProductName}
									</div>
									<div class="form-group">
										<label>募資金額：</label>
										 <strong>NT$<fmt:formatNumber value="${fundProject.fundProjectTotal}${getFundProduct.fundProductPrice}" pattern="###,###,###,###"/></strong>
									</div>
									<div class="form-group">
										<label>結束天數:</label> <strong >${fundProject.fundProjectDate}${LastDay}日</strong>
										<input type="hidden" value="${fundProject.fundProjectDate}${LastDay}" name="LastDay">
									</div>
									<div class="form-group">
										<label>募資商品照片:</label> <input type="file" value="file"  accept="image/jpeg" name="file"><br/>
										<small style="color:red; ">${errorProjectSize}${errorFileType}</small>
									</div>
									
								</div>
							</div>		
							<div class="row">
									<div class="col-md-12">
									<div class="form-group">
										<label> 募資內容說明:</label>
										<textarea class="form-control"style="height: 200px; width:100%;" name="fundProductDetail">${getFundProduct.fundProductDetail}</textarea>
										<small style="color:red; ">${errorDetail}</small>
							</div>									
									</div>				
							</div>					
							<div>
								<input type="hidden" value="${fundProject.fundProjectTitle}${getFundProduct.fundProductName}" name="fundProductName">
  								<input type="hidden" value="${fundProject.fundProjectTotal}${getFundProduct.fundProductPrice}" name="fundProductPrice">
  								<input type="hidden" value="${fundProject.fundProjectId}${fundProjectId}" name="fundProjectId">
  								<input type="hidden" value="${fundProject.fundProjectPf}${getFundProduct.fundProductPf}" name="fundProductPf">
  								<div align="center">
									<input type="submit" class="btn btn-primary" value="新增方案">
									<button class="btn btn-primary align-items-center" type="button" onclick="location.href='FindFundProject'">返回上頁</button>
								</div>
							</div>
						</div>
					</div>
				</div>			
			</form>
</main>				
</div>
 
	<!-- ---- 商品明細----- -->
	<!-- ---- 商家資料----- -->
<div class="container">
	
</div>
	<!-- ---- 商家資料----- -->
</body>
</html>
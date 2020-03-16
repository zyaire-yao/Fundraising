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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<title>人客來募資購物網</title>
</head>
<style>

body{
background-image: url('${pageContext.request.contextPath}/images/storePic/background-2.jpg');
background-size: cover;
background-repeat: no-repeat;
font-family: 'Noto Sans TC', sans-serif;
}
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


<body >

	<nav class="navbar navbar-expand-lg navbar-dark " style="background:rgba(0,0,0,0.6)";>
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
					<li class="nav-item active">
					
					<a class="nav-link" href="#" onclick="location.href='${pageContext.request.contextPath}'">首頁
							<span class="sr-only">(current)</span>
					</a>
					</li>
						<c:if test="${not empty sessionScope.memberSession}"><!-- 如果不為空 才顯示 -->
					      <li class="nav-item">
					        <a class="nav-link" href="#" onclick="location.href='findMember'">會員專區</a>
					      </li>
					     
					      <c:if test="${empty sessionScope.storeSession}"><!-- 如果不為空 才顯示 -->
					       <li class="nav-item">
					        <a class="nav-link" href="#" onclick="location.href='registerStore'">註冊商家</a>				     	
					      </li>
					      </c:if>
					      
					       <c:if test="${not empty sessionScope.storeSession}"><!-- 如果不為空 才顯示 -->
					      <li class="nav-item">					     
					        <a class="nav-link" href="#" onclick="location.href='findStore'">查詢商家資料</a>					      
					      </li>
					      
					       </c:if>
					        
					  </c:if> 
					  <li class="nav-item">
					       <a class="nav-link" href="#" onclick="location.href='managerlogin'">後臺登入</a>
					  		 </li>   
					<li class="nav-item dropdown">
			<a  class="nav-link dropdown-toggle" href="#"  id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false" > 
			商品 
			</a>
						
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">募資商品</a> 
							<a  class="dropdown-item" href="#"  onclick="location.href='getAllProduct'">商品選購</a> 
							<a class="dropdown-item" href="#">提出募資專案</a>
						</div>
					</li>
				</ul>
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
              welcome 
              <i style="margin-left: 2px">,</i> <i style="margin-left: 5px"></i> 
         ${sessionScope.get('memberSession').memberSname}</div>
 </c:if>
<!-- ------------------- -->				   
				</form>
			</div>
		</div>
	</nav>
	<!-- ---- 導覽列----- -->
	<!-- ---- 輪播----- -->
	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<!-- 在不動到預設的情況下 使用 header-carousel-item 已背景方式來調整圖片大小 -->
				<div class="carousel-item  header-carousel-item bg-cover active"
					style="background-image: url('${pageContext.request.contextPath}/images/HomePagePic/item1.jpg')">
					<div class="carousel-caption d-none d-md-block px-3">
						<h5>Second slide label</h5>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div>
				</div>
				<div class="carousel-item header-carousel-item bg-cover"
					style="background-image: url('${pageContext.request.contextPath}/images/HomePagePic/item2.jpg')">
					<div class="carousel-caption d-none d-md-block px-3">
						<h5>Second slide label</h5>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div>
				</div>
				<div class="carousel-item header-carousel-item bg-cover"
					style="background-image: url('${pageContext.request.contextPath}/images/HomePagePic/camera.jpg')">
					<div class="carousel-caption d-none d-md-block px-3">
						<h5>Second slide label</h5>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>
	<!-- ---- 輪播----- -->
	<!-- ---- 內容----- -->
	<section class="bg-info text-white  py-5">
		<!-- bg-info text-white -->
		<div class="container  ">
			<!-- m-margin  y-上下 -->
			<div class="row">
				<!-- 12除3  col-4 -->
				<div class="col-md-4">
					<!-- 加入md 為了響應式 大裝置4欄 小裝置滿版 -->
					<div class="mb-2">
						<i class="fas fa-cart-arrow-down fa-5x"></i>
					</div>
					<h3>Lorem ipsum dolor</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing
						elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>
				<div class="col-md-4">
					<div class="mb-2">
						<i class="fas fa-donate fa-5x"></i>
					</div>
					<h3>Lorem ipsum dolor</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing
						elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>
				<div class="col-md-4">
					<div class="mb-2">
						<i class="fab fa-cc-visa fa-5x"></i>
					</div>
					<h3>Lorem ipsum dolor</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing
						elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- ---- 內容----- -->
	<!-- 內容2 -->
	<section class="container-fluid py-5 bg-light text-white"
		style="position: relative">
		<!-- 用絕對定位  裡面就可以用相對定位 -->
		<div class="row">
			<div class="col-md-5 bg-cover"
				style="position:absolute; top: 0; bottom:0; 
				background-image:url('${pageContext.request.contextPath}/images/HomePagePic/item3.jpg')">
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-end text-md-dark">
				<div class="col-md-7">
					<h3>Lorem ipsum dolor</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing
						elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<a href="#" class="btn btn-outline-info">查看更多</a>
					<div class="row mt-3">
						<!-- row內層一定是col -->
						<div class="col-md-6">
							<h3>Lorem ipsum dolor</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<a href="#" class="btn btn-outline-info">查看更多</a>
						</div>
						<div class="col-md-6">
							<h3>Lorem ipsum dolor</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<a href="#" class="btn btn-outline-info">查看更多</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 內容2 -->
<!-- 	<!-- 內容3 --> 
<!-- 	<section class="py-4"> -->
<!-- 		<div class="container"> -->
<!-- 			<h2 class="text-center my-3">Lorem ipsum dolor</h2> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-6"> -->
<!-- 					<div class="d-flex"> -->
<!-- 						讓他有flex功能 -->
<!-- 						<div class="mr-4  text-info"> -->
<!-- 							<i class="fas fa-cogs fa-4x"></i> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<h3>Lorem ipsum dolor</h3> -->
<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipiscing -->
<!-- 								elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-6"> -->
<!-- 					<div class="d-flex"> -->
<!-- 						讓他有flex功能 -->
<!-- 						<div class="mr-4  text-info"> -->
<!-- 							<i class="fas fa-cogs fa-4x"></i> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<h3>Lorem ipsum dolor</h3> -->
<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipiscing -->
<!-- 								elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
	

	<section class="container-fluid">
		<div class="row">
			<div class="col-md-6 p-5 bg-cover text-white"
				style="background-image: url('${pageContext.request.contextPath}/images/HomePagePic/item6.jpg')">
				<div class="row">
					<div class="col-md-9">
						<small>歡迎提交募資專案</small>
						<h3>Lorem ipsum dolor</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						<a href="#" class="btn btn-outline-warning">提交專案</a>
					</div>
				</div>

			</div>

			<div class="col-md-6  p-5 bg-cover  text-white"
				style="background-image: url('${pageContext.request.contextPath}/images/HomePagePic/item7.jpg')">
				<div class="row">
					<div class="col-md-9">
						<small>歡迎提交募資專案</small>
						<h3>Lorem ipsum dolor</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						<a href="#" class="btn btn-outline-warning">提交專案</a>
					</div>
				</div>

			</div>
		</div>
	</section>
<script type="text/javascript">
		function nofind() {
			var img = event.srcElement;
			img.src = "images/memberPic/T1213121.jpg"; //替換的圖片
			img.onerror = null; //控制不要一直觸發錯誤
		}
</script>
</body>
</html>
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
.form-control-borderless {
    border: none;
}

.form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
    border: none;
    outline: none;
    box-shadow: none;
}

body {
	font-family: 'Noto Sans TC', sans-serif;
	background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg111.png') no-repeat 0% 20%/ cover;
}

#box {
	background:rgba(0,0,0,0.2);
	border-radius:1%;
	font-family: 'Noto Sans TC', sans-serif;
	width:800px;
	height: 300px;
	margin: 0 auto;

}
.row .cards{
	border-radius: 8px;
	box-shadow: 0  0px rgba(30, 144, 255,.2);
	overflow: hidden;
	transition:all 0.25s;
}	
.row .cards:hover {
	transform:translateY(-15px);
	box-shadow: 0  3px 5px rgba(30, 144, 255,0.2);
}
.navbar{
	 text-transform: uppercase;
	 font-weight: 700;
	 font-size: .9em;
	 letter-spacing: .1rem;
	 background: rgba(0,0,0,.6) !important;
	}
	.navbar-nav li{
     padding-right: 1rem;
	}
	.navbar-dark .navbar-nav .navbar-link{
	color: white;
	padding-top: .8rem;	
	}
	.navbar-dark .navbar-nav .navbar-link.active,
	.navbar-dark .navbar-nav .navbar-link:hover{
	 color: #lebba3;
	}
.boxboxbox {
	background-image: url('${randomProduct.productPic}') ;
			/*linear-gradient(rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.2)),*/
	background-size: cover;
	background-position: center center;
	border-radius: 8px;
}
#box {
	background:rgba(0,0,0,0.3);
	border-radius:1%;
	font-family: 'Noto Sans TC', sans-serif;
	width:800px;
	height: 300px;
	margin-left:14%;
	margin-top:2.5%;
	text-align: center;
}
.searchbar{
    margin-bottom: auto;
    margin-top: auto;
    height: 60px;
    background-color: #353b48;
    border-radius: 30px;
    padding: 10px;
}

.search_input{
    color: white;
    border: 0;
    outline: 0;
    background: none;
    width: 0;
    caret-color:transparent;
    line-height: 40px;
    transition: width 0.4s linear;
}
.searchbar:hover > .search_input{
    padding: 0 10px;
    width: 200px;
    caret-color:red;
    transition: width 0.4s linear;
}
.searchbar:hover > .search_icon{
    background: white;
    color: #e74c3c;
}
.search_icon{
    height: 40px;
    width: 40px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    color:white;
    text-decoration:none;
}


/* 文字插入式 */

.hr2 {
    padding: 0;
    border: none;
    border-top: medium double #333;
    color: #333;
    text-align: center;
    width: 1100px;
}
.hr2:after {
    content: "商品列表";
    display: inline-block;
    position: relative;
    top: -0.7em;
    font-size: 1.5em;
    padding: 0 0.25em;
    background: white;
}
</style>


<body >
	<!-- Home -->
	<div class="home">
	<!-- ---- 導覽列----- -->
	<nav class="navbar navbar-expand-lg navbar-dark" style="background:rgba(0,0,0,0.6)" >
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
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="location.href='findMember'">會員專區</a></li>
					<li class="nav-item"><c:if
							test="${empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<a class="nav-link" href="#"
								onclick="location.href='registerStore'">註冊商家</a>
						</c:if></li>
						<c:if test="${not empty sessionScope.memberSession}">
					<li class="nav-item"><c:if
							test="${not empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<a class="nav-link" href="#" onclick="location.href='findStore'">賣家中心</a>
						</c:if></li>
						</c:if>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 商品 </a>

						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#" onclick="location.href='getAllFundProductForCustomer'">募資商品</a> 
						</div></li>
				</ul>
			</div>
			<!-- 搜尋 -->
			<c:if test="${empty Inquire}"><!-- 如果 沒有輸入值 -->
			<div class="d-flex justify-content-center" style="padding-right: 10px;">
			<form  action="findProductLike">
		        <div class="searchbar">
		          <input class="search_input" type="text" name="Inquire" placeholder="Search...">
		          <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
		        </div>
		    </form>
		    </div>
		    </c:if>
		    <!--  -->

		    <c:if test="${not empty Inquire}"> <!-- 如果 有輸入值 -->
		    <div class="d-flex justify-content-center" style="padding-right: 10px;">
				<form  action="findProductLike">
					 <div class="searchbar">
		          <input class="search_input" type="text" name="Inquire" placeholder="Search..." value="${Inquire}">
		          <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
		        </div>
				</form>	
			</div>
			</c:if>
			<!-- 搜尋 -->
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
			
		   	<div class="dropdown ml-auto">
				    <button class="btn btn-sm btn-cart" data-toggle="dropdown"
				     data-flip="false" onclick="location.href='FindMemberShoppingCart'">
				     <i class="fas fa-shopping-cart btn-cart text-light fa-2x"></i>
				     <span class="badge badge-danger">${MemberCartCounts}</span>
				    </button>
	   		</div>
		
		</div>
		
	</nav>
	<!-- ---- 導覽列----- -->
	<!-- 隨機商品展示 -->	
	<div class="col-md-9 boxboxbox my-2 " style="margin:0 auto; height: 50vh;">
			<div class="carousel-item active" id="box">			
				<p style="color: white; font-size: 30px; margin-top: 11%;">${randomProduct.productName}</p>
				<form action="getProductDetail" method="get">
				<input type="hidden" value="${randomProduct.productId}" name="productId">
				<input class="btn btn-outline-success"
											data-toggle="button" aria-pressed="false" type="submit"
											value="查看詳情">
				</form>
			</div>
	</div>
	<!-- 隨機商品展示 -->
</div>

<!-- ---- 卡片排版----- -->
	<!-- 搜尋 -->	
	<!-- 未輸入時  已 productId 顯示商品-->
	<hr class="hr2">
	<div class="col-md-10 my-4"  style="margin:0 auto;">
		<div class="row row-cols-1 row-cols-md-3" >
			<c:forEach items="${All}"  var="all">
				<div class="col-md-3 mb-4  " >
					<form action="getProductDetail" method="get">
						<input type="hidden" value="${all.productId }" name="productId">
						<div class="card cards  text-center ">
						<a href="" ></a>
							<img src="${all.productPic}" class="card-img-top  header-carousel-item" style="object-fit:cover" alt="" width="100%" height="230px">
							
							<div class="card-body"  style="height: 80px;">

							 <div class="pcontent">
        						<p class="title">${all.productName }</p>
  							</div>
  							
							</div>
							
							<div>
								<input class="btn btn-outline-primary btn-lg btn-block"
									 type="submit"
									value="View">
							</div>
							
						</div>
					</form>
				</div>
			</c:forEach>
			
			<!-- 輸入模糊查詢 -->
			<c:forEach items="${listProduct}"  var="listProduct">
				<div class="col-md-4 mb-4  " >
					<form action="getProductDetail" method="get">
						<input type="hidden" value="${listProduct.productId }" name="productId">
						<div class="card cards  text-center ">
						<a href="" ></a>
							<img src="${listProduct.productPic}" class="card-img-top  header-carousel-item" style="object-fit:cover" alt="" width="100%" height="230px">
							
							<div class="card-body"  style="height: 80px;">

							 <div class="pcontent">
        						<p class="title">${listProduct.productName }</p>
  							</div>
  							
							</div>
							
								<div>
								<input class="btn btn-outline-primary btn-lg btn-block"
									 type="submit"
									value="View">
							</div>
						</div>
					</form>
				</div>
			</c:forEach>
			
		</div>
		</div>
<!-- 	</div> -->




<footer class="my-5 pt-5 text-muted text-center text-small" >
<hr style=" height: 12px; border: 0; box-shadow: inset 0 8px 8px -5px rgba(0,0,0,0.5);">
    <p class="mb-1">2020 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
  
	<!-- ---- 卡片排版----- -->
	
</body>
</html>
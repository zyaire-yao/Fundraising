<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
#box {
	background:rgba(0,0,0,0.2);
	border-radius:1%;
	font-family: 'Noto Sans TC', sans-serif;
	width:800px;
	height: 300px;
	margin: 0 auto;

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

body {
background:rgba(245,245,245,0.6);
font-family: 'Noto Sans TC', sans-serif;
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg111.png') no-repeat 0% 20%/ cover;
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

span{
 		font-weight: 700;
	 font-size: .9em;
	 letter-spacing: .1rem;
	  padding-right: 5rem;
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
.boxboxbox {
	background-image: url('${pageContext.request.contextPath}/images/fundproductPic/FundProduct.jpg') ;
			/*linear-gradient(rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.2)),*/
	background-size: cover;
	background-position: center center;
	border-radius: 8px;
}
</style>


<body>
<div class="home">
	<!-- ---- 導覽列----- -->
	<nav class="navbar navbar-expand-lg navbar-dark" style="background:rgba(0,0,0,0.6)">
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
					<li class="nav-item"><c:if
							test="${not empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<a class="nav-link" href="#" onclick="location.href='findStore'">賣家中心</a>
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
			<!-- 搜尋 -->
			<c:if test="${empty Inquire}"><!-- 如果 沒有輸入值 -->
			<div class="d-flex justify-content-center" style="padding-right: 10px;">
			<form  action="findFundProductLike">
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
				<form  action="findFundProductLike">
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
		</div>
	</nav>
	<!-- ---- 導覽列----- -->
	<!-- ---- 廣告大屏幕----- -->
	<div class="col-md-9 boxboxbox " style="margin:0 auto; height: 70vh;position:relative;">
	<div class="col-md-9 p-lg-5 mx-auto my-2 " style="text-align: center;margin: 0 auto;">			
<!-- 		<p style="font-size: 30px;">你知道群眾募資是甚麼嗎?</p> -->
<!-- 		<br> -->
<!-- 		<p style="font-size: 30px;">你知道群眾募資是甚麼嗎?</p> -->
<!-- 		<br> -->
<!-- 		<p style="font-size: 30px;">你知道群眾募資是甚麼嗎?</p> -->
	</div>
</div>
</div>
	<!-- ---- 廣告大屏幕----- -->
	<!-- ---- 卡片排版----- -->
	<div class="col-md-10 my-3" style="margin:0 auto;">
		<div class="row row-cols-1 row-cols-md-3">
		<!-- 搜尋前 -->
			<c:forEach items="${AllFundProduct}" var="allFundProduct">
				<div  class="col mb-4 " style="opacity:0.9;">
					<form action="getFundProductDetail" method="get">
						<input type="hidden" value="${allFundProduct.fundProductId}" name="fundProductId">
						<div class="card cards h-100">
						
							<img src="${allFundProduct.fundProductPic}" class="card-img-top  header-carousel-item" style="object-fit:cover" alt="" width="100%" height="500px">
							
							<div class="card-body" style="height: 150px;">
								
								 <div class="pcontent">
        						<p class="title">${allFundProduct.fundProductName }</p>
       					 		<p class="small creator"></p>
       					 		<p class="excerpt" style="OVERFLOW: auto; HEIGHT:80px;">${allFundProduct.fundProductPf}</p>
  							</div>
  						</div>
  								<div style="padding-left: 40px">
  						$<fmt:formatNumber type="currency" value="${AllFundProductTotal[allFundProduct.fundProductId]}" pattern="###,###,###,###" />
  						</div>
  								<div class="progress text-center" style="width: 80%;margin:0 auto;">
  									<div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" style="width:${AllRateGoal[allFundProduct.fundProductId]}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
								
								</div>
								<div  class="py-1" style="padding-left: 40px">  <!-- card-footer  -->
								<span>${AllRateGoal[allFundProduct.fundProductId]}%</span>
								<span>${AllLastDay[allFundProduct.fundProductId]}天</span>
								
								</div>
								
								<div class="card-footer  border-top-0 text-right  btn-group-sm" >
								<input class="btn btn-outline-success   "
									data-toggle="button" aria-pressed="false" type="submit"
									value="View">
								</div>
								
						</div>
					</form>
				</div>
			</c:forEach>
			
			<!-- 搜尋後 -->
			<c:forEach items="${listFundProduct}" var="listFundProduct">
				<div  class="col mb-4 " style="opacity:0.9;">
					<form action="getFundProductDetail" method="get">
						<input type="hidden" value="${listFundProduct.fundProductId}" name="fundProductId">
						<div class="card cards h-100">
						
							<img src="${listFundProduct.fundProductPic}" class="card-img-top  header-carousel-item" style="object-fit:cover" alt="" width="100%" height="500px">
							
							<div class="card-body" style="height: 150px;">
								
								 <div class="pcontent">
        						<p class="title">${listFundProduct.fundProductName }</p>
       					 		<p class="small creator"></p>
       					 		<p class="excerpt" style="OVERFLOW: auto; HEIGHT:80px;">${listFundProduct.fundProductPf}</p>
  							</div>
  						</div>
  								<div style="padding-left: 40px">
  						$<fmt:formatNumber type="currency" value="${AllFundProductTotal[listFundProduct.fundProductId]}" pattern="###,###,###,###" />
  						</div>
  								<div class="progress text-center" style="width: 80%;margin:0 auto;">
  									<div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" style="width:${AllRateGoal[listFundProduct.fundProductId]}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
								
								</div>
								<div  class="py-1" style="padding-left: 40px">  <!-- card-footer  -->
								<span>${AllRateGoal[listFundProduct.fundProductId]}%</span>
								<span>${AllLastDay[listFundProduct.fundProductId]}天</span>
								
								</div>
								
								<div class="card-footer  border-top-0 text-right  btn-group-sm" >
								<input class="btn btn-outline-success   "
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




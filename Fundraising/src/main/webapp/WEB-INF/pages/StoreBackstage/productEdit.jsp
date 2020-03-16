<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
    <title>商品上架/編輯</title>
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
	 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/sidebar.css" rel="stylesheet">	
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap-->
</head>
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}' ;


jQuery(function ($) {
    $(".sidebar-dropdown > a").click(function() {
  $(".sidebar-submenu").slideUp(200);
  if (
    $(this)
      .parent()
      .hasClass("active")
  ) {
    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .parent()
      .removeClass("active");
  } else {
    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .next(".sidebar-submenu")
      .slideDown(200);
    $(this)
      .parent()
      .addClass("active");
  }
});
$("#close-sidebar").click(function() {
  $(".page-wrapper").removeClass("toggled");
});
$("#show-sidebar").click(function() {
  $(".page-wrapper").addClass("toggled");
});  
});

</script>
<style>
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
.imgbg{	
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg4.jpg') no-repeat 0% 20%/ cover;
font-family: 'Noto Sans TC', sans-serif;
	}
</style>
<body class="imgbg">
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
    <i class="fas fa-bars"></i>
  </a>
  <nav id="sidebar" class="sidebar-wrapper" style="font-size: 15px;">
    <div class="sidebar-content">
      <div class="sidebar-brand">
        <a href="#"><img
				src='${pageContext.request.contextPath}/images/HomePagePic/thumbs-up.svg'
				width="40px" height="30px" alt=""> 思思募募</a>
        <div id="close-sidebar">
          <i class="fas fa-times"></i>
        </div>
      </div>
      <div class="sidebar-header">
      <c:if test="${not empty sessionScope.get('memberSession')}">
        <div class="user-pic">
          <img class="img-responsive img-rounded" onerror="nofind()"
				   src="${sessionScope.get('memberSession').memberPic}"
            alt="User picture">
        </div>
        <div class="user-info">
          <span class="user-name"> ${sessionScope.get('memberSession').memberSname}
          </span>
          <span class="user-role">Administrator</span>
          <span class="user-status">
            <i class="fa fa-circle"></i>
            <span>Online</span>
          </span>
        </div>
       </c:if>  
      </div>
      
      <!-- sidebar-header  -->
      <div class="sidebar-menu">
        <ul>
        
          <li class="header-menu">
            <span>商品/募資</span>
          </li>
          
          <li class="sidebar-dropdown">
            <a href="#" onclick="location.href='${pageContext.request.contextPath}'">
              <i class="fa fa-tachometer-alt"></i>
              <span>首頁</span>
<!--               <span class="badge badge-pill badge-warning">返回首頁</span> -->
            </a>
            
              <li class="sidebar-dropdown">
            <a href="#" onclick="location.href='findMember'">
             <i class="fa fa-folder"></i>
              <span>會員專區</span>
            </a>
          </li>
            
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fa fa-shopping-cart"></i>
              <span>商品專區</span>
<!--               <span class="badge badge-pill badge-danger">3</span> -->
            </a>
            <div class="sidebar-submenu">
              <ul>
              
                <li>
                  <a href="#">
					商品上架 / 編輯
                  </a>
                </li>
                
                <li>
                  <a href="#" onclick="location.href='ProductMsg'">
                  	商品留言
                  </a>
                </li>
                
              </ul>
            </div>
            
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="far fa-gem"></i>
              <span>募資專區</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="#" onclick="location.href='FundProject'">
                   	募資提案
                  </a>
                </li>
                <li>
                  <a href="#" onclick="location.href='FindFundProject'">
                   	募資查詢/修改
                  </a>
                </li>
                <li>
                  <a href="#" onclick="location.href='FindFundMsg'" >
               		   募資留言
                  </a>
                </li>       
              </ul>
            </div>
          </li>
          
          
          
          <li class="header-menu">
            <span>商家資料 / 訂單</span>
          </li>
          
          
          <li>
            <a href="#"  onclick="location.href='findStore'">
              <i class="fa fa-book"></i>
              <span>基本資料更新</span>            
            </a>
          </li>
          
          <li>
              <a href="#" onclick="location.href='findStoreOrder'">
              <i class="fa fa-calendar"></i>
              <span>商品訂單查詢</span>
            </a>
          </li>
          
          
          <li>
            <a href="#" onclick="location.href='findStoreFundOrder'" >
              <i class="fa fa-folder"></i>
              <span>募資訂單查詢</span>
            </a>
          </li>
          
            <li>
            <a href="#" onclick="location.href='findStoreReturn'">
              <i class="fa fa-folder"></i>
              <span>退貨審核</span>
            </a>
          </li>
          
        </ul>
      </div>
      <!-- sidebar-menu  -->
    </div>
    <!-- sidebar-content  -->

  </nav>
  <!-- sidebar-wrapper 右邊內容放此 -->
  <main class="page-content">
  <h1>商品上架/編輯</h1>
  <hr>
   			 <div class="row">
						<c:forEach items="${All}" var="all">
							<div class="col-md-3 mb-4 " style="opacity:0.8;" id="touch" >
								<form action="getProductToUpdate" method="post">
									<div class="card cards text-center"  style="height: 500px">
									
										<img src="${all.productPic}" class="card-img-top  header-carousel-item" style="object-fit:cover" alt="" width="200px" height="250px">
										<hr style=" border: 0;
                                                    height: 1px;
                                                     background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));">
										<div class="card-body mb-4" >
												<div>
													<h5 class="card-title">商品名稱:${all.productName}</h5>
													<p class="card-text"  style="OVERFLOW: scroll; HEIGHT:100px;">商品簡介:${all.productPf}</p>
													<p class="card-text" >商品編號:${all.productItemNO}</p>
													<p class="card-text" >商品價格:${all.productPrice}</p>
													<input type="hidden" value="${all.productId}" name="productId">
												</div>
										
											
										</div>
											<div >
													<input class="btn btn-outline-primary btn-lg btn-block" type="submit"
													value="編輯" >
												</div>	
									</div>
								</form>
							</div>
				
						</c:forEach>
						<div class="col-md-3 mb-4 " style="opacity:0.8;"  id="touch" >
									
									<div class="card text-center" style="height: 500px">
									
										
										<img src='${pageContext.request.contextPath}/images/productPic/Plus_symbol.svg' class="card-img-top  header-carousel-item" style="object-fit:contain" alt="" width="200px" height="250px">
				
										<hr style=" border: 0;
                                                    height: 1px;
                                                     background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));">					
										<div class="card-body mb-4" >
											<div>
											<h5 class="card-title">商品名稱</h5>
											<p class="card-text" >商品簡介</p>
											<p class="card-text" >商品編號</p>
											<p class="card-text" >商品價格</p>
										
											<input type="hidden" value="${all.productId }" name="productId">
											</div>
											
										</div>
										<div >
											<input class="btn btn-outline-primary btn-lg btn-block "
												 type="submit"
												value="上架" onclick="location.href='linkinAddProduct'">
											</div>	
									</div>
								
						</div>
				
			</div>
  </main>


 	
<!--  -->	
  <!-- page-content" -->
</div>
<!-- page-wrapper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    
</body>

</html>
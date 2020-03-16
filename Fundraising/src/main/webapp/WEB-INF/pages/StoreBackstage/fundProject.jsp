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
    <title>提交您的募資專案</title>
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
                  <a href="#" onclick="location.href='ProductEdit'">
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
                  <a href="#" >
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
            <a href="#" onclick="location.href='findStore'">
              <i class="fa fa-book"></i>
              <span>基本資料更新</span>            
            </a>
          </li>
          
          <li>
            <a href="#"  onclick="location.href='findStoreOrder'">
              <i class="fa fa-calendar"></i>
              <span>商品訂單查詢</span>
            </a>
          </li>
          
          
          <li>
            <a href="#"  onclick="location.href='findStoreFundOrder'">
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
<h1>募資提案專區</h1>
<hr>
			<form action="fundProject" method="post"
				enctype="multipart/form-data">
				<div id="box" style="font-size: 18px">
					<div class="container"
						style=" color: white; margin: 0 auto;">
						<div class="text-center mb-4">
							<h1 class=" mb-3">新增募資專案</h1>
							<small style="color: red">*為必填</small>
						</div>
						<div class="container">
							<div class="row">
								<div class="col-md-6">

									<div class="form-group">
										<label>*提案名稱 :  </label> <input type="text" class="form-control"
											value="${getFundProject.fundProjectTitle}" name="fundProjectTitle" >
											<small style="color: red;">${titalFail}</small>
									</div>

									<div class="form-group">
										<label>*提案金額 : </label><input type="text" class="form-control"
											value="${getFundProject.fundProjectTotal}" name="fundProjectTotal" onkeyup="value=value.replace(/[^\d]/g,'') " required>
											 <small style="color: red;">${totalFail}</small>
									</div>


								</div>

								<div class="col-md-6">

									<div class="form-group">
										<label>*提案天數 : </label> <input type="text" class="form-control"
											value="${getFundProject.fundProjectDate}" name="fundProjectDate" onkeyup="value=value.replace(/[^\d]/g,'') " required>
											  <small style="color: red;">${dateFail}</small>
									</div>

									<div class="form-group">
										<label>*提案檔案 :  </label> <input type="file" class="form-control"
											name="file" accept=".pdf" >
											 <small style="color: red;">${upLoadFile}${failFileType}${failFileSize}</small>
									</div>

								</div>


							</div>
							
							<div class="row">
									<div class="col-md-12">
									<div class="form-group">
										<label>*提案內容 :</label>
										<textarea class="form-control"
											style="height: 200px; width:100%;" name="fundProjectPf" >${getFundProject.fundProjectPf}</textarea>
											 <small style="color: red;">${pfFail}</small>
							</div>
									
									
									
									</div>
							
							
							
							</div>
							
							<div>
								<input class="btn btn-primary align-items-center" type="submit"
									value="儲存">${successful}
							</div>
						</div>
					</div>
				</div>
				
				
			</form>



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
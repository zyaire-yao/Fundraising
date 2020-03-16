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
    <title>基本資料更新</title>
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
.imgbg{	
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg4.jpg') no-repeat 0% 20%/ cover;
font-family: 'Noto Sans TC', sans-serif;
	}
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
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

            </a>
            
           <li class="sidebar-dropdown">
            <a href="#" onclick="location.href='findMember'">
             <i class="fa fa-folder"></i>
              <span>會員專區</span>
            </a>
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
                  <a href="#"  onclick="location.href='FundProject'" >
                   	募資提案
                  </a>
                </li>
                <li>
                  <a href="#"  onclick="location.href='FindFundProject'">
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
          
<!--           <li class="sidebar-dropdown"> -->
<!--             <a href="#"> -->
<!--               <i class="fa fa-globe"></i> -->
<!--               <span>Maps</span> -->
<!--             </a> -->
<!--             <div class="sidebar-submenu"> -->
<!--               <ul> -->
<!--                 <li> -->
<!--                   <a href="#">Google maps</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="#">Open street map</a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </div> -->
<!--           </li> -->
          
          
          <li class="header-menu">
            <span>商家資料 / 訂單</span>
          </li>
          
          
          <li>
            <a href="#">
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
            <a href="#" onclick="location.href='findStoreFundOrder'">
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
     <h1>賣家中心</h1>
  <hr>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12  " >     
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">基本資料更新</h3>
            </div>
            <div class="panel-body">
              <div class="row" style="font-size: 16px;">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="${storeSession.storePic}"  style="height:150px;width:150px;"> </div>
                
                <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>商家名稱:</td>
                        <td>${storeSession.storeName}</td>
                      </tr>
                      <tr>
                        <td>商家電話:</td>
                        <td>${storeSession.storeTel}</td>
                      </tr>
                      <tr>
                        <td>商家地址:</td>
                        <td>${storeSession.storeAddress}</td>
                      </tr>
                   
                      <tr>                             
                        <td>商行號碼:</td>
                        <td>${storeSession.storeNumber}</td>
                      </tr>
                        <tr>
                        <td>商行帳戶:</td>
                        <td>${storeSession.storeAccount}</td>
                      </tr>
                      <tr>
                        <td>負責人姓名:</td>
                        <td>${storeSession.storePiName}</td>
                      </tr>
                      <tr>
                        <td>負責人身分證:</td>
                        <td>${storeSession.storePiTwid}</td>                                                  
                      </tr>
                      <tr>
                        <td>負責人電話:</td>
                        <td>${storeSession.storePiTel}</td>                                                   
                      </tr>
                      <tr>
                        <td>負責人地址:</td>
                        <td>${storeSession.storePiAddress}</td>                                                   
                      </tr>
                      <tr>
                        <td>簡介:</td>
                        <td>${storeSession.storePf}</td>                                                   
                      </tr>                    
                    </tbody>
                  </table>
                  
                  <button type="button" style="float:right;font-size:15px; " class="btn btn-primary " data-toggle="modal" data-target="#exampleModal">
 			修改商家資訊
				  </button>
                </div>
              </div>
            </div>
               
            
          </div>
        </div>
      </div>
    </div>

  </main>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">資料更新</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!-- - -->       
<form action="updateStore" method="post" enctype="multipart/form-data">

			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4" style="text-align: center;">
				
					<label for="memberPicInput">
											
	                      <img src="${getstore.storePic}${storeInput.storePic}" id="memberPic" style="height: 150px; width: 150px; border-radius: 50%">
	                		${errorPic}${errorPicSize}
	                </label>
	                      <input type="file" class="form-control" placeholder="Enter Pic"  id="memberPicInput" name="file" style="display: none ;" >
	             </div>
	             
			</div>


<div class="container">

	<div class="row">
		<div  class="col-md-6">
			<div class="form-group">
			<label for="Fname">商家名稱 :</label>
			<input type="text" class="form-control" value="${getstore.storeName}${storeInput.storeName}" name="storeName" id="storeNameUpdate"> ${errorName} ${errorRepeat}
			<small id="storeNameUpdateRegular" class="text-danger"></small><br>
			</div>	
				
			<div class="form-group">
			<label for="Fname">商家簡介 :</label>	
			<input type="text" class="form-control" value="${getstore.storePf}${storeInput.storePf}" name="storePf" id="storePf"> ${errorPf}
			<small id="storePfRegular" class="text-danger"></small><br>
			</div>
			
			<div class="form-group">
			<label for="Fname">商家電話 (EX:0289123456):</label>
			<input type="text" class="form-control" value="${getstore.storeTel}${storeInput.storeTel}" name="storeTel" id="storeTel"> ${errorTel}
			<small id="storeTelRegular" class="text-danger"></small><br>
			</div>
			
			<div class="form-group">
			<label for="Fname">商家地址(實體店面):</label>
			<input type="text" value="${getstore.storeAddress}${storeInput.storeAddress}" name="storeAddress" id="storeAddress">
			</div>
			
			<div class="form-group">
			<label for="Fname">商行號碼 (8碼商行號碼):</label>
			<input type="text" value="${getstore.storeNumber}${storeInput.storeNumber}" name="storeNumber" id="storeNumber"> ${errorNumber}
			<small id="storeNumberRegular" class="text-danger"></small><br>
			</div>
			
			<div class="form-group">
				商行負責人身分證  (第一英文字母大寫 加九位數字) :<br> 
				<input type="text"  class="form-control" value="${getstore.storePiTwid}${storeInput.storePiTwid}" name="storePiTwid" id="storePiTwid"> ${errorPiTwid}
				<small id="storePiTwidRegular" class="text-danger"></small><br>
				</div>
		
		</div>

		<div  class="col-md-6">
		
				<div class="form-group">
				商行帳戶 (只能輸入數字 最多25碼):<br> 
				<input type="text" class="form-control" value="${getstore.storeAccount}${storeInput.storeAccount}" name="storeAccount" id="storeAccount"> ${errorAccount}
				<small id="storeAccountRegular" class="text-danger"></small><br>
				</div>
					
				<div class="form-group">
				商行負責人姓名 (請輸入中文名):<br> 
				<input type="text"  class="form-control" value="${getstore.storePiName}${storeInput.storePiName}" name="storePiName" id="storePiName"> ${errorPiName}
				<small id="storePiNameRegular" class="text-danger"></small><br>
				</div>
				
				
				
				<div class="form-group">
				商行負責人手機號碼 (09開頭10位數電話號碼):<br> 
				<input type="text"  class="form-control" value="${getstore.storePiTel}${storeInput.storePiTel}" name="storePiTel" id="storePiTel"> ${errorPiTel}
				<small id="storePiTelRegular" class="text-danger"></small><br>
				</div>
				
				<div class="form-group">
				商行負責人地址 (輸入中文地址) :<br> 
				<input type="text" class="form-control" value="${getstore.storePiAddress}${storeInput.storePiAddress}" name="storePiAddress" id="storePiAddress"> ${errorPiAddress}
				<small id="storePiAddressRegular" class="text-danger"></small><br>
				</div>
				
			
				<input type="hidden" value="${getstore.storeId}${storeInput.storeId}" name="storeId" id="storeId">
				<input type="hidden" value="${getstore.storeStatus}${storeInput.storeStatus}" name="storeStatus" id="storeStatus">
				<input type="hidden" value="${getstore.storePic}${storeInput.storePic}" name="storePic" id="storePic">							
		</div>
	
	</div>

</div>




	<div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <input type="submit" class="btn btn-primary" value="Save changes" >
	      </div>
	 </form> 

      </div>
      
    </div>
  </div>
  <script type="text/javascript">
	function readURL( img ){
		if( img.files && img.files[0] )
			var reader = new FileReader();
		reader.onload = function(e){
			$("#memberPic").attr('src' , e.target.result );
		}
		reader.readAsDataURL(img.files[0]) ;
	}

	$("#memberPicInput").change(function(){
		readURL(this) ;
	})
</script>
</div>
 	
<!--  -->	
  <!-- page-content" -->
</div>
<!-- page-wrapper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/storeRegular.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/allProduct.js" ></script> 
</body>

</html>
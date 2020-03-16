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
    <title>思思募募</title>
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
<!--               <span class="badge badge-pill badge-warning">返回首頁</span> -->
            </a>
            
            
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fa fa-shopping-cart"></i>
              <span>基本資料查詢</span>
<!--               <span class="badge badge-pill badge-danger">3</span> -->
            </a>
            <div class="sidebar-submenu">
              <ul>
              
                <li>
                  <a href="#" >
					會員基本資料
                  </a>
                </li>
                
                <li>
                  <a href="#" onclick="location.href='findPwd'" >
                  	更改密碼
                  </a>
                </li>
                
              </ul>
            </div>
            
          </li>

          
          
          <li class="header-menu">
            <span>訂單</span>
          </li>
          
                    
          
          <li>
            <a href="#" onclick="location.href='findMemberOrder'" >
              <i class="fa fa-calendar"></i>
              <span>商品訂單查詢</span>
            </a>
          </li>
          
          
          <li>
            <a href="#" onclick="location.href='findMemberFundOrder'">
              <i class="fa fa-folder"></i>
              <span>募資訂單查詢</span>
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
  <h1>會員專區</h1>
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
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="${getMember.memberPic}"  style="height:150px;width:150px;"> </div>
                
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
                        <td>姓名:</td>
                        <td>${getMember.memberFname}</td>
                      </tr>
                      <tr>
                        <td>暱稱:</td>
                        <td>${getMember.memberSname}</td>
                      </tr>
                      <tr>
                        <td>身分證字號:</td>
                        <td>${getMember.memberTwid}</td>
                      </tr>
                   
                      <tr>                             
                        <td>性別:</td>
                        <td>${getMember.memberGd}</td>
                      </tr>
                        <tr>
                        <td>生日:</td>
                        <td>${getMember.memberHb}</td>
                      </tr>
                      <tr>
                        <td>市內電話:</td>
                        <td>${getMember.memberTel}</td>
                      </tr>
                      <tr>
                        <td>手機號碼:</td>
                        <td>${getMember.memberCel}</td>                                                  
                      </tr>
                                   
                    </tbody>
                  </table>
                  
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
 						修改會員資訊
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
        <h5 class="modal-title" id="exampleModalLabel">使用者資料更新</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!-- - -->       
<div class="container">

		<div class="text-center mb-4">
		
			<small style="color: red">*為必填</small>
		</div>
		
		<form action="memberUpdate" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4" style="text-align: center;">
					<label for="memberPicInput">
	                      <img src="${getMember.memberPic}${memberInput.memberPic}" id="memberPic" style="height: 150px; width: 150px; border-radius: 50%">
	                </label>
	                      <input type="file" class="form-control" placeholder="Enter Pic"  id="memberPicInput" name="file" style="display: none ;" >
	             </div>
	             <div class="col-md-4">
				</div>
			</div>
			<div class="container">			
				<div class="row">
					                 				
					<div class="col-md-6">

                        <div class="form-group">
							<label for="Fname">*姓名(請輸入中文姓名)</label> <input type="text"
								class="form-control" placeholder="Enter Name" name="memberFname"
								id="memberFname" value="${getMember.memberFname}${memberInput.memberFname}">
							<small id="memberFnameRegular" class="text-danger">${errorFname}</small>
						</div>
						
						<div class="form-group">
							<label for="Fname">*暱稱 :</label> <input type="text"
								class="form-control" placeholder="Enter Nickname" name="memberSname"
								id="memberSname" value="${getMember.memberSname}${memberInput.memberSname}">
							<small id="memberFnameRegular" class="text-danger">${errorSname}</small>
						</div>
						
						<div class="form-group">
							<label for="Twid">*身分證字號 身分證字號(第一字母為英文大寫 加 9位數字) </label> 
							<input type="text" class="form-control" placeholder="Enter ID card"
								name="memberTwid" id="memberTwid"
								value="${getMember.memberTwid}${memberInput.memberTwid}">  
								<small id="memberTwidRegular" class="text-danger">${errorTwid}</small>
						</div>
						<div class="form-group">
							<label for="hb">*生日</label> <input type="date"
								class="form-control" placeholder="Enter date" name="memberHb"
								value="${getMember.memberHb}${memberInput.memberHb}" id="memberHb"> 
								<small id="memberHbRegular" class="text-danger">${errorHb}</small>
						</div>
					</div>	
					<div class="col-md-6">
					
					<div class="form-group">
					<label for="hb">*性別</label><br>
					<c:if test="${not empty getMember.memberGd || not empty memberInput.memberGd}">
					 <select name="memberGd" id="memberGd"  class="form-control">
					  <c:if test="${getMember.memberGd=='男性' || memberInput.memberGd=='男性'}">
					　  <option value="${getMember.memberGd}${memberInput.memberGd}">${getMember.memberGd}${memberInput.memberGd}</option>
					　  <option value="女性">女性</option>
					　  <option value="跨性別">跨性別</option>
					  </c:if>
					  <c:if test="${getMember.memberGd=='女性' || memberInput.memberGd=='女性'}">
					　  <option value="${getMember.memberGd}${memberInput.memberGd}">${getMember.memberGd}${memberInput.memberGd}</option>
					　  <option value="男性">男性</option>
					　  <option value="跨性別">跨性別</option>
					  </c:if>
					  <c:if test="${getMember.memberGd=='跨性別' || memberInput.memberGd=='跨性別'}">
					　  <option value="${getMember.memberGd}${memberInput.memberGd}">${getMember.memberGd}${memberInput.memberGd}</option>
					  　<option value="男性">男性</option>
					　  <option value="女性">女性</option>
					  </c:if>
					 </select>
					</c:if>
					</div>

                        <div class="form-group">
							<label for="Tel">市內電話 :</label> <input type="text"
								class="form-control" placeholder="Enter Tel" name="memberTel"
								value="${getMember.memberTel}${memberInput.memberTel}" id="Tel">
						</div>

                        <div class="form-group">
							<label for="Cel">*手機 (為09開頭的10位數電話號碼)</label> <input type="text"
								class="form-control" placeholder="Enter Cel" name="memberCel"
								value="${getMember.memberCel}${memberInput.memberCel}" id="memberCel">
							<small id="memberCelRegular" class="text-danger">${errorCel}</small>
						</div>


<input type="hidden" value="${getMember.memberId}${memberInput.memberId}"  name="memberId" id="memberId">
<input type="hidden" value="${getMember.memberPic}${memberInput.memberPic}"  name="memberPic" id="memberPic">
<input type="hidden" value="${getMember.memberStatus}${memberInput.memberStatus}" name="memberStatus" id="memberStatus">
<input type="hidden" value="${getMember.memberEmail}${memberInput.memberEmail}" name="memberEmail" id="memberEmail">
<input type="hidden" value="${getMember.memberPwd}${memberInput.memberPwd}" name="memberPwd" id="memberPwd">
<input type="hidden" value="${getMember.memberCode}${memberInput.memberCode}" name="memberCode" id="memberCode">
	</div>
		</div>
			</div>
			
			  	<div class="row">
				<div class="col-md-6">
					<button class="btn btn-lg btn-success btn-block" type="submit">送出修改</button>
				</div>

				<div class="col-md-6">
					<button class="btn btn-lg btn-warning btn-block" type="button"
						onclick="location.href='${pageContext.request.contextPath}'">首頁</button>
				</div>
				</div>
</form>          
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/memberRegular.js" ></script>

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
      
    </div>
  </div>

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
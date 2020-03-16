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
    <title>募資留言</title>
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
                  <a href="#"  onclick="location.href='FundProject'">
                   	募資提案
                  </a>
                </li>
                <li>
                  <a href="#"  onclick="location.href='FindFundProject'">
                   	募資查詢/修改
                  </a>
                </li>
                <li>
                  <a href="#">
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
  <h1>募資商品留言專區</h1>
  <hr>
  <div class="container">
		<c:forEach items="${getListFundMsg}" var="getListFundMsg">
		<form action="addFundReply" method="post" enctype="multipart/form-data">
    <div class="card gedf-card">
    	
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="${getListMsg.member.memberPic}" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">${getListFundMsg.member.memberEmail} <span><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#replyMsg${getListFundMsg.fundMsgId}"><i class="fa fa-comment"></i>Reply</button>
                    	<input type="hidden" value="${getListFundMsg.fundMsgId}" name="fundMsgId">
	 					<input type="hidden" value="${getListFundMsg.fundProduct.fundProductId}" name="fundProductId"></span></div>
                                    <div class="h7 text-muted">@${getListFundMsg.member.memberFname}</div>
                                </div>
                            </div>
                            <div>
                                
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>${getListFundMsg.fundMsgDate}</div>
                        <a class="card-link" href="#">
                            <h5 class="card-title">${getListFundMsg.fundMsgTital}</h5>
                        </a>

                        <p class="card-text">
                            ${getListFundMsg.fundMsgPf}
                        </p>
                        
                    </div>
                    <input type="hidden" value="${getListFundMsg.fundMsgId}" name="fundMsgId">
	 				<input type="hidden" value="${getListFundMsg.fundProduct.fundProductId}" name="fundProductId">
<!--                     <div class="card-footer">                         -->
<%--                         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#replyMsg${getListMsg.msgId}"><i class="fa fa-comment"></i>Reply</button> --%>
<!--                     </div> -->
                
 <!-- 商家回覆顯示 -->    	
    <c:forEach items="${listFundReply}" var="listFundReply">    
		<c:if test="${listFundReply.fundMsg.fundMsgId == getListFundMsg.fundMsgId}"><!-- 如果ID相同 -->			
			<div class="card-header">
				<div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="${listFundReply.store.storePic}" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">@商家回覆</div>                                    
                                </div>
                            </div>
                            <div>                               
                            </div>
                        </div>
         </div>
         <div class="card-body">
                        <p class="card-text">
                            ${listFundReply.fundReplyPf}
                        </p>
                         <c:if test="${not empty listFundReply.fundReplyPic}"><!-- 如果圖片不為空 -->
			 				<img alt="" src="${listFundReply.fundReplyPic}" style="width: 100px;height: 100px">
		   				 </c:if>
         </div>		   		   
		</c:if>	
    </c:forEach>   
</div>			 
    <!-- 按下回覆留言後開啟視窗 -->
    <div class="modal fade" id="replyMsg${getListFundMsg.fundMsgId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalldLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">留言回覆</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><!-- X按鈕 -->
            <span aria-hidden="true">&times;</span>
          </button>
        </div>   
		<div class="row" style="text-align: center">
			<div class="col-md-4" style="text-align: center;margin: 0 auto;">
				<label for="replyPicInput${getListFundMsg.fundMsgId}">							
					<img src="" onerror="nofind${getListFundMsg.fundMsgId}()" id="replyPic${getListFundMsg.fundMsgId}" style="height: 150px; width: 150px">
				</label>
	            <input type="file" class="form-control" placeholder="Enter Pic" id="replyPicInput${getListFundMsg.fundMsgId}" name="file" style="display: none ;" >
			</div>    
		</div>			
		<div class="modal-body">
        	<label for="inputEmail">回覆內容</label>
			<div class="form-label-group">
			<textarea rows="10" cols="10" id="replyPf" name="fundReplyPf" class="form-control" required></textarea>		
			</div>	
       		<button type="submit" class="btn btn-lg btn-success btn-block">送出</button>				
		</div>	
		</form>		
	</div>
	</div>
    </div>
    <script type="text/javascript">  
	function readURL${getListFundMsg.fundMsgId}(img) {
		if (img.files && img.files[0])
			var reader = new FileReader();
		reader.onload = function(e) {
			$("#replyPic${getListFundMsg.fundMsgId}").attr('src', e.target.result);
		}
		reader.readAsDataURL(img.files[0]);
	}

	$("#replyPicInput${getListFundMsg.fundMsgId}").change(function() {
		readURL${getListFundMsg.fundMsgId}(this);
	})	
	
	function nofind${getListFundMsg.fundMsgId}() {
	var img = event.srcElement;
	img.src = "images/reply/inputImages.jpg"; //替換的圖片
	img.onerror = null; //控制不要一直觸發錯誤
}
    </script>
    
		</c:forEach>
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
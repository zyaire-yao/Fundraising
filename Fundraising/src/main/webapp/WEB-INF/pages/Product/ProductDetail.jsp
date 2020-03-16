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
<link href="https://fonts.googleapis.com/css?family=Sriracha&display=swap" rel="stylesheet">
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
<link href="${pageContext.request.contextPath}/css/msg.css" rel="stylesheet">	
<!-- You can use open graph tags to customize link previews.
    Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
  <meta property="og:url"           content="${pageContext.request.contextPath}" />
  <meta property="og:type"          content="website" />
  <meta property="og:title"         content="Your Website Title" />
  <meta property="og:description"   content="Your description" />
  <meta property="og:image"         content="https://www.your-domain.com/path/image.jpg" />


<title>思思募募</title>
</head>
<style>
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
body {
	font-family: 'Noto Sans TC', sans-serif;
	background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg111.png') no-repeat 0% 20%/ cover;
}
@media ( min-width : 768px) {
	.text-md-dark {
		color: #333;
	}
}
.bg-store {
	background-color: rgba(245,245,245,0.6); /* 用RGB 來調整   .6讓他有些透明度*/
}
.bg-cover2{
	object-fit:cover
}
body{
font-family: 'Noto Sans TC', sans-serif;
}
img {
  max-width: 100%; 
   }
.img2{
 height: 390px;

}
.img3{
 height:64.8px;

}
.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
@media screen and (max-width: 996px) {
.preview {
      margin-bottom: 10px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1;
   }

.preview-thumbnail.nav-tabs {
  border: none;
  margin-top: 15px; }
.preview-thumbnail.nav-tabs li {
    width: 18%;
    margin-right: 2.5%; }
.preview-thumbnail.nav-tabs li img {
      max-width: 100%;
      display: block; }
.preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
.preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
.tab-content img {
    width: 100%;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; 
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

.max{width:100%;height:auto;}
.btn-cart .badge {
	position: absolute;
	top:-1px;
	right: -1px;
}
</style>


<body>

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
							<a class="dropdown-item" href="#" onclick="location.href='getAllFundProductForCustomer'">募資商品</a> 
							<a	class="dropdown-item" href="#"
								onclick="location.href='getAllProduct'">商品選購</a>
								
						</div></li>
				</ul>
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
				
<!-- ------------------- -->
<div class="dropdown ml-auto">
				    <button class="btn btn-sm btn-cart" data-toggle="dropdown"
				     data-flip="false" onclick="location.href='FindMemberShoppingCart'">
				     <i class="fas fa-shopping-cart btn-cart text-light fa-2x"></i>
				     <span class="badge badge-danger">${MemberCartCounts}</span>
				    </button>
	   		</div>
				</form>
				
			</div>
		</div>
	</nav>
	<!-- ---- 導覽列----- -->
	<!-- ---- 商品明細----- -->
<div class="container  ">
<nav aria-label="breadcrumb">
  <ol class="breadcrumb bg-transparent pl-0"style="font-family: 'Noto Sans TC', sans-serif">
    <li class="breadcrumb-item"><a href="#" onclick="location.href='${pageContext.request.contextPath}'">首頁</a></li>
    <li class="breadcrumb-item"><a href="#" onclick="location.href='getAllProduct'">商城</a></li>
    <li class="breadcrumb-item active" aria-current="page">${productDetail.productName }</li>
  </ol>
</nav>
	<div class="row " style="background:rgba(0,0,0,0.1);border-radius: 1%;">
		<div class="col-md-6" style="height: 310px;">
			<div class="preview-pic tab-content ">
				<div class="tab-pane active" id="pic-1" style="margin-top: 10px;">
				
				<img src="${productDetail.productPic }" style="width: 100% ; height: 290px;object-fit:contain;"/>
				</div>
			</div>
			
		</div>

		<div class="col-md-6" style="margin-top: 30px;">
		<form action="addShoppingCart" >
		 <div class="sticky-center">
		 	<h2>${productDetail.productName}</h2>
   				 <hr>
   				 <p>${productDetail.productPf}</p>
  				<hr>
  				 <div class="d-flex justify-content-end align-items-end">
<!--   				 	<span class="text-muted">199</span> -->
  				 	<div class="h3 ml-auto mb-0 text-danger">
  				 		<small>售價NT$</small>
  				 		<strong>${productDetail.productPrice }</strong>
  				 	</div>
  				 </div>
  				<hr>
  			<div class="input-group mr-3">
  				<select name="counts" id="" class="form-control mr-1">
  					<option value="1">1</option>
  					<option value="2">2</option>
  					<option value="3">3</option>
  					<option value="4">4</option>
  					<option value="5">5</option>
  					<option value="6">6</option>
  					<option value="7">7</option>
  					<option value="8">8</option>
  					<option value="9">9</option>
  					<option value="10">10</option>
  				</select>
  				
  				<input type="hidden" value="${productDetail.productPic}" name="productPic">
  				<input type="hidden" value="${productDetail.productName}" name="productName">
  				<input type="hidden" value="${productDetail.productPrice}" name="productPrice">
  				<input type="hidden" value="${productDetail.productId}" name="productId">
			<input type="submit" class="btn btn-primary" value="加入購物車">

  			</div>
		 </div>	
		 	</form> 
		</div>
	
	</div>
</div>

	<!-- ---- 商品明細----- -->
	<!-- ---- 商家資料----- -->
	<div class="container">
	<div class="row bg-store " style="border-width: thin;height:150px; border:2px solid rgba(0,0,0,0.1); background-clip: padding-box; margin-top: 10px">
		<div class="col-md-3 my-3" style="text-align: center;">					
	       <img  src="${store.storePic}" id="storePic" style="height: 100px; width: 100px; border-radius: 50%">
	    </div>
	    <div class="col-md-6 py-4">
	    <table class="table" style="width: 600px;">
	    	<tr>
	    		<th scope="col">商家名稱</th>

	    		<th scope="col" style="width:250px;">商家簡介</th>
	    		<th scope="col">商家聯繫方式</th>
	    	</tr>
	    	<tr>
	    			<td scope="row">${store.storeName}</td>
	    			<td scope="row">${store.storePf}</td>
	    			<td scope="row">${store.storeTel}</td>
	    	</tr>	    	
	    	</table>
	    </div>
	    
	    	 <div class="col-md-2 py-4">
	    	 <form action="Addreport">
	    	 <input type="hidden" value="${productDetail.productId}" name="productId">
				<button class="btn btn-lg btn-warning btn-block" type="submit"
					>檢舉</button>
					
					  <!-- Load Facebook SDK for JavaScript -->
					  <div id="fb-root"></div>
					  <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0"></script>
					
					  <!-- Your like button code -->
					<div class="fb-like  py-2"
						data-href="https://developers.facebook.com/docs/plugins/"
						data-width="50px" data-layout="standard" data-action="like"
						data-size="small" data-share="true"></div>

				</form>
			</div>    	
	</div>
	
</div>
	<!-- ---- 商家資料----- -->
	<!-- 留言板 -->
<div class="container">  
<div class="row">
 <div style="background-color: #DDDDDD;" class="col-md-12 my-2">
  <c:if test="${empty sessionScope.memberSession}">
   <!--未登入的話顯示以下文字 -->  
   <p style="text-align: center;">登入才能留言。如有相關提問，請先進行<span><a href="#" onclick="location.href='loginSystem'">登入</a>。</span></p>
  </c:if>
  <c:if test="${not empty sessionScope.memberSession}">
   <button  type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">點此提問</button>
  </c:if>
 
</div> 
</div>
<!--   <hr>  -->
</div>
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">輸入你的留言</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    
      <div class="modal-body"> 
    <!-- 內容 -->  
      <form action="addMsg" method="post" enctype="multipart/form-data" class="form-signin">      
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">留言標題:</label>
            <input type="text" class="form-control" id="recipient-name" name="msgTital">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">留言內容:</label>
            <input type="text" class="form-control" id="recipient-name" name="msgPf">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">上傳圖片:</label>
            <input type="file" class="form-control"  name="file" >
          </div>       
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        <input type="hidden"  value="${productDetail.productId }" name="productId"/>
        <input type="submit" class="btn btn-primary" value="送出"/>
      </div>
      </form>
      
      <!--  -->
      </div>
     
    </div>
  </div>

</div>
<!-- 顯示留言內容 -->

 <div class="container">
 
    <div class="row bg-store" style="border-width: thin; border:2px solid rgba(0,0,0,0.1); background-clip: padding-box;">
    		
    		<!--  -->
    	<div class="msg_history col-md-10 py-5" style="margin: 0 auto;" >
           <c:forEach items="${MsgByProductId}" var="Msg">
            <img src="${Msg.member.memberPic}" width=50px height=50px  style="border-radius: 50%">${Msg.member.memberSname} :
            <div class="incoming_msg">
              <div class="received_msg">
                <div class="received_withd_msg">
                <!-- 客人留言 -->
                  <p>
                  標題:${Msg.msgTital}
                  <br>
                                  內容: ${Msg.msgPf }
                  </p> 
                  <span class="time_date"> ${Msg.msgDate }</span>
                  <c:if test="${not empty Msg.msgPic}">
                  <img src="${Msg.msgPic}"/>
                  </c:if>
                </div>
							<script>
								$('#img').click(function() {
									$(this).toggleClass('img3');
									$(this).toggleClass('max');
								});
							</script>

			<!-- 客人留言 --> 
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
              <!-- 商家留言 -->
              <c:forEach items="${reply}" var="reply">
              <c:if test="${reply.msg.msgId == Msg.msgId}">
              賣家回覆 : 
             <p> ${reply.replyPf}</p>
             <c:if test="${not empty reply.replyPic}">
             <img alt="" src="${reply.replyPic}">
             </c:if>
              </c:if>
              </c:forEach>       
               <!-- 商家留言 --> 
              </div>
            </div>
             <hr>
              </c:forEach>
            </div>
            
    	
    	  	<!--  -->
    </div>

 </div>  


<!-- 留言板 -->
</body>
</html>
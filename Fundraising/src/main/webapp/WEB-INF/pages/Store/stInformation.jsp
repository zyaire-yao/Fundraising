<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap-->
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}' ;
	
//	tabs頁籤function
	function openCity(evt, cityName) {
			  var i, tabcontent, tablinks;
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }
			  tablinks = document.getElementsByClassName("tablinks");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }
			  document.getElementById(cityName).style.display = "block";
			  evt.currentTarget.className += " active";
			}
			
			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
</script>

<title>思思募募</title>
<link href="${pageContext.request.contextPath}/css/stinformation.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">

</head>

<style>
body{
background-image: url('${pageContext.request.contextPath}/images/storePic/background-2.jpg');
background-size: cover;
background-repeat: no-repeat;
font-family: 'Noto Sans TC', sans-serif;
}
div{


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
.ul2{
	position:relative;
	width: 450px;
	box-sizing: border-box;
}	
.ul2 .li2{
	display:flex;
	background: rgba(255,255,255,.2);
	padding: 10PX 20PX;
	margin: 5px 0;
	transition:.5s;
}
.ul2 .li2:hover {
	transform:scale(1.06);
	background:  rgba(0,0,0,.6);
}	

/* ↓↓↓↓↓↓↓↓===tabs 樣式===-↓↓↓↓↓↓↓↓*/
/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid none;
  background-color: transparent;

}

/* Style the buttons inside the tab */
.tab button {
  background-color: rgba(245,245,245,0.6);
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: rgba(105,105,105);
}

/* Create an active/current tablink class */
.tab button.active {
  background-color:rgba(255,255,255);
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid none;
  border-top: none;
  
}
#NewYork{
	display: block;
}
#London{
display: block;
}
</style>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark"  style="background:rgba(0,0,0,0.6);">
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
					<li class="nav-item dropdown">
			<a  class="nav-link dropdown-toggle" href="#"  id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false" > 
			商品 
			</a>
						
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#" onclick="location.href='getAllFundProductForCustomer'">募資商品</a> 
							<a  class="dropdown-item" href="#"  onclick="location.href='getAllProduct'">商品選購</a> 
<!-- 							<a class="dropdown-item" href="#">提出募資專案</a> -->
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
	

<!--    導覽列     -->	

<div  class="row" id="box1"  >
 <div class="col-md-2"  >
    <div class="list-group" id="list-tab" role="tablist">
   
      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">商家資料</a>
       <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">商品修改/上架</a>
      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">募資提案</a>
      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings" >募資查詢</a>
      <a class="list-group-item list-group-item-action"	id="list-orders-list" data-toggle="list" href="#list-orders"role="tab" aria-controls="orders">我的商城訂單</a> 
      <a class="list-group-item list-group-item-action" id="list-check-list"data-toggle="list" href="#list-check" role="tab"aria-controls="check">退貨審核</a>
       <a class="list-group-item list-group-item-action" id="list-fundproject-list" data-toggle="list" href="#list-fundproject" role="tab" aria-controls="fundproject" >我的募資訂單</a>
        <a class="list-group-item list-group-item-action" id="list-productMsg-list" data-toggle="list" href="#list-productMsg" role="tab" aria-controls="productMsg" >我的商品留言</a>
   <a class="list-group-item list-group-item-action" id="list-fundproductMsg-list" data-toggle="list" href="#list-fundproductMsg" role="tab" aria-controls="fundproductMsg" >我的募資留言</a>
    </div>
 
 </div>

	
	<div class="col-md-8" id="box" >
    <div class="tab-content" id="nav-tabContent">
    <!-- 商品編輯-->
    <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
			<div class="row">
						<c:forEach items="${All}" var="all">
							<div class="col-md-6 mb-4 " style="opacity:0.8;" id="touch" >
								<form action="getProductToUpdate" method="post">
									<div class="card text-center"  style="height: 650px">
									
										<img src="${all.productPic}" class="card-img-top  header-carousel-item" style="object-fit:cover" alt="" width="200px" height="250px">
										<hr style=" border: 0;
                                                    height: 1px;
                                                     background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));">
										<div class="card-body mb-4" >
												<div>
													<h5 class="card-title">商品名稱:${all.productName}</h5>
													<p class="card-text">商品簡介:${all.productPf}</p>
													<p class="card-text" >商品編號:${all.productItemNO}</p>
													<p class="card-text" >商品價格:${all.productPrice}</p>
													<input type="hidden" value="${all.productId}" name="productId">
												</div>
										
												<div style="" >
													<input class="btn btn-outline-primary btn-lg btn-block" type="submit"
													value="編輯" >
												</div>	
										</div>
									</div>
								</form>
							</div>
				
						</c:forEach>
						<div class="col-md-6 mb-4 " style="opacity:0.8;"  id="touch" >
									
									<div class="card text-center" style="height: 650px">
									
										
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
											<div >
											<input class="btn btn-outline-primary btn-lg btn-block "
												 type="submit"
												value="上架" onclick="location.href='linkinAddProduct'">
											</div>	
										</div>
									</div>
								
						</div>
				
			</div>		
	</div>

 <!-- ------------------------ -->
  <!--  商家資料 -->  
      <div class="tab-pane fade show active   mx-5" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
		
		  <div class="row">
    		<div class="col-md-7 "  style="font-size: 20px;">
    		<ul class="ul2" style="opacity: 0.9;color: white;">
    			<li class="li2">商家名稱:<span style="padding-left: 20px">${storeSession.storeName}</span></li>
				<li class="li2">商家簡介:<span style="padding-left: 20px">${storeSession.storePf}</span></li>
				<li class="li2">商家電話 : <span style="padding-left: 20px">${storeSession.storeTel}</span></li>
				<li class="li2">商家地址(實體店面):<span style="padding-left: 20px">${storeSession.storeAddress}</span></li>
				<li class="li2">商行號碼 :<span style="padding-left: 20px">${storeSession.storeNumber}</span></li>
				<li class="li2">商行帳戶 :<span style="padding-left: 20px">${storeSession.storeAccount}</span></li>
				<li class="li2">商行負責人姓名 :<span style="padding-left: 20px">${storeSession.storePiName}</span></li>
				<li class="li2">商行負責人身分證 :<span style="padding-left: 20px">${storeSession.storePiTwid}</span></li>
				<li class="li2">商行負責人電話 :<span style="padding-left: 20px">${storeSession.storePiTel}</span></li>
				<li class="li2">商行負責人地址 :<span style="padding-left: 20px">${storeSession.storePiAddress}</span></li>
			</ul>
    		</div>
    		
    		<div class="col-md-5 img-wrap" style="font-size: 20px;color: white; ">
<!--     		display:  flex; -->
<!--      		align-items: center;  justify-content:  center;" -->
     		商家照片:
    		<br> <img  src="${storeSession.storePic}" style="height:250px;width:250px;"><br>
    		</div>
    		
    	</div>
    		<div  class="my-2  px-5">
    		<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
 			修改商家資訊
			</button>
<!--     		 <input type="button" value="修改商家資訊" onclick="location.href='findStoreToUpdate'">   -->
    		</div>
		</div>
		
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
<!----- 募資提案  -->	     
<div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list"  style="font-size: 20px;color:white;">
   
<form action="fundProject" method="post" enctype="multipart/form-data"  > 
	
	<div class="container">	
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">募資專案更新</h1>
			<small style="color: red">*為必填</small>
		</div>
 	<div class="container" >
 		<div class="col-md-7"  style="margin:0 auto;">
 		
 		  <div class="form-group">
		<label >提案名稱 :</label> 
		<input type="text" class="form-control"  value="${getFundProjectTitle}" name="fundProjectTitle">
   </div>

	<div class="form-group">
		<label >提案金額:</label> 
		<input type="text" class="form-control"  value="${getFundProjectTotal}" name="fundProjectTotal">
   </div>
 
 	<div class="form-group">
		<label >提案天數:</label> 
		<input type="text" class="form-control"  value="${getFundProjectDate}" name="fundProjectDate">
   </div>
 
 	<div class="form-group">
		<label > 提案檔案:</label> 
		<input type="file" class="form-control"  name="file" accept=".pdf">
   </div>
 
	<div class="form-group">
		<label > 提案內容:</label> 
		<textarea  class="form-control" style="height: 100px;width: 400px" name="fundProjectPf">${getFundProjectPf}</textarea>
   </div>
	<input class="btn btn-primary" type="submit" value="儲存" >
 		
 		
 		
 		
 		</div>
 	
 	
 	</div>	
 
</div>

</form>

      
      
      </div>
<!---- 募資查詢  --> 
 <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list" style="font-size: 20px;color:white;">
      
      <div>
      <table class="table">
   <thead class="thead-dark">
       <tr>
        <th scope="col">提案名稱:</th>
        <th scope="col">提案內容:</th>
        <th scope="col">提案金額:</th>
        <th scope="col">提案天數:</th>
        <th scope="col">提案狀態:</th>
        <th scope="col"></th>
        <th scope="col"></th>
      </tr>
    </thead>
  
   <tbody>
   <c:forEach items="${test}" var="b" varStatus="st" >
     <tr>
      <form action="getUpdateFundProject" method="get" >
      <c:if test="${b.fundProjectStatus =='審核中'||b.fundProjectStatus =='審核失敗'}">
       <input type="hidden" value="${b.fundProjectId}" name="fundProjectId"> 
       <td width="120px" style="font-size: 20px;color:white;"><c:out value="${b.fundProjectTitle}" /></td>
       <td width="200px"style="font-size: 20px;color:white;height: 100px"><div style="width:100% ; height: 100% ; overflow-x: hidden ; overflow-y: scroll; "><c:out value="${b.fundProjectPf}" /><div></td>
       <td width="120px"style="font-size: 20px;color:white;"><c:out value="${b.fundProjectTotal}" /></td>
       <td width="120px"style="font-size: 20px;color:white;"><c:out value="${b.fundProjectDate}" /></td>
       <td width="120px"style="font-size: 20px;color:white;"><c:out value="${b.fundProjectStatus}" /></td>
       <td width="120px"style="font-size: 20px;color:white;"><input type="button" onclick="downloadFun(<c:out value="${st.count}"/>)" value="下載"></td>
       <td width="40px"style="font-size: 20px;color:white;"><input type="submit" value="更改"></td>
       </c:if>
       <c:if test="${b.fundProjectStatus =='審核通過'}">
       <input type="hidden" value="${b.fundProjectId}" name="fundProjectId"> 
       <td width="120px" style="font-size: 20px;color:white;"><c:out value="${b.fundProjectTitle}" /></td>
       <td width="200px"style="font-size: 20px;color:white;height: 100px"><div style="width:100% ; height: 100% ; overflow-x: hidden ; overflow-y: scroll; "><c:out value="${b.fundProjectPf}" /><div></td>
       <td width="120px"style="font-size: 20px;color:white;"><c:out value="${b.fundProjectTotal}" /></td>
       <td width="120px"style="font-size: 20px;color:white;"><c:out value="${b.fundProjectDate}" /></td>
       <td width="120px"style="font-size: 20px;color:white;"><c:out value="${b.fundProjectStatus}" /></td>
<%--        <td width="120px"style="font-size: 20px;color:white;"><input type="button" onclick="downloadFun(<c:out value="${st.count}"/>)" value="修改募資商品"></td> --%>
        <c:if test="${empty b.fundProducts}">
       <td width="40px"style="font-size: 20px;color:white;"><input type="button" onclick="addFundProduct(<c:out value="${st.count}"/>)" value="新增文案"></td>
       </c:if>       
       <c:if test="${not empty b.fundProducts}">
       <td width="40px"style="font-size: 20px;color:white;"><input type="button" onclick="updateFundProduct(<c:out value="${st.count}"/>)" value="編輯文案"></td>
       <td width="40px"style="font-size: 20px;color:white;"><input type="button" onclick="findAllFundProgramByFundProjectId(<c:out value="${st.count}"/>)" value="新增/編輯方案"></td>
       </c:if>
       </c:if>
      </form>
     </tr>
    <form action="downloadFile" id="downloadFileForm<c:out value="${st.count}"/>" method="get">
     <input type="hidden" value="${b.fundProjectProject}" name="fundProjectProject">
    </form>
    <form action="getAddFundProduct" id="addFundProduct<c:out value="${st.count}"/>" method="get">
    <input type="hidden" value="${b.fundProjectId}" name="fundProjectId">      
    </form>
    <form action="getUpdateFundProduct" id="updateFundProduct<c:out value="${st.count}"/>" method="get">
    <input type="hidden" value="${b.fundProjectId}" name="fundProjectId">      
    </form>
    <form action="findAllFundProgramByFundProjectId" id="findAllFundProgramByFundProjectId<c:out value="${st.count}"/>" method="get">
    <input type="hidden" value="${b.fundProjectId}" name="fundProjectId">      
    </form>
    </c:forEach>
   </tbody>
  </table>
   
  
  
 </div>
      
      </div>
   
   
 <!--    商家訂單查詢 -------------------------------------------------------------------------->
				<div class="tab-pane fade" id="list-orders" role="tabpanel"	aria-labelledby="list-orders-list"style="font-size: 20px; color: white;">
				<div id="tabs">
						    <div class="tab" style="color: white;">
								  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen" >全部</button>
								  <button class="tablinks" onclick="openCity(event, 'Paris')">已受理</button>
								  <button class="tablinks" onclick="openCity(event, 'Tokyo')">備貨中</button>
								  <button class="tablinks" onclick="openCity(event, 'Taiwan')">已出貨</button>
								  <button class="tablinks" onclick="openCity(event, 'USA')">已完成訂單</button>							 
							</div>
				<div id="London" class="tabcontent">
					<table align="center" class="table" style="color: white;">	
						<thead>
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col">查看明細</td>
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">宅配方式</td>
								<td scope="col">貨運名稱</td>
								<td scope="col">配送貨號</td>
								<td scope="col">訂單狀態</td>
								<td scope="col">EDIT</td>
							</tr>
						</thead>
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
							<form action="updateDelivery" method="post">
<!-- 												<table > -->
								<tr align="center">
									<td scope="row">${orderDetailVar.count }</td>							
									<td scope="row">
												<button type="button" class="btn btn-primary"	data-toggle="modal"data-target="#exampleOrderCenter${orderDetail.order.getOrderId()}">查詢明細</button>
														<!-- Modal -->
													<div class="modal fade"	id="exampleOrderCenter${orderDetail.order.getOrderId()}" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalLabelCenter"aria-hidden="true">
														<div class="modal-dialog modal-lg" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel" style="color: black;">訂購人資料</h5>
																		<button type="button" class="close" data-dismiss="modal"aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																</div>
																	<div class="modal-body">
													<!------------------------------------------------------ -->
																	<table class="table">
																		<thead align="center">
																			<tr>
																				<td scope="col">收件人</td>
																				<td scope="col">收件地址</td>
																				<td scope="col">聯絡資訊</td>
																				<td scope="col">訂購日期</td>
																			</tr>
																		</thead>
																		<tbody align="center">
																			<tr>
																				<td scope="row">${orderDetail.order.getOrderName()}</td>
																				<td scope="row">${orderDetail.order.getOrderAddress()}</td>
																				<td scope="row">${orderDetail.order.getOrderPhone()}</td>
																				<td scope="row">	
																						<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
																				</td>
																			</tr>
																		</tbody>
																	</table>
													<!------------------------------------------------------ -->
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"data-dismiss="modal">Close</button>
																</div>
															</div>
														</div>
													</div>																
									</td>								
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
									<td scope="row">${orderDetail.orderDeliveryMethod}</td>
									<td scope="row">
									<c:if test="${orderDetail.orderDeliveryStatus!='退貨處理中'}">
<!-- 									當orderDetail.orderDeliveryName不為空且訂單狀態不是完成訂單時，將對應的貨運名稱直接顯示於選單 -->
											<c:if test="${not empty orderDetail.orderDeliveryName && orderDetail.orderDeliveryStatus!='完成訂單'}">
											<select name="deliveryMethod" >
													<option value="${orderDetail.orderDeliveryName }">${orderDetail.orderDeliveryName }</option>
													<option value="blackCatDelivery">黑貓</option>
													<option value="postDelivery">郵局</option>
											</select>
											</c:if>
		<!-- 									當orderDetail.orderDeliveryName尚未選擇時，將選單選項欲設為請選擇 ------- -->
											<c:if test="${ empty orderDetail.orderDeliveryName }">
											<select name="deliveryMethod" >
													<option value="請選擇">請選擇</option>
													<option value="blackCatDelivery">黑貓</option>
													<option value="postDelivery">郵局</option>
											</select>
<!-- 									-------------------------------------------------------------------------------------------- -->
											</c:if>
									</c:if>
<!-- -------------------------當訂單狀態==完成訂單，直接顯示運送狀態，且不與編輯------------------------------------------------------------ -->										
									<c:if test="${orderDetail.orderDeliveryStatus=='完成訂單'}">
											${orderDetail.orderDeliveryName }
									</c:if>
									</td>
									<td scope="row">
										<c:if test="${orderDetail.orderDeliveryStatus!='退貨處理中'}">										
<!-- 									當orderDetail.orderDeliveryNumber為空時，給個欄位讓商家可以輸入"配送編號" -->
											 	<c:if test="${empty orderDetail.orderDeliveryNumber}">
													<input type="text" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 180px;">
												</c:if> 
<!-- 										當orderDetail.orderDeliveryNumber不為空且訂單狀態不等於完成訂單時，將"配送編號"顯示於欄位內----- -->
												<c:if test="${not empty orderDetail.orderDeliveryNumber &&orderDetail.orderDeliveryStatus!='完成訂單'}">
													<input type="text" value="${ orderDetail.orderDeliveryNumber}" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 180px;">											
												</c:if>
										</c:if>
<!-- -------------------------當訂單狀態==完成訂單，直接顯示訂單編號，且不與編輯------------------------------------------------------------ -->										
										<c:if test="${orderDetail.orderDeliveryStatus=='完成訂單'}">
											${ orderDetail.orderDeliveryNumber}
										</c:if>

									</td>
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>
									
									<td scope="row">		
<!-- 										當orderDeliveryStatus==已受理，給商家可以選擇出貨方式 ----------------------- -->
									<c:if test="${orderDetail.orderDeliveryStatus=='已受理'}">
									<select name="status">
											<option value="請選擇">請選擇</option>
											<option value="prepare">備貨中</option>
											<option value="ship">已出貨</option>
									</select> 
									<input type="hidden" value="${orderDetail.orderDetailId}"	name="orderDetailId"> 										
										<input type="submit" value="修改">
									</c:if>
<!-- 									-------------------------------------------------------------------------------------------------- -->
<!-- 											當orderDeliveryStatus==備貨中||已出貨，將運送方式顯示於選單第一個 --------- -->
									<c:if test="${orderDetail.orderDeliveryStatus=='備貨中'||orderDetail.orderDeliveryStatus=='已出貨'}">
									<select name="status">
											<option value="請選擇">${orderDetail.orderDeliveryStatus}</option>
											<option value="prepare">備貨中</option>
											<option value="ship">已出貨</option>
									</select> 
										<input type="hidden" value="${orderDetail.orderDetailId}"	name="orderDetailId"> 										
										<input type="submit" value="修改">
									</c:if>
<!-- 									-------------------------------------------------------------------------------------------------- -->
									<c:if test="${orderDetail.orderDeliveryStatus=='退貨處理中'}">
									<input type="button" value="退貨處理中" onclick="alert('請至退貨訂單審核!')">
									</c:if>								
									<c:if test="${orderDetail.orderDeliveryStatus=='允許退貨'||orderDetail.orderDeliveryStatus=='拒絕退貨'}">
									<input type="button" value="退貨已處理" onclick="alert('退貨訂單已結案!')">
									</c:if>				
									</td>												
								</tr>
<!-- 												</table> -->
							</form>
						</c:forEach>	
											
					</table>
					</div>
<!-- -------------------------------已受理_頁籤-------------------------------------------------------------- -->					
				<div id="Paris" class="tabcontent">
					<table align="center" class="table" style="color: white;">	
						<thead>
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col">訂購日期</td>
								<td scope="col">收件人</td>
								<td scope="col">收件地址</td>
								<td scope="col">聯絡電話</td>
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">宅配方式</td>														
								<td scope="col">訂單狀態</td>
								<td scope="col">EDIT</td>
							</tr>
						</thead>
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
						<c:if test="${orderDetail.orderDeliveryStatus=='已受理'}">
							<form action="updateDelivery" method="post">
								<tr align="center">
									<td scope="row">${orderDetailVar.count }</td>							
									
									<td scope="row">	
											<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
									</td>	
									<td scope="row">${orderDetail.order.getOrderName()}</td>
									<td scope="row">${orderDetail.order.getOrderAddress()}</td>
									<td scope="row">${orderDetail.order.getOrderPhone()}</td>										
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
									<td scope="row">${orderDetail.orderDeliveryMethod}</td>														
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>								
									<td scope="row">		
<!-- 										當orderDeliveryStatus==已受理，給商家可以選擇出貨方式 ----------------------- -->									
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="prepare">備貨中</option>										
										</select> 
										<input type="hidden" value="${orderDetail.orderDetailId}"	name="orderDetailId"> 										
										<input type="submit" value="修改">								
									</td>																														
										<input type="hidden" placeholder="因共用同個controller，雖沒用到仍需存在"	name="deliveryNumber"	>																																
								</tr>
							</form>
						</c:if>
						</c:forEach>
						</table>
					</div>
<!-- -------------------------------備貨中__頁籤--------------------------------------------------------------------------------------------- -->					
					<div id="Tokyo" class="tabcontent">
						<table align="center" class="table" style="color: white;">	
						<thead>
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col" >訂購日期</td>
								<td scope="col">收件人</td>
								<td scope="col">收件地址</td>	
<!-- 								<td scope="col">聯絡電話</td>				 -->
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">宅配方式</td>	
								<td scope="col">貨運名稱</td>
								<td scope="col">配送貨號</td>													
								<td scope="col">訂單狀態</td>
								<td scope="col">EDIT</td>
							</tr>
						</thead>
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
						<c:if test="${orderDetail.orderDeliveryStatus=='備貨中'}">
							<form action="updateDelivery" method="post">
								<tr align="center" >
									<td scope="row">${orderDetailVar.count }</td>							
									
									<td scope="row" style="width: 100px">	
											<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
									</td>	
									<td scope="row">${orderDetail.order.getOrderName()}</td>
									<td scope="row" style="width: 170px">${orderDetail.order.getOrderAddress()}</td>	
<%-- 									<td scope="row">${orderDetail.order.getOrderPhone()}</td>								 --%>
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
									<td scope="row">${orderDetail.orderDeliveryMethod}</td>	
									<td scope="row">												
			<!-- 									當orderDetail.orderDeliveryName尚未選擇時，將選單選項欲設為請選擇 ------- -->
												<c:if test="${ empty orderDetail.orderDeliveryName }">
												<select name="deliveryMethod" >
														<option value="請選擇">請選擇</option>
														<option value="blackCatDelivery">黑貓</option>
														<option value="postDelivery">郵局</option>
												</select>
												</c:if>
									</td>	
									<td scope="row">										
		<!-- 									當orderDetail.orderDeliveryNumber未輸入時，給個欄位讓商家可以輸入"配送編號" -->
											 	<c:if test="${empty orderDetail.orderDeliveryNumber}">
													<input type="text" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 180px;">
												</c:if> 		
									</td>														
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>								
									<td scope="row">		
<!-- 										當orderDeliveryStatus已在備貨中頁籤，僅給商家出貨選項 ----------------------- -->									
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="ship">已出貨</option>										
										</select> 
										<input type="hidden" value="${orderDetail.orderDetailId}"	name="orderDetailId"> 										
										<input type="submit" value="修改">								
									</td>																														
								</tr>
							</form>
						</c:if>
						</c:forEach>
						</table>
					
					</div>
<!-- -------------------------------已出貨__頁籤--------------------------------------------------------------------------------------------- -->						
					<div id="Taiwan" class="tabcontent">				
					  <table align="center" class="table" style="color: white;">	
						<thead>
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col" >訂購日期</td>
								<td scope="col">收件人</td>
								<td scope="col">收件地址</td>	
<!-- 								<td scope="col">聯絡電話</td>				 -->
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
<!-- 								<td scope="col">宅配方式</td>	 -->
								<td scope="col">貨運名稱</td>
								<td scope="col">配送貨號</td>													
								<td scope="col">訂單狀態</td>
								<td scope="col">EDIT</td>
							</tr>
						</thead>
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
						<c:if test="${orderDetail.orderDeliveryStatus=='已出貨'}">
							<form action="updateDelivery" method="post">
								<tr align="center" >
									<td scope="row">${orderDetailVar.count }</td>							
									
									<td scope="row" style="width: 100px">	
											<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
									</td>	
									<td scope="row">${orderDetail.order.getOrderName()}</td>
									<td scope="row" style="width: 170px">${orderDetail.order.getOrderAddress()}</td>	
<%-- 									<td scope="row">${orderDetail.order.getOrderPhone()}</td>								 --%>
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
<%-- 									<td scope="row">${orderDetail.orderDeliveryMethod}</td>	 --%>
									<td scope="row">												
<!-- 									當orderDetail.orderDeliveryName不為空時，將對應的貨運名稱直接顯示於選單 -->
											<c:if test="${not empty orderDetail.orderDeliveryName }">
											<select name="deliveryMethod" >
													<option value="${orderDetail.orderDeliveryName }">${orderDetail.orderDeliveryName }</option>
													<option value="blackCatDelivery">黑貓</option>
													<option value="postDelivery">郵局</option>
											</select>
											</c:if>
									</td>	
									<td scope="row">										
<!-- 										當orderDetail.orderDeliveryNumber不為空時，將"配送編號"顯示於欄位內----- -->
										<c:if test="${not empty orderDetail.orderDeliveryNumber}">
											<input type="text" value="${ orderDetail.orderDeliveryNumber}" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 180px;">											
										</c:if>		
									</td>														
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>								
									<td scope="row">		
<!-- 										當orderDeliveryStatus已在備貨中頁籤，僅給商家出貨選項 ----------------------- -->									
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="ship">已出貨</option>										
										</select> 
										<input type="hidden" value="${orderDetail.orderDetailId}"	name="orderDetailId"> 										
										<input type="submit" value="修改">								
									</td>																														
								</tr>
							</form>
						</c:if>
						</c:forEach>
						</table>				
					</div>
<!-- ------------------訂單已完成_頁籤-------------------------------------------------------------------------------------- -->					
					<div id="USA" class="tabcontent">
						<table align="center" class="table" style="color: white;">	
						<thead>
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col" >訂購日期</td>
								<td scope="col">收件人</td>
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">商品金額</td>
								<td scope="col">宅配方式</td>
								<td scope="col">貨運名稱</td>
								<td scope="col">配送貨號</td>														
								<td scope="col">訂單狀態</td>
							</tr>
						</thead>
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
						<c:if test="${orderDetail.orderDeliveryStatus=='完成訂單'}">
							<form action="updateDelivery" method="post">
								<tr align="center" >
									<td scope="row">${orderDetailVar.count }</td>								
									<td scope="row" >	
											<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
									</td>	
									<td scope="row">${orderDetail.order.getOrderName()}</td>
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
									<td scope="row">
										<fmt:formatNumber value="${orderDetail.orderDetailPrice }" pattern="###,###,###" />									
									</td>
									<td scope="row">${orderDetail.orderDeliveryMethod}</td>	
									<td scope="row">	${orderDetail.orderDeliveryName }	</td>	
									<td scope="row">	${ orderDetail.orderDeliveryNumber}	</td>														
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>																																		
								</tr>
							</form>
						</c:if>
						</c:forEach>
						</table>
					</div>
					<c:if test="${not empty noItemsOrders}">
						<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
						<h1 align="center" >${noItemsOrders }</h1>
					</c:if>
					</div>
				</div>
<!-- Order__End------------------------------------------------------------------------------------------------------------------------------- -->
	

				<!-- 退貨訂單 -->
				<div class="tab-pane fade" id="list-check" role="tabpanel" aria-labelledby="list-check-list" style="font-size: 20px; color: white;">
					<table align="center" class="table" style="color: white;">
						<thead>
							<tr align="center" style="color: white;">
								<td scope="col">編號</td>
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">商品單價</td>
								<td scope="col">商品總額</td>
								<td scope="col">退貨狀態</td>
								<td scope="col">退貨原因</td>
								<td scope="col">退款方式</td>
								<td scope="col">退貨日期</td>
								<td scope="col">EDIT</td>
							</tr>
						</thead>
						
						<c:forEach items="${storeCheck }" var="sc" varStatus="sct">
							<form action="replyReturnStatus" method="post">
								<!-- 				<table border="1"> -->
								<tr align="center">
									<td scope="row">${sct.count}</td>
									<td scope="row">${sc.productReturnDetailName}</td>
									<td scope="row"><fmt:formatNumber
											value="${sc.productReturnDetailAmount }" pattern="#,###,###" /></td>
									<td scope="row"><fmt:formatNumber
											value="${sc.productReturnDetailPrice }" pattern="#,###,###" /></td>
									<td scope="row"><fmt:formatNumber
											value="${sc.productReturnTotal }" pattern="#,###,###" /></td>
									<td scope="row">${sc.productReturnStatus }</td>
									<td scope="row">${sc.productReturnReason }</td>
									<td scope="row">${sc.productReturnMethod }</td>
									<td scope="row"><fmt:formatDate
											value="${sc.productReturnDate }" pattern="yyyy-MM-dd" /></td>
									<td scope="row">
									<c:if test="${sc.productReturnStatus=='退貨處理中' }">
									<select name="returnSelect"	id="returnSelect">
											<option value="請選擇">請選擇</option>
											<option value="yes">允許退貨</option>
											<option value="no">拒絕退貨</option>
									</select>
									 		<input type="hidden" value="${sc.productReturnId }"name="productReturnId">
									 		<input type="submit" 	value="SUBMIT" onclick="return applicationcheck()">
									 </c:if>
<!-- 									 若訂單狀態已為"允許退活"或"拒絕退貨" ，即不能重複審核!-->
									 <c:if test="${sc.productReturnStatus=='允許退貨' ||sc.productReturnStatus=='拒絕退貨'}">
									 		<input type="button" 	value="程序已完成" onclick="alert('該商品已處理完成，請勿重複審核!')">
									 </c:if>
									 </td>
								</tr>
								<!-- 				</table> -->

							</form>

						</c:forEach>

					</table>
					<c:if test="${not empty noReturn}">
						<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
						<h1 align="center" >${noReturn}</h1>
					</c:if>
				</div>
   
   
   
   
    <!--募資 商品編輯-->
    <div class="tab-pane fade" id="list-fundproduct" role="tabpanel" aria-labelledby="list-fundproduct-list">
   <div class="row">
      <c:forEach items="${AllFundProduct}" var="all">
       <div class="col-md-4 mb-4" style="opacity:0.8;" id="touch" >
        <form action="getUpdateFundProject" method="post">
         <div class="card text-center" >
         
          <img src="${all.fundProductPic}" class="card-img-top  header-carousel-item" style="object-fit:cover" alt="" width="200px" height="150px">
          <hr style=" border: 0;
                                                    height: 1px;
                                                     background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));">
          <div class="card-body mb-4" >
           <h5 class="card-title">商品名稱:${all.fundProductName}</h5>
           <p class="card-text">商品簡介:${all.fundProductPf}</p>
           <p class="card-text" >商品價格${all.fundProductPrice}</p>
           <input type="hidden" value="${all.fundProductId}" name="fundProductId">
            <input class="btn btn-outline-primary btn-lg btn-block"
            data-toggle="button" aria-pressed="false" type="submit"
            value="編輯">
           </div>
         </div>
        </form>
       </div>
    
      </c:forEach>
      <div class="col-md-4 mb-4 " style="opacity:0.8;"  id="touch" >
         
         <div class="card text-center">
         
          
          <img src='${pageContext.request.contextPath}/images/productPic/Plus_symbol.svg' class="card-img-top  header-carousel-item" style="object-fit:contain" alt="" width="200px" height="150px">
    
          <hr style=" border: 0;
      height: 1px;
       background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));">     
          <div class="card-body mb-4">
           <h5 class="card-title">募資商品名稱</h5>
           <p class="card-text" >募資簡介</p>
           <p class="card-text" >商品編號</p>
           <p class="card-text" >募資達標金額</p>
           <input type="hidden" value="${all.fundProductId }" name="fundProductId">
           <input class="btn btn-outline-primary btn-lg btn-block"
            data-toggle="button" aria-pressed="false" type="submit"
            value="上架" onclick="location.href='linkinAddFundProduct'">
          </div>
         </div>
        
      </div>
    
   </div>  
 </div>

 <!-- ------------------------ -->
   
   <!-- 				我的募資訂單查詢 ----------------------------------------------------------------------------------------------------------------------->
				<div class="tab-pane fade" id="list-fundproject" role="tabpanel" aria-labelledby="list-fundproject-list">
				  	<div id="tabs">
						    <div class="tab" style="color: white;">
								  <button class="tablinks" onclick="openCity(event, 'NewYork')" id="defaultOpen" >全部</button>
								  <button class="tablinks" onclick="openCity(event, 'Korea')">已受理</button>
								  <button class="tablinks" onclick="openCity(event, 'Japan')">備貨中</button>
								  <button class="tablinks" onclick="openCity(event, 'Tailand')">已出貨</button>
								  <button class="tablinks" onclick="openCity(event, 'UK')">已完成訂單</button>
							</div>
<!-- 				查詢全部狀態訂單			 ----------------------------------------------------------->
				<div id="NewYork" class="tabcontent">
					<table class="table" style="color: white;">
						<thead align="center" >
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col">收件地址</td>
									<td scope="col">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">物流公司</td>
									<td scope="col">物流單號</td>
									<td scope="col">訂單狀態</td>
									<td scope="col">EDIT</td>
								</tr>
							</thead>
							<c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
							<form action="updateFundOrder" method="post">
							<tbody >
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row">${fundOrderList.fundOrderName }</td>
									<td scope="row">${fundOrderList.fundOrderAddress }</td>
									<td scope="row">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">
										<c:if test="${fundOrderList.fundOrderStatus!='完成訂單'}">
<!-- 									當orderDetail.orderDeliveryName尚未選擇時，將選單選項欲設為請選擇 ------- -->	
											<c:if test="${empty fundOrderList.fundOorderDeliveryName }">										
												<select name="deliveryName" >
													<option value="請選擇">請選擇</option>
													<option value="blackCatDelivery">黑貓</option>
													<option value="postDelivery">郵局</option>
												</select>
											</c:if>
<!-- 									當orderDetail.orderDeliveryName不為空且訂單狀態不是完成訂單時，將對應的貨運名稱直接顯示於選單 -->
											<c:if test="${not empty fundOrderList.fundOorderDeliveryName }">										
											<select name="deliveryName" >
												<option value="${fundOrderList.fundOorderDeliveryName }">${fundOrderList.fundOorderDeliveryName}</option>
												<option value="blackCatDelivery">黑貓</option>
												<option value="postDelivery">郵局</option>
											</select>
											</c:if>
										</c:if>
<!-- -------------------------當訂單狀態==完成訂單，直接顯示運送狀態，且不與編輯------------------------------------------------------------ -->										
										<c:if test="${fundOrderList.fundOrderStatus=='完成訂單'}">
												${fundOrderList.fundOorderDeliveryName }
										</c:if>
									</td>
									<td scope="row">
										<c:if test="${fundOrderList.fundOrderStatus!='完成訂單'}">
<!-- 									當orderDetail.orderDeliveryNumber為空時，給個欄位讓商家可以輸入"配送編號" -->
										<c:if test="${empty fundOrderList.fundOrderDeliveryNumber}">
											<input type="text" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 140px;">
										</c:if> 
<!-- 										當orderDetail.orderDeliveryNumber不為空且訂單狀態不等於完成訂單時，將"配送編號"顯示於欄位內----- -->
										<c:if test="${not empty fundOrderList.fundOrderDeliveryNumber &&fundOrderList.fundOrderStatus!='完成訂單'}">
											<input type="text" value="${ fundOrderList.fundOrderDeliveryNumber}" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 140px;">											
										</c:if>
										</c:if>
<!-- -------------------------當訂單狀態==完成訂單，直接顯示運送狀態，且不與編輯------------------------------------------------------------ -->										
										<c:if test="${fundOrderList.fundOrderStatus=='完成訂單'}">
												${fundOrderList.fundOrderDeliveryNumber}
										</c:if>									
									</td>
									<td scope="row">${fundOrderList.fundOrderStatus }</td>
									<td scope="row">
									<c:if test="${fundOrderList.fundOrderStatus!='完成訂單'}">
											<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="prepare">備貨中</option>
												<option value="ship">已出貨</option>										
											</select>
										<input type="hidden" value="${fundOrderList.fundOrderId }" name="fundOrderId">
										<input type="submit" value="修改">
									</c:if>
									<c:if test="${fundOrderList.fundOrderStatus=='完成訂單'}">
										<div align="center">訂單已完成</div>
									</c:if>
									</td>
								</tr>
							</tbody>
							</form>		
							</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" style="color: white;">${noFundOrder}</h1>
						</c:if>
					</div>
<!-- 					查詢已受理狀態訂單 --------------------------------------------------------------->
					<div id="Korea" class="tabcontent">
					<table class="table" style="color: white;">
						<thead align="center" >
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col">收件地址</td>
									<td scope="col">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">訂單狀態</td>
									<td scope="col">EDIT</td>
								</tr>
							</thead>
					  <c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
						<c:if test="${fundOrderList.fundOrderStatus=='已受理' }">
						  <form action="updateFundOrder" method="post">
							<tbody align="center" >
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row">${fundOrderList.fundOrderName }</td>
									<td scope="row">${fundOrderList.fundOrderAddress }</td>
									<td scope="row">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">
											<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="prepare">備貨中</option>										
											</select>
									</td>
									<td scope="row">
										<input type="hidden" placeholder="因共用同個controller，雖沒用到仍需存在"	name="deliveryNumber"	>
										<input type="hidden" value="${fundOrderList.fundOrderId}" name="fundOrderId">
										<input type="submit" value="修改">
									</td>
								</tr>
							</tbody>
							</form>
						  </c:if>
						</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" style="color: white;">${noFundOrder}</h1>
						</c:if>
					</div>
					
<!-- 					查詢"備貨中"狀態訂單 -------------------------------------------------------------------------------->
					<div id="Japan" class="tabcontent">
					<table class="table" style="color: white;">
						<thead align="center" >
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col">收件地址</td>
									<td scope="col">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">物流公司</td>
									<td scope="col">物流單號</td>
									<td scope="col">EDIT</td>
								</tr>
							</thead>
					  <c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
						<c:if test="${fundOrderList.fundOrderStatus=='備貨中' }">
						  <form action="updateFundOrder" method="post">
							<tbody align="center">
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row">${fundOrderList.fundOrderName }</td>
									<td scope="row">${fundOrderList.fundOrderAddress }</td>
									<td scope="row">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">
<!-- 									當orderDetail.orderDeliveryName尚未選擇時，將選單選項欲設為請選擇 ------- -->	
										<c:if test="${empty fundOrderList.fundOorderDeliveryName }">										
											<select name="deliveryName" >
												<option value="請選擇">請選擇</option>
												<option value="blackCatDelivery">黑貓</option>
												<option value="postDelivery">郵局</option>
											</select>
										</c:if>
<!-- 									當orderDetail.orderDeliveryName不為空且訂單狀態不是完成訂單時，將對應的貨運名稱直接顯示於選單 -->
										<c:if test="${not empty fundOrderList.fundOorderDeliveryName }">										
											<select name="deliveryName" >
												<option value="${fundOrderList.fundOorderDeliveryName }">${fundOrderList.fundOorderDeliveryName}</option>
												<option value="blackCatDelivery">黑貓</option>
												<option value="postDelivery">郵局</option>
											</select>
										</c:if>
<!-- -------------------------當訂單狀態==完成訂單，直接顯示運送狀態，且不與編輯------------------------------------------------------------ -->										
										<c:if test="${fundOrderList.fundOrderStatus=='完成訂單'}">
												${fundOrderList.fundOorderDeliveryName }
										</c:if>
									</td>
									<td scope="row">
<!-- 									當orderDetail.orderDeliveryNumber為空時，給個欄位讓商家可以輸入"配送編號" -->
										<c:if test="${empty fundOrderList.fundOrderDeliveryNumber}">
											<input type="text" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 140px;">
										</c:if> 
<!-- 										當orderDetail.orderDeliveryNumber不為空且訂單狀態不等於完成訂單時，將"配送編號"顯示於欄位內----- -->
										<c:if test="${not empty fundOrderList.fundOrderDeliveryNumber &&fundOrderList.fundOrderStatus!='完成訂單'}">
											<input type="text" value="${ fundOrderList.fundOrderDeliveryNumber}" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 140px;">											
										</c:if>
									</td>
									<td scope="row">
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="ship">已出貨</option>										
											</select>
										<input type="hidden" value="${fundOrderList.fundOrderId }" name="fundOrderId">
										<input type="submit" value="修改">
									</td>
								</tr>
							</tbody>
						  </form>
						  </c:if>
						</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" style="color: white;">${noFundOrder}</h1>
						</c:if>
					</div>
<!-- 					查詢"已出貨"狀態訂單 -------------------------------------------------------------->
					<div id="Tailand" class="tabcontent">
					<table class="table" style="color: white;">
						<thead align="center" >
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col">收件地址</td>
									<td scope="col">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">物流公司</td>
									<td scope="col">物流單號</td>
									<td scope="col">EDIT</td>
								</tr>
							</thead>
					  <c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
						<c:if test="${fundOrderList.fundOrderStatus=='已出貨' }">
						  <form action="updateFundOrder" method="post">
							<tbody align="center">
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row">${fundOrderList.fundOrderName }</td>
									<td scope="row">${fundOrderList.fundOrderAddress }</td>
									<td scope="row">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">
<!-- 									當orderDetail.orderDeliveryName尚未選擇時，將選單選項欲設為請選擇 ------- -->	
										<c:if test="${empty fundOrderList.fundOorderDeliveryName }">										
											<select name="deliveryName" >
												<option value="請選擇">請選擇</option>
												<option value="blackCatDelivery">黑貓</option>
												<option value="postDelivery">郵局</option>
											</select>
										</c:if>
<!-- 									當orderDetail.orderDeliveryName不為空且訂單狀態不是完成訂單時，將對應的貨運名稱直接顯示於選單 -->
										<c:if test="${not empty fundOrderList.fundOorderDeliveryName }">										
											<select name="deliveryName" >
												<option value="${fundOrderList.fundOorderDeliveryName }">${fundOrderList.fundOorderDeliveryName}</option>
												<option value="blackCatDelivery">黑貓</option>
												<option value="postDelivery">郵局</option>
											</select>
										</c:if>
<!-- -------------------------當訂單狀態==完成訂單，直接顯示運送狀態，且不與編輯------------------------------------------------------------ -->										
										<c:if test="${fundOrderList.fundOrderStatus=='完成訂單'}">
												${fundOrderList.fundOorderDeliveryName }
										</c:if>
									</td>
									<td scope="row">
<!-- 									當orderDetail.orderDeliveryNumber為空時，給個欄位讓商家可以輸入"配送編號" -->
										<c:if test="${empty fundOrderList.fundOrderDeliveryNumber}">
											<input type="text" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 140px;">
										</c:if> 
<!-- 										當orderDetail.orderDeliveryNumber不為空且訂單狀態不等於完成訂單時，將"配送編號"顯示於欄位內----- -->
										<c:if test="${not empty fundOrderList.fundOrderDeliveryNumber &&fundOrderList.fundOrderStatus!='完成訂單'}">
											<input type="text" value="${ fundOrderList.fundOrderDeliveryNumber}" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: white; width: 140px;">											
										</c:if>									
									</td>
									<td scope="row">
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="ship">已出貨</option>										
											</select>
										<input type="hidden" value="${fundOrderList.fundOrderId }" name="fundOrderId">
										<input type="submit" value="修改">									
									</td>
								</tr>
							</tbody>
							</form>
						  </c:if>
						</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" style="color: white;">${noFundOrder}</h1>
						</c:if>
					</div>
<!-- 					查詢已完成狀態訂單 ---------------------------------------------------------------------------------->
					<div id="UK" class="tabcontent">
					<table class="table" style="color: white;">
						<thead align="center" >
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col">收件地址</td>
									<td scope="col">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">物流公司</td>
									<td scope="col">物流單號</td>

								</tr>
							</thead>
					  <c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
						<c:if test="${fundOrderList.fundOrderStatus=='完成訂單' }">
						  <form action="updateFundOrder" method="post">
							<tbody align="center">
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row">${fundOrderList.fundOrderName }</td>
									<td scope="row">${fundOrderList.fundOrderAddress }</td>
									<td scope="row">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">${fundOrderList.fundOorderDeliveryName }</td>
									<td scope="row">${fundOrderList.fundOrderDeliveryNumber }</td>

								</tr>
							</tbody>
							</form>
						  </c:if>
						</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" style="color: white;">${noFundOrder}</h1>
						</c:if>
					</div>
					
				 </div>		
				</div>
				
				
				<!-- --ListGroupEnd---------------------- -->
       <!-- 商品留言-->
    <div class="tab-pane fade" id="list-productMsg" role="tabpanel" aria-labelledby="list-productMsg-list">
		<c:forEach items="${getListMsg}" var="getListMsg">
    <div style="color: white;">
		<form action="addReply" method="post" enctype="multipart/form-data"> 
	    	商品名稱 : ${getListMsg.product.productName}
	    	留言標題 : ${getListMsg.msgTital}
	    	留言內容 : ${getListMsg.msgPf}
	    	留言圖片 : <img alt="" src="${getListMsg.msgPic}" style="width: 50px ;height: 50px"> 
	    	留言人 : ${getListMsg.member.memberSname}
	 		<input type="hidden" value="${getListMsg.msgId}" name="msgId">
	 		<input type="hidden" value="${getListMsg.product.productId}" name="productId">
    </div> 
 <!-- 商家回覆顯示 -->    	
    <c:forEach items="${listReply}" var="listReply">
		<c:if test="${listReply.msg.msgId == getListMsg.msgId}"><!-- 如果ID相同 -->
		   <div style="color: white;"> 商家回覆:${listReply.replyPf}</div>
		   <c:if test="${not empty listReply.replyPic}"><!-- 如果圖片不為空 -->
			 <img alt="" src="${listReply.replyPic}" style="width: 100px;height: 100px">
		   </c:if>
		</c:if>
    </c:forEach>   
	<div  class="my-2  px-5">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#replyMsg${getListMsg.msgId}">回覆留言</button>
	</div>		 
    <!-- 按下回覆留言後開啟視窗 -->
    <div class="modal fade" id="replyMsg${getListMsg.msgId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalldLabel" aria-hidden="true">
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
				<label for="replyPicInput${getListMsg.msgId}">							
					<img src="" onerror="nofind${getListMsg.msgId}()" id="replyPic${getListMsg.msgId}" style="height: 150px; width: 150px">
				</label>
	            <input type="file" class="form-control" placeholder="Enter Pic" id="replyPicInput${getListMsg.msgId}" name="file" style="display: none ;" >
			</div>    
		</div>			
		<div class="modal-body">
        	<label for="inputEmail">回覆內容</label>
			<div class="form-label-group">
			<textarea rows="10" cols="10" id="replyPf" name="replyPf" class="form-control" required></textarea>		
			</div>	
       		<button type="submit" class="btn btn-lg btn-success btn-block">送出</button>				
		</div>	
		</form>		
	</div>
	</div>
    </div>
    <script type="text/javascript">  
	function readURL${getListMsg.msgId}(img) {
		if (img.files && img.files[0])
			var reader = new FileReader();
		reader.onload = function(e) {
			$("#replyPic${getListMsg.msgId}").attr('src', e.target.result);
		}
		reader.readAsDataURL(img.files[0]);
	}

	$("#replyPicInput${getListMsg.msgId}").change(function() {
		readURL${getListMsg.msgId}(this);
	})	
	
	function nofind${getListMsg.msgId}() {
	var img = event.srcElement;
	img.src = "images/replyPic/inputImages.jpg"; //替換的圖片
	img.onerror = null; //控制不要一直觸發錯誤
}
    </script>
		</c:forEach>
  </div>
  
  
     <!------------------------- 募資留言------------------>
    <div class="tab-pane fade" id="list-fundproductMsg" role="tabpanel" aria-labelledby="list-fundproductMsg-list">
		<c:forEach items="${getListFundMsg}" var="getListFundMsg">
	
    <div style="color: white;">
		<form action="addFundReply" method="post" enctype="multipart/form-data"> 
	    	商品名稱 : ${getListFundMsg.fundProduct.fundProductName}
	    	留言標題 : ${getListFundMsg.fundMsgTital}
	    	留言內容 : ${getListFundMsg.fundMsgPf}
	    	留言圖片 : <img alt="" src="${getListFundMsg.fundMsgPic}" style="width: 50px ;height: 50px"> 
	    	留言人 : ${getListFundMsg.member.memberSname}
	 		<input type="hidden" value="${getListFundMsg.fundMsgId}" name="fundMsgId">
	 		<input type="hidden" value="${getListFundMsg.fundProduct.fundProductId}" name="fundproductId">
    </div> 
 <!-- 商家回覆顯示 -->    	
    <c:forEach items="${listFundReply}" var="listFundReply">
		<c:if test="${listFundReply.fundMsg.fundMsgId == getListFundMsg.fundMsgId}"><!-- 如果ID相同 -->
		   <div style="color: white;"> 商家回覆:${listFundReply.fundReplyPf}</div>
		   <c:if test="${not empty listFundReply.fundReplyPic}"><!-- 如果圖片不為空 -->
			 <img alt="" src="${listFundReply.fundReplyPic}" style="width: 100px;height: 100px">
		   </c:if>
		</c:if>
    </c:forEach>  
	<div  class="my-2  px-5">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#replyFundMsg${getListFundMsg.fundMsgId}">回覆留言</button>
	</div>		 
    <!-- 按下回覆留言後開啟視窗 -->
    <div class="modal fade" id="replyFundMsg${getListFundMsg.fundMsgId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalFundMsg" aria-hidden="true">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title" id="exampleModalFundMsg">留言回覆</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><!-- X按鈕 -->
            <span aria-hidden="true">&times;</span>
          </button>
        </div>   
		<div class="row" style="text-align: center">
			<div class="col-md-4" style="text-align: center;margin: 0 auto;">
				<label for="fundReplyPicInput${getListFundMsg.fundMsgId}">							
					<img src="" onerror="nofind${getListFundMsg.fundMsgId}()" id="fundReplyPic${getListFundMsg.fundMsgId}" style="height: 150px; width: 150px">
				</label>
	            <input type="file" class="form-control" placeholder="Enter Pic" id="fundReplyPicInput${getListFundMsg.fundMsgId}" name="file" style="display: none ;" >
			</div>    
		</div>			
		<div class="modal-body">
        	<label for="inputEmail">回覆內容</label>
			<div class="form-label-group">
			<textarea rows="10" cols="10" id="fundReplyPf" name="fundReplyPf" class="form-control" required></textarea>		
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
			$("#fundReplyPic${getListFundMsg.fundMsgId}").attr('src', e.target.result);
		}
		reader.readAsDataURL(img.files[0]);
	}

	$("#fundReplyPicInput${getListFundMsg.fundMsgId}").change(function() {
		readURL${getListFundMsg.fundMsgId}(this);
	})	
	
	function nofind${getListFundMsg.fundMsgId}() {
	var img = event.srcElement;
	img.src = "images/replyPic/inputImages.jpg"; //替換的圖片
	img.onerror = null; //控制不要一直觸發錯誤
}
    </script>
		</c:forEach>
  </div>
</div>



       
</div>

<!-- 下載檔案 -->
<script type="text/javascript">  
function downloadFun(st){
	document.getElementById("downloadFileForm" + st).submit();
}
</script>
<!---------------------------->

<!-- 上傳募資文案 -->
<script type="text/javascript">
function addFundProduct(st){
	document.getElementById("addFundProduct" + st).submit();
}
</script>
<!---------------------------->

<!-- 更新募資文案 -->
<script type="text/javascript">
function updateFundProduct(st){
	document.getElementById("updateFundProduct" + st).submit();
}
</script>
<!---------------------------->
<!-- 抓取募資方案 -->
<script type="text/javascript">
function findAllFundProgramByFundProjectId(st){
	document.getElementById("findAllFundProgramByFundProjectId" + st).submit();
}
</script>
<!---------------------------->
<script type="text/javascript">
function applicationcheck() {

	if (confirm("資料是否已確認 ?!")) {
		alert("退貨審核已完畢。");
		return true;
	} else {
		return false;
	}
}
</script>

<script type="text/javascript">
function nofind() {
	var img = event.srcElement;
	img.src = "images/reply/inputImages.jpg"; //替換的圖片
	img.onerror = null; //控制不要一直觸發錯誤
}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/storeRegular.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/allProduct.js" ></script>



</body>
</html>
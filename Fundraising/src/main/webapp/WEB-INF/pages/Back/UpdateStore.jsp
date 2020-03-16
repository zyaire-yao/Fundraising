<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap-->
<meta charset="UTF-8">
<title>思思募募</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet">
</head>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<body align="center" style="font-family:Microsoft JhengHei;">

<!-- 	<h4>商家資料</h4>
	<form action="updateStoreStatus" method="post">
		<input type="hidden" value="${all.storeId}"
			name="storeId">
		<p>商家名稱 :  ${all.storeName}</p>
		<p>商家簡介 :  ${all.storePf}</p>
		<p>商家電話 :  ${all.storeTel}</p>
		<p>商家圖片              :  ${all.storePic}</p>
		<p>商家地址 :  ${all.storeAddress}</p>
		<p>商行號碼 :  ${all.storeNumber}</p>
		<p>商行帳戶 :  ${all.storeAccount}</p>
		<p>商行負責人姓名 :  ${all.storePiName}</p>
		<p>商行負責人身分證 :  ${all.storePiTwid}</p>
		<p>商行負責人電話 :  ${all.storePiTel}</p>
		<p>商行負責人地址 :  ${all.storePiAddress}</p>
		<p>商家狀態 :  ${all.storeStatus}</p>
		
		<select name="status"  id="status">
		<option value="pass">封鎖</option>
		<option value="fail">正常</option>
		</select><br/>

		<input type="hidden" value="${all.storeStatus}">

		<input type="submit" value="儲存">
	</form>
	 -->
<form action="updateBStore" method="post" enctype="multipart/form-data"  class="form-signin"> 
	<input type="hidden" value="${getStore.storeId}" name="storeId" >	
		
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">商家更新</h1>
			<small style="color: red"></small>
		</div>
		
		<img alt="" src="${getStore.storePic}${inputStore.storePic}" style="width: 200px;height: 200px">
        <input type="hidden" value="${getStore.storePic}" name="storePic">
   <div class="form-group">
		<label >商家名稱 :</label> 
		<input type="text" class="form-control"  value="${getStore.storeName}${inputStore.storeName}" name="storeName" readonly="readonly">
   </div>

	<div class="form-group">
		<label >商家簡介:</label> 
		<input type="text" class="form-control"  value="${getStore.storePf}${inputStore.storePf}" name="storePf">${errorPf}
   </div>
   
   <div class="form-group">
		<label >商家電話:</label> 
		<input type="text" class="form-control"  value="${getStore.storeTel}${inputStore.storeTel}" name="storeTel">${errorTel}
   </div>
 
   
    <div class="form-group">
		<label >商家地址:</label> 
		<input type="text" class="form-control"  value="${getStore.storeAddress}${inputStore.storeAddress}" name="storeAddress">${errorAddress}
   </div>
 
     <div class="form-group">
		<label >商家號碼:</label> 
		<input type="text" class="form-control"  value="${getStore.storeNumber}${inputStore.storeNumber}" name="storeNumber">${errorNumber}
   </div>
   
    <div class="form-group">
		<label >商行帳戶:</label> 
		<input type="text" class="form-control"  value="${getStore.storeAccount}${inputStore.storeAccount}" name="storeAccount">${errorAccount}
   </div>
   
   <div class="form-group">
		<label >商行負責人姓名:</label> 
		<input type="text" class="form-control"  value="${getStore.storePiName}${inputStore.storePiName}" name="storePiName">${errorPiName}
   </div>

   <div class="form-group">
		<label >商行負責人身分證:</label> 
		<input type="text" class="form-control"  value="${getStore.storePiTwid}${inputStore.storePiTwid}" name="storePiTwid">${errorPiTwid}
   </div>
   
   <div class="form-group">
		<label >商行負責人電話:</label> 
		<input type="text" class="form-control"  value="${getStore.storePiTel}${inputStore.storePiTel}" name="storePiTel">${errorPiTel}
   </div>
   
   <div class="form-group">
		<label >商行負責人地址 :</label> 
		<input type="text" class="form-control"  value="${getStore.storePiAddress}${inputStore.storePiAddress}" name="storePiAddress">${errorPiAddress}
   </div>
   
   <div class="form-group">
		<label >商家狀態:</label> 
		<select class="custom-select" name="status"  id="status">
		<option value="pass">封鎖</option>
		<option value="fail">正常</option>
		</select>
   </div>
   
   

<input type="submit" value="儲存" class="btn btn-lg btn-success btn-block">
</form>
</body>
</html>
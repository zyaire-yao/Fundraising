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
	<!--<h4>會員資料</h4>
	 <form action="updateMemberStatus" method="post">
		<input type="hidden" value="${all.memberId}"
			name="memberId">
		<p>會員信箱 : ${all.memberEmail}</p>
		<p>會員密碼 : ${all.memberPwd}</p>
		<p>會員姓名 : ${all.memberFname}</p>
		<p>會員暱稱 : ${all.memberSname}</p>
		<p>會員身分證字號 : ${all.memberTwid}</p>
		<p>會員生日 : ${all.memberHb}</p>
		<p>會員性別 : ${all.memberGd}</p>
		<p>會員行動電話: ${all.memberTel}</p>
		<p>會員電話 : ${all.memberCel}</p>
		<p>會員照片 : ${all.memberPic}</p>
		<p>會員狀態 : ${all.memberStatus}</p>
		
		
		<select name="status"  id="status">
		<option value="pass">封鎖</option>
		<option value="fail">正常</option>
		</select><br/>

		<input type="hidden" value="${all.memberStatus}">

		<input type="submit" value="儲存">
	</form>-->
<form action="updateBMember" method="post" enctype="multipart/form-data"  class="form-signin"> 
	<input type="hidden" value="${getMember.memberId}${inputMember.memberId}" name="memberId" >	
		<input type="hidden" value="${all.memberStatus}">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">會員更新</h1>
			<small style="color: red"></small>
		</div>
		
		<img alt="" src="${getMember.memberPic}${inputMember.memberPic}" style="width: 200px;height: 200px; display:block; margin:auto;">
        <input type="hidden" value="${getMember.memberPic}" name="memberPic">
   <div class="form-group">
		<label >會員信箱 :</label> 
		<input type="text" class="form-control"  value="${getMember.memberEmail}${inputMember.memberEmail}" name="memberEmail" readonly="readonly">
   </div>

	<div class="form-group">
		<label >會員名稱:</label> 
		<input type="text" class="form-control"  value="${getMember.memberFname}${inputMember.memberFname}" name="memberFname">${errorFname}
   </div>
 
 	<div class="form-group">
		<label >會員暱稱:</label> 
		<input type="text" class="form-control"  value="${getMember.memberSname}${inputMember.memberSname}" name="memberSname">${errorSname}
   </div>
   
    <div class="form-group">
		<label >身份證字號:</label> 
		<input type="text" class="form-control"  value="${getMember.memberTwid}${inputMember.memberTwid}" name="memberTwid">${errorTwid}
   </div>
 
     <div class="form-group">
		<label >生日:</label> 
		<input type="date" class="form-control"  value="${getMember.memberHb}${inputMember.memberHb}" name="memberHb">${errorHb}
   </div>
   
    <div class="form-group">
		<label >性別:</label> 
		<input type="text" class="form-control"  value="${getMember.memberGd}${inputMember.memberGd}" name="memberGd">${errorGd}
   </div>
   
   <div class="form-group">
		<label >行動電話:</label> 
		<input type="text" class="form-control"  value="${getMember.memberCel}${inputMember.memberCel}" name="memberCel">${errorCel}
   </div>

   <div class="form-group">
		<label >電話:</label> 
		<input type="text" class="form-control"  value="${getMember.memberTel}${inputMember.memberTel}" name="memberTel">
   </div>
   
   <div class="form-group">
		<label >會員狀態:</label> 
		<select class="custom-select"  name="status"  id="status">
		<option value="pass">封鎖</option>
		<option value="fail">正常</option>
		</select>
   </div>
   

   

<input type="submit" value="儲存" class="btn btn-lg btn-success btn-block">
</form>
	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap-->
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}' ;
</script>
<meta charset="UTF-8">
<title>思思募募</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>

<!-- Bootstrap core CSS -->

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
.imgbg{	
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg4.jpg') no-repeat 0% 20%/ cover;
font-family: 'Noto Sans TC', sans-serif;
	}
</style>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet">
</head>
<body class="imgbg">

<div class="container">
<form action="findPwdByEmail" method="post" class="form-signin">

        <div class="text-center mb-4">
			<!--     <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h1 class="h3 mb-3 font-weight-normal" style="color: green;">${success}</h1>
			<h1 class="h3 mb-3 font-weight-normal">查詢密碼</h1>
		</div>

           <div class="form-label-group">
			<input type="text" id="memberEmail" name="memberEmail"
				class="form-control" placeholder="Email address"> 
				<label for="inputPassword">請輸入帳號:</label>
				<small style="color: red">${errorEmail}</small>
				<small id="memberEmailRegularLogin" class="text-danger"></small><br>
		    </div>

           <div class="form-label-group">
			<input type="text" id="memberTwid" name="memberTwId"
				class="form-control" placeholder="Email address"> 
				<label for="inputPassword">請輸入身份證字號:</label>
				<small style="color: red">${errorTwid}</small>
				<small id="memberTwidRegular" class="text-danger"></small><br>
		   </div>
            
           <div class="container">
            
            <div class="row">
            
            
            	<div class="col-md-4">
					<a class="btn btn-lg btn-info btn-block" type="submit" onclick="location.href='findMember'">上一頁</a>
				</div>
				
            	   <div class="col-md-4">
					<button class="btn btn-lg btn-warning btn-block" type="button"
						onclick="location.href='${pageContext.request.contextPath}'">首頁</button>
				</div>
				
				<div class="col-md-4">
					<button class="btn btn-lg btn-success btn-block" type="submit">送出</button>
				</div>
		
              
              </div>
</div> 

</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/memberRegular.js" ></script>
</body>
</html>
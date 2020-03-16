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
<body style="font-family:Microsoft JhengHei;">



<form action="getManagerByManagerAccount" method="post"  class="form-signin" >

		<div class="text-center mb-4">
			<!--     <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h1 class="h3 mb-3 font-weight-normal">Login</h1>
		</div>
		
		<div class="form-group">		
		<label >管理員帳號:</label>
		<input type="text" name="managerAccount" class="form-control">
		</div>
		
		<div class="form-group">		
		<label >管理員密碼:</label>
		<input type="text" name="managerPwd" class="form-control">
		</div>


		<div class="row">
				<div class="col-md-6">
					<input class="btn btn-lg btn-success btn-block" type="submit" value="登入"  onclick="location.href='back'"/>
				</div>



				<div class="col-md-6">
					<input class="btn btn-lg btn-warning btn-block" type="reset"  value="清除">
				</div>


			</div>

</form>
</body>
</html>
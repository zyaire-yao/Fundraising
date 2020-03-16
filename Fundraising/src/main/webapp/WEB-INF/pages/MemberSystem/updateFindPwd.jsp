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
</style>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet">
</head>

<body>


<form action="updatePwdByEmail" method="post" class="form-signin">

        <div class="text-center mb-4">
			<!--     <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h1 class="h3 mb-3 font-weight-normal">忘記密碼 - 更改密碼</h1>
		</div>

           <div class="form-label-group">
			<input type="text" id="memberPwd" name="newPwd1"
				class="form-control" placeholder="Password" required> 
				<label for="inputPassword">請輸入新密碼 :</label>
				<small style="color: red">${errorNewPwd1}</small>
				<small id="memberPwdRegular" class="text-danger"></small><br>
		    </div>
		    
		     <div class="form-label-group">
			<input type="text" id="confirmPwd" name="newPwd2"
				class="form-control" placeholder="Password" required> 
				<label for="inputPassword">請再次輸入新密碼 :</label>
				<small style="color: red">${errorNewPwd2}</small>
				<small id="confirmPwdRegular" class="text-danger"></small><br>
		    </div>
		    
            <input type="hidden" value="${getMember.memberId}" name="memberId">

            <div class="row">
				<div class="col-md-6">
					<button class="btn btn-lg btn-success btn-block" type="submit">送出</button>
				</div>

            <div class="col-md-6">
				<button class="btn btn-lg btn-warning btn-block" type="button"
					onclick="location.href='${pageContext.request.contextPath}'">首頁</button>
			</div>
            </div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/memberRegular.js" ></script>
</body>


</html>
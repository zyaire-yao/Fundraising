<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap-->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<meta charset="UTF-8">
<title>思思募募</title>
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet">
</head>
<style>
body {
	background-color: #f5f5f5;
}


@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<body>



	<form action="addreport" method="post"  class="form-signin">
		 <input type="hidden" value="${productId}" name="productId"> 
		 
		<div class="text-center mb-4">
			<!--     <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h1 class="h3 mb-3 font-weight-normal">檢舉</h1>
		</div>

		<div class="form-label-group">
			<input type="text" id="inputNO" class="form-control"
				placeholder="標題" name="ReportTital"> 
				<label  for="inputNO">標題</label>${errorReportTital}
		</div>

		<div class="form-label-group">
			<input type="text" id="inputname" class="form-control"
				placeholder="檢舉內容" name="ReportPf"> 
				<label  for="inputname">檢舉內容</label>${errorReportPf}
		</div>
		
		<div class="container  my-3">
			<div class="row">
				<div class="col-md-6">
					<button class="btn btn-lg btn-success btn-block" type="submit">送出</button>
				</div>
		

			<div class="col-md-6">
				<button class="btn btn-lg btn-warning btn-block" type="button"
					onclick="location.href='${pageContext.request.contextPath}'">首頁</button>
			</div>
				</div>
		</div>

	</form>




</body>
</html>
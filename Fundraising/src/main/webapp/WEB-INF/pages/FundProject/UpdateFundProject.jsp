<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	rossorigin="anonymous"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<!-- Bootstrap core CSS -->
<script type="text/javascript" nonce="7409969d3b9a447a88bb8e3682a"
	src="//local.adguard.org?ts=1581589242599&amp;type=content-script&amp;dmn=bootstrap.hexschool.com&amp;css=1&amp;js=1&amp;gcss=1&amp;rel=1&amp;rji=1"></script>
<script type="text/javascript" nonce="7409969d3b9a447a88bb8e3682a"
	src="//local.adguard.org?ts=1581589242599&amp;name=AdGuard%20Popup%20Blocker&amp;name=AdGuard%20Assistant&amp;name=AdGuard%20Extra&amp;type=user-script"></script>
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>思思募募</title>
</head>
<body>
<form action="updateFundProject" method="post" enctype="multipart/form-data"  class="form-signin"> 
	<input type="hidden" value="${getFundProjectId}${getFundProject.fundProjectId}" name="FundProjectId">	
		
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">募資專案更新</h1>
			<small style="color: red">*為必填</small>
		</div>

   <div class="form-group">
		<label >*提案名稱 :</label> 
		<input type="text" class="form-control"  value="${getFundProjectTitle}${getFundProject.fundProjectTitle}" name="fundProjectTitle">
   </div>

	<div class="form-group">
		<label >*提案金額:</label> 
		<input type="text" class="form-control"  value="${getFundProjectTotal}${getFundProject.fundProjectTotal}" name="fundProjectTotal">
   </div>
 
 	<div class="form-group">
		<label >*提案天數:</label> 
		<input type="text" class="form-control"  value="${getFundProjectDate}${getFundProject.fundProjectDate}" name="fundProjectDate">
   </div>
 
 	<div class="form-group">
		<label >*提案檔案:</label> 
		<input type="file" class="form-control"  name="file" accept=".pdf">
		<small style="color: red;">${failFileType}${failFileSize}</small>
   </div>
 
	<div class="form-group">
		<label >*提案內容:</label> 
		<textarea  class="form-control" style="height: 100px;width: 400px" name="fundProjectPf">${getFundProjectPf}${getFundProject.fundProjectPf}</textarea>
   </div>
	

<input type="submit" value="儲存" class="btn btn-lg btn-success btn-block">
</form>

</body>
</html>
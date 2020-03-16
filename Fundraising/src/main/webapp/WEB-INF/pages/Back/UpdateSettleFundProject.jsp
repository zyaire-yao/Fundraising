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
	<!--  <h4>審核資料</h4>
	<form action="updateFundProjectStatus" method="post">
		<input type="hidden" value="${getprojects.fundProjectId}"
			name="fundProjectId">
		<p>提案名稱:</p>
		<p>${getprojects.fundProjectTitle}</p>
		<p>提案內容:</p>
		<p>${getprojects.fundProjectPf}</p>
		<p>提案金額:</p>
		<p>${getprojects.fundProjectTotal}</p>
		<p>提案天數:</p>
		<p>${getprojects.fundProjectDate}</p>
		<select name="status"  id="status">
		<option value="pass">審核通過</option>
		<option value="fail">審核失敗</option>
		</select><br/>
		<input type="hidden" value="${getprojects.fundProjectTotal}" name="fundProjectTotal">
		<input type="hidden" value="${getprojects.fundProjectDate}" name="fundProjectDate">
		<input type="hidden" value="${getprojects.fundProjectProject}">
		<input type="hidden" value="${getprojects.fundProjectStatus}">
		<%-- 		<input type="text" value="${getprojects.store}"> --%>

		<input type="submit" value="儲存">
	</form>-->
	<form action="updateFundProjectStatus" method="post" enctype="multipart/form-data"  class="form-signin"> 
	<input type="hidden" value="${getprojects.fundProjectId}" name="fundProjectId" >	
		<input type="hidden" value="${all.memberStatus}">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">提案審核</h1>
			<small style="color: red"></small>
		</div>
		
		<img alt="" src="${getMember.memberPic}${inputMember.memberPic}" style="width: 200px;height: 200px">
        <input type="hidden" value="${getMember.memberPic}" name="memberPic">
   <div class="form-group">
		<label >提案名稱:</label> 
		<input type="text" class="form-control"  value="${getprojects.fundProjectTitle}" name="memberEmail" readonly="readonly">
   </div>

	<div class="form-group">
		<label >提案內容:</label> 
		<input type="text" class="form-control"  value="${getprojects.fundProjectPf}" name="memberFname" readonly="readonly">
   </div>
 
 	<div class="form-group">
		<label >提案金額:</label> 
		<input type="text" class="form-control"  value="${getprojects.fundProjectTotal}" name="memberSname" readonly="readonly">
   </div>
   
    <div class="form-group">
		<label >提案天數:</label> 
		<input type="text" class="form-control"  value="${getprojects.fundProjectDate}" name="memberTwid" readonly="readonly"	>
   </div>

   
   <div class="form-group">
		<label >提案狀態:</label> 
		<select  name="status"  id="status">
		<option value="pass">審核通過</option>
		<option value="fail">審核失敗</option>
		</select>
   </div>
   		<input type="hidden" value="${getprojects.fundProjectTotal}" name="fundProjectTotal">
		<input type="hidden" value="${getprojects.fundProjectDate}" name="fundProjectDate">
		<input type="hidden" value="${getprojects.fundProjectProject}">
		<input type="hidden" value="${getprojects.fundProjectStatus}">
   

<input type="submit" value="儲存" class="btn btn-lg btn-success btn-block">
</form>
</body>
</html>
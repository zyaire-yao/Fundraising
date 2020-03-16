<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>思思募募</title>
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
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}';
</script>
</head>
<body>

<div class="container">

		<div class="text-center mb-4">
			<!--     <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h1 class="h3 mb-3 font-weight-normal">使用者資料更新</h1>
			<small style="color: red">*為必填</small>
		</div>
		
		<form action="memberUpdate" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4" style="text-align: center;">
					<label for="memberPicInput">
	                      <img src="${getMember.memberPic}${memberInput.memberPic}" id="memberPic" style="height: 150px; width: 150px; border-radius: 50%">
	                </label>
	                      <input type="file" class="form-control" placeholder="Enter Pic"  id="memberPicInput" name="file" style="display: none ;" >
	             </div>
	             <div class="col-md-4">
				</div>
			</div>
			<div class="container">
			
				<div class="row">
					
                      
					
					<div class="col-md-6">

                        <div class="form-group">
							<label for="Fname">*姓名(請輸入中文姓名)</label> <input type="text"
								class="form-control" placeholder="Enter Name" name="memberFname"
								id="memberFname" value="${getMember.memberFname}${memberInput.memberFname}">
							<small id="memberFnameRegular" class="text-danger">${errorFname}</small>
						</div>
						
						<div class="form-group">
							<label for="Fname">*暱稱 :</label> <input type="text"
								class="form-control" placeholder="Enter Nickname" name="memberSname"
								id="memberSname" value="${getMember.memberSname}${memberInput.memberSname}">
							<small id="memberFnameRegular" class="text-danger">${errorSname}</small>
						</div>
						
						<div class="form-group">
							<label for="Twid">*身分證字號 身分證字號(第一字母為英文大寫 加 9位數字) </label> 
							<input type="text" class="form-control" placeholder="Enter ID card"
								name="memberTwid" id="memberTwid"
								value="${getMember.memberTwid}${memberInput.memberTwid}">  
								<small id="memberTwidRegular" class="text-danger">${errorTwid}</small>
						</div>
						<div class="form-group">
							<label for="hb">*生日</label> <input type="date"
								class="form-control" placeholder="Enter date" name="memberHb"
								value="${getMember.memberHb}${memberInput.memberHb}" id="memberHb"> 
								<small id="memberHbRegular" class="text-danger">${errorHb}</small>
						</div>
					</div>	
<div class="col-md-6">

<div class="form-group">
<label for="hb">*性別</label><br>
<c:if test="${not empty getMember.memberGd || not empty memberInput.memberGd}">
 <select name="memberGd" id="memberGd"  class="form-control">
  <c:if test="${getMember.memberGd=='男性' || memberInput.memberGd=='男性'}">
　  <option value="${getMember.memberGd}${memberInput.memberGd}">${getMember.memberGd}${memberInput.memberGd}</option>
　  <option value="女性">女性</option>
　  <option value="跨性別">跨性別</option>
  </c:if>
  <c:if test="${getMember.memberGd=='女性' || memberInput.memberGd=='女性'}">
　  <option value="${getMember.memberGd}${memberInput.memberGd}">${getMember.memberGd}${memberInput.memberGd}</option>
　  <option value="男性">男性</option>
　  <option value="跨性別">跨性別</option>
  </c:if>
  <c:if test="${getMember.memberGd=='跨性別' || memberInput.memberGd=='跨性別'}">
　  <option value="${getMember.memberGd}${memberInput.memberGd}">${getMember.memberGd}${memberInput.memberGd}</option>
  　<option value="男性">男性</option>
　  <option value="女性">女性</option>
  </c:if>
 </select>
</c:if>
</div>

                        <div class="form-group">
							<label for="Tel">市內電話 :</label> <input type="text"
								class="form-control" placeholder="Enter Tel" name="memberTel"
								value="${getMember.memberTel}${memberInput.memberTel}" id="Tel">
						</div>

                        <div class="form-group">
							<label for="Cel">*手機 (為09開頭的10位數電話號碼)</label> <input type="text"
								class="form-control" placeholder="Enter Cel" name="memberCel"
								value="${getMember.memberCel}${memberInput.memberCel}" id="memberCel">
							<small id="memberCelRegular" class="text-danger">${errorCel}</small>
						</div>


<input type="hidden" value="${getMember.memberId}${memberInput.memberId}"  name="memberId" id="memberId">
<input type="hidden" value="${getMember.memberPic}${memberInput.memberPic}"  name="memberPic" id="memberPic">
<input type="hidden" value="${getMember.memberStatus}${memberInput.memberStatus}" name="memberStatus" id="memberStatus">
<input type="hidden" value="${getMember.memberEmail}${memberInput.memberEmail}" name="memberEmail" id="memberEmail">
<input type="hidden" value="${getMember.memberPwd}${memberInput.memberPwd}" name="memberPwd" id="memberPwd">
<input type="hidden" value="${getMember.memberCode}${memberInput.memberCode}" name="memberCode" id="memberCode">
	</div>
		</div>
			</div>
			
			  	<div class="row">
				<div class="col-md-6">
					<button class="btn btn-lg btn-success btn-block" type="submit">送出修改</button>
				</div>

				<div class="col-md-6">
					<button class="btn btn-lg btn-warning btn-block" type="button"
						onclick="location.href='${pageContext.request.contextPath}'">首頁</button>
				</div>
				</div>
</form>          
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/memberRegular.js" ></script>

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

</body>
</html>
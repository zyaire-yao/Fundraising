<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="/docs/4.2/dist/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet">
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}';
</script>
<style type="text/css">
.imgbg{	
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg4.jpg') no-repeat 0% 20%/ cover;
font-family: 'Noto Sans TC', sans-serif;
	}
</style>
</head>
<body class="imgbg">
	<div class="container" style="margin: auto; ">
<!-- <main class="page-content"> -->
<div class="container" >
	<form action="addFundProgram" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${FundProductId}" name="fundProductId">
	
	<div class="row" >
	<div class="col-md-6">
<!-- 				<div class="mr-auto col-md-4 ml-auto" style="text-align: center;"> -->
					<label for="memberPicInput"> 
					<img onerror="nofind()" src="${getfundProgram.fundProgramPic}${memberInput.memberPic}"id="memberPic" style="height: 500px; width: 500px; ">
					</label> 
					<input type="file" class="form-control" placeholder="Enter Pic"	id="memberPicInput" name="file" style="display: none;">
<!-- 				</div> -->
	</div>
					<div class="sticky-center">
						<div class="d-flex justify-content-end ">
							<div class="h4 ml-auto mb-0">						
						<div class="form-group">
							<label for="pwd">募資方案金額:</label> <input type="text" class="form-control" placeholder="方案金額"name="fundProgramPrice" id="fundProgramPrice" required> 							
						</div>
						<div class="form-group">
							<label for="Fname">募資方案剩餘數量:</label> <input type="text" class="form-control" placeholder="輸入數量" name="fundProgramLast"id="fundProgramLast" required>			
						</div>
						<div class="form-group">
							<label for="Sname">募資方案內容:</label> <br>
							<textarea placeholder="輸入內容" name="fundProgramPf" id="fundProgramPf" style="height: 200px" required></textarea>
<!-- 							<input type="text"class="form-control" placeholder="輸入內容"name="fundProgramPf" id="fundProgramPf"required> 								 -->
						</div>
						</div>
						</div>
					</div>
					</div>
				<div class="row">
					<div class="col-md-6">
						<button class="btn btn-lg btn-success btn-block" type="submit">上架方案</button>
					</div>
					<div class="col-md-6">
						<button class="btn btn-lg btn-warning btn-block" type="button"onclick="location.href='FindFundProject'">上一頁</button>
					</div>
				</div>
			<hr style=" border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));">
	</form>
</div>
<div class="container">						
   			 <div class="row" style="font-size: 15px;">
						<c:forEach items="${AllFundProgram}" var="allFundProgram" varStatus="st">
							<div class="col-md-3 mb-4 " style="opacity:0.8;" id="touch" >							
									<div class="card cards text-center"  >									
												<div class="card-body mb-4" >
														<div>														
																<p class="card-text" ><img width="125px" height="100px"	src="${allFundProgram.fundProgramPicture}"></p>
																<p class="card-text" >方案金額:${allFundProgram.fundProgramPrice}</p>
																<p class="card-text" >方案內容:${allFundProgram.fundProgramPf}</p>
																<p class="card-text" >商品剩餘數量:${allFundProgram.fundProgramLast}</p>
																<hr style=" border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));">
																													
														</div>										
												</div>
									</div>				
							</div>						  						
						</c:forEach>			
			</div>
	
</div>
<!--  </main>	 -->
</div>
	

	
<script type="text/javascript">
	function readURL(img) {
		if (img.files && img.files[0])
			var reader = new FileReader();
		reader.onload = function(e) {
			$("#memberPic").attr('src', e.target.result);
		}
		reader.readAsDataURL(img.files[0]);
	}

	$("#memberPicInput").change(function() {
		readURL(this);
	})

</script>

</body>



<script type="text/javascript">
	function nofind() {
		var img = event.srcElement;
		img.src = "images/productPic/T1213121.jpg"; //替換的圖片
		img.onerror = null; //控制不要一直觸發錯誤
	}
</script>

</html>
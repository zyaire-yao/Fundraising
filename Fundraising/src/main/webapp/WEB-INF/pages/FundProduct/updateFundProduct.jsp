<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<link href="https://fonts.googleapis.com/css?family=Sriracha&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ProductDetail.css">
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
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/css/msg.css" rel="stylesheet">	
<link href="${pageContext.request.contextPath}/css/fuDetail.css" rel="stylesheet">	
<title>思思募募</title>
</head>
<style>
#box {
	margin:0 auto;
	background:rgba(0,0,0,0.6);
	border-radius:1%;
	font-family: 'Noto Sans TC', sans-serif;
	padding-top: 10px;
	padding-bottom: 5px;
	width: 900px;
	margin-top: 10%;
}

.imgbg{	
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg4.jpg') no-repeat 0% 20%/ cover;
font-family: 'Noto Sans TC', sans-serif;
	}
.bgMsg {
	background-color: rgba(0,0,0,.6)
}
</style>
<body class="imgbg">
 <main class="page-content" style="padding-top: 10%;">
<div class="container"style=" background-color: rgba(158,158,158,0.3);  border-radius: 10px; " >
<form action="updateFundProduct" method="post" enctype="multipart/form-data">
<h1 align="center">募資商品資料更新</h1>
<div class="row" >			
			<div class="col-md-6" >
					<div class="tab-pane active" id="pic-1">
						<label for="fundProductPicInput" >	
						<img src="${FundProductPic}${getFundProduct.fundProductPic}" id="memberPic"  style="border-radius: 10px;width: 560px;height: 320px;"  title="點我編輯">${errorPicSize}${errorFileType}
						<small><<點擊圖片編輯>></small>
						</label>
						<input type="file" class="form-control" placeholder="Enter Pic"  id="fundProductPicInput" name="file" style="display: none ;" >
					</div>				
			</div>
			<div class="" align="left">		
					<div class="sticky-center">
						 <hr>
						<div class="d-flex justify-content-end align-items-end">
							<div class="h3 ml-auto mb-0 text-danger">
								<p>募資商品名稱 : ${FundProductName}${getFundProduct.fundProductName}</p>
								<p>募資總金額：<strong>NT$<fmt:formatNumber value="${FundProductPrice}${getFundProduct.fundProductPrice}" pattern="###,###,###,###"/></strong></p>
								<p>結束天數: <strong >${LastDate}</strong>日</p>
								 募資商品說明:<textarea class="form-control"name="fundProductDetail">${FundProductDetail}${getFundProduct.fundProductDetail}</textarea>
								 <small style="color: red;'">${errorDetail}</small>
							</div>	
						</div>
						<hr>	
						<div>		
								<input type="hidden" value="${fundProject.fundProjectTitle}${getFundProduct.fundProductName}" name="fundProductName">
								<input type="hidden" value="${FundProductId}${fundProductId}" name="fundProductId">
  								<input type="hidden" value="${fundProject.fundProjectId}" name="fundProjectId">
  								<input type="hidden" value="${fundProject.fundProjectPf}${getFundProduct.fundProductPf}" name="fundProductPf">
								<input class="btn btn-primary align-items-center" type="submit"value="儲存" >
								<button class="btn btn-primary align-items-center" type="button" onclick="location.href='FindFundProject'">返回上頁</button>
						</div>
				</div>				
			</div>
</div>
</form>
</div>
</main>

<script type="text/javascript">
	function readURL( img ){
		if( img.files && img.files[0] )
			var reader = new FileReader();
		reader.onload = function(e){
			$("#productPic").attr('src' , e.target.result );
		}
		reader.readAsDataURL(img.files[0]) ;
	}
	$("#productPicInput").change(function(){
		readURL(this) ;
	})
</script>

</body>


</html>
	
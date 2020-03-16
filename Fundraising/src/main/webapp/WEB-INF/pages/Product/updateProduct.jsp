<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<title>更新商品資料</title>
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


		
<form action="updateProduct" method="post" enctype="multipart/form-data"  class="form-signin">	

		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">商品資料更新</h1>
			<small style="color: red">*為必填</small>
		</div>
		
	
<!-- 商品圖片 -->	
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4" style="text-align: center;">
					<label for="productPicInput">
	                      <img src="${getProduct.productPic}${productInp.productPic}" id="productPic"  style="height: 150px; width: 150px; border-radius: 50%">
	                </label>
	                      <input type="file" class="form-control" placeholder="Enter Pic"  id="productPicInput" name="file" style="display: none ;" >
	             </div>
	             <div class="col-md-4">
				</div>
			</div>
<!-- 商品圖片 -->




			
					
					    <div class="form-group">
							<label for="productItemNO">*商品編號 :</label> 
							<input type="text" readonly="readonly"
								class="form-control" placeholder="Enter productItemNO" name="productItemNO"
								id="productItemNO" value="${getProduct.productItemNO}${productInp.productItemNO}"  required>${errorIremNO1}${errorIremNO2}
						</div>
					
					    <div class="form-group">
							<label for="productName">*商品名稱 :</label> 
							<input type="text"
								class="form-control" placeholder="Enter productName" name="productName"
								id="productName" value="${getProduct.productName}${productInp.productName}"  required>${errorName}
						</div>
					
						
			
					
					
					<div class="form-group">
							<label for="productPrice">*商品價格 :</label> 
							<input type="text"
								class="form-control" placeholder="Enter productPrice" name="productPrice"
								id="productPrice" value="${getProduct.productPrice}${productInp.productPrice}"
								onkeyup="value=value.replace(/[^\d]/g,'') "  required>${errorPrice}
						</div>
						
						<div class="form-group">
							<label for="productStatus">*商品狀態 :</label> 
							<input type="text"
								class="form-control" placeholder="Enter productStatus" name="productStatus"
								id="productStatus" value="${getProduct.productStatus}${productInp.productStatus}"  required>
						</div>
						
						<div class="form-group">
<!-- 							<label for="productPf">*商品簡介 :</label>  -->
<!-- 							<input type="text" -->
<!-- 								class="form-control" placeholder="Enter productPf" name="productPf" -->
<%-- 								id="productPf" value="${getProduct.productPf}"> --%>
								<label>商品簡介</label>
								<textarea class="form-control" style="height: 100px;width: 390px" name="productPf"  required>${getProduct.productPf}${productInp.productPf}</textarea>
						</div>
					
					
					  <input type="hidden" value="${getProduct.productId}" name="productId">
				
					<input type="submit" value="儲存" class="btn btn-lg btn-success btn-block"><br>


					</form>
					
			




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
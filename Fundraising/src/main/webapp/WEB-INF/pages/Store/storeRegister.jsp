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
<title>商家註冊</title>
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
</head>
<body style="background-image:url('images/test123.jpg'); ">


<div class="container">

		<div class="text-center mb-4">
			<!--     <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h1 class="h3 mb-3 font-weight-normal">商家註冊</h1>
			<small style="color: red">*為必填</small>
		</div>


<form action="addStore" method="post" enctype="multipart/form-data">

<div class="row">
          <div class="col-md-4">
				</div>
				<div class="col-md-4" style="text-align: center;">
					<label for="memberPicInput">
	                      <img onerror="nofind()" src="${getMember.memberPic}${memberInput.memberPic}"  id="memberPic" style="height: 150px; width: 150px; border-radius: 50%">
	                </label>
	                      <input type="file" class="form-control" placeholder="Enter Pic"  id="memberPicInput" name="file" style="display: none ;" >
	                      ${errorPicFormat}${errorPicSize}
	             </div>
	             <div class="col-md-4">
		  </div>
</div>

			<div class="container">
				<div class="row">
					<div class="col-md-6">

						<div class="form-group">
							<label for="storeName">*商家名稱 (商家名稱不可重複)</label> 
							<input type="text" class="form-control" placeholder="Enter storeName"
								name="storeName" id="storeName" value="${storeInput.storeName}"> 
								<div id="storeNameRegular" style="color: red">${errorName} ${errorRepeat}</div>
						</div>
						
						<div class="form-group">
							<label for="storePf">*商家簡介</label> 
							<input type="text" class="form-control" placeholder="Enter storePf"
								name="storePf" id="storePf" value="${storeInput.storePf}"> 
								<div id="storePfRegular" style="color: red">${errorPf}</div>
						</div>
											
						<div class="form-group">
							<label for="storeTel">*商家電話 (輸入加入區碼數字 EX:0289123456)</label> 
							<input type="text" class="form-control" placeholder="Enter storePf"
								name="storeTel" id="storeTel" value="${storeInput.storeTel}"> 
								<div id="storeTelRegular" style="color: red">${errorTel}</div>
						</div>
						
					    <div class="form-group">
							<label for="storeAddress">商家地址(實體店面)</label> 
							<input type="text" class="form-control" placeholder="Enter storeAddress"
								name="storeAddress" id="storeAddress" value="${storeInput.storeAddress}"> 
						</div>
						
						<div class="form-group">
							<label for="storeNumber">*商行號碼 (數字8碼商行號碼)</label> 
							<input type="text" class="form-control" placeholder="Enter storeNumber"
								name="storeNumber" id="storeNumber" value="${storeInput.storeNumber}"> 
						  <div id="storeNumberRegular" style="color: red">${errorNumber}</div>
						</div>
						
                </div>

          <div class="col-md-6">
					    <div class="form-group">
							<label for="storeAccount">*商行帳戶 (只能輸入數字 最多25碼)</label> 
							<input type="text" class="form-control" placeholder="Enter storeAccount"
								name="storeAccount" id="storeAccount" value="${storeInput.storeAccount}"> 
							<div id="storeAccountRegular" style="color: red">${errorAccount}</div>
						</div>

                        <div class="form-group">
							<label for="storePiName">*商行負責人姓名 (請輸入中文名)</label> 
							<input type="text" class="form-control" placeholder="Enter storePiName"
								name="storePiName" id="storePiName" value="${storeInput.storePiName}"> 
							<div id="storePiNameRegular" style="color: red">${errorPiName}</div>
						</div>
						
					    <div class="form-group">
							<label for="storePiTwid">*商行負責人身分證 (第一英文字母大寫 加九位數字)</label> 
							<input type="text" class="form-control" placeholder="Enter storePiTwid"
								name="storePiTwid" id="storePiTwid" value="${storeInput.storePiTwid}"> 
							<div id="storePiTwidRegular" style="color: red">${errorPiTwid}</div>
						</div>
						
					    <div class="form-group">
							<label for="storePiTel">*商行負責人手機號碼 (為09開頭的10位數電話號碼)</label> 
							<input type="text" class="form-control" placeholder="Enter storePiCel"
								name="storePiTel" id="storePiTel" value="${storeInput.storePiTel}"> 
							<div id="storePiTelRegular" style="color: red">${errorPiTel}</div>
						</div>
						
						<div class="form-group" >
							<label for="storePiAddress">*商行負責人地址 (請輸入中文地址)</label> 
							<input type="text" class="form-control" placeholder="Enter storePiAddress" 
								name="storePiAddress" id="storePiAddress" value="${storeInput.storePiAddress}"> 
							<div id="storePiAddressRegular" style="color: red">${errorPiAddress}</div>
						</div>
                    </div>
                </div>
             </div>

	          <div class="row">
				<div class="col-md-6">
					<button class="btn btn-lg btn-success btn-block" type="submit">送出</button>
				</div>

				<div class="col-md-6">
					<button class="btn btn-lg btn-warning btn-block" type="button"
						onclick="location.href='${pageContext.request.contextPath}'">首頁</button>
				</div>
			  </div>
			  
			  	<div>
				<br>
				</div>
				<input type="button" class="btn btn-lg btn-warning btn-block" 
				value="一鍵輸入" id="allInOne"> 
 
</form>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/storeRegular.js" ></script>
</body>

<script type="text/javascript">

//一鍵輸入
$(".container").on("click", "#allInOne", function() {
	
	$("#storeName").val("無心藝創意實驗室");
	$("#storePf").val("服務時間：週一-週五 10：00-18：00 (例假日休息)");
	$("#storeTel").val("0289123456");
	$("#storeAddress").val("新店區中正路一段200號一樓");
	$("#storeNumber").val("12345678");
	$("#storeAccount").val("012345678901234567890");
	$("#storePiName").val("黃楚堯");
	$("#storePiTwid").val("F126689338");
	$("#storePiTel").val("0911123123");
	$("#storePiAddress").val("新店區中正路一段200號一樓");

});

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

<script type="text/javascript">
		function nofind() {
			var img = event.srcElement;
			img.src = "images/storePic/T1213121.jpg"; //替換的圖片
			img.onerror = null; //控制不要一直觸發錯誤
		}
</script>

</html>
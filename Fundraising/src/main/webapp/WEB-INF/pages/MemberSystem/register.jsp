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
<title>註冊</title>
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
<body>

	<div class="container">

		<div class="text-center mb-4">
			<!--     <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h1 class="h3 mb-3 font-weight-normal">使用者註冊</h1>
			<small style="color: red">*為必填</small>
		</div>

		<form action="registerMember" method="post" enctype="multipart/form-data">

			<div class="row">
				<div class="mr-auto col-md-4 ml-auto" style="text-align: center;">
					<label for="memberPicInput"> 
					<img onerror="nofind()" src="${getMember.memberPic}${memberInput.memberPic}"
						id="memberPic" style="height: 150px; width: 150px; border-radius: 50%">
					</label> 
					<input type="file" class="form-control" placeholder="Enter Pic"
						id="memberPicInput" name="file" style="display: none;">
				</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-md-6">

						<div class="form-group">
							<label for="account">*信箱 (包含 @ 信箱)</label> <input type="text"
								class="form-control" placeholder="Enter Email"
								name="memberEmail" id="memberEmail" required>
							<div id="memberEmailRegular">${errorEmail}</div>
							<c:if test="${not empty errorAccount}">
								帳號已註冊 可更改為:
							<c:forEach var="a11at" items="${errorAccount}">
									<div style="color: red">${a11at}</div>
								</c:forEach>
							</c:if>
						</div>

						<div class="form-group">
							<label for="pwd">*密碼 (6~12長度 ,包含數字及英文字母)</label> <input
								type="text" class="form-control" placeholder="Enter Password"
								name="memberPwd" id="memberPwd" required> 
								<div id="memberPwdRegular" style="color: red">${errorPwd}</div>
						</div>

						<div class="form-group">
							<label for="pwd">*確認密碼</label> <input type="text"
								class="form-control" placeholder="Enter Password"
								name="confirmPwd" id="confirmPwd" required> 
								<div id="confirmPwdRegular" style="color: red">${errorPwd2}</div>
						</div>

						<div class="form-group">
							<label for="Fname">*姓名(請輸入中文姓名)</label> <input type="text"
								class="form-control" placeholder="Enter Name" name="memberFname"
								id="memberFname" value="${inputMember.memberFname}" required>
							<div id="memberFnameRegular" style="color: red">${errorFname}</div>
						</div>

						<div class="form-group">
							<label for="Sname">*暱稱</label> <input type="text"
								class="form-control" placeholder="Enter Nickname"
								name="memberSname" id="memberSname"
								value="${inputMember.memberSname}" required> 
								<div id="memberSnameRegular" style="color: red">${errorSname}</div>
						</div>

					</div>


					<div class="col-md-6">

						<div class="form-group">
							<label for="Twid">*身分證字號 (第一字母為英文大寫)</label> <input type="text"
								class="form-control" placeholder="Enter ID card"
								name="memberTwid" id="memberTwid"
								value="${inputMember.memberTwid}" required> 
								<div id="memberTwidRegular" style="color: red">${errorTwid}</div>
						</div>

						<div class="form-group">
							<label for="hb">*生日</label> <input type="date"
								class="form-control" placeholder="Enter date" name="memberHb"
								value="${inputMember.memberHb}" id="memberHb" required>
							<div id="memberHbRegular" style="color: red">${errorHb}</div>
						</div>

						<div class="form-group">
							<label for="hb">*性別</label>
							<c:if test="${inputMember.memberGd ==null}">
								<select name="memberGd" id="memberGd" class="form-control">
									<option value="男性">男性</option>
									<option value="女性">女性</option>
									<option value="跨性別">跨性別</option>
								</select>
							</c:if>

							<c:if test="${not empty inputMember.memberGd}">
								<select name="memberGd" id="memberGd">
									<c:if test="${inputMember.memberGd=='男性'}">
										<option value="${inputMember.memberGd}">${inputMember.memberGd}</option>
										<option value="女性">女性</option>
										<option value="跨性別">跨性別</option>
									</c:if>
									<c:if test="${inputMember.memberGd=='女性'}">
										<option value="${inputMember.memberGd}">${inputMember.memberGd}</option>
										<option value="男性">男性</option>
										<option value="跨性別">跨性別</option>
									</c:if>
									<c:if test="${inputMember.memberGd=='跨性別'}">
										<option value="${inputMember.memberGd}">${inputMember.memberGd}</option>
										<option value="女性">男性</option>
										<option value="跨性別">女性</option>
									</c:if>
								</select>
							</c:if>
						</div>

						<div class="form-group">
							<label for="Tel">電話</label> <input type="text"
								class="form-control" placeholder="Enter Tel" name="memberTel"
								value="${inputMember.memberTel}" id="memberTel">

						</div>

						<div class="form-group">
							<label for="Cel">*手機 (為09開頭的10位數電話號碼)</label> <input type="text"
								class="form-control" placeholder="Enter Cel" name="memberCel"
								value="${inputMember.memberCel}" id="memberCel" required>
							<div id="memberCelRegular" style="color: red">${errorCel}</div>
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
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/memberRegular.js"></script>

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

	//一鍵輸入使用
	$(".container").on("click", "#allInOne", function() {

		$("#memberEmail").val("descki0611@gmail.com");
		$("#memberPwd").val("qqq123");
		$("#confirmPwd").val("qqq123");
		$("#memberFname").val("黃楚堯");
		$("#memberSname").val("堯堯");
		$("#memberTwid").val("F123456789");
		$("#memberHb").val("1986-06-11");
		$("#memberGd").val("男性");
		$("#memberTel").val("0289115123");
		$("#memberCel").val("0909797622");

	});
</script>

</body>



<script type="text/javascript">
	function nofind() {
		var img = event.srcElement;
		img.src = "images/memberPic/T1213121.jpg"; //替換的圖片
		img.onerror = null; //控制不要一直觸發錯誤
	}
</script>

</html>
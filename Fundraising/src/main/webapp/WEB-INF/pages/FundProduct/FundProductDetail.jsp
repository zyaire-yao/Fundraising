<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
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
<link href="${pageContext.request.contextPath}/css/msg.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/fuDetail.css"
	rel="stylesheet">
<title>思思募募</title>
</head>
<style>
body {
	background: linear-gradient(rgba(255, 255, 255, 0.5),
		rgba(255, 255, 255, 0.5)),
		url('${pageContext.request.contextPath}/images/productPic/bg111.png')
		no-repeat 0% 20%/cover;
}
</style>


<body class="imgbg">

	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background: rgba(0, 0, 0, 0.6)">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src='${pageContext.request.contextPath}/images/HomePagePic/thumbs-up.svg'
				width="40px" height="30px" alt=""> 思思募募
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#"
						onclick="location.href='${pageContext.request.contextPath}'">首頁
							<span class="sr-only">(current)</span>
					</a></li>
					<c:if test="${not empty sessionScope.memberSession}">
						<!-- 如果不為空 才顯示 -->
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="location.href='findMember'">會員專區</a></li>

						<c:if test="${empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<li class="nav-item"><a class="nav-link" href="#"
								onclick="location.href='registerStore'">註冊商家</a></li>
						</c:if>

						<c:if test="${not empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<li class="nav-item"><a class="nav-link" href="#"
								onclick="location.href='findStore'">賣家中心</a></li>
						</c:if>
					</c:if>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 商品 </a>

						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#"
								onclick="location.href='getAllFundProductForCustomer'">募資商品</a>
							<a class="dropdown-item" href="#"
								onclick="location.href='getAllProduct'">商品選購</a>
						</div></li>
				</ul>
				<form class="form-inline">


					<c:if test="${sessionScope.memberSession == null}">
						<!-- 如果不為空 才顯示 -->
						<a href="#" class="btn btn-outline-primary mr-1"
							onclick="location.href='loginSystem'">登入</a>
					</c:if>

					<c:if test="${sessionScope.memberSession != null}">
						<!-- 如果不為空 才顯示 -->
						<a href="#" class="btn btn-outline-primary mr-1"
							onclick="location.href='outSystem'">登出</a>
					</c:if>

					

					<!-- -----會員頭貼-------- -->
					<c:if test="${not empty sessionScope.get('memberSession')}">
						<!-- 如果不為空 才顯示 -->
						<div class="nav-link">
							<img onerror="nofind()"
								src="${sessionScope.get('memberSession').memberPic}"
								style="height: 29px; width: 29px; border-radius: 50%">
						</div>
						<div style="color: white;">
							${sessionScope.get('memberSession').memberSname}</div>

					</c:if>
					<!-- ------------------- -->
				</form>
			</div>
		</div>
	</nav>
	<!-- ---- 導覽列----- -->
	<!-- ---- 商品明細----- -->
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb bg-transparent pl-0"
				style="font-family: 'Noto Sans TC', sans-serif;">
				<li class="breadcrumb-item"><a href="#"
					onclick="location.href='${pageContext.request.contextPath}'">首頁</a></li>
				<li class="breadcrumb-item active" aria-current="page">${fundProductDetail.fundProductName }</li>
			</ol>
		</nav>
		<div class="row">
			<div class="col-md-6" style="height: 300px">
				<div class="tab-pane active" id="pic-1">
					<img src="${fundProductDetail.fundProductPic}" class="card-img-top"
						alt="" height="400px" width="250px">
				</div>

			</div>


			<div class="col-md-6">

				<div class="sticky-center">
					<h2>${fundProductDetail.fundProductName }</h2>
					<hr>
					<p class="text-break">${fundProductDetail.fundProductDetail}</p>
					<hr>
					<div class="d-flex justify-content-end align-items-end">
						<!--   				 	<span class="text-muted">199</span> -->
						<div class="h3 ml-auto mb-0 text-danger">
							<small>募款達標金額NT$</small> <strong>${fundProductDetail.fundProductPrice}</strong>
						</div>
					</div>
					<div class="d-flex justify-content-end align-items-end">
						<div class="h3 ml-auto mb-0 text-danger">
							<small>現在金額:</small> <strong>${totalPrice}</strong>
						</div>
					</div>
					<div class="d-flex justify-content-end align-items-end">
						<div class="h3 ml-auto mb-0 text-danger">
							<small>贊助人數:</small> <strong>${orderSize}</strong>
						</div>
					</div>
					<div class="d-flex justify-content-end align-items-end">
						<div class="h3 ml-auto mb-0 text-danger">
							<small>剩餘天數:</small> <strong>${LastDay}</strong>
						</div>
					</div>
					<hr>

				</div>

			</div>

		</div>
	</div>

	<!-- ---- 商品明細----- -->
	<!-- ----------------- -->

	<!-- ------------------ -->
	<!-- ---- 商家資料----- -->
	<div class="container">
		<div class="row bg-store "
			style="border-width: thin; height: 150px; border: 2px solid rgba(0, 0, 0, 0.1); background-clip: padding-box; margin-top: 130px">
			<div class="col-md-3 my-3" style="text-align: center;">
				<img src="${store.storePic}" id="storePic"
					style="height: 100px; width: 100px; border-radius: 50%">
			</div>
			<div class="col-md-6 py-4">
				<table class="table" style="width: 800px;">
					<thead>
						<tr>
							<th scope="col" style="width: 100px;">商家名稱</th>
							<th scope="col" style="width: 180px;">商家簡介</th>
							<th scope="col" style="width: 100px;">商家聯繫方式</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">${store.storeName}</td>
							<td scope="row">${store.storePf}</td>
							<td scope="row">${store.storeTel}</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>

	</div>
	<!-- ---- 商家資料----- -->

	<!-- --------------- -->


	<!-- --------------- -->
	<!-- 留言板 -->
	<div class="container">
		<div class="row">
			<div style="background-color: #DDDDDD;" class="col-md-12 my-2">
				<c:if test="${empty sessionScope.memberSession}">
					<!--未登入的話顯示以下文字 -->
					<p style="text-align: center;">
						登入才能留言。如有相關提問，請先進行<span><a href="#"
							onclick="location.href='loginSystem'">登入</a>。</span>
					</p>
				</c:if>
				<c:if test="${not empty sessionScope.memberSession}">
					<button type="button" class="btn btn-outline-secondary"
						data-toggle="modal" data-target="#exampleModal"
						data-whatever="@fat">點此提問</button>
				</c:if>

			</div>
		</div>
		<!--   <hr>  -->
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">輸入你的留言</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<!-- 內容 -->
					<form action="addFundMsg" method="post"
						enctype="multipart/form-data" class="form-signin">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">留言標題:</label>
							<input type="text" class="form-control" id="recipient-name"
								name="fundMsgTital">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">留言內容:</label> <input
								type="text" class="form-control" id="recipient-name"
								name="fundMsgPf">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">上傳圖片:</label> <input
								type="file" class="form-control" name="file">
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">關閉</button>
							<input type="hidden" value="${fundProductDetail.fundProductId}"
								name="fundProductId" /> <input type="submit"
								class="btn btn-primary" value="送出" />
						</div>
					</form>

					<!--  -->
				</div>

			</div>
		</div>

	</div>
	<!-- 顯示留言內容 -->

	<div class="container">

		<div class="row bg-store">

			<!--  -->
			<div class="msg_history col-md-8 py-5"
				style="border-width: thin; border: 2px solid rgba(0, 0, 0, 0.1); background-clip: padding-box;" id="msgBody">
				<!--  style="margin: 0 auto;" -->
				<c:forEach items="${MsgByFundProductId}" var="fundMsg">
					<div class="incoming_msg">
						<div class="incoming_msg_img">
							<img src="https://ptetutorials.com/images/user-profile.png"
								alt="sunil">
						</div>
						<div class="received_msg">
							<div class="received_withd_msg">
								<!-- 客人留言 -->
								<p>留言人: ${fundMsg.member.memberFname }</p>
								<p>${fundMsg.fundMsgPf}</p>
								<span class="time_date"> ${fundMsg.fundMsgDate }</span>
								<c:if test="${not empty fundMsg.fundMsgPic}">
									<img src="${fundMsg.fundMsgPic}" />
								</c:if>
							</div>

							<script>
								$('#img').click(function() {
									$(this).toggleClass('img3');
									$(this).toggleClass('max');
								});
							</script>
							<!-- 客人留言 -->
						</div>
					</div>
					<div class="outgoing_msg">
						<div class="sent_msg">
							<!-- 商家留言 -->
							<c:forEach items="${allFundReply}" var="allFundReply">
								<c:if
									test="${allFundReply.fundMsg.fundMsgId == fundMsg.fundMsgId}">
            	  						賣家回覆 : <p>${allFundReply.fundReplyPf}</p>
									<c:if test="${not empty allFundReply.fundReplyPic}">
										<img alt="" src="${allFundReply.fundReplyPic}">
									</c:if>
								</c:if>
							</c:forEach>
							<!-- 商家留言 -->
							<!-- 商家留言 -->
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>
			<!-- --留言板END- -->

			<!-----專案區---->

			<div class="col-md-4">
				<!-- 專案! -->
				<c:forEach items="${AllFundProgram}" var="allFundProgram"
					varStatus="st">
					<form action="findFundProgramDetailByFundProgramId">
						<div class="col-1-of-3">
							<div class="card" style="margin-bottom: 10px; height: 700px;" name="programCard">
								<div class="card__side card__side--front" style="height: 700px;">
									<img  alt="" src="${allFundProgram.fundProgramPicture}" class="card__picture">

									<div class="card-body">
										<!--card__details   -->
										<h6>方案內容:${allFundProgram.fundProgramPf}<h6>
										<br />
										<h6>贈品剩餘數量:${allFundProgram.fundProgramLast}</h6>
										<br />

										<h4>方案贊助金額 : ${allFundProgram.fundProgramPrice}</h4>
										<br />
									</div>
								</div>
								<div class="card__side card__side--back card__side--back-3"
									style="height: 700px;">
									<div class="card__cta">
										<div class="card__price-box">
											<p class="card__price-only">方案贊助金額</p>
											<p class="card__price-value">${allFundProgram.fundProgramPrice}</p>
										</div>
										<c:if test="${allFundProgram.fundProgramLast > 0}">
											<button type="submit"
												class="btn btn-light btn-lg text-center rounded-pill">贊助此專案</button>
										</c:if>
										<c:if test="${allFundProgram.fundProgramLast == 0}">
											<button type="button"
												class="btn btn-light btn-lg text-center rounded-pill">剩餘數量不夠</button>
										</c:if>
										<input type="hidden" value="${allFundProgram.fundProgramId}"
											name="fundProgramId">
									</div>
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
				<!--  -->
			</div>

			<!-----專案區END--->
		</div>

	</div>


	<!-- 留言板 -->
	
	<!-- 自動調整留言板大小    -->
	<script type="text/javascript">
	function name() {
		var windowHeight =700;
		var cardNum = $('div[name="programCard"]').length;
		var msgHeight = (windowHeight*cardNum)-80;
		$('#msgBody').height(msgHeight);
		console.log(cardNum);
	}
	name();	
	</script>

	<footer class="my-5 pt-5 text-muted text-center text-small">
		<hr
			style="height: 12px; border: 0; box-shadow: inset 0 8px 8px -5px rgba(0, 0, 0, 0.5);">
		<p class="mb-1">2020 Company Name</p>
		<ul class="list-inline">
			<li class="list-inline-item"><a href="#">Privacy</a></li>
			<li class="list-inline-item"><a href="#">Terms</a></li>
			<li class="list-inline-item"><a href="#">Support</a></li>
		</ul>
	</footer>
</body>
</html>
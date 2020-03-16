<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.6">
<title>思思募募</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.4/examples/checkout/">

<!-- Bootstrap core CSS -->
<link href="/docs/4.4/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<meta name="msapplication-config"
	content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Cart.css"
	rel="stylesheet">

<style>
body {
	font-family: 'Noto Sans TC', sans-serif;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.lh-condensed {
	line-height: 1.25;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.countsCss {
	border-radius: 10px;
	margin-right: 50px;
}
/* Navbar*/
.navbar {
	text-transform: uppercase;
	font-weight: 700;
	font-size: .9em;
	letter-spacing: .1rem;
	background: rgba(0, 0, 0, .6) !important;
}

.navbar-nav li {
	padding-right: 1rem;
}

.navbar-dark .navbar-nav .navbar-link {
	color: white;
	padding-top: .8rem;
}

.navbar-dark .navbar-nav .navbar-link.active, .navbar-dark .navbar-nav .navbar-link:hover
	{
	color: #lebba3;
}
</style>

</head>


<body>
	<!-- Start home -->
	<!--  Navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
		style="background: rgba(0, 0, 0, 0.6)";>
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
					<!-- 					       <li class="nav-item"> -->
					<!-- 					        <a class="nav-link" href="#" onclick="location.href='managerlogin'">後臺登入</a> -->
					<!-- 					  		 </li>    -->
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
				<!--  form  -->
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

					<c:if test="${sessionScope.memberSession == null}">
						<!-- 如果不為空 才顯示 -->
						<a href="#" class="btn btn-primary"
							onclick="location.href='register'">註冊</a>
					</c:if>

					<!-- -----會員頭貼-------- -->
					<c:if test="${not empty sessionScope.get('memberSession')}">
						<!-- 如果不為空 才顯示 -->
						<div class="nav-link">
							<img onerror="nofind()"
								src="${sessionScope.get('memberSession').memberPic}"
								style="height: 29px; width: 29px; border-radius: 50%">
						</div>
						<div
							style="color: white; font-family: 'Acme', sans-serif; font-size: 15px">
							welcome <i style="margin-left: 2px">,</i> <i
								style="margin-left: 5px"></i>
							${sessionScope.get('memberSession').memberSname}
						</div>
					</c:if>
					<!-- ------------------- -->
				</form>
			</div>
		</div>
	</nav>
	<!--  Navbar -->

	<!-- top container shopping car  -->
	<div class="container py-5">
		<br> <br>
		<h2 class="h2  text-center"
			style="font-family: 'Noto Sans TC', sans-serif;">
			付款頁面<img alt=""
				src="${pageContext.request.contextPath}/images/Cart.gif"
				height="100px">
		</h2>
		<hr>

		<div class="card">
			<div style="OVERFLOW: scroll; HEIGHT: 250px;">
				<!-- 		<div style="width:100% ; height: 100% ; overflow-x: hidden ; overflow-y: scroll; "> -->
				<table class="table table-hover shopping-cart-wrap"
					style="height: 250px">

					<thead class="text-muted">
						<tr>
							<th scope="col">商品</th>
							<th></th>
							<th></th>
							<th></th>
							<th scope="col" width="120">數量</th>
							<th scope="col" width="120">單價</th>
							<th scope="col" width="120">價錢</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberCarts}" var="Carts">


							<tr>
								<td>

									<figure class="media">
										<div class="img-wrap">
											<img src="${Carts.productPic}" class="img-thumbnail img-sm">
										</div>
										<figcaption class="media-body">
											<h4 class="title text-truncate">${Carts.productName }</h4>

										</figcaption>
									</figure>
								</td>

								<td></td>
								<td></td>
								<td></td>
								<td>

									<h4 type="text" name="counts" value="" class="countsCss "
										style="width: 75%;">${Carts.counts}</h4> <input type="hidden"
									value="${Carts.shoppingcartId }" name="shoppingcartId"
									id="updatecounts">

								</td>
								<td>
									<div class="price-wrap">
										<var class="price" id="productPrice">NT${Carts.productPrice}</var>
									</div> <!-- price-wrap .// -->
								</td>
								<td>
									<div class="price-wrap">
										<var class="price" id="productPrice">NT${Carts.productPrice*Carts.counts}</var>
									</div> <!-- price-wrap .// -->
								</td>
								<td class="text-right">
									<form action="deleteMemberShoppingCart" method="post">
										<input type="hidden" value="${Carts.shoppingcartId }"
											name="shoppingcartId" id="updatecounts">
									</form>
								</td>
							</tr>
						</c:forEach>

						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h6>合計</h6></td>
							<td class="text-right"><h3>
									<strong>${allTotal}</strong>
								</h3></td>
							<td> </td>

						</tr>


					</tbody>

				</table>
			</div>
		</div>
	</div>

	<!--top container shopping car-->
	<div class="container" style="max-width: 960px">
		<!-- End home -->
		<!----Start Form ---->
		<form action="addOrderAll" class="needs-validation" novalidate>
			<div class="col-md-12 order-md-1 ">
				<h4 class="mb-3">輸入訂購人資料</h4>


				<input type="hidden" value="${allTotal}" name="orderTotal">
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="Receipt">收貨方式</label> <select class="custom-select"
							name="orderDeliveryMethod" id="inputGroupSelect01" placeholder=""
							required>
							<option value="1">宅配</option>
							<option value="2">超商取貨</option>
						</select>
						<div class="invalid-feedback">Please enter your Receipt
							method.</div>
					</div>
					<div class="col-md-6 mb-3">
						<label for="Cellphone">收件人手機號碼</label> <input type="text"
							class="form-control" name="orderPhone" id="Cellphone"
							placeholder="" value="" required>
						<div class="invalid-feedback">Valid cell phone is required.
						</div>
					</div>


				</div>



				<div class="mb-3">
					<label for="address">收貨地址</label> <input type="text"
						class="form-control" name="orderAddress" id="address"
						placeholder="" required>
					<div class="invalid-feedback">Please enter your shipping
						address.</div>
				</div>




				<div class=" mb-3">
					<label for="pdName">收件人姓名 </label> <input type="text"
						class="form-control" name="orderName" id="pdName" placeholder=""
						required>
					<div class="invalid-feedback">Please enter your name.</div>
				</div>


				<hr class="mb-4">

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="payment">付款方式</label>
					</div>
					<select class="custom-select" name="payment" id="payment">
						<option value="1">信用卡付款</option>
						<option value="2">超商繳費</option>
					</select>
				</div>

				
				<button class="btn btn-primary btn-lg btn-block" type="submit">確認付款</button>
		</form>
	</div>
	</div>
	<!-- End Form -->

	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2020 Company Name</p>
		<ul class="list-inline">
			<li class="list-inline-item"><a href="#">Privacy</a></li>
			<li class="list-inline-item"><a href="#">Terms</a></li>
			<li class="list-inline-item"><a href="#">Support</a></li>
		</ul>
	</footer>

	<script>
		window.jQuery
				|| document
						.write(
								'<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script src="/docs/4.4/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm"
		crossorigin="anonymous"></script>
	<script>
		(
								function() {
									'use strict'

									window
											.addEventListener(
													'load',
													function() {
														// Fetch all the forms we want to apply custom Bootstrap validation styles to
														var forms = document
																.getElementsByClassName('needs-validation')

														// Loop over them and prevent submission
														Array.prototype.filter
																.call(
																		forms,
																		function(
																				form) {
																			form
																					.addEventListener(
																							'submit',
																							function(
																									event) {
																								if (form
																										.checkValidity() === false) {
																									event
																											.preventDefault()
																									event
																											.stopPropagation()
																								}
																								form.classList
																										.add('was-validated')
																							},
																							false)
																		})
													}, false)
								}())
	</script>

</body>
<!-- -- End Start---- -->
</html>

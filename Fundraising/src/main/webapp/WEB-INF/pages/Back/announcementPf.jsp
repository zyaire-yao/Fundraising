<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>思思募募</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<meta name="msapplication-config"
	content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">



<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

</head>
<body style="font-family: Microsoft JhengHei;">
	<nav class="navbar navbar-dark  bg-dark flex-md-nowrap p-12 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">後台管理員</a>
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link"
				href="managerlogin">登出</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="back">
								<span data-feather="home"></span> 首頁 <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="getAnnouncement"> <span data-feather="file"></span> 公告
						</a></li>
						<li class="nav-item"><a class="nav-link" href="getBReport">
								<span data-feather="bar-chart-2"></span> 檢舉
						</a></li>
						<li class="nav-item"><a class="nav-link" href="getBProduct">
								<span data-feather="shopping-bag"></span> 商品狀態
						</a></li>
						<li class="nav-item"><a class="nav-link" href="getBMember">
								<span data-feather="users"></span> 會員管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="getBStore">
								<span data-feather="shopping-cart"></span> 商家管理
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="getSettleAllFundProject"> <span data-feather="layers"></span>
								募資專案審核
						</a></li>
						
					</ul>

					<h6
						class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
						<span>報表</span> <a class="d-flex align-items-center text-muted"
							href="#" aria-label="Add a new report"> <span
							data-feather="plus-circle"></span>
						</a>
					</h6>
					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link"
							href="getBFundOrder"> <span data-feather="file-text"></span>
								募資訂單
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="getBOrderDetail"> <span data-feather="file-text"></span>
								商品訂單
						</a></li>
					</ul>
				</div>
			</nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

					<h1 class="h2">公告</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group mr-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">分享</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">輸出</button>
						</div>
						<button type="button"
							class="btn btn-sm btn-outline-secondary dropdown-toggle">
							<span data-feather="calendar"></span> 日期
						</button>
					</div>
				</div>
				<div class="row">
					<div class="product-item">
						<c:forEach var="a11at" items="${allAt}">
							<div class="container">
								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="pic">
											<img class="img-responsive" src="${a11at.announcementPic}"
												style="width: 100%; height: 100%;">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<div class="txt">
											<h2>${a11at.announcementTital}</h2>
											<p>${a11at.announcementPf}</</p>
											<a href="getAnnouncement" class="btn btn-primary">回上頁</a>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
		</div>

	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>

	<script>
		feather.replace()
	</script>
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
</body>
</html>
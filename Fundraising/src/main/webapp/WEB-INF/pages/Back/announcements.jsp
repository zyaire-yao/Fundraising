<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<li class="nav-item"><a class="nav-link" href="getBFundOrder">
								<span data-feather="file-text"></span> 募資訂單
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

				</div>
				<div class="row">
				
					<div class="col-lg-6 " style="padding-left: 5%;">
						<h2>
							<a>新增公告</a>
						</h2>
							<form action="initAnnouncement" method="post" enctype="multipart/form-data">
								公告標題:<br> <input type="text" name="announcementTital" style="width: 400px;"><br>
								公告內容:<br>
								<textarea style="height: 100px; width: 400px"
									name="announcementPf"></textarea>
								<br> 公告圖片:<input style="width: 40%" type="file"
									name="file" class="btn btn-light"><br>
								<div style="padding-left: 20%;">	
									<input type="submit" value="送出" class="btn btn-outline-primary">
									<input type="reset" value="清除" class="btn btn-outline-danger">
								</div>
								<p></p>
								<c:if test="${not empty error}">
									<h5 style="color: red">${error}</h5>
									<br>
								</c:if>
								<c:if test="${not empty errorTital}">
									<h5 style="color: red">${errorTital}</h5>
									<br>
								</c:if>
								<c:if test="${not empty errorPf}">
									<h5 style="color: red">${errorPf}</h5>
									<br>
								</c:if>
							</form>
					</div>


					<div class="col-lg-6">
						<h2>
							<a>最近新增</a>
						</h2>
						<table class="table">
							<thead align="center">
								<tr>
									<td scope="col">公告標題</td>
									<td scope="col">新增日期</td>
									<td scope="col">EDIT</td>
								</tr>
							</thead>
							<c:forEach var="a11at" items="${allAt}" varStatus="st">

								<tr class="text-center">


									<td scope="row">${a11at.announcementTital}</td>
									<td scope="row"><fmt:formatDate value="${a11at.announcementDate}" pattern="yyyy-MM-dd"/></td>
									<td scope="row">
										<input type="button" value="查詢"	class="btn btn-outline-primary" onclick="getAnnouncementById(<c:out value="${st.count}"/>)"> 
										<input type="button" class="btn btn-outline-danger" value="× 刪除" 	onclick="deleteAnnouncement(<c:out value="${st.count}"/>)"></td>
								</tr>
								
								<form action="getAnnouncementById" method="get"
									id="getAnnouncementById<c:out value="${st.count}"/>">
									<input type="hidden" value="${a11at.announcementId}" name="aaa">
								</form>

								<form action="deleteAnnouncement" method="post"
									id="deleteAnnouncement<c:out value="${st.count}"/>">
									<input type="hidden" value="${a11at.announcementId }"
										name="announcementId">
								</form>
							</c:forEach>
						</table>

					</div>
				</div>
		</div>

	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>

	<script>
		function deleteAnnouncement(st) {
			document.getElementById("deleteAnnouncement"+st).submit();
		}
		function getAnnouncementById(st) {
			document.getElementById("getAnnouncementById"+st).submit();
		}

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
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

					<h1 class="h2">會員</h1>
					
				</div>

				<!--       <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas> -->
				<!-- 查詢輸入 -->
				<c:if test="${empty Inquire}">
					<!-- 如果 沒有輸入值 -->
					<form action="memberEmailLike">
						<h3>請輸入查詢條件( 可為MemberId、模糊查詢(Email、姓名、身分證字號) )</h3>
						<select name="InquireSelect">
							<option value="1">memberId</option>
							<option value="2">模糊查詢</option>
						</select> <input type="text" style="width: 500px;" name="Inquire">
						<input type="submit" value="查詢">
					</form>
				</c:if>

				<c:if test="${not empty Inquire}">
					<!-- 如果 有輸入值 -->

					<c:if test="${InquireSelect == 1}">
						<!-- 如果 選擇memberId查詢 -->
						<form action="memberEmailLike">
							<h3>請輸入查詢條件( 可為MemberId、模糊查詢(Email、姓名、身分證字號) )</h3>
							<select name="InquireSelect">
								<option value="1">memberId</option>
								<option value="2">模糊查詢</option>
							</select> <input type="text" style="width: 500px;" name="Inquire"
								value="${Inquire}"> <input type="submit" value="查詢">
						</form>
					</c:if>

					<c:if test="${InquireSelect == 2}">
						<!-- 如果 選擇 模糊查詢 -->
						<form action="memberEmailLike">
							<h3>請輸入查詢條件( 可為MemberId、模糊查詢(Email、姓名、身分證字號) )</h3>
							<select name="InquireSelect">
								<option value="2">模糊查詢</option>
								<option value="1">memberId</option>
							</select> <input type="text" style="width: 500px;" name="Inquire"
								value="${Inquire}"> <input type="submit" value="查詢">
						</form>
					</c:if>

				</c:if>
				<!-- 查詢輸入 -->
				<h2>帳號狀態</h2>

				<div class="table-responsive">

					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>Id</th>
								<th>信箱</th>
								<th>姓名</th>
								<th>綽號</th>
								<th>身份證字號</th>
								<th>生日</th>
								<th>性別</th>
								<th>行動電話</th>
								<th>電話</th>
								<th>照片</th>
								<th>狀態</th>
								<th>選項</th>

							</tr>
						</thead>
						<tbody>

							<c:forEach items="${all}" var="all" varStatus="st">
								<form action="getUpdateBMemberStatus" method="get">
									<input type="hidden" value="${all.memberId}" name="memberId">
									<tr>
										<td><c:out value="${all.memberId}" /></td>
										<td><c:out value="${all.memberEmail}" /></td>
										<td><c:out value="${all.memberFname}" /></td>
										<td><c:out value="${all.memberSname}" /></td>
										<td><c:out value="${all.memberTwid}" /></td>
										<td><c:out value="${all.memberHb}" /></td>
										<td><c:out value="${all.memberGd}" /></td>
										<td><c:out value="${all.memberTel}" /></td>
										<td><c:out value="${all.memberCel}" /></td>
										<td><img alt="會員大圖" src="${all.memberPic}"
											style="width: 50px; height: 50px;"></td>
										<td><c:out value="${all.memberStatus}" /></td>
										<td><input type="submit" class="btn btn-outline-primary"
											value="更改"></td>
									</tr>



								</form>

							</c:forEach>
						</tbody>

						<tbody>

							<c:forEach items="${listMember}" var="listMember">
								<form action="getUpdateBMemberStatus" method="get">
									<input type="hidden" value="${listMember.memberId}"
										name="memberId">
									<tr>
										<td><c:out value="${listMember.memberId}" /></td>
										<td><c:out value="${listMember.memberEmail}" /></td>
										<td><c:out value="${listMember.memberFname}" /></td>
										<td><c:out value="${listMember.memberSname}" /></td>
										<td><c:out value="${listMember.memberTwid}" /></td>
										<td><c:out value="${listMember.memberHb}" /></td>
										<td><c:out value="${listMember.memberGd}" /></td>
										<td><c:out value="${listMember.memberTel}" /></td>
										<td><c:out value="${listMember.memberCel}" /></td>
										<td><img alt="會員大圖" src="${listMember.memberPic}"
											style="width: 50px; height: 50px;"></td>
										<td><c:out value="${listMember.memberStatus}" /></td>
										<td><input type="submit" class="btn btn-outline-primary"
											value="更改"></td>
									</tr>

								</form>

							</c:forEach>
						</tbody>
					</table>

				</div>
			</main>
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
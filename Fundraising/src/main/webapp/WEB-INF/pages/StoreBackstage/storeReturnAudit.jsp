<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
<title>思思募募</title>
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/sidebar.css"
	rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap-->
</head>
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}';

	jQuery(function($) {
		$(".sidebar-dropdown > a").click(function() {
			$(".sidebar-submenu").slideUp(200);
			if ($(this).parent().hasClass("active")) {
				$(".sidebar-dropdown").removeClass("active");
				$(this).parent().removeClass("active");
			} else {
				$(".sidebar-dropdown").removeClass("active");
				$(this).next(".sidebar-submenu").slideDown(200);
				$(this).parent().addClass("active");
			}
		});
		$("#close-sidebar").click(function() {
			$(".page-wrapper").removeClass("toggled");
		});
		$("#show-sidebar").click(function() {
			$(".page-wrapper").addClass("toggled");
		});
	});
</script>
<style>
.imgbg {
	background: linear-gradient(rgba(255, 255, 255, 0.5),
		rgba(255, 255, 255, 0.5)),
		url('${pageContext.request.contextPath}/images/productPic/bg4.jpg')
		no-repeat 0% 20%/cover;
	font-family: 'Noto Sans TC', sans-serif;
}

.page-content table {
	text-align: center;
}
</style>
<body class="imgbg">
	<div class="page-wrapper chiller-theme toggled">
		<a id="show-sidebar" class="btn btn-sm btn-dark" href="#"> <i
			class="fas fa-bars"></i>
		</a>
		<nav id="sidebar" class="sidebar-wrapper" style="font-size: 15px;">
			<div class="sidebar-content">
				<div class="sidebar-brand">
					<a href="#"><img
						src='${pageContext.request.contextPath}/images/HomePagePic/thumbs-up.svg'
						width="40px" height="30px" alt=""> 思思募募</a>
					<div id="close-sidebar">
						<i class="fas fa-times"></i>
					</div>
				</div>
				<div class="sidebar-header">
					<c:if test="${not empty sessionScope.get('memberSession')}">
						<div class="user-pic">
							<img class="img-responsive img-rounded" onerror="nofind()"
								src="${sessionScope.get('memberSession').memberPic}"
								alt="User picture">
						</div>
						<div class="user-info">
							<span class="user-name">
								${sessionScope.get('memberSession').memberSname} </span> <span
								class="user-role">Administrator</span> <span class="user-status">
								<i class="fa fa-circle"></i> <span>Online</span>
							</span>
						</div>
					</c:if>
				</div>

				<!-- sidebar-header  -->
				<div class="sidebar-menu">
					<ul>

						<li class="header-menu"><span>商品/募資</span></li>

						<li class="sidebar-dropdown"><a href="#"
							onclick="location.href='${pageContext.request.contextPath}'">
								<i class="fa fa-tachometer-alt"></i> <span>首頁</span> <!--               <span class="badge badge-pill badge-warning">返回首頁</span> -->
						</a>
						<li class="sidebar-dropdown"><a href="#"
							onclick="location.href='findMember'"> <i class="fa fa-folder"></i>
								<span>會員專區</span>
						</a></li>

						</li>
						<li class="sidebar-dropdown"><a href="#"> <i
								class="fa fa-shopping-cart"></i> <span>商品專區</span> <!--               <span class="badge badge-pill badge-danger">3</span> -->
						</a>
							<div class="sidebar-submenu">
								<ul>

									<li><a href="#" onclick="location.href='ProductEdit'">
											商品上架 / 編輯 </a></li>

									<li><a href="#" onclick="location.href='ProductMsg'">
											商品留言 </a></li>

								</ul>
							</div></li>
						<li class="sidebar-dropdown"><a href="#"> <i
								class="far fa-gem"></i> <span>募資專區</span>
						</a>
							<div class="sidebar-submenu">
								<ul>
									<li><a href="#" onclick="location.href='FundProject'">
											募資提案 </a></li>
									<li><a href="#" onclick="location.href='FindFundProject'">
											募資查詢/修改 </a></li>
									<li><a href="#" onclick="location.href='FindFundMsg'">
											募資留言 </a></li>
								</ul>
							</div></li>




						<li class="header-menu"><span>商家資料 / 訂單</span></li>


						<li><a href="#" onclick="location.href='findStore'"> <i
								class="fa fa-book"></i> <span>基本資料更新</span>
						</a></li>

						<li><a href="#" onclick="location.href='findStoreOrder'">
								<i class="fa fa-calendar"></i> <span>商品訂單查詢</span>
						</a></li>


						<li><a href="#" onclick="location.href='findStoreFundOrder'">
								<i class="fa fa-folder"></i> <span>募資訂單查詢</span>
						</a></li>

						<li><a href="#"> <i class="fa fa-folder"></i> <span>退貨審核</span>
						</a></li>

					</ul>
				</div>
				<!-- sidebar-menu  -->
			</div>
			<!-- sidebar-content  -->

		</nav>
		<!-- sidebar-wrapper 右邊內容放此 -->
		<main class="page-content">
			<h1>顧客退貨訂單查詢</h1>
			<hr>
			<div class="container" style="font-size: 15px;">
				<table align="left" class="table">
					<thead>
						<tr style="background-color: rgba(255, 235, 59, 0.3)">
							<th scope="col">編號</th>
							<th scope="col">商品名稱</th>
							<th scope="col">商品數量</th>
							<th scope="col">商品單價</th>
							<th scope="col">商品總額</th>
							<th scope="col">退貨狀態</th>
							<th scope="col">退貨原因</th>
							<th scope="col">退款方式</th>
							<th scope="col">退貨日期</th>
							<th scope="col">EDIT</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${storeCheck }" var="sc" varStatus="sct">
							<form action="replyReturnStatus" method="post">
								<tr>
									<td scope="row">${sct.count}</td>
									<td scope="row">${sc.productReturnDetailName}</td>
									<td scope="row"><fmt:formatNumber
											value="${sc.productReturnDetailAmount }" pattern="#,###,###" /></td>
									<td scope="row"><fmt:formatNumber
											value="${sc.productReturnDetailPrice }" pattern="#,###,###" /></td>
									<td scope="row"><fmt:formatNumber
											value="${sc.productReturnTotal }" pattern="#,###,###" /></td>
									<td scope="row">${sc.productReturnStatus }</td>
									<td scope="row">${sc.productReturnReason }</td>
									<td scope="row">${sc.productReturnMethod }</td>
									<td scope="row"><fmt:formatDate
											value="${sc.productReturnDate }" pattern="yyyy-MM-dd" /></td>
									<td scope="row"><c:if
											test="${sc.productReturnStatus =='退貨處理中'}">
											<select name="returnSelect" id="returnSelect">
												<option>請選擇</option>
												<option value="yes">允許退貨</option>
												<option value="no">拒絕退貨</option>
											</select>
											<input type="hidden" value="${sc.productReturnId}"
												name="productReturnId">|<input type="submit"
												value="SUBMIT">
										</c:if> <c:if
											test="${sc.productReturnStatus =='允許退貨'||sc.productReturnStatus =='拒絕退貨'}">
      已審核完畢
      </c:if></td>
								</tr>

							</form>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>



		<!--  -->
		<!-- page-content" -->
	</div>
	<!-- page-wrapper -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>

</html>
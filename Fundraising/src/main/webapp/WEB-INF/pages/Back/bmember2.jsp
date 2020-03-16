<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>思思募募</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript"
	src="http://www.pureexample.com/js/lib/jquery.ui.touch-punch.min.js"></script>
</head>
<style type="text/css">
body {
	background-color: #DFFFDF;
	font-family: Microsoft JhengHei;
}

* {
	margin: 0;
	padding: 0;
}

#allpage {
	width: 80%;
	margin: 0 auto;
}

header {
	width: 100%;
}

.logo-img {
	width: 100%;
}

.menu {
	width: 100%;
	overflow: auto;
	background-color: #FFC78E;
	border-radius: 5px;
	list-style-type: none;
}

.menu li {
	width: 7em;
	line-height: 2.5em;
	float: left;
}

.menu li a {
	display: block;
	text-align: center;
	color: #005AB5;
}

.menu li a:link {
	text-decoration: none;
}

.menu li a:hover {
	background-color: #0080FF;
	color: #ffffff;
	border-radius: 5px;
}

.menu2 {
	width: 100%;
	overflow: auto;
	background-color: #FFED97;
	border-radius: 5px;
	list-style-type: none;
}

.menu2 li {
	width: 20em;
	line-height: 2.5em;
	float: left;
}

#content {
	width: 100%;
	overflow: auto;
}

.article {
	width: 70%;
	float: left;
}

.section {
	background-color: #FFED97;
	border-radius: 5px;
	margin: 10px 0;
	padding: 20px 26px;
	line-height: 2em;
}

.aside {
	width: 28%;
	float: right;
}

footer {
	background-color: #FFED97;
	border-radius: 5px;
	text-align: center;
	line-height: 2.5em;
	color: #4F4F4F;
	height: 40px;
	box-sizing: border-box;
	position: absolute;
	bottom: 0;
	width: 70%;
}

#accordion {
	width: auto;
	margin: auto;
}

.accordion {
	width: auto;
	margin: auto;
}

.tablestyle {
	border-collapse: collapse;
	border-color: black;
}

.tr1 {
	background-color: orange;
	text-align: center;
}

.tablestyle tr td {
	width: auto;
}

table {
	border-collapse: collapse;
	width: 770px;
	table-layout: fixed;
}

td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	border: black solid 1px;
}
</style>
<body>
	<script>
		$(function() {
			$("#accordion").accordion({
				//heightStyle : "fill",
				collapsible : true
			});
		});

		function check() {

			if (confirm("確定取消訂單 ? ")) {
				alert("期待您下次光臨");
				return true;
			} else {
				return false;
			}
		}
	</script>
	<div id="allpage">

		<header>
			<nav>
				<ul class="menu">
					<li><a href="back">首頁</a></li>
					<li><a href="getAnnouncement">公告</a></li>
					<li><a href="getBReport">檢舉</a></li>
					<li><a href="getBProduct">商品號狀態</a></li>
					<li><a href="getBMember">會員帳號狀態</a></li>
					<li><a href="getBStore">商家帳號狀態</a></li>
					<li><a href="getSettleAllFundProject">募資專案審核</a></li>

				</ul>
			</nav>
		</header>
		<div id="content">
			<article class="article">
				<section class="section">
					<h2>
						<a>會員</a>
					</h2>
					<form action="checkMembers" method="post">

						<center>
							<h1>會員查詢</h1>
							請輸入Email查詢會員：<input type="text" name="memberEmail"> <input
								type="submit" value="submit">
						</center>
					</form>
					<div class="accordion">


						<table id="table" border=1 class="tablestyle" align="center"
							valingn="center">



							<tr class="tr1">
								<td>Id</td>
								<td>信箱</td>
								<td>密碼</td>
								<td>姓名</td>
								<td>綽號</td>
								<td>身份證字號</td>
								<td>生日</td>
								<td>性別</td>
								<td>行動電話</td>
								<td>電話</td>
								<td>照片</td>
								<td>狀態</td>
								<td>選項</td>
							</tr>
							<c:forEach items="${all}" var="all" varStatus="st">
								<form action="getUpdateMemberStatus" method="get">
									<input type="hidden" value="${all.memberId}" name="memberId">
									<table border="1">
										<tr>
											<td><c:out value="${all.memberId}" /></td>
											<td><c:out value="${all.memberEmail}" /></td>
											<td><c:out value="${all.memberPwd}" /></td>
											<td><c:out value="${all.memberFname}" /></td>
											<td><c:out value="${all.memberSname}" /></td>
											<td><c:out value="${all.memberTwid}" /></td>
											<td><c:out value="${all.memberHb}" /></td>
											<td><c:out value="${all.memberGd}" /></td>
											<td><c:out value="${all.memberTel}" /></td>
											<td><c:out value="${all.memberCel}" /></td>
											<td><c:out value="${all.memberPic}" /></td>
											<td><c:out value="${all.memberStatus}" /></td>
											<td><input type="submit" value="更改"></td>
										</tr>
									</table>
								</form>
							</c:forEach>

						</table>
					</div>
				</section>
			</article>
			<aside class="aside">
				<section class="section">
					<h2>
						<a>會員</a>
					</h2>
					<p>?</p>
				</section>
			</aside>
		</div>
	</div>


</body>
</html>
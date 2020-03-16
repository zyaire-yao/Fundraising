<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>思思募募</title>
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
	width: a
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
<div id="allpage">
	<header>
		<nav>
			<ul class="menu">
				<li><a href="back">首頁</a></li>
				<li><a href="initAnnouncement">公告</a></li>
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
					<a>募資專案審核</a>
				</h2>
				<form action="checkMembers" method="post">

					<center>
						<h1>募資專案</h1>
						請輸入ID查詢檢舉：<input type="text" name="memberEmail"> <input
							type="submit" value="submit">
					</center>
				</form>
				<div class="accordion">
					<table id="table" border=1 class="tablestyle" align="center"
						valingn="center">
						<tr class="tr1">
							<td >提案名稱:</td>
							<td >提案內容:</td>
							<td >提案金額:</td>
							<td >提案天數:</td>
							<td >提案狀態:</td>
							<td >更改:</td>
			
						</tr>
					

					<c:forEach items="${test}" var="b" varStatus="st">
						<form action="getMemberStatus" method="get">
							<input type="hidden" value="${b.fundProjectId}"
								name="fundProjectId">
							<table  border="1">
								<tr>
									<td ><c:out value="${b.fundProjectTitle}" /></td>
									<td ><c:out value="${b.fundProjectPf}" /></td>
									<td ><c:out value="${b.fundProjectTotal}" /></td>
									<td ><c:out value="${b.fundProjectDate}" /></td>
									<td ><c:out value="${b.fundProjectStatus}" /></td>
									<td ><input type="submit" value="更改"></td>
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
					<a></a>
				</h2>
				<p>?</p>
			</section>
		</aside>
	</div>
</div>
</body>
</html>
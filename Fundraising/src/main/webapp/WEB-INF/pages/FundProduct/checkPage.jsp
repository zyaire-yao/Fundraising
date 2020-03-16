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
 <form action="addFundOrder" class="needs-validation" novalidate>
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
			<div style=" HEIGHT: 250px;">
				<!-- 		<div style="width:100% ; height: 100% ; overflow-x: hidden ; overflow-y: scroll; "> -->
				<table class="table table-hover shopping-cart-wrap"
					style="height: 250px;">

					<thead class="text-muted">
						<tr>
							<th scope="col">商品</th>
							<th></th>
							<th></th>
							<th></th>
							<th scope="col" width="120">價錢</th>
							<th> + </th>
							<th>額外贊助(可以為空)</th>
						</tr>
					</thead>
					<tbody>
						


							<tr>
								<td>

									<figure class="media">
										<div class="img-wrap">
											<img src="${FundProgramDetail.fundProgramPicture}" class="img-thumbnail img-xl" height="300px" width="250px">
										</div>
										<figcaption class="media-body">
										
											<p >${FundProgramDetail.fundProgramPf}</p>
						
										</figcaption>
									</figure>
								</td>

								<td></td>
								<td></td>
								
								<td><h4 type="text" name="counts" value="" class="countsCss" style="width: 75%;">${Carts.counts}</h4> 
										<input type="hidden" value="${Carts.shoppingcartId }" name="shoppingcartId"	id="updatecounts">
								</td>
								<td><span id="programPrice">${FundProgramDetail.fundProgramPrice}</span></td>
								<td>+</td>
								<td align="left">
								<input type="text" name="fundOrderExtraPrice" id="extraPrice" value="0" onkeyup="value=value.replace(/[^\d]/g,'') " > 
								</td>
							</tr>
						

						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h6>合計</h6></td>
							<td class="text-right" ><h3>
									<strong style="color: red;">NT <span id="totalPrice">${FundProgramDetail.fundProgramPrice}</span></strong>
									<input type="hidden" id="totalPriceForOrder" value="${FundProgramDetail.fundProgramPrice}" name="fundOrderTotal" >
								</h3></td>
							<td></td>

						</tr>


					</tbody>

				</table>
				<div>
	    
  	 <div class="col-md-12 order-md-1 ">
      <h4 class="mb-3">輸入訂購人資料</h4>
  </div>
       
       <input type="hidden" value="${FundProgramDetail.fundProgramId}" name="fundProgramId">
  		<input type="hidden" value="${FundProgramDetail.fundProgramPrice}" name="fundOrderPrice">
  		<input type="hidden" value="${FundProgramDetail.fundProgramPf}" name="fundOrderProductName">
  		
          <div class="row">
          <div class="col-md-6 mb-3">
            <label for="Receipt">收貨方式</label>
             <select class="custom-select" name="fundOrderDeliveryMethod" id="inputGroupSelect01" placeholder="" required="required" >
			    <option value="宅配">宅配</option>
			    <option value="超商取貨">超商取貨</option> 
			 </select>
			 <div class="invalid-feedback">
              Please enter your Receipt method.
            </div>
        </div> 
           <div class="col-md-6 mb-3">
            <label for="Cellphone">收件人手機號碼</label>
            <input type="text" class="form-control" name="fundOrderPhone" id="Cellphone" placeholder="" value="" required="required">
            <div class="invalid-feedback">
              Valid cell phone is required.
            </div>
          </div>        
        </div>
		   <div class="mb-3">
            <label for="address">收貨地址</label>
            <input type="text" class="form-control" name="fundOrderAddress" id="address" placeholder="" required="required">
            <div class="invalid-feedback">
           Please enter your shipping address.
            </div>
          </div>
     
					  
          
      
        <div class=" mb-3">
          <label for="pdName">收件人姓名
          </label>
          <input type="text" class="form-control" name="fundOrderName" id="pdName" placeholder="" required="required">
           <div class="invalid-feedback">
            Please enter your name.
          </div>
        </div>
			
      
        <hr class="mb-4">

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="payment">付款方式</label>
					</div>
					<select class="custom-select" name="paymentToFund" id="paymentToFund">
						<option value="1">信用卡付款</option>
						<option value="2">超商付款</option>
					</select>
				</div>
				<input type="hidden" name="fundOrderTotal" value="${FundProgramDetail.fundProgramPrice}">
        <button class="btn btn-primary btn-lg btn-block" type="submit">確認付款</button>
        
    </div>
			</div>
		</div>
		
		
	</div>



	<div class="container" style="max-width:960px">
<!----Start Form ---->	

      </div>

</form>
<script type="text/javascript">
$('#extraPrice').change(function() {
	
// 	判斷輸入的欄位是否為空
	if($(this).val() !=''){
// 		抓取到輸入的值，轉換成十進位
		var extraPrice = parseInt($(this).val(), 10);  
	}else{
// 		設定欄位的值為0
		var extraPrice = 0;
		$(this).val(0);
	}
// 	把抓到的方案金額轉為十進位
	var programPrice = parseInt($('#programPrice').text(), 10);
	var totalPrice = programPrice + extraPrice;
// 	回傳給id=totalPrice的欄位顯示  顯示總金額
	$('#totalPrice').text(totalPrice);
// 	回傳給id=totalPriceForOrder的欄位顯示  Hidden起來傳到後端
	$('#totalPriceForOrder').val(totalPrice);
})



</script>
   <!-- End Form -->

	<!-- ---- 商家資料----- -->
	<div class="container"></div>
	<!-- ---- 商家資料----- -->
</body>
</html>
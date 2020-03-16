<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" integrity="sha384-REHJTs1r2ErKBuJB0fCK99gCYsVjwxHrSU0N7I1zl9vZbggVJXRMsv/sLlOAGb4M" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Cart.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Trade+Winds&display=swap" rel="stylesheet">
<title>思思募募</title>
</head>
<style>
.navbar{
	 text-transform: uppercase;
	 font-weight: 700;
	 font-size: .9em;
	 letter-spacing: .1rem;
	 background: rgba(0,0,0,.6) !important;
	}
	.navbar-nav li{
     padding-right: 1rem;
	}
	.navbar-dark .navbar-nav .navbar-link{
	color: white;
	padding-top: .8rem;	
	}
	.navbar-dark .navbar-nav .navbar-link.active,
	.navbar-dark .navbar-nav .navbar-link:hover{
	 color: #lebba3;
	}
	
.countsCss {
	border-radius: 10px;
	margin-right: 50px;
}
body{
font-family: 'Noto Sans TC', sans-serif;	
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg4.png') no-repeat 0% 20%/ cover;
}
div.cartProductChangeNumberDiv {
	border: solid 1px #E5E5E5;
	width: 80px;
}

div.cartProductChangeNumberDiv a {
	width: 14px;
	display: inline-block;
	text-align: center;
	color: black;
	text-decoration: none;
}

div.cartProductChangeNumberDiv input {
	border: solid 1px #AAAAAA;
	width: 23px;
	display: inline-block;
}
</style>
<body>
<!-- ---- 導覽列----- -->
	<nav class="navbar navbar-expand-lg navbar-dark" style="background:rgba(0,0,0,0.6)">
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
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="location.href='findMember'">會員專區</a></li>
					<li class="nav-item"><c:if
							test="${empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<a class="nav-link" href="#"
								onclick="location.href='registerStore'">註冊商家</a>
						</c:if></li>
					<li class="nav-item"><c:if
							test="${not empty sessionScope.storeSession}">
							<!-- 如果不為空 才顯示 -->
							<a class="nav-link" href="#" onclick="location.href='findStore'">賣家中心</a>
						</c:if></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 商品 </a>

						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#" onclick="location.href='getAllFundProductForCustomer'">募資商品</a> 
							<a class="dropdown-item" href="#" onclick="location.href='getAllProduct'">商品選購</a> 
						</div></li>
				</ul>
				
				<!--  form  -->		
				<form class="form-inline">
	
					<c:if test="${sessionScope.memberSession == null}"><!-- 如果不為空 才顯示 -->
					<a href="#" class="btn btn-outline-primary mr-1" onclick="location.href='loginSystem'">登入</a> 
				   </c:if>
				   
				   <c:if test="${sessionScope.memberSession != null}"><!-- 如果不為空 才顯示 -->
					<a href="#" class="btn btn-outline-primary mr-1" onclick="location.href='outSystem'">登出</a> 
				   </c:if>
				   
				   <c:if test="${sessionScope.memberSession == null}"><!-- 如果不為空 才顯示 -->
				   <a href="#"   class="btn btn-primary"  onclick="location.href='register'">註冊</a>
				   </c:if>
				   
				<!-- -----會員頭貼-------- --> 
				<c:if test="${not empty sessionScope.get('memberSession')}">
				  <!-- 如果不為空 才顯示 -->
				  <div  class="nav-link">
				  <img onerror="nofind()"
				   src="${sessionScope.get('memberSession').memberPic}"
				   style="height: 29px; width: 29px; border-radius: 50%  ">
				   </div>
				        <div style="color: white; font-family: 'Acme', sans-serif;font-size:15px" >
				              welcome 
				              <i style="margin-left: 2px">,</i> <i style="margin-left: 5px"></i> 
				         ${sessionScope.get('memberSession').memberSname}</div>
				 </c:if>
				<!-- ------------------- -->				   
				</form>
			</div>
		</div>
	</nav>
<!-- ---- 導覽列----- -->
<div class="container">
  <h2 class="h2 text-center py-5" style="font-family: 'Trade Winds', cursive;" >ShoppingCart<img alt="" src="${pageContext.request.contextPath}/images/cart/cart.gif" height="100px"></h2>
<hr>



<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col">商品</th>
  <th scope="col">單價</th>
  <th scope="col" width="120">數量</th>
  <th scope="col" width="120">金額</th>
  <th scope="col" width="200" class="text-right">編輯</th>
</tr>
</thead>
<tbody>

<c:forEach items="${memberCarts}" var="Carts">

	
<tr>
	<td>
	
<figure class="media">
	<div class="img-wrap"><img src="${Carts.productPic}" class="img-thumbnail img-sm"></div>
	<figcaption class="media-body">
		<h4 class="title text-truncate">${Carts.productName }</h4>
</figcaption>
</figure> 
	</td>
	<td >
		
			<var class="cartProductItemPrice" id="5">NT<span name="priceSingle">${Carts.productPrice}</span></var> 
		
	</td>
	
   <form action="updateShoppingCartCounts" method="post" id="${Carts.shoppingcartId}">
	<td> 
		<div class="cartProductChangeNumberDiv">

			<input type="hidden" name="action" value="updateShoppingCartCounts">
			<input type="button" name="minus" value="-"class="numberMinus" id="${Carts.shoppingcartId+11}"/>
			<input type="text" name="counts" value="${Carts.counts }" class="textNum" style=" text-align: center;" id="${Carts.shoppingcartId+21}"/>
			<input type="hidden" value="${Carts.shoppingcartId }" name="shoppingcartId">
			<input type="button" name="add" value="+" class="numberPlus" id="${Carts.shoppingcartId+31}" />	
	
<script type="text/javascript">

$('#${Carts.shoppingcartId+11}').blur(function() {
  $('#${Carts.shoppingcartId}').submit();
});

$('#${Carts.shoppingcartId+21}').blur(function() {
	  $('#${Carts.shoppingcartId}').submit();
	});
	
$('#${Carts.shoppingcartId+31}').blur(function() {
	  $('#${Carts.shoppingcartId}').submit();
	});
</script>
	
		</div>      
	</td>
	</form>
	     
	<td> 
		<span class="cartProductItemSumPrice">${Carts.productPrice*Carts.counts}</span>
	</td>
	
	<td class="text-right"> 
	<form action="deleteMemberShoppingCart" method="post">
		<input type="hidden" value="${Carts.shoppingcartId }" name="shoppingcartId">
		<input type="submit" class="btn btn-outline-danger" value="× Remove" >
	</form>
	</td>
</tr>



</c:forEach>
               
                    <tr>
                    	
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>合計</h3></td>
                        <td class="cartSumPrice" id="Sum"><h3><strong></strong></h3></td>
                    </tr>
                    <tr>
                    	
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <form action="">
                        	<button type="button" class="btn btn-default" onclick="location.href='getAllProduct'">
                            	<span class="glyphicon glyphicon-shopping-cart"></span> 繼續購物
                        	</button>
                        </form>
                        </td>
                        <td>
                        
                        	<button type="button" class="btn btn-danger" onclick="location.href='findMemberShoppingCartToCheckout'">
                            	結帳 <span class="glyphicon glyphicon-play"></span>
                       		</button>
                        
                        </td>
                    </tr>
		</tbody>
	</table>

</div>

</div> 
<!--container end.//-->


<script>


//減號操作
$(".numberMinus").click(function () {
           var num = $(this).siblings(".textNum").val();  //獲取數量框裡的數值       
           //單價的值
           var productPrice=$(this).parents("tr").find("span[name='priceSingle']").text();
           num--;  //單擊“-”減號時，數量遞減
           if(num<=0){
           	$(this).prop("disabled", true);
           }
           
           $(this).siblings(".textNum").val(num); //把數量變化後的新值放入數量框中
         	//小計的值
            $(this).parent().parent().next().children("span").text(num*productPrice);
      	totalPrice();		//呼叫總價方法
       totalNum();	//合計數
})
//加號操作
$(".numberPlus").click(function(){
	 var num = $(this).siblings(".textNum").val();  //獲取數量框裡的數值
    //單價的值
    var productPrice=$(this).parents("tr").find("span[name='priceSingle']").text();
    num++;  //單擊“+”減號時，數量遞減
    if(num>0){
    $(this).siblings(".numberMinus").prop("disabled", false); 
    }
    $(this).siblings(".textNum").val(num); //把數量變化後的新值放入數量框中
  	//小計的值
     $(this).parent().parent().next().children("span").text(num*productPrice);
     totalPrice();	//呼叫總價方法
     totalNum();	//合計數
})
//計算總價方法
	function totalPrice(){
		//計算總價，編寫總價方法
             var zong = 0;
             $(".cartProductItemSumPrice").each(function () {
                 var all = parseInt($(this).text());
                 zong += all;
             })
             $("#Sum").text(zong);
	}
	//計算數量方法
	function totalNum(){
		//計算總價，編寫總價方法
             var sumNum = 0;
             $(".textNum").each(function () {
                 var all = parseInt($(this).val());
                 sumNum += all;
             })
             $("#cartSumNumber").text(sumNum);
	}
	//載入頁面時，呼叫總價方法
	$(function(){
		 totalNum();
		 totalPrice();	//呼叫總價方法
	})
</script>
</body>	
</html>
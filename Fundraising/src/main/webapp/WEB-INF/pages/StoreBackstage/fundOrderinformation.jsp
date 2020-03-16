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
    <meta name="description" content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
    <title>募資訂單查詢</title>
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
	 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/sidebar.css" rel="stylesheet">	
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap-->
</head>
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}' ;


jQuery(function ($) {
    $(".sidebar-dropdown > a").click(function() {
  $(".sidebar-submenu").slideUp(200);
  if (
    $(this)
      .parent()
      .hasClass("active")
  ) {
    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .parent()
      .removeClass("active");
  } else {
    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .next(".sidebar-submenu")
      .slideDown(200);
    $(this)
      .parent()
      .addClass("active");
  }
});
$("#close-sidebar").click(function() {
  $(".page-wrapper").removeClass("toggled");
});
$("#show-sidebar").click(function() {
  $(".page-wrapper").addClass("toggled");
});  
});
//tabs頁籤function
function openCity(evt, cityName) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
		
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
</script>
<style>
.imgbg{	
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg4.jpg') no-repeat 0% 20%/ cover;
font-family: 'Noto Sans TC', sans-serif;
	}
/* ↓↓↓↓↓↓↓↓===tabs 樣式===-↓↓↓↓↓↓↓↓*/
/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid none;
  background-color: transparent;

}

/* Style the buttons inside the tab */
.tab button {
  background-color: rgba(255,235,59,0.3);
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 20px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: rgba(105,105,105);
}

/* Create an active/current tablink class */
.tab button.active {
  background-color:rgba(255,152,0,0.3);
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid none;
  border-top: none;
  padding-left: 2px;
}
#NewYork{
	display: block;
}
#London{
display: block;
}
.page-content table {
font-size: 18px;
text-align: center;
}
</style>
<body class="imgbg">
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
    <i class="fas fa-bars"></i>
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
          <span class="user-name"> ${sessionScope.get('memberSession').memberSname}
          </span>
          <span class="user-role">Administrator</span>
          <span class="user-status">
            <i class="fa fa-circle"></i>
            <span>Online</span>
          </span>
        </div>
       </c:if>  
      </div>
      
      <!-- sidebar-header  -->
      <div class="sidebar-menu">
        <ul>
        
          <li class="header-menu">
            <span>商品/募資</span>
          </li>
          
          <li class="sidebar-dropdown">
            <a href="#" onclick="location.href='${pageContext.request.contextPath}'">
              <i class="fa fa-tachometer-alt"></i>
              <span>首頁</span>
<!--               <span class="badge badge-pill badge-warning">返回首頁</span> -->
            </a>
            
              <li class="sidebar-dropdown">
            <a href="#" onclick="location.href='findMember'">
             <i class="fa fa-folder"></i>
              <span>會員專區</span>
            </a>
          </li>
            
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fa fa-shopping-cart"></i>
              <span>商品專區</span>
<!--               <span class="badge badge-pill badge-danger">3</span> -->
            </a>
            <div class="sidebar-submenu">
              <ul>
              
                <li>
                  <a href="#" onclick="location.href='ProductEdit'">
					商品上架 / 編輯
                  </a>
                </li>
                
                <li>
                  <a href="#" onclick="location.href='ProductMsg'">
                  	商品留言
                  </a>
                </li>
                
              </ul>
            </div>
            
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="far fa-gem"></i>
              <span>募資專區</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="#"  onclick="location.href='FundProject'">
                   	募資提案
                  </a>
                </li>
                <li>
                  <a href="#"  onclick="location.href='FindFundProject'">
                   	募資查詢/修改
                  </a>
                </li>
                <li>
                  <a href="#" onclick="location.href='FindFundMsg'" >
               		   募資留言
                  </a>
                </li>       
              </ul>
            </div>
          </li>
          
<!--           <li class="sidebar-dropdown"> -->
<!--             <a href="#"> -->
<!--               <i class="fa fa-globe"></i> -->
<!--               <span>Maps</span> -->
<!--             </a> -->
<!--             <div class="sidebar-submenu"> -->
<!--               <ul> -->
<!--                 <li> -->
<!--                   <a href="#">Google maps</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="#">Open street map</a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </div> -->
<!--           </li> -->
          
          
          <li class="header-menu">
            <span>商家資料 / 訂單</span>
          </li>
          
          
          <li>
            <a href="#" onclick="location.href='findStore'">
              <i class="fa fa-book"></i>
              <span>基本資料更新</span>            
            </a>
          </li>
          
          <li>
            <a href="#" onclick="location.href='findStoreOrder'">
              <i class="fa fa-calendar"></i>
              <span>商品訂單查詢</span>
            </a>
          </li>
          
          
          <li>
            <a href="#" >
              <i class="fa fa-folder"></i>
              <span>募資訂單查詢</span>
            </a>
          </li>
          
            <li>
            <a href="#" onclick="location.href='findStoreReturn'">
              <i class="fa fa-folder"></i>
              <span>退貨審核</span>
            </a>
          </li>
          
        </ul>
      </div>
      <!-- sidebar-menu  -->
    </div>
    <!-- sidebar-content  -->

  </nav>
  <!-- sidebar-wrapper 右邊內容放此 -->
  <main class="page-content">
  <h1>募資訂單查詢</h1>
  <hr>
  	 <!-- 				我的募資訂單查詢 ----------------------------------------------------------------------------------------------------------------------->
				<div class="tab-pane" id="list-fundproject" role="tabpanel" aria-labelledby="list-fundproject-list"style="font-size: 20px;">
				  	<div id="tabs">
				  			<div>
								<form action="getRangeDate" method="post">
								<h3 >起訖時間：<input type="date" name="startDate">-<input type="date" name="endDate" > 
								<input type="submit" value="搜尋"><span style="color:red;"> ${errorFundOrderDetail}</span></h3>
								</form>
								<form action="getFundOrderDetailPoi" method="post">
								<h3 >起訖時間：<input type="date" name="startDate">-<input type="date" name="endDate" > 
								<input type="submit" value="下載區間報表"><span style="color:red;"> ${errorFundOrderDetailToPOI}</span></h3>
								</form>
							</div>
						    <div class="tab" style="color: black;">
								  <button class="tablinks" onclick="openCity(event, 'NewYork')" id="defaultOpen" >全部</button>
								  <button class="tablinks" onclick="openCity(event, 'Korea')">已受理</button>
								  <button class="tablinks" onclick="openCity(event, 'Japan')">備貨中</button>
								  <button class="tablinks" onclick="openCity(event, 'Tailand')">已出貨</button>
								  <button class="tablinks" onclick="openCity(event, 'UK')">已完成訂單</button>					  
							<div style="text-align: right; padding-right: 10%;">
									<form action="getReverseFundOrder" method="post">
									<input type="submit" value="排序">
									<select name="getLineUp">
										<option value="forward">順向排序</option>
										<option value="reverse">逆向排序</option>
									</select>				
									</form>
							</div>
							
							</div>
							
<!-- 				查詢全部狀態訂單			 ----------------------------------------------------------->
				<div id="NewYork" class="tabcontent">
					<table class="table" style="color: black;">
						<thead align="center"  style="background-color: rgba(255,235,59,0.3)">
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col" style="width: 130px">收件地址</td>
									<td scope="col" style="width: 300px">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">物流公司</td>
									<td scope="col">物流單號</td>
									<td scope="col">訂單狀態</td>
									<td scope="col">備註</td>
								</tr>
							</thead>
							<c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
							<form action="updateFundOrder" method="post">
							<tbody >
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row" >${fundOrderList.fundOrderName }</td>
									<td scope="row" >${fundOrderList.fundOrderAddress }</td>
									<td scope="row" style="OVERFLOW: scroll; HEIGHT:100px;display: block;">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">
<!-- -------------------------當訂單狀態==完成訂單，直接顯示運送狀態，且不與編輯------------------------------------------------------------ -->										
										<c:if test="${not empty fundOrderList.fundOorderDeliveryName}">
												${fundOrderList.fundOorderDeliveryName }
										</c:if>
									</td>
									<td scope="row">
<!-- -------------------------當訂單狀態==完成訂單，直接顯示運送狀態，且不與編輯------------------------------------------------------------ -->										
										<c:if test="${not empty fundOrderList.fundOrderDeliveryNumber}">
												${fundOrderList.fundOrderDeliveryNumber}
										</c:if>									
									</td>
									<td scope="row">${fundOrderList.fundOrderStatus }</td>
									<td scope="row">
									<c:if test="${fundOrderList.fundOrderStatus=='已受理'}">
										請至受理頁面審核
									</c:if>									
									<c:if test="${fundOrderList.fundOrderStatus=='完成訂單'}">
										顧客已取貨
									</c:if>
									</td>
								</tr>
							</tbody>
							</form>		
							</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" >${noFundOrder}</h1>
						</c:if>
					</div>
<!-- 					查詢已受理狀態訂單 --------------------------------------------------------------->
					<div id="Korea" class="tabcontent">
					<table class="table" style="color: black;">
						<thead align="center" style="background-color: rgba(255,235,59,0.3)">
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col">收件地址</td>
									<td scope="col" style="width: 300px;">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">訂單狀態</td>
									<td scope="col">EDIT</td>
								</tr>
							</thead>
					  <c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
						<c:if test="${fundOrderList.fundOrderStatus=='已受理' }">
						  <form action="updateFundOrder" method="post">
							<tbody align="center" >
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row">${fundOrderList.fundOrderName }</td>
									<td scope="row">${fundOrderList.fundOrderAddress }</td>
									<td scope="row"style="OVERFLOW: scroll; HEIGHT:100px;display: block;">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">
											<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="prepare">備貨中</option>										
											</select>
									</td>
									<td scope="row">
										<input type="hidden" placeholder="因共用同個controller，雖沒用到仍需存在"	name="deliveryNumber"	>
										<input type="hidden" value="${fundOrderList.fundOrderId}" name="fundOrderId">
										<input type="submit" value="修改">
									</td>
								</tr>
							</tbody>
							</form>
						  </c:if>
						</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" style="color: black;">${noFundOrder}</h1>
						</c:if>
					</div>
					
<!-- 					查詢"備貨中"狀態訂單 -------------------------------------------------------------------------------->
					<div id="Japan" class="tabcontent">
					<table class="table" style="color: black;">
						<thead align="center" style="background-color: rgba(255,235,59,0.3)">
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col">收件地址</td>
									<td scope="col" style="width: 300px;">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">物流公司</td>
									<td scope="col">物流單號</td>
									<td scope="col">EDIT</td>
								</tr>
							</thead>
					  <c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
						<c:if test="${fundOrderList.fundOrderStatus=='備貨中' }">
						  <form action="updateFundOrder" method="post">
							<tbody align="center">
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row">${fundOrderList.fundOrderName }</td>
									<td scope="row">${fundOrderList.fundOrderAddress }</td>
									<td scope="row" style="OVERFLOW: scroll; HEIGHT:100px;display: block;">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">
<!-- 									當orderDetail.orderDeliveryName尚未選擇時，將選單選項欲設為請選擇 ------- -->	
										<c:if test="${empty fundOrderList.fundOorderDeliveryName }">										
											<select name="deliveryName" >
												<option value="請選擇">請選擇</option>
												<option value="blackCatDelivery">黑貓</option>
												<option value="postDelivery">郵局</option>
											</select>
										</c:if>
<!-- 									當orderDetail.orderDeliveryName不為空且訂單狀態不是完成訂單時，將對應的貨運名稱直接顯示於選單 -->
										<c:if test="${not empty fundOrderList.fundOorderDeliveryName }">										
											<select name="deliveryName" >
												<option value="${fundOrderList.fundOorderDeliveryName }">${fundOrderList.fundOorderDeliveryName}</option>
												<option value="blackCatDelivery">黑貓</option>
												<option value="postDelivery">郵局</option>
											</select>
										</c:if>
<!-- -------------------------當訂單狀態==完成訂單，直接顯示運送狀態，且不與編輯------------------------------------------------------------ -->										
										<c:if test="${fundOrderList.fundOrderStatus=='完成訂單'}">
												${fundOrderList.fundOorderDeliveryName }
										</c:if>
									</td>
									<td scope="row">
<!-- 									當orderDetail.orderDeliveryNumber為空時，給個欄位讓商家可以輸入"配送編號" -->
										<c:if test="${empty fundOrderList.fundOrderDeliveryNumber}">
											<input type="text" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; width: 140px;">
										</c:if> 
<!-- 										當orderDetail.orderDeliveryNumber不為空且訂單狀態不等於完成訂單時，將"配送編號"顯示於欄位內----- -->
										<c:if test="${not empty fundOrderList.fundOrderDeliveryNumber &&fundOrderList.fundOrderStatus!='完成訂單'}">
											<input type="text" value="${ fundOrderList.fundOrderDeliveryNumber}" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent;  width: 140px;">											
										</c:if>
									</td>
									<td scope="row">
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="ship">已出貨</option>										
											</select>
										<input type="hidden" value="${fundOrderList.fundOrderId }" name="fundOrderId">
										<input type="submit" value="修改">
									</td>
								</tr>
							</tbody>
						  </form>
						  </c:if>
						</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" style="color: black;">${noFundOrder}</h1>
						</c:if>
					</div>
<!-- 					查詢"已出貨"狀態訂單 -------------------------------------------------------------->
					<div id="Tailand" class="tabcontent">
					<table class="table" style="color: black;">
						<thead align="center" style="background-color: rgba(255,235,59,0.3)">
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col">收件地址</td>
									<td scope="col" style="width: 300px;">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">物流公司</td>
									<td scope="col">物流單號</td>
									<td scope="col">EDIT</td>
								</tr>
							</thead>
					  <c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
						<c:if test="${fundOrderList.fundOrderStatus=='已出貨' }">
						  <form action="updateFundOrder" method="post">
							<tbody align="center">
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row">${fundOrderList.fundOrderName }</td>
									<td scope="row">${fundOrderList.fundOrderAddress }</td>
									<td scope="row" style="OVERFLOW: scroll; HEIGHT:100px;display: block;">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">
<!-- 									當orderDetail.orderDeliveryName尚未選擇時，將選單選項欲設為請選擇 ------- -->	
										<c:if test="${empty fundOrderList.fundOorderDeliveryName }">										
											<select name="deliveryName" >
												<option value="請選擇">請選擇</option>
												<option value="blackCatDelivery">黑貓</option>
												<option value="postDelivery">郵局</option>
											</select>
										</c:if>
<!-- 									當orderDetail.orderDeliveryName不為空且訂單狀態不是完成訂單時，將對應的貨運名稱直接顯示於選單 -->
										<c:if test="${not empty fundOrderList.fundOorderDeliveryName }">										
											<select name="deliveryName" >
												<option value="${fundOrderList.fundOorderDeliveryName }">${fundOrderList.fundOorderDeliveryName}</option>
												<option value="blackCatDelivery">黑貓</option>
												<option value="postDelivery">郵局</option>
											</select>
										</c:if>
<!-- -------------------------當訂單狀態==完成訂單，直接顯示運送狀態，且不與編輯------------------------------------------------------------ -->										
										<c:if test="${fundOrderList.fundOrderStatus=='完成訂單'}">
												${fundOrderList.fundOorderDeliveryName }
										</c:if>
									</td>
									<td scope="row">
<!-- 									當orderDetail.orderDeliveryNumber為空時，給個欄位讓商家可以輸入"配送編號" -->
										<c:if test="${empty fundOrderList.fundOrderDeliveryNumber}">
											<input type="text" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent;  width: 140px;">
										</c:if> 
<!-- 										當orderDetail.orderDeliveryNumber不為空且訂單狀態不等於完成訂單時，將"配送編號"顯示於欄位內----- -->
										<c:if test="${not empty fundOrderList.fundOrderDeliveryNumber &&fundOrderList.fundOrderStatus!='完成訂單'}">
											<input type="text" value="${ fundOrderList.fundOrderDeliveryNumber}" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent;  width: 140px;">											
										</c:if>									
									</td>
									<td scope="row">
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="ship">已出貨</option>										
											</select>
										<input type="hidden" value="${fundOrderList.fundOrderId }" name="fundOrderId">
										<input type="submit" value="修改">									
									</td>
								</tr>
							</tbody>
							</form>
						  </c:if>
						</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" style="color: black;">${noFundOrder}</h1>
						</c:if>
					</div>
<!-- 					查詢已完成狀態訂單 ---------------------------------------------------------------------------------->
					<div id="UK" class="tabcontent">
					<table class="table" style="color: black;">
						<thead align="center" style="background-color: rgba(255,235,59,0.3)">
								<tr>
									<td scope="col">編號</td>
									<td scope="col">贊助日期</td>
									<td scope="col">收件人</td>
									<td scope="col">收件地址</td>
									<td scope="col" style="width: 300px;">贊助商品</td>
									<td scope="col">贊助金額</td>
									<td scope="col">配送方式</td>
									<td scope="col">物流公司</td>
									<td scope="col">物流單號</td>

								</tr>
							</thead>
					  <c:forEach items="${fundOrderList }" var="fundOrderList" varStatus="fundOrderListVar">
						<c:if test="${fundOrderList.fundOrderStatus=='完成訂單' }">
						  <form action="updateFundOrder" method="post">
							<tbody align="center">
								<tr>
									<td scope="row">${fundOrderListVar.count }</td>
									<td scope="row"><fmt:formatDate value="${fundOrderList.fundOrderDate }" pattern="yyyy-MM-dd"/></td>
									<td scope="row">${fundOrderList.fundOrderName }</td>
									<td scope="row">${fundOrderList.fundOrderAddress }</td>
									<td scope="row" style="OVERFLOW: scroll; HEIGHT:100px;display: block;">${fundOrderList.fundOrderProductName }</td>
									<td scope="row"><fmt:formatNumber value="${fundOrderList.fundOrderTotal }" pattern="#,###,###,###"/></td>
									<td scope="row">${fundOrderList.fundOrderDeliveryMethod }</td>
									<td scope="row">${fundOrderList.fundOorderDeliveryName }</td>
									<td scope="row">${fundOrderList.fundOrderDeliveryNumber }</td>

								</tr>
							</tbody>
							</form>
						  </c:if>
						</c:forEach>				
					</table>
						<c:if test="${not empty noFundOrder}">
							<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
							<h1 align="center" style="color: black;">${noFundOrder}</h1>
						</c:if>
					</div>
					
				 </div>		
				</div>
				
				
				<!-- --ListGroupEnd---------------------- -->
  </main>


 	
<!--  -->	
  <!-- page-content" -->
</div>
<!-- page-wrapper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    
</body>

</html>
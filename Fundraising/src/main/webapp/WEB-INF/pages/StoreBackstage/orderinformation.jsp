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
    <title>訂單查詢</title>
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
//	tabs頁籤function
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
  background-color: rgba(255,235,59,0.3);;
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
				width="40px" height="30px" alt="">思思募募</a>
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
                  <a href="#" onclick="location.href='FundProject'">
                   	募資提案
                  </a>
                </li>
                <li>
                  <a href="#" onclick="location.href='FindFundProject'">
                   	募資查詢/修改
                  </a>
                </li>
                <li>
                  <a href="#"  onclick="location.href='FindFundMsg'">
               		   募資留言
                  </a>
                </li>       
              </ul>
            </div>
          </li>
          
          
          
          <li class="header-menu">
            <span>商家資料 / 訂單</span>
          </li>
          
          
          <li>
            <a href="#"  onclick="location.href='findStore'">
              <i class="fa fa-book"></i>
              <span>基本資料更新</span>            
            </a>
          </li>
          
          <li>
            <a href="#">
              <i class="fa fa-calendar"></i>
              <span>商品訂單查詢</span>
            </a>
          </li>
          
          
          <li>
            <a href="#"  onclick="location.href='findStoreFundOrder'">
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
  <h1>商城訂單查詢</h1>
  <hr>
			<!--    商家訂單查詢 -------------------------------------------------------------------------->
				<div class="tab-pane " id="list-orders" role="tabpanel"	aria-labelledby="list-orders-list"style="font-size: 20px;">
				<div id="tabs">
				<div>
					<form action="getOrderRangeDate" method="post">
					<h3 >起訖時間：<input type="date" name="startDate" id="aa1">-<input type="date" name="endDate" id="aa2"> 
					<input type="submit" value="搜尋" ><span style="color:red;"> ${errorOrderDetail}</span></h3> 
					
					</form>						
					<form action="getOrderDetailPoi" method="post">
					<h3>起訖時間：<input type="date" name="startDate">-<input type="date" name="endDate"> 
					<input type="submit" value="下載區間報表"><span style="color:red;"> ${errorOrderDetailToPOI}</span></h3>
					</form>
				</div>				
				<div class="tab" style="color: black;">
					<button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen" >全部</button>
					<button class="tablinks" onclick="openCity(event, 'Paris')">已受理</button>
					<button class="tablinks" onclick="openCity(event, 'Tokyo')">備貨中</button>
					<button class="tablinks" onclick="openCity(event, 'Taiwan')">已出貨</button>
					<button class="tablinks" onclick="openCity(event, 'USA')">已完成訂單</button>							 
				<div style="text-align: right; padding-right: 10%;">
					<form action="getReverseOrder" method="post">
					<input type="submit" value="排序">
					<select name="getLineUp">
						<option value="forward">順向排序</option>
						<option value="reverse">逆向排序</option>
					</select>				
					</form>
					</div>
				
				</div>
				<div id="London" class="tabcontent">
					<table align="center" class="table" style="color: black;">	
						<thead style="background-color: rgba(255,235,59,0.3)">
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col">顧客資料</td>
								<td scope="col">訂單日期</td>
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">宅配方式</td>
								<td scope="col">貨運名稱</td>
								<td scope="col">配送貨號</td>
								<td scope="col">訂單狀態</td>
								<td scope="col" align="left">備註</td>
							</tr>
						</thead>
						
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
							<form action="updateDelivery" method="post">
								<tr align="center">
									<td scope="row">${orderDetailVar.count }</td>							
									<td scope="row">
												<button type="button" class="btn btn-primary"	data-toggle="modal"data-target="#exampleOrderCenter${orderDetail.order.getOrderId()}">查詢明細</button>
														<!-- Modal -->
													<div class="modal fade"	id="exampleOrderCenter${orderDetail.order.getOrderId()}" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalLabelCenter"aria-hidden="true">
														<div class="modal-dialog modal-lg" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel" style="color: black;">訂購人資料</h5>
																		<button type="button" class="close" data-dismiss="modal"aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																</div>
																	<div class="modal-body">
													<!------------------------------------------------------ -->
																	<table class="table">
																		<thead align="center">
																			<tr>
																				<td scope="col">收件人</td>
																				<td scope="col">收件地址</td>
																				<td scope="col">聯絡資訊</td>
																				<td scope="col">訂購日期</td>
																			</tr>
																		</thead>
																		<tbody align="center">
																			<tr>
																				<td scope="row">${orderDetail.order.getOrderName()}</td>
																				<td scope="row">${orderDetail.order.getOrderAddress()}</td>
																				<td scope="row">${orderDetail.order.getOrderPhone()}</td>
																				<td scope="row">	
																						<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
																				</td>
																			</tr>
																		</tbody>
																	</table>
													<!------------------------------------------------------ -->
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"data-dismiss="modal">Close</button>
																</div>
															</div>
														</div>
													</div>																
									</td>		
									<td scope="row"><fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" /></td>						
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
									<td scope="row">${orderDetail.orderDeliveryMethod}</td>
									<td scope="row">	
										<c:if test="${not empty orderDetail.orderDeliveryName }"> 
											${orderDetail.orderDeliveryName }
										</c:if>
									</td>
									<td scope="row">	${ orderDetail.orderDeliveryNumber}	</td>
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>								
									<td scope="row" align="left">		
										<c:if test="${orderDetail.orderDeliveryStatus=='已受理'}">
											請至受理頁面審核
										</c:if>
										<c:if test="${orderDetail.orderDeliveryStatus=='完成訂單'}">
											顧客已取貨
										</c:if>
									<c:if test="${orderDetail.orderDeliveryStatus=='退貨處理中'}">
									<input type="button" value="退貨處理中" onclick="alert('請至退貨訂單審核!')">
									</c:if>								
									<c:if test="${orderDetail.orderDeliveryStatus=='允許退貨'||orderDetail.orderDeliveryStatus=='拒絕退貨'}">
										退貨審核完畢
									</c:if>				
									</td>												
								</tr>
							</form>
						</c:forEach>	
											
					</table>
					</div>
<!-- -------------------------------已受理_頁籤-------------------------------------------------------------- -->					
				<div id="Paris" class="tabcontent">
					<table align="center" class="table" style="color: black;">	
						<thead style="background-color: rgba(255,235,59,0.3)">
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col">訂購日期</td>
								<td scope="col">收件人</td>
								<td scope="col">收件地址</td>
								<td scope="col">聯絡電話</td>
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">宅配方式</td>														
								<td scope="col">訂單狀態</td>
								<td scope="col">EDIT</td>
							</tr>
						</thead>
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
						<c:if test="${orderDetail.orderDeliveryStatus=='已受理'}">
							<form action="updateDelivery" method="post">
								<tr align="center">
									<td scope="row">${orderDetailVar.count }</td>							
									
									<td scope="row">	
											<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
									</td>	
									<td scope="row">${orderDetail.order.getOrderName()}</td>
									<td scope="row">${orderDetail.order.getOrderAddress()}</td>
									<td scope="row">${orderDetail.order.getOrderPhone()}</td>										
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
									<td scope="row">${orderDetail.orderDeliveryMethod}</td>														
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>								
									<td scope="row">		
<!-- 										當orderDeliveryStatus==已受理，給商家可以選擇出貨方式 ----------------------- -->									
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="prepare">備貨中</option>										
										</select> 
										<input type="hidden" value="${orderDetail.orderDetailId}"	name="orderDetailId"> 										
										<input type="submit" value="修改">								
									</td>																														
										<input type="hidden" placeholder="因共用同個controller，雖沒用到仍需存在"	name="deliveryNumber"	>																																
								</tr>
							</form>
						</c:if>
						</c:forEach>
						</table>
					</div>
<!-- -------------------------------備貨中__頁籤--------------------------------------------------------------------------------------------- -->					
					<div id="Tokyo" class="tabcontent">
						<table align="center" class="table" style="color: black;">	
						<thead style="background-color: rgba(255,235,59,0.3)">
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col" style="width: 130px;">訂購日期</td>
								<td scope="col">收件人</td>
								<td scope="col">收件地址</td>	
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">宅配方式</td>	
								<td scope="col">貨運名稱</td>
								<td scope="col">配送貨號</td>													
								<td scope="col">訂單狀態</td>
								<td scope="col">EDIT</td>
							</tr>
						</thead>
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
						<c:if test="${orderDetail.orderDeliveryStatus=='備貨中'}">
							<form action="updateDelivery" method="post">
								<tr align="center" >
									<td scope="row">${orderDetailVar.count }</td>							
									
									<td scope="row" style="width: 100px">	
											<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
									</td>	
									<td scope="row">${orderDetail.order.getOrderName()}</td>
									<td scope="row" style="width: 170px">${orderDetail.order.getOrderAddress()}</td>	
<%-- 									<td scope="row">${orderDetail.order.getOrderPhone()}</td>								 --%>
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
									<td scope="row">${orderDetail.orderDeliveryMethod}</td>	
									<td scope="row">												
			<!-- 									當orderDetail.orderDeliveryName尚未選擇時，將選單選項欲設為請選擇 ------- -->
												<c:if test="${ empty orderDetail.orderDeliveryName }">
												<select name="deliveryMethod" >
														<option value="請選擇">請選擇</option>
														<option value="blackCatDelivery">黑貓</option>
														<option value="postDelivery">郵局</option>
												</select>
												</c:if>
									</td>	
									<td scope="row">										
		<!-- 									當orderDetail.orderDeliveryNumber未輸入時，給個欄位讓商家可以輸入"配送編號" -->
											 	<c:if test="${empty orderDetail.orderDeliveryNumber}">
													<input type="text" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent;  width: 180px;">
												</c:if> 		
									</td>														
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>								
									<td scope="row">		
<!-- 										當orderDeliveryStatus已在備貨中頁籤，僅給商家出貨選項 ----------------------- -->									
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="ship">已出貨</option>										
										</select> 
										<input type="hidden" value="${orderDetail.orderDetailId}"	name="orderDetailId"> 										
										<input type="submit" value="修改">								
									</td>																														
								</tr>
							</form>
						</c:if>
						</c:forEach>
						</table>
					
					</div>
<!-- -------------------------------已出貨__頁籤--------------------------------------------------------------------------------------------- -->						
					<div id="Taiwan" class="tabcontent">				
					  <table align="center" class="table" style="color: black;">	
						<thead style="background-color: rgba(255,235,59,0.3)">
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col" style="width: 130px;">訂購日期</td>
								<td scope="col">收件人</td>
								<td scope="col">收件地址</td>	
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">貨運名稱</td>
								<td scope="col">配送貨號</td>													
								<td scope="col">訂單狀態</td>
								<td scope="col">EDIT</td>
							</tr>
						</thead>
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
						<c:if test="${orderDetail.orderDeliveryStatus=='已出貨'}">
							<form action="updateDelivery" method="post">
								<tr align="center" >
									<td scope="row">${orderDetailVar.count }</td>							
									
									<td scope="row" style="width: 100px">	
											<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
									</td>	
									<td scope="row">${orderDetail.order.getOrderName()}</td>
									<td scope="row" style="width: 170px">${orderDetail.order.getOrderAddress()}</td>	
<%-- 									<td scope="row">${orderDetail.order.getOrderPhone()}</td>								 --%>
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
<%-- 									<td scope="row">${orderDetail.orderDeliveryMethod}</td>	 --%>
									<td scope="row">												
<!-- 									當orderDetail.orderDeliveryName不為空時，將對應的貨運名稱直接顯示於選單 -->
											<c:if test="${not empty orderDetail.orderDeliveryName }">
											<select name="deliveryMethod" >
													<option value="${orderDetail.orderDeliveryName }">${orderDetail.orderDeliveryName }</option>
													<option value="blackCatDelivery">黑貓</option>
													<option value="postDelivery">郵局</option>
											</select>
											</c:if>
									</td>	
									<td scope="row">										
<!-- 										當orderDetail.orderDeliveryNumber不為空時，將"配送編號"顯示於欄位內----- -->
										<c:if test="${not empty orderDetail.orderDeliveryNumber}">
											<input type="text" value="${ orderDetail.orderDeliveryNumber}" placeholder="請輸入配送編號"	name="deliveryNumber"	style="BACKGROUND-COLOR: transparent; color: black; width: 180px;">											
										</c:if>		
									</td>														
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>								
									<td scope="row">		
<!-- 										當orderDeliveryStatus已在備貨中頁籤，僅給商家出貨選項 ----------------------- -->									
										<select name="status">
												<option value="請選擇">請選擇</option>
												<option value="ship">已出貨</option>										
										</select> 
										<input type="hidden" value="${orderDetail.orderDetailId}"	name="orderDetailId"> 										
										<input type="submit" value="修改">								
									</td>																														
								</tr>
							</form>
						</c:if>
						</c:forEach>
						</table>				
					</div>
<!-- ------------------訂單已完成_頁籤-------------------------------------------------------------------------------------- -->					
					<div id="USA" class="tabcontent">
						<table align="center" class="table" style="color: black;">	
						<thead style="background-color: rgba(255,235,59,0.3)">
							<tr align="center">
								<td scope="col">編號</td>
								<td scope="col" >訂購日期</td>
								<td scope="col">收件人</td>
								<td scope="col">商品名稱</td>
								<td scope="col">商品數量</td>
								<td scope="col">商品金額</td>
								<td scope="col">宅配方式</td>
								<td scope="col">貨運名稱</td>
								<td scope="col">配送貨號</td>														
								<td scope="col">訂單狀態</td>
							</tr>
						</thead>
						<c:forEach items="${getOrderDetail}" var="orderDetail"	varStatus="orderDetailVar" >
						<c:if test="${orderDetail.orderDeliveryStatus=='完成訂單'}">
							<form action="updateDelivery" method="post">
								<tr align="center" >
									<td scope="row">${orderDetailVar.count }</td>								
									<td scope="row" >	
											<fmt:formatDate value="${orderDetail.order.getOrderDate()}" pattern="yyyy-MM-dd" />
									</td>	
									<td scope="row">${orderDetail.order.getOrderName()}</td>
									<td scope="row">${orderDetail.orderDetailName}</td>
									<td scope="row">${orderDetail.orderDetailAmount }</td>
									<td scope="row">
										<fmt:formatNumber value="${orderDetail.orderDetailPrice }" pattern="###,###,###" />									
									</td>
									<td scope="row">${orderDetail.orderDeliveryMethod}</td>	
									<td scope="row">	${orderDetail.orderDeliveryName }	</td>	
									<td scope="row">	${ orderDetail.orderDeliveryNumber}	</td>														
									<td scope="row">${orderDetail.orderDeliveryStatus}</td>																																		
								</tr>
							</form>
						</c:if>
						</c:forEach>
						</table>
					</div>
					<c:if test="${not empty noItemsOrders}">
						<img src="images/noOrders.png" width="240" height="250" style="display:block; margin:auto;">
						<h1 align="center" style="color: black;">${noItemsOrders }</h1>
					</c:if>
					</div>
				</div>
<!-- Order__End------------------------------------------------------------------------------------------------------------------------------- -->
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
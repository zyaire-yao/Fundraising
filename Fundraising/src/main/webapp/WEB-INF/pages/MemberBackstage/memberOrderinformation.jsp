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
    <title>思思募募</title>
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
  background-color: yellow;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: rgba(105,105,105);
}

/* Create an active/current tablink class */
.tab button.active {
  background-color:rgba(255,255,255);
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid none;
  border-top: none;
  
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
            
            
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fa fa-shopping-cart"></i>
              <span>基本資料查詢</span>
<!--               <span class="badge badge-pill badge-danger">3</span> -->
            </a>
            <div class="sidebar-submenu">
              <ul>
              
                <li>
                  <a href="#" onclick="location.href='findMember'">
					會員基本資料
                  </a>
                </li>
                
                <li>
                  <a href="#" onclick="location.href='findPwd'" >
                  	更改密碼
                  </a>
                </li>
                
              </ul>
            </div>
            
          </li>

          
          
          <li class="header-menu">
            <span>訂單</span>
          </li>
          
                    
          
          <li>
            <a href="#" >
              <i class="fa fa-calendar"></i>
              <span>商品訂單查詢</span>
            </a>
          </li>
          
          
          <li>
            <a href="#" onclick="location.href='findMemberFundOrder'">
              <i class="fa fa-folder"></i>
              <span>募資訂單查詢</span>
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
     <h1>會員商品訂單查詢</h1>
  <hr>
    			<!---------我的訂單----------->
				<div class="tab-pane" id="list-messages" role="tabpanel"
					aria-labelledby="list-messages-list">
					<!---------內容---------------->

					<c:forEach var="listOrder" items="${listOrder}"	varStatus="listVarStatus">
						<table class="table">
							<thead align="center" style="background-color: rgba(255,235,59,0.3)">
								<tr>
									<th scope="col">編號</th>
									<th scope="col">訂單日期</th>
									<th scope="col" style="width: 130px">收件人姓名</th>
									<th scope="col">收件人電話</th>
									<th scope="col" style="width: 150px">收件人地址</th>
									<th scope="col">訂單總金額</th>									
									<th scope="col">出貨狀態</th>
									<th scope="col">查看明細</th>
								</tr>
							</thead>		
							<tbody align="center">					
								<tr>
									<td scope="row">${listVarStatus.count}</td>
									<td scope="row">
										<fmt:formatDate value="${listOrder.orderDate}" pattern="yyyy-MM-dd"/>
									</td>
									<td scope="row">${listOrder.orderName}</td>
									<td scope="row">${listOrder.orderPhone}</td>
									<td scope="row">${listOrder.orderAddress}</td>
									<td scope="row">
										$<fmt:formatNumber value="${listOrder.orderTotal}"  pattern="###,###,###"/>元
									</td>								
									<td scope="row">${listOrder.orderStatus}</td>
									<td scope="row">
										<button type="button" class="btn btn-primary"	data-toggle="modal"
											data-target="#exampleOrderCenter${listOrder.orderId}">查看明細</button>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- Modal -->
						<div class="modal fade"	id="exampleOrderCenter${listOrder.orderId}" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabelCenter"aria-hidden="true">
							<div class="modal-dialog modal-xl" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">訂單明細</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<!------------------------------------------------------ -->
										<table class="table">
											<thead align="center" style="background-color: rgba(255,235,59,0.3)">
												<tr>
													<td scope="col">商品名稱</td>
													<td scope="col">單價</td>
													<td scope="col">數量</td>
													<td scope="col">配送方式</td>
													<td scope="col">貨運公司</td>
													<td scope="col">物流單號</td>
													<td scope="col">訂單狀態</td>
													<td scope="col">我要退貨</td>
													<td scope="col">完成訂單</td>										
												</tr>
											</thead>
											<c:forEach var="listOrderdetail" items="${listOrderdetail}">
												<c:forEach var="listOrderdetail1" varStatus="abc"	items="${listOrderdetail}">
													<c:if test="${listOrderdetail1.order.getOrderId() == listOrder.orderId}">
														<tbody align="center">												
																<tr>
																	<td scope="row">${listOrderdetail1.orderDetailName}</td>
																	<td scope="row"><fmt:formatNumber	value="${listOrderdetail1.orderDetailPrice}"
																			pattern="###,###,###" />元</td>
																	<td scope="row"><fmt:formatNumber
																			value="${listOrderdetail1.orderDetailAmount}"
																			pattern="###,###,###" />件</td>
																	<td scope="row">${listOrderdetail1.orderDeliveryMethod}</td>
																	<td scope="row">${listOrderdetail1.orderDeliveryName}</td>
																	<td scope="row">${listOrderdetail1.orderDeliveryNumber}</td>
																	<td scope="row">${listOrderdetail1.orderDeliveryStatus}</td>
<!-- 																	我要退貨欄位 -->
																	<td scope="row">
																		<c:if test="${listOrderdetail1.orderDeliveryStatus!='完成訂單' }">
																				<c:if	test="${listOrderdetail1.orderDeliveryStatus=='已受理'||listOrderdetail1.orderDeliveryStatus=='備貨中'}">
																					<form action="itemReturnedSystem" method="post"	onsubmit="false">
																						<input type="hidden"	value="${listOrderdetail1.orderDetailId}"	name="itemOrderId"> 
																						<input type="submit"	value="取消訂單" onclick="return returnCheck()">
																					</form>
																				</c:if>
																				
																				<c:if	test="${listOrderdetail1.orderDeliveryStatus=='已出貨'}">
																					<form action="itemReturnedSystem" method="post"	onsubmit="false">
																						<input type="hidden"	value="${listOrderdetail1.orderDetailId}"	name="itemOrderId"> 
																						<input type="submit"	value="我要退貨" onclick="return returnCheck()">
																					</form>
																				</c:if>
																		</c:if>
																			<c:if test="${listOrderdetail1.orderDeliveryStatus=='退貨處理中'}">
																				審核中
																			</c:if>
																			
																			<c:if test="${listOrderdetail1.orderDeliveryStatus=='允許退貨'||listOrderdetail1.orderDeliveryStatus=='拒絕退貨'}">
																				審核完畢
																			</c:if>
																	</td>	
<!-- 																	完成訂單欄位 -->
																	<td scope="row">	
																		<c:if test="${listOrderdetail1.orderDeliveryStatus=='已出貨' }">
																				<form action="finishOrder" method="post" id="finishOrder" onsubmit="false">		
																						<input type="hidden" 	value="${listOrderdetail1.orderDetailId}" name="itemOrderId">
																						<input type="submit" 	value="完成訂單"  onclick="if (!(confirm('商品都檢查完畢了嗎?'))) return false">
																				</form>	
																			</c:if>	
																		<c:if test="${listOrderdetail1.orderDeliveryStatus=='完成訂單' }">
																						已取貨
																		</c:if>
																	</td>
																</tr>															
																</tbody>
															</c:if>												
												</c:forEach>
											</c:forEach>
										</table>

										<!------------------------------------------------------ -->

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>

								</div>
							</div>
						</div>


					</c:forEach>

				</div>


				<!-- ------------------------------------------------------------------ -->
  </main>
   


<script type="text/javascript" src="${pageContext.request.contextPath}/js/memberRegular.js" ></script>

<script type="text/javascript">
	function readURL( img ){
		if( img.files && img.files[0] )
			var reader = new FileReader();
		reader.onload = function(e){
			$("#memberPic").attr('src' , e.target.result );
		}
		reader.readAsDataURL(img.files[0]) ;
	}

	$("#memberPicInput").change(function(){
		readURL(this) ;
	})
</script>



      </div>
      
    </div>
  </div>

</div>
 	
<!--  -->	
  <!-- page-content" -->
</div>
<!-- page-wrapper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/storeRegular.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/allProduct.js" ></script> 
</body>

</html>
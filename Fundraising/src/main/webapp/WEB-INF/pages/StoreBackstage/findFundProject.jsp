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
    <title>商品上架/編輯</title>
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
.row .cards{
	border-radius: 8px;
	box-shadow: 0  0px rgba(30, 144, 255,.2);
	overflow: hidden;
	transition:all 0.25s;
}	
.row .cards:hover {
	transform:translateY(-15px);
	box-shadow: 0  3px 5px rgba(30, 144, 255,0.2);
}
.imgbg{	
background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
			url('${pageContext.request.contextPath}/images/productPic/bg4.jpg') no-repeat 0% 20%/ cover;
font-family: 'Noto Sans TC', sans-serif;
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
                  <a href="#" onclick="location.href='FindFundMsg'" >
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
              <a href="#" onclick="location.href='findStoreOrder'">
              <i class="fa fa-calendar"></i>
              <span>商品訂單查詢</span>
            </a>
          </li>
          
          
          <li>
            <a href="#" onclick="location.href='findStoreFundOrder'" >
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
  <h1>募資專案查詢/修改</h1>
  <hr>
   			 <div class="row" style="font-size: 15px;">
<!--    			 	<div class="card-deck"> -->
						<c:forEach items="${test}" var="b" varStatus="st" >
							<div class="col-md-3 mb-4 " style="opacity:0.8;" id="touch" >
								<form action="getUpdateFundProject" method="get">
									<div class="card cards text-center"  >									
												<div class="card-body mb-4" >
														<div>
															<c:if test="${b.fundProjectStatus =='審核中'||b.fundProjectStatus =='審核失敗'}">
																<p class="card-text" >
																	<c:if test="${b.fundProjectStatus =='審核失敗'}">
																			<h2 style="color: bl;">${b.fundProjectStatus}</h2>
																	</c:if>
																	<c:if test="${b.fundProjectStatus =='審核中'}">
																			<h2 style="color: black;">${b.fundProjectStatus}</h2>
																	</c:if>
																</p>
																<hr style=" border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));">																
																<input type="hidden" value="${b.fundProjectId}" name="fundProjectId">
																<p class="card-text" >提案名稱：${b.fundProjectTitle}</p>																
																<p class="card-text" >提案金額：<fmt:formatNumber value="${b.fundProjectTotal}" pattern="###,###,###,###"/></p>
																<p class="card-text" >提案天數：${b.fundProjectDate}</p>																
																提案內容：<p class="card-text" style="OVERFLOW: scroll; HEIGHT:100px;">${b.fundProjectPf}</p>
																<p class="card-text" >
																	<input type="button" onclick="downloadFun(<c:out value="${st.count}"/>)" value="下載">
																	<input type="submit" value="更改">
																</p>																
															</c:if>
															<c:if test="${b.fundProjectStatus =='審核通過'}">
																<p class="card-text" >
																	<c:if test="${empty b.fundProducts}">
																		<h2 style="color: green;">${b.fundProjectStatus}</h2>
                                 								 </c:if>
                                 								 <c:if test="${not empty b.fundProducts}">
                                   								 <h2 style="color: rgba(238,201,0);">已上架</h2>
                                 									 </c:if>
																</p>
																<hr style=" border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));">
																<input type="hidden" value="${b.fundProjectId}" name="fundProjectId">
																<input type="hidden" value="${b.fundProjectId}" name="fundProjectId">
																<p class="card-text" >提案名稱：${b.fundProjectTitle}</p>																
																<p class="card-text" >提案金額：<fmt:formatNumber value="${b.fundProjectTotal}" pattern="###,###,###,###"/></p>
																<p class="card-text" >提案天數：${b.fundProjectDate}</p>																
																提案內容：<p class="card-text" style="OVERFLOW: scroll; HEIGHT:100px;">${b.fundProjectPf}</p> 
																<c:if test="${empty b.fundProducts}">
																	<input type="button" onclick="addFundProduct(<c:out value="${st.count}"/>)" value="新增募資商品上架資料">
																</c:if>
																<c:if test="${not empty b.fundProducts}">
																	<input type="button" onclick="updateFundProduct(<c:out value="${st.count}"/>)"  value="編輯募資商品">
																	<input type="button" onclick="findAllFundProgramByFundProjectId(<c:out value="${st.count}"/>)" value="新增贊助方案">
																</c:if>
															</c:if>															
														</div>										
												</div>
									</div>
								</form>
							</div>
						    <form action="downloadFile" id="downloadFileForm<c:out value="${st.count}"/>" method="get">
						     		<input type="hidden" value="${b.fundProjectProject}" name="fundProjectProject">
						    </form>
						    <form action="getAddFundProduct" id="addFundProduct<c:out value="${st.count}"/>" method="get">
						    		<input type="hidden" value="${b.fundProjectId}" name="fundProjectId">      
						    </form>
						    <form action="getUpdateFundProduct" id="updateFundProduct<c:out value="${st.count}"/>" method="get">
						    		<input type="hidden" value="${b.fundProjectId}" name="fundProjectId">      
						    </form>
						    <form action="findAllFundProgramByFundProjectId" id="findAllFundProgramByFundProjectId<c:out value="${st.count}"/>" method="get">
						    		<input type="hidden" value="${b.fundProjectId}" name="fundProjectId">      
						    </form>							
						</c:forEach>
<!-- 						</div>			 -->
			</div>
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
<!-- 下載檔案 -->
<script type="text/javascript">  
function downloadFun(st){
 document.getElementById("downloadFileForm" + st).submit();
}
</script>
<!---------------------------->

<!-- 上傳募資文案 -->
<script type="text/javascript">
function addFundProduct(st){
 document.getElementById("addFundProduct" + st).submit();
}
</script>
<!---------------------------->

<!-- 更新募資文案 -->
<script type="text/javascript">
function updateFundProduct(st){
 document.getElementById("updateFundProduct" + st).submit();
}
</script>
<!---------------------------->
<!-- 抓取募資方案 -->
<script type="text/javascript">
function findAllFundProgramByFundProjectId(st){
 document.getElementById("findAllFundProgramByFundProjectId" + st).submit();
}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<meta charset="utf-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 首頁</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
</head>
<style>
	body {
	font-family: 'Noto Sans TC', sans-serif;
	overflow-x:hidden;
	color: #505962; 
	}
	
	/* Navbar*/
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
	
	/* Slider*/
	.carousel-item{
		height: 100vh;
		background-size: cover;
		background-repeat: no-repeat;
	}
	.carousel-caption{
		position: absolute;
		top:38%;
		text-transform: uppercase;
		width: 800px;
		right: 0;
		left: 0;
	}
	.carousel-caption h1{
	font-size: 3.8rem;
	font-weight: 700;
	letter-spacing: .3rem;
	text-shadow: .1rem .1rem .8rem black;
	padding-bottom: 1rem;
	}
	.carousel-caption h3{
	font-size: 2rem;
	text-shadow: .1rem .1rem .5rem black;
	padding-bottom: 1.6rem;
	}
	
	.btn-lg{
	border-width: medium;
	border-radius:0; 
	font-size: 1.1rem;
	}
	#box {
	background:rgba(0,0,0,0.6);
	border-radius:1%;
	font-family: 'Noto Sans TC', sans-serif;
	width:800px;
	height: 300px;
	margin: 0 auto;

}
	

/* --- Media Queries-- */
@media (max-width:767px) {
	.carousel-caption h1{
		font-size: 2.3rem;
		letter-spacing: .15rem;	
		padding-bottom: .5rem;
	}
	.carousel-caption h3{
		font-size: 1.2rem;
		padding-bottom: 1.2rem;
	}	
	.btn-lg{
	    font-size: 1rem;
	}
}	
</style>
<c:if test="${empty allAt}">
<body onload="location.href='getAnnouncementsToHome'">
</c:if>

<c:if test="${not empty allAt}">
<body>
</c:if>
<!-- <body> -->

<!-- Star  HOME  -->
<div id="home">

<!--  Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background:rgba(0,0,0,0.6)";>
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
					<li class="nav-item active">
					
					<a class="nav-link" href="#" onclick="location.href='${pageContext.request.contextPath}'">首頁
							<span class="sr-only">(current)</span>
					</a>
					</li>
						<c:if test="${not empty sessionScope.memberSession}"><!-- 如果不為空 才顯示 -->
					      <li class="nav-item">
					        <a class="nav-link" href="#" onclick="location.href='findMember'">會員專區</a>
					      </li>
					     
					      <c:if test="${empty sessionScope.storeSession}"><!-- 如果不為空 才顯示 -->
					       <li class="nav-item">
					        <a class="nav-link" href="#" onclick="location.href='registerStore'">註冊商家</a>				     	
					      </li>
					      </c:if>
					      
					       <c:if test="${not empty sessionScope.storeSession}"><!-- 如果不為空 才顯示 -->
					      <li class="nav-item">					     
					        <a class="nav-link" href="#" onclick="location.href='findStore'">賣家中心</a>					      
					      </li>
					      
					       </c:if>
					        
					      </c:if> 
<!-- 					       <li class="nav-item"> -->
<!-- 					        <a class="nav-link" href="#" onclick="location.href='managerlogin'">後臺登入</a> -->
<!-- 					  		 </li>    -->
					  		 
					  		<li class="nav-item">
							<a class="nav-link" href="#" data-toggle="modal" id="announcement"
							data-target="#exampleModalCenter">公告</a>
					  		</li> 
					  		
					  		
					<li class="nav-item dropdown">
			<a  class="nav-link dropdown-toggle" href="#"  id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false" > 
			商品 
			</a>
						
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#" onclick="location.href='getAllFundProductForCustomer'">募資商品</a> 
							<a  class="dropdown-item" href="#"  onclick="location.href='getAllProduct'">商品選購</a> 
						
						</div>
					</li>
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
<!--  Navbar -->

<!--  Start image slider -->
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel"
		 date-interval="7000"	>
		 
			<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li> 
			
			<li data-target="#carouselExampleIndicators" data-slide-to="1" ></li> 
			
			<li data-target="#carouselExampleIndicators" data-slide-to="2" ></li> 
			</ol>
			
			<div  class="carousel-inner" role="listbox">
				<!-- ----Slide1 ---- -->
				<div class="carousel-item active" style="background-image:url('${pageContext.request.contextPath}/images/HomePagePic/item4.jpg'); ">
				
					<div class="carousel-caption text-center" id="box">
						<h1>Welcome</h1>
						<h3>募資&銷售平台</h3>
						<a class="btn btn-outline-light btn-lg" href="#" onclick="location.href='getAllProduct'">
						Get Start
						</a>
					</div>	
				</div>	
				<!-- -- Slide2 ---- -->
				<div class="carousel-item" style="background-image:url('${pageContext.request.contextPath}/images/HomePagePic/background-8.jpg'); ">
						<div class="carousel-caption text-center" id="box">
						<h1>Welcome to Website</h1>
						<h3>募資&銷售平台</h3>
						<a class="btn btn-outline-light btn-lg" href="#" onclick="location.href='getAllProduct'">
						Get Start
						</a>
				</div>	
				
				</div>
				<!-- -- Slide3 ---- -->
				<div class="carousel-item" style="background-image:url('${pageContext.request.contextPath}/images/HomePagePic/item3.jpg'); ">
						<div class="carousel-caption text-center" id="box">
						<h1>Welcome to Website</h1>
						<h3>募資&銷售平台</h3>
						<a class="btn btn-outline-light btn-lg" href="#" onclick="location.href='getAllProduct'">
						Get Start
						</a>
				</div>	
				
				</div>				
			</div> <!-- -- End Carousel inner --   -->
			<!-- - Prev & Next buttons---- -->
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
			 role="button" data-slide="prev">
			 		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</a>	
			
			<a class="carousel-control-next" href="#carouselExampleIndicators"
			 role="button" data-slide="next">
			 		<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</a>	
		</div>	

<!--  End image slider -->
</div>
<!-- End  HOME  -->


<!-- Modal  Start-->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">重要公告</h5>

					       

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!--東西請塞此  -->
        <c:forEach var="a11at" items="${allAt}">
								<form action="getAnnouncementByIdToHome" method="get">
									<img alt="" src=""> ${a11at.announcementTital}
									公告日期${a11at.announcementDate} <input type="hidden"
										value="${a11at.announcementId}" name="aaa"> <input
										type="submit" value="查詢">
								</form>
		</c:forEach>
	  <!--東西請塞此  -->
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- Modal End -->

<script type="text/javascript">
		function nofind() {
			var img = event.srcElement;
			img.src = "images/memberPic/T1213121.jpg"; //替換的圖片
			img.onerror = null; //控制不要一直觸發錯誤
		}
</script>
</body>
</html>
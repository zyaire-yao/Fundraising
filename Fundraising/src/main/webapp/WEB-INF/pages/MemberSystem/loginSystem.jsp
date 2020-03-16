<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%-- <jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap--> --%>
<meta charset="utf-8">
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}';
</script>
<title>登入</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

	$(document).ready(function() {
		$("form[name=subscribeform]").submit(function(ev) {
			if (grecaptcha.getResponse() != "") {
				return true;
			}
			alert("未通過驗證");
			return false;
		});
	});
</script>
<!-- Bootstrap core CSS -->


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
@import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
.login-block{
/*     background: #DE6262;  /* fallback for old browsers */ 
/* background: -webkit-linear-gradient(to bottom, #FFB88C, #DE6262);  /* Chrome 10-25, Safari 5.1-6 */ 
/* background: linear-gradient(to bottom, #FFB88C, #DE6262); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */ 
/* background-image:url("${pageContext.request.contextPath}/images/productPic/bg4.jpg"); */
float:left;
width:100%;
padding : 50px 0;
}
.banner-sec{background:url(https://static.pexels.com/photos/33972/pexels-photo.jpg)  no-repeat left bottom; background-size:cover; min-height:500px; border-radius: 0 10px 10px 0; padding:0;}
.container{background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);}
.carousel-inner{border-radius:0 10px 10px 0;}
.carousel-caption{text-align:left; left:5%;}
.login-sec{padding: 50px 30px; position:relative;}
.login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
.login-sec .copy-text i{color:#FEB58A;}
.login-sec .copy-text a{color:#E36262;}
.login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #DE6262;}
.login-sec h2:after{content:" "; width:100px; height:5px; background:#FEB58A; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
.btn-login{background: #DE6262; color:#fff; font-weight:600;}
.banner-text{width:70%; position:absolute; bottom:40px; padding-left:20px;}
.banner-text h2{color:#fff; font-weight:600;}
.banner-text h2:after{content:" "; width:100px; height:5px; background:#FFF; display:block; margin-top:20px; border-radius:3px;}
.banner-text p{color:#fff;}
</style>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet">
</head>
<body>		
	<section class="login-block">
   		<div class="container">
			<div class="row">
				<div class="col-md-4 login-sec">
		    		<h2 class="text-center">Login Now</h2>
		    			<form action="loginMember" method="post" class="form-signin" name="subscribeform">
 							<div class="form-group">
							 	<label for="inputEmail">輸入帳號</label>
							    <input type="email" id="memberEmail" name="memberEmail" class="form-control" placeholder="Email address" required>
							    <small style="color: red">${errorEmail}${errorAccount}${errorStatus1}${errorStatus2}</small>  
								<small id="memberEmailRegularLogin" class="text-danger"></small><br>   
  							</div>
  							<div class="form-group">
							  	<label for="inputPassword">輸入密碼</label>
							    <input type="text" id="memberPwd" name="memberPwd" class="form-control" placeholder="Password" required> 
							    <small style="color: red">${errorPwd}${errorNoPwd}</small>
								<small id="memberPwdRegular" class="text-danger"></small>
								<a href="#" onclick="location.href='findPwd'">Forgot Password?</a><br>
							 </div>     							
				<div class="g-recaptcha my-1" data-sitekey="6Le_YdUUAAAAAD5nxrA1HIK-E6xPCKbSgdNxCdgN"></div>
				
				<div class="aa">
					<button class="btn btn-lg btn-danger btn-block" type="submit">登入</button>
                    <button class="btn btn-lg btn-warning btn-block" type="button"
						onclick="location.href='${pageContext.request.contextPath}'">首頁</button>
				</div>  
					</form>
				</div>
				<div class="col-md-8 banner-sec">
            			
    					<div class="carousel-item ">
      						<img class="d-block img-fluid" src="https://static.pexels.com/photos/33972/pexels-photo.jpg" alt="First slide">
      					     						 
   						</div>
            	</div>	   
		    
				</div>
				</div>
		
	
</section>	
<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/memberRegular.js">
	
		</script>		

</body>
</html>
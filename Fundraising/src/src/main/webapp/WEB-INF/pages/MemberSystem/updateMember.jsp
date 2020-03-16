<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../init/bootstrap.jsp" /><!-- 套用 bootstrap-->
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}' ;
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>資料更新</h4>
<form action="memberUpdate" method="post" enctype="multipart/form-data">
頭像:<br>
<img  src="${getMember.memberPic}${memberInput.memberPic}" style="height: 100px;width: 120px"><br>
<input type="file" name="file" accept="image/*" id="memberPic"><br>${errorPic}
姓名 :<br> 
<input type="text" value="${getMember.memberFname}${memberInput.memberFname}" name="memberFname" id= "memberFname">${errorFname}
<small id="memberFnameUpdate" class="text-danger"></small><br> 
暱稱 :<br> 
<input type="text" value="${getMember.memberSname}${memberInput.memberSname}" name="memberSname" id="memberSname">${errorSname}
<small id="memberSnameUpdate" class="text-danger"></small><br>
身分證字號 :<br> 
<input type="text" value="${getMember.memberTwid}${memberInput.memberTwid}" name="memberTwid" id="memberTwid">${errorTwId}
<small id="memberTwidUpdate" class="text-danger"></small><br> 
性別 :<br> 
<input type="text" value="${getMember.memberGd}${memberInput.memberGd}" name="memberGd" id="memberGd">${errorGd}
<small id="memberGdUpdate" class="text-danger"></small><br> 
生日 :<br> 
<input type="text" value="${getMember.memberHb}${memberInput.memberHb}" name="memberHb" id="memberHb">${errorHb}
<small id="memberHbUpdate" class="text-danger"></small><br> 
市內電話 :<br> 
<input type="text" value="${getMember.memberTel}${memberInput.memberTel}" name="memberTel" id="memberTel">
<br> 
手機號碼 :<br> 
<input type="text" value="${getMember.memberCel}${memberInput.memberCel}" name="memberCel" id="memberCel">${errorCel}
<small id="memberCelUpdate" class="text-danger"></small><br> 

<input type="hidden" value="${getMember.memberId}${memberInput.memberId}"  name="memberId" id="memberId">
<input type="hidden" value="${getMember.memberPic}${memberInput.memberPic}"  name="memberPic" id="memberPic">
<input type="hidden" value="${getMember.memberStatus}${memberInput.memberStatus}" name="memberStatus" id="memberStatus">
<input type="hidden" value="${getMember.memberEmail}${memberInput.memberEmail}" name="memberEmail" id="memberEmail">
<input type="hidden" value="${getMember.memberPwd}${memberInput.memberPwd}" name="memberPwd" id="memberPwd">

<input type="submit" value="儲存">               
<input type="button" value="首頁" onclick="location.href='${pageContext.request.contextPath}'">
</form>          


<script type="text/javascript" src="${pageContext.request.contextPath}/js/memberUpdate.js" ></script>


</body>
</html>
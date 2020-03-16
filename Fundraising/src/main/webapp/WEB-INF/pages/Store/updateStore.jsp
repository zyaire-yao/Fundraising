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
<meta charset="UTF-8">
<title>思思募募</title>
</head>
<body>

<h4>資料更新</h4>
<form action="updateStore" method="post" enctype="multipart/form-data">
商行照片(為jpeg，gif檔 大小不可超過3M):<br>
<img  src="${getstore.storePic}${storeInput.storePic}" style="height: 100px;width: 120px" ><br>
<input type="file" name="file" id="errorPic">${errorPic}${errorPicSize}
<br>

商家名稱 :<br> 
<input type="text" value="${getstore.storeName}${storeInput.storeName}" name="storeName" id="storeNameUpdate"> ${errorName} ${errorRepeat}
<small id="storeNameUpdateRegular" class="text-danger"></small><br>

商家簡介 :<br> 
<input type="text" value="${getstore.storePf}${storeInput.storePf}" name="storePf" id="storePf"> ${errorPf}
<small id="storePfRegular" class="text-danger"></small><br>

商家電話 (輸入加入區碼數字 EX:0289123456):<br> 
<input type="text" value="${getstore.storeTel}${storeInput.storeTel}" name="storeTel" id="storeTel"> ${errorTel}
<small id="storeTelRegular" class="text-danger"></small><br>

商家地址(實體店面):<br> 
<input type="text" value="${getstore.storeAddress}${storeInput.storeAddress}" name="storeAddress" id="storeAddress">
<br> 

商行號碼 (數字8碼商行號碼):<br> 
<input type="text" value="${getstore.storeNumber}${storeInput.storeNumber}" name="storeNumber" id="storeNumber"> ${errorNumber}
<small id="storeNumberRegular" class="text-danger"></small><br>

商行帳戶 (只能輸入數字 最多25碼):<br> 
<input type="text" value="${getstore.storeAccount}${storeInput.storeAccount}" name="storeAccount" id="storeAccount"> ${errorAccount}
<small id="storeAccountRegular" class="text-danger"></small><br>

商行負責人姓名 (請輸入中文名):<br> 
<input type="text" value="${getstore.storePiName}${storeInput.storePiName}" name="storePiName" id="storePiName"> ${errorPiName}
<small id="storePiNameRegular" class="text-danger"></small><br>

商行負責人身分證  (第一英文字母大寫 加九位數字) :<br> 
<input type="text" value="${getstore.storePiTwid}${storeInput.storePiTwid}" name="storePiTwid" id="storePiTwid"> ${errorPiTwid}
<small id="storePiTwidRegular" class="text-danger"></small><br>

商行負責人手機號碼 (為09開頭的10位數電話號碼):<br> 
<input type="text" value="${getstore.storePiTel}${storeInput.storePiTel}" name="storePiTel" id="storePiTel"> ${errorPiTel}
<small id="storePiTelRegular" class="text-danger"></small><br>

商行負責人地址 (請輸入中文地址) :<br> 
<input type="text" value="${getstore.storePiAddress}${storeInput.storePiAddress}" name="storePiAddress" id="storePiAddress"> ${errorPiAddress}
<small id="storePiAddressRegular" class="text-danger"></small><br>


<input type="hidden" value="${getstore.storeId}${storeInput.storeId}" name="storeId" id="storeId">
<input type="hidden" value="${getstore.storeStatus}${storeInput.storeStatus}" name="storeStatus" id="storeStatus">
<input type="hidden" value="${getstore.storePic}${storeInput.storePic}" name="storePic" id="storePic">


<input type="submit" value="儲存">               
<input type="button" value="首頁" onclick="location.href='${pageContext.request.contextPath}'">
</form>          

<script type="text/javascript" src="${pageContext.request.contextPath}/js/storeRegular.js" ></script>



</body>
</html>
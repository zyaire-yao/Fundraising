<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<h4>變更密碼</h4>

<form action="updatePwd" method="post">
請輸入舊密碼 :<br>
<input type="password" name="oldPwd">${errorOldPwd}${errorPwd}<br>
請輸入新密碼 :<br>
<input type="password" name="newPwd1">${errorNewPwd1}<br>
請再次輸入新密碼 :<br>
<input type="password" name="newPwd2">${errorNewPwd2}<br>
<br>
<input type="submit" value="送出">
<input type="reset" value="清除"> 
<input type="button" value="首頁" onclick="location.href='${pageContext.request.contextPath}'">
</form>

</body>
</html>
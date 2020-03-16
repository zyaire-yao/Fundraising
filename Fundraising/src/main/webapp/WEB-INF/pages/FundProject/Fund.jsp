<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>思思募募</title>
</head>
<body>

	<form action="fundProject" method="post" enctype="multipart/form-data">
		
			提案名稱:<br/>
			<input type="text" name="fundProjectTitle"><br/>
			提案內容:<br/>
			<textarea style="height: 100px;width: 400px" name="fundProjectPf"></textarea><br>
			 提案金額:<br/>
			<input type="text" name="fundProjectTotal"><br/>
			 提案天數:<br/>
			<input type="text" name="fundProjectDate"><br/>
			<input type="file" name="file" accept=".pdf"><br/>
			<input type="submit" value="提交提案">
			<input type="reset" value="清除"><br/>

		<input type="button" value="首頁" onclick="location.href='${pageContext.request.contextPath}'"> 
		
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>思思募募</title>
</head>
<body>
<form action="getProduct" method="get">
商品編號 :${product.productItemNO}<br> 
商品名稱 :${product.productName}<br> 
商品價格 : ${product.productPrice}<br> 
商品狀態 :${product.productStatus}<br> 

</form>
<input type="button" value="修改資料" onclick="location.href='getProduct2'">  


</body>
</html>
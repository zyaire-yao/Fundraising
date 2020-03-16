<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save</title>

</head>
<body>
	<h1 align="center" >上架成功 </h1>

	<div align="center" >
		<h2 id="div1" style="display: inline"></h2>
		<h2 style="display: inline">秒後 返回會員查詢頁面</h2>
   </div>
   
   	<div align="center" >
		<img alt="life" src="images/save.gif">
   </div>

		<script type="text/javascript">
			var count = 5;//設定倒數秒數 
			function countDown() {//寫一個方法，顯示倒數秒數  數到0後跳轉頁面  
				document.getElementById("div1").innerHTML = count;//將count顯示在div中
				count -= 1;//執行一次，count減1
				if (count == -1) {//count=0時，跳轉頁面
				 			window.location = 'findStore';                
				}
				setTimeout("countDown()", 900);//每秒執行一次,showTime()
			}
			countDown();
		</script>

</body>
</html>
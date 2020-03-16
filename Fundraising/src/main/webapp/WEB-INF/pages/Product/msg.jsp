<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>思思募募</title>
</head>
<body>
 <form action="addMessage" method="post" enctype="multipart/form-data" class="form-signin">      
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">留言標題:</label>
            <input type="text" class="form-control" id="recipient-name" name="msgTital">${errorMsgTital }
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">留言內容:</label>
            <input type="text" class="form-control" id="recipient-name" name="msgPf">${errorMsgPf }
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">上傳圖片:</label>
            <input type="file" class="form-control"  name="msgPic" >
          </div>       
      
      <div class="modal-footer">
   
        <input type="text"  value="${productDetail.productId }"/>
        <input type="submit" class="btn btn-primary" value="送出"/>
      </div>
     </form>
</body>
</html>
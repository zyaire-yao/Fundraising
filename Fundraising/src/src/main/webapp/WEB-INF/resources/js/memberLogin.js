// 使用前得先引入jquery 及在開頭設置變數contextPath

$("#memberEmail").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Login' ,
		data : { "email" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Login').html(data) ;
		}
	}) 
})

$("#memberPwd").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Login' ,
		data : { "pwd" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Login').html(data) ;
		}
	}) 
})

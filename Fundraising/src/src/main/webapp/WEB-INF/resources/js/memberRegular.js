// 使用前得先引入jquery 及在開頭設置變數contextPath

$("#memberEmail").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "email" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})


$("#memberPwd").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "pwd" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

$("#confirmPwd").blur(function(){
	let currentVal = $(this).val();
	let memberPwd = $("#memberPwd").val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "memberPwd" : memberPwd , "pwd" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

$("#memberFname").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "Fname" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

$("#memberSname").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "Sname" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

$("#memberTwid").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "Twid" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

$("#memberHb").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "Hb" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

$("#memberGd").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "Gd" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

$("#memberCel").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "Cel" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})



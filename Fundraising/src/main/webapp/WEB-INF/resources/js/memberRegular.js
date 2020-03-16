// 使用前得先引入jquery 及在開頭設置變數contextPath

$("#memberEmail").change(function(){
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

$("#memberEmail").change(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'RegularLogin' ,
		data : { "email" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'RegularLogin').html(data) ;
		}
	}) 
})

$("#memberPwd").change(function(){
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

$("#confirmPwd").change(function(){
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

$("#oldMemberPwd").change(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "oldPwd" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

$("#memberFname").change(function(){
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

$("#memberSname").change(function(){
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

$("#memberTwid").change(function(){
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

$("#memberHb").change(function(){
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



$("#memberCel").change(function(){
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



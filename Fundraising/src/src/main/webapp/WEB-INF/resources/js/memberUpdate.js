// 使用前得先引入jquery 及在開頭設置變數contextPath

$("#memberFname").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Update' ,
		data : { "Fname" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Update').html(data) ;
		}
	}) 
})

$("#memberSname").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Update' ,
		data : { "Sname" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Update').html(data) ;
		}
	}) 
})

$("#memberTwid").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Update' ,
		data : { "Twid" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Update').html(data) ;
		}
	}) 
})

$("#memberGd").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Update' ,
		data : { "Gd" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Update').html(data) ;
		}
	}) 
})

$("#memberHb").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Update' ,
		data : { "Hb" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Update').html(data) ;
		}
	}) 
})

$("#memberCel").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Update' ,
		data : { "Cel" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Update').html(data) ;
		}
	}) 
})













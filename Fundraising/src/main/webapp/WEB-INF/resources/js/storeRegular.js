// 使用前得先引入jquery 及在開頭設置變數contextPath

//商店名
$("#storeName").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "name" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

//商店名更新用
$("#storeNameUpdate").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "nameUpdate" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

//商店簡介
$("#storePf").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "pf" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

//商店簡介
$("#storeTel").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "tel" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

//商店商行號碼
$("#storeNumber").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "nb" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

//商店商行帳戶
$("#storeAccount").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "account" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

//商店負責人姓名
$("#storePiName").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "pName" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

//商店負責人身分證
$("#storePiTwid").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "twId" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

//商店負責人手機號碼
$("#storePiTel").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "piTel" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})

//商店負責人地址
$("#storePiAddress").blur(function(){
	let currentVal = $(this).val();
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		url : contextPath + '/' + currentId + 'Regular' ,
		data : { "piAddress" : currentVal } ,
		success : function(data){
			$('#' + currentId + 'Regular').html(data) ;
		}
	}) 
})







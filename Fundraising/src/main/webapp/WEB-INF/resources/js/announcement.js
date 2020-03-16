// 使用前得先引入jquery 及在開頭設置變數contextPath

$("#announcement").change(function(){
	let currentId = $(this).attr('id') ;
	$.ajax({
		type : 'get' ,
		dataType : "json",
		url : contextPath + '/' + currentId + 'Regular' ,
		success : function(data){
			$('#' + currentId + 'Find') ;
		}
	}) 
})
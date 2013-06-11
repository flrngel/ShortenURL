$("#shortBtn").click(function(){
	if( $("#url").val().length < 1 ){
		$("#urlprint").html("Empty url");
		return;
	}
	$.ajax({
		data:{
			'url':$("#url").val()
		},
		dataType:'json',
		type:'POST',
		url:'/create',
		success:function(data){
			if( data.result == "true" ){
				$("#urlprint").html("http://flx.kr/"+data.url);
			}
			else{
				$("#urlprint").html("something went wrong");
			}
		},
		error:function(xhr, ajaxOptions, err){
			$("#urlprint").html("someting went wrong");
		}
	});
});

$("#url").keypress(function(e){
	var code=(e.keyCode?e.keyCode:e.which);
	if( code == 13 ){
		$("#shortBtn").trigger("click");
	}
});

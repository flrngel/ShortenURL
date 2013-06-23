$("#shortBtn").click(function(){
	if( $("#url").val().length < 1 ){
		$("#urlprint").html("Empty url");
		return;
	}
	var expire=-1;
	if( $("#expire_radio2").prop("checked") == true ) expire=$("#expire").val();
	$.ajax({
		data:{
			'url':$("#url").val(),
			'expire':expire
		},
		dataType:'json',
		type:'POST',
		url:'/create',
		success:function(data){
			if( data.result == "true" ){
				$("#urlprint").html("http://flx.kr/"+data.url);
				$("#link").attr("href","http://flx.kr/"+data.url);
			}
			else{
				$("#urlprint").html("something went wrong");
				$("#link").attr("href","https://github.com/flrngel/ShortenURL");
			}
		},
		error:function(xhr, ajaxOptions, err){
			$("#urlprint").html("someting went wrong");
			$("#link").attr("href","https://github.com/flrngel/ShortenURL");
		}
	});
});

$("#url").keypress(function(e){
	var code=(e.keyCode?e.keyCode:e.which);
	if( code == 13 ){
		$("#shortBtn").trigger("click");
	}
});

$("#expire").focus(function(){
	$("#expire_radio2").prop("checked",true);
});

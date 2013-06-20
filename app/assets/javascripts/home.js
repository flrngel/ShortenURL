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

$("#expire").focus(function(){
	$("#expire_radio2").prop("checked",true);
});

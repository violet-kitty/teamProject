//모달 띄우는 function


function modalFn(msg, btnMsg1){
	var length = arguments.length;
	
	//아무 버튼 없이 글만 뜨는 모달
	if(length == 1){
		var html = '<div class="modal py-10 px-3" tabindex="-1" role="dialog" id="modalDiv">'
					+ '<div class="modal-dialog hbshadow" role="document">'
					+ '<div class="modal-content">'
					+ '<div class="form-floating ">'
					+ '<p class="text-muted">'+msg+'</p>'
					+ '</div>'
					+ '</div>'
					+ '</div>'
					+ '</div>';
		
		$("body").prepend(html);
		
		$("#modalDiv").show();
	}
	//버튼 1개만 있는 모달
	else if(length == 2){
		var html = '<div class="modal py-10 px-3" tabindex="-1" role="dialog" id="modalDiv">'
					+ '<div class="modal-dialog hbshadow" role="document">'
					+ '<div class="modal-content">'
					+ '<div class="form-floating ">'
					+ '<p class="text-muted">'+msg+'</p>'
					+ '</div>'
					+ '<div class="btnarea">'
					+ '<button type="button" class="bluebtn w-100" onclick="modalClose()">'+btnMsg1+'</button>'
					+ '</div>'
					+ '</div>'
					+ '</div>'
					+ '</div>';
		
		$("body").prepend(html);
		
		$("#modalDiv").show();
	}
}

//모달 없애기
function modalClose(){
	$("#modalDiv").hide();
	$("#modalDiv").remove();
}










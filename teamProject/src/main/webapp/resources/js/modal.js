//모달 띄우는 function


function modalFn(msg, btnMsg1, title, btnMsg2, funcName){
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
	//타이틀과 버튼이 있는 모달
	else if(length == 3){
		var html = '<div class="modal py-10 px-3" tabindex="-1" role="dialog" id="modalDiv">'
					+ '<div class="modal-dialog hbshadow" role="document">'
					+ '<div class="modal-content">'
					+ '<h2 class="hfc-bold">'+title+'</h2>'
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
	//타이틀과 확인 취소 버튼이 있는 모달
	else if(length == 4){
		var html = '<div class="modal py-10 px-3" tabindex="-1" role="dialog" id="modalDiv">'
					+ '<div class="modal-dialog hbshadow" role="document">'
					+ '<div class="modal-content">'
					+ '<h2 class="hfc-bold">'+title+'</h2>'
					+ '<div class="form-floating ">'
					+ '<p class="text-muted">'+msg+'</p>'
					+ '</div>'
					+ '<div class="btnarea">'
					+ '<button type="button" class="graybtn w-50" onclick="modalClose()">'+btnMsg2+'</button>'
					+ '<button type="button" class="bluebtn w-50" onclick="modalOkFn()">'+btnMsg1+'</button>'
					+ '</div>'
					+ '</div>'
					+ '</div>'
					+ '</div>'; 
		
		$("body").prepend(html);
		
		$("#modalDiv").show();
	}
	//함수를 여러개 써야할 때 쓰는 모달
	else if(length == 5){
		var html = '<div class="modal py-10 px-3" tabindex="-1" role="dialog" id="modalDiv">'
					+ '<div class="modal-dialog hbshadow" role="document">'
					+ '<div class="modal-content">'
					+ '<h2 class="hfc-bold">'+title+'</h2>'
					+ '<div class="form-floating ">'
					+ '<p class="text-muted">'+msg+'</p>'
					+ '</div>'
					+ '<div class="btnarea">'
					+ '<button type="button" class="graybtn w-50" onclick="modalClose()">'+btnMsg2+'</button>'
					+ '<button type="button" class="bluebtn w-50" onclick="'+funcName+'()">'+btnMsg1+'</button>'
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










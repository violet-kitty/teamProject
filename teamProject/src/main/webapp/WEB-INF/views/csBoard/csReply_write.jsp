<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->     
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 사용시 필요 -->
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- /제이쿼리 사용시 필요 -->
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- /summernote -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	font-size: 16px;
}
h3{
	text-align: center;
}
.replies{
	margin-top: 50px;
}
.tb2{	
	text-align: center;
	width: 80%;	
	margin-left: 10%;
	margin-right: 10%;
}
.reply_category{
	width: 10%;
	color: black;
	background-color: #b2ffb5;
	font-weight: bold;
}
.reply_category_title{
	border-top: 2px solid #27c6be;
	border-bottom: 2px solid #27c6be;
}
.reply_content{
	border-top: 2px solid #27c6be;
	text-align: left;
}
.content_input_box{
}
.btn_td{
	border-top: 2px solid #27c6be;
	border-bottom: 2px solid #27c6be;
}
.btn1{
	width: 100px;
	height: 30px;
	margin-left: 1%;
	background-color: #b2ffb5;
	border: 0.5px solid gray;
}
.input_title{
	width: 100%;
	box-sizing: border-box;
	margin-right: 2px;
}
</style>
</head>
<body>
	<h3>1:1 문의 답변 글 작성</h3>
	<hr>
	<div class="replies">
		<form id="form1" action="csReply_write.do?origincsbidx=${cv.origincsbidx}" method="post">
			<table class="tb2">
				<tbody>
					<tr>
						<td class="reply_category reply_category_title" colspan="6">1:1 문의 답변</td>
					</tr>				
					<tr>
						<td class="reply_category">작성자</td>
						<td>${login.nickname}<input type="hidden" name="origincsbidx" value="${cv.csbidx}"></td>
						<td class="reply_category">제목</td>
						<td><input type="text" id="title" name="title" class="input_title" value="${cv.title}"></td>
					</tr>
					<tr>
						<td class="reply_category" style="border-top: 2px solid #27c6be;">내용</td>
						<td class="reply_content" colspan="3"><textarea id="summernote" name="content" class="content_input_box" style="resize: none;" placeholder="내용을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td class="btn_td" colspan="4">
							<input type="button" class="btn1" value="등록" onclick="reply_write()">
							<input type="button" class="btn1" value="취소" id="cancel">
						</td>
					</tr>			
				</tbody>
			</table>
		</form>
	</div>
<script>
	$(function(){
		
		$("#summernote").summernote({
			height:300,
			minHeight:null,
			maxHeight:null,
			focus:false,
			lang:"ko-KR",
			placeholder:"최대 2000자까지 쓸 수 있습니다.&#13;&#10;제목1로 지정한 텍스트는 제목 목록에 표시됩니다.",
			toolbar: [
				['style',['style']],
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			styleTags: ['h1']
		});
		
		$("#cancel").click(function(){
	    	if($("#summernote").val() != null){
	    		if(!confirm("작성된 내용이 있습니다. \n\n작성을 취소하시겠습니까?")){
	    			return false;
	    		}
	    		else{
	    			history.back();
	    		}
	    	}
	    });
		
	});
	
	function reply_write(){
		var title = $("#title");
		var content = $("#summernote");
		if(title.val() == ""){
			alert("제목을 입력해주세요");
			title.focus();
			return;
		}
		else if(content.val() == ""){
			alert("내용을 입력해주세요");
			content.focus();
			return;
		}
		else {
			alert("글이 등록되었습니다.");
			$("#form1").submit();
		}
	};
</script>
</body>
</html>
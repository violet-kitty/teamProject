<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->     
<!DOCTYPE html>
<html>
<head>
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
	text-align: left;
	vertical-align: middle;
	width: 100%;
	height: 500px;
	border-top: 2px solid #27c6be;
}
.content_input_box{
	border: 1px solid black;
	width: 100%;
	height: 500px;
	box-sizing: border-box;
	margin-right: 1px;
	margin-top: 3px;
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
.title_td{
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
						<td><input type="text" id="title" name="title" class="title_td" placeholder="제목을 입력해주세요."></td>
					</tr>
					<tr>
						<td class="reply_category" style="border-top: 2px solid #27c6be;">내용</td>
						<td class="reply_content" colspan="3"><textarea id="content" name="content" class="content_input_box" style="resize: none;" placeholder="내용을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td class="btn_td" colspan="4">
							<input type="button" class="btn1" value="등록" onclick="checkFn()">
							<input type="button" class="btn1" value="취소" onclick="javascript:history.back()">
						</td>
					</tr>			
				</tbody>
			</table>
		</form>
	</div>
<script>
	function checkFn(){
		var title = $("#title");
		var content = $("#content");
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
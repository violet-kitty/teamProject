<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
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
	vertical-align: top;
	width: 100%;
	height: 500px;
	border-top: 2px solid #27c6be;
}
.content_input_box{
	border: none;
	width: 100%;
	height: 500px;
	text-align: left;
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
</style>
</head>
<body>
	<h3>1:1 문의 답변 글 수정</h3>
	<hr>
	<div class="replies">
		<form id="form1" action="csReply_modify.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}" method="post">
			<table class="tb2">
				<tbody>
					<tr>
						<td class="reply_category reply_category_title" colspan="6">답변 내용</td>
					</tr>				
					<tr>
						<td class="reply_category">작성자</td>
						<td>${cv.nickname}</td>
						<td class="reply_category">제목</td>
						<td>${cv.title}</td>
						<td class="reply_category">작성일</td>
						<td>${cv.wdate}</td>
					</tr>
					<tr>
						<td class="reply_category" style="border-top: 2px solid #27c6be;">내용</td>
						<td class="reply_content" colspan="5"><textarea id="content" name="content" class="content_input_box" style="resize: none;">${cv.content}</textarea></td>
					</tr>
					<tr>
						<td class="btn_td" colspan="6">
							<input type="button" class="btn1" value="수정" onclick="checkFn()">
							<input type="button" class="btn1" value="취소" onclick="javascript:history.back()">
						</td>
					</tr>			
				</tbody>
			</table>
		</form>
	</div>
<script>
	function checkFn(){
		var content = $("#content");
		if(content.val() == ""){
			alert("내용을 입력해주세요");
			content.focus();
			return;
		}
		else {
			$("#form1").submit();
		}
	};
</script>
</body>
</html>
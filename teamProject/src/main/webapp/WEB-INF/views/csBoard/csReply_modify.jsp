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
	padding-top: 10px;
	padding-left: 10px;
	width: 100%;
	height: 500px;
	border-top: 2px solid #27c6be;
	border-bottom: 2px solid #27c6be;
}
</style>
</head>
<body>
	<h3>1:1 문의 답변 글 수정</h3>
	<div class="replies">
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
					<td class="reply_category" style="border-top: 2px solid #27c6be; border-bottom: 2px solid #27c6be;">내용</td>
					<td class="reply_content" colspan="5">${cv.content}</td>
				</tr>				
			</tbody>
		</table>
	</div>
</body>
</html>
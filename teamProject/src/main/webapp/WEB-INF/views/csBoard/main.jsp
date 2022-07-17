<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 사용시 필요 -->
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- /제이쿼리 사용시 필요 -->
<title>Insert title here</title>
</head>
<script>
	function sendMessage(form){
		
		form.writer.value = form.writer.value.trim();
		
		if(form.writer.value.length == 0){
			alert("작성자를 입력하세요.");
			form.writer.focus();
			return false;
		}
		
		form.body.value = form.body.value.trim();
		
		if(form.body.value.length == 0){
			alert("내용을 입력하세요.");
			form.body.focus();
			return false;
		}
		
		$.post("./doAddMessage",{
			writer : form.writer.value,
			body : form.body.value
		}, function(data){
			
		},'json');
		
		form.body.value = "";
		form.body.focus();
		
	}
</script>
<body>
	<h1>채팅 메시지 입력</h1>
	<hr>
	<br><br>
	<form onsubmit="sendMessage(this); return false;">
		<input type="text" name="writer" placeholder="작성자">
		<input type="text" name="body" placeholder="내용">
		<input type="submit" value="전송">
	</form>

</body>
</html>
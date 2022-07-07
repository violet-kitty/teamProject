<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>수정</h1>
<body>
	<form action="noticemodify.do" name="noticemodify" method="post">
		<input type="hidden" name="nbidx" value="${vo.nbidx }">
		title : <input type="text" name="title" value="${vo.title }"> <br>
		content : <input type="text" name="content" value="${vo.content }"> <br>
		name : ${vo.name}<br>
		
		<input type="submit" value="저장">
		<input type="reset" value="다시작성">
	</form>
	<form action="fileupload" method="post" enctype="multipart/form-data">
		<input multiple="multiple" type="file" name="fileupload" />
		<input type="text" name="src" />
		<input type="submit" value="upload" />
    </form>
<button id="btn1" onclick="location.href='notice.do'"> 리스트</button><br>
</body>
</html>
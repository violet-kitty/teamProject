<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<script type="text/javascript">

	function check() {
	
		var title = $("#title");
		var content = $("#content");
	
		if (title.val() == ""){
			modalFn("제목을 입력해 주세요");
			setTimeout(function(){
				modalClose();
				title.focus();
				return ;	
			},1000);

		}else if (content.val() == ""){
			modalFn("내용을 입력해 주세요");
			setTimeout(function(){
				modalClose();
				content.focus();
				return ;
			},1000);

		}else {
			$("#form").submit();
		}
	
</script>
</head>
<body>
<form id="form" action="faqmodify.do" method="post" enctype="multipart/form-data">
 	<input type="hidden" name="fbidx" value="${vo.fbidx }">

 
    	제목 :
    	<input type="text" name="title" id="title" size="50" maxlength="100"><br>

    	내용 :
    	<textarea name="content" id="content" cols="80" rows="20"></textarea><br>
 
    

   
		
 
    <button type="button" onclick="check()">저장</button>
</form>
	    <a href="faqbaord.do">취소</a>
</body>
</html>
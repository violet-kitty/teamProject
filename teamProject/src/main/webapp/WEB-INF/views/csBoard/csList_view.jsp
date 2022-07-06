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
h3{
	text-align: center;
}
.div1{
	
}
.tb1{
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	text-align: center;
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
}
.tb_category{
	background-color: lightgray;
	font-weight: bold;
}
.tb_content{
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	height: 500px;
}
.tb_content_fill{	
	text-align: left;
	vertical-align: top;
	padding-top: 10px;
	padding-left: 10px;
}
.tb_filename{
	text-align: left;
	padding-left: 10px;
}
.div2{
	width: 80%;
	margin-top: 5px;
	margin-left: 10%;
}
.btn1{
	float: left;
	width: 100px;
	height: 30px;.
}
.btn2{
	float: right;
	width: 100px;
	height: 30px;
	margin-left: 1%;
}
#reply{
	display: none;
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
}
</style>
</head>
<body>
	<h3>CS List View</h3>
	<hr>
	<br>
	<br>
	<div class="div1">	
		<table class="tb1">
			<tbody>
				<tr>
					<td class="tb_category">글번호</td>
					<td>${cv.csbidx}</td>
					<td class="tb_category">구분</td>
					<td>${cv.divsn}</td>
					<td class="tb_category">작성자</td>
					<td>${cv.nickname}</td>
					<td class="tb_category">제목</td>
					<td>${cv.title}</td>
					<td class="tb_category">작성일</td>
					<td>${cv.wdate}</td>
					<td class="tb_category">조회수</td>
					<td>${cv.cnt}</td>					
				</tr>
				<tr>
					<td class="tb_category tb_content">내용</td>
					<td colspan="11" class="tb_content tb_content_fill">${cv.content}</td>				
				</tr>
				<tr>
					<td class="tb_category">첨부파일</td>
					<td colspan="11" class="tb_filename">${cv.filename}</td>
				</tr>
			</tbody>
		</table>
		<div class="div2">
			<c:if test="${login.role != 'admin' }">
				<input id="reply_btn" type="button" value="답변" class="btn1">
			</c:if>
				<input type="button" value="목록" onclick="location.href='csList.do'" class="btn2">
			<c:if test="${login.midx == cv.midx }">				
				<input type="button" value="수정" onclick="location.href='csList_modify.do?bidx=${cv.csbidx}'" class="btn2">
				<input type="button" value="삭제" onclick="location.href='csList_delete.do?bidx=${cv.csbidx}'" class="btn2">
			</c:if>
		</div>
	</div>
	<br>
	<div id="reply">
		<h4>답변</h4>
		<hr>
		<form action="csList_view.do" method="post" id="reply_form">
			<input type="text" name="content">
			<input type="hidden" name="origincsbidx" value="${cv.origincsbidx}">
			<input type="hidden" name="title" value="${cv.title}">
			<input type="hidden" name="midx" value="${login.midx}">
			<input type="button" id="reply_btn2" value="답변 등록">
		</form>
	</div>
	<div class="replies">
	
	</div>
	<script>
		$("#reply_btn").click(function(){
			$("#reply").show();
		});
		
		$("#reply_btn2").click(function(){
			var frm = $("#reply_form").serialize();
			$.ajax({
				url: 'csList_reply.do',
				type: "post",
				data: frm,
				success: function(data){
					if(data == 1){
						alert("글이 등록되었습니다.");
						$(".replies").html(data);
						location.reload();
					}
					
				}
			});
		});
	</script>
</body>
</html>
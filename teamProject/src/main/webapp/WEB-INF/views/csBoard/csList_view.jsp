<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 사용시 필요 -->
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- 제이쿼리 사용시 필요 -->
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
	width: 10%;
	background-color: lightgray;
	font-weight: bold;
}
.tb_content{
	border-top: 2px solid black;
	height: 500px;
}
.tb_content_fill{	
	text-align: left;
	vertical-align: top;
	padding-top: 10px;
	padding-left: 10px;
}
.td_file{
	border-top: 2px solid black;
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
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
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
	width: 100%;
	height: 300px;
	text-align: left;
	vertical-align: top;
	padding-top: 10px;
	padding-left: 10px;
	border-top: 2px solid #27c6be;
	border-bottom: 2px solid #27c6be;
}
.btn_td{
	border-bottom: 2px solid #27c6be;
}
.btn3{
	width: 100px;
	height: 30px;
	margin-left: 1%;
	background-color: #b2ffb5;
	border: 0.5px solid gray;
}
#img{
	max-width: 500px;
	max-height: 300px;
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
					<td class="tb_category">문의유형</td>
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
			<c:if test="${cv.filename != null}">
				<tr>
					<td class="tb_category td_file">첨부파일</td>
					<td colspan="11" class="tb_filename td_file"><a href="displayFile.do?fileName=${cv.filename}&down=1"><img id="img" src="displayFile.do?fileName=${cv.filename}"></a></td>
				</tr>
			</c:if>
			</tbody>
		</table>
		<div class="div2">
			<c:if test="${login.role == 'admin'}">
				<input id="reply_btn" type="button" value="답변" class="btn1" onclick="location.href='csReply_write.do?csbidx=${cv.csbidx}'">
			</c:if>
				<input type="button" value="목록" onclick="location.href='csList.do'" class="btn2">
			<c:if test="${login.midx == cv.midx || login.role == 'admin'}">				
				<input type="button" value="수정" onclick="location.href='csList_modify.do?csbidx=${cv.csbidx}'" class="btn2">
				<input type="button" id="delete" value="삭제" class="btn2">
			</c:if>
		</div>
	</div>
	<br>
	<c:forEach var="cvr" items="${cvr}">
		<div class="replies">
			<table class="tb2">
				<tbody>
					<tr>
						<td class="reply_category reply_category_title" colspan="6">답변 내용</td>
					</tr>				
					<tr>
						<td class="reply_category">작성자 </td>
						<td>${cvr.nickname}</td>
						<td class="reply_category">제목</td>
						<td>${cvr.title}</td>
						<td class="reply_category">작성일</td>
						<td>${cvr.wdate}</td>
					</tr>
					<tr>
						<td class="reply_category" style="border-top: 2px solid #27c6be; border-bottom: 2px solid #27c6be;">내용</td>
						<td class="reply_content" colspan="5">${cvr.content}</td>
					</tr>
					<c:if test="${login.midx == cvr.midx || login.role == 'admin'}">
						<tr>
							<td class="btn_td" colspan="6">							
								<input type="button" id="reply_delete" value="삭제" class="btn3">
								<input type="button" value="수정" class="btn3" onclick="location.href='csReply_modify.do?csbidx=${cvr.csbidx}'">
							</td>									
						</tr>	
					</c:if>		
				</tbody>
			</table>
		</div>
	</c:forEach>
<script>
	$(function(){
		
		$("#delete").click(function(){
			if(!confirm("삭제하시면 복구할 수 없습니다. \n\n정말로 삭제하시겠습니까?")){				
				return false;
			}
			else{
				 location.href = "csList_delete.do?csbidx=${cv.csbidx}";
			}
			
		});
		
		$("reply_delete").click(function(){
			if(!confirm("정말로 삭제하시겠습니까?")){
				return false;				
			}
			else{
				locaion.href = "csReply_delete.do?csbidx=${cvr.csbidx}";								 
			}
			
		});
	});
</script>
</body>
</html>
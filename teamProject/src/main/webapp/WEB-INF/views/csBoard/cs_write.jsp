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
h3{
	text-align: center;
}
.div1{
	
}
.tb1{
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
}
.tb_category{
	text-align: center;
	width: 10%;
	background-color: lightgray;
	font-weight: bold;
}
.tb_content{
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}
.tb_textarea{
	width: 100%;
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
	text-align: center;
	width: 80%;
	margin-top: 5px;
	margin-left: 10%;
	margin-right: 10%;
}
.btn1{
	width: 100px;
	height: 30px;
	margin-left: 1%;
}
</style>
</head>
<body>
	<h3>CS List View</h3>
	<hr>
	<br>
	<br>
	<div class="div1">
		<form action="cs_write.do" method="post">
			<table class="tb1">
				<tbody>
					<tr>			
						<td class="tb_category">문의유형</td>
						<td>
							<select name="divsn">
								<option value="">문의유형 선택</option>
								<option value="질문">질문</option>
								<option value="환불">환불</option>
								<option value="신고">신고</option>
								<option value="계정">게정</option>
							</select>
						</td>
					</tr>
					<tr>				
						<td class="tb_category">제목</td>
						<td><input type="text" name="title"></td>					
					</tr>
					<tr>
						<td class="tb_category">내용</td>
						<td><textarea class="tb_textarea" rows="30" name="content"></textarea></td>
					</tr>
					<tr>
						<td class="tb_category">첨부파일</td>
						<td class="tb_filename"><input type="file" name="filename" accept="image/png, image/jpeg"></td>
					</tr>
				</tbody>
			</table>
			<div class="div2">
				<input type="submit" value="등록" class="btn1">
				<input type="button" value="취소" onclick="location.href='csList.do'" class="btn1">
			</div>			
		</form>		
	</div>
</body>
</html>
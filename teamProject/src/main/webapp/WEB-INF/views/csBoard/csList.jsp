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
	float: right;
	text-align: center;
}
.form1{

}
.tb1{
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>
	<h3>CS BOARD (임시)</h3>
	<hr>	
	<br>
	<br>
	<br>
	<table border="1" class="tb1">
		<tbody>
			<tr>
				<td>글번호</td>
				<td>구분</td>
				<td>작성자</td>
				<td>제목</td>
				<td>조회수</td>
				<td>작성일</td>				
			</tr>
			<c:forEach var="c" items="${cv}">
				<tr>
					<td>${c.csbidx}</td>
					<td>${c.divsn}</td>
					<td>${c.name}</td>
					<td>${c.title}</td>
					<td>${c.cnt}</td>
					<td>${c.wdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${login.role == 'admin'}">
	<div class="div1">
		<form action="csList.do" method="get" class="form1">
			<select name="searchType">
				<option value="total">전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="nickname">닉네임</option>
			</select>
			<input type="text" name="searchValue">
			<input type="submit" value="검색">
		</form>
	</div>
	</c:if>
</body>
</html>
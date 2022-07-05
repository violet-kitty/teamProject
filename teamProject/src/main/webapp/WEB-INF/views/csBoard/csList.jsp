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
	margin-top: 5px;
	margin-right: 30%;	
}
.btn1{
	float: right;
	width: 100px;
	height: 30px;
}
.div2{
	float: right;
	text-align: center;
}
.form1{

}
.tb1{
	margin: 0 auto;
	text-align: center;
}
.tb2{
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
					<td><a href="csList_view.do?bidx=${c.csbidx}">${c.title}</a></td>
					<td>${c.cnt}</td>
					<td>${c.wdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="div1">
		<input type="button" value="등록" onclick="location.href='cs_write.do'" class="btn1">
	</div>
	<br>	
	<table class="tb2">
		<tbody>
			<tr>
				<td>
					<c:if test="${pm.prev == true }">
						<a href="csList.do?page=${pm.startPage-1}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}">◀</a>
					</c:if>
				</td>
				<td>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
						<a href="csList.do?page=${i}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}">${i}</a>
					</c:forEach>
				</td>
				<td>
					<c:if test="${pm.next && pm.endPage > 0}">
						<a href="csList.do?page=${pm.endPage}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}">▶</a>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
	<c:if test="${login.role == 'admin'}">
		<br>
		<div class="div2">
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
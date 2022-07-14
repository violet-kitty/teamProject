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
	margin-right: 10%;	
}
.btn1{
	float: right;
	width: 100px;
	height: 30px;
}
.div2{
	float: right;
	text-align: center;
	margin-right: 10%;
}
.form1{

}
.tb1{
	width: 80%;
	margin: 0 auto;
	text-align: center;
}
.tb_category{
	font-weight: bold;
	background-color: lightgray;
}
.tb2{
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
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
				<th class="tb_category">글번호</th>
				<th class="tb_category">문의유형</th>
				<th class="tb_category">작성자</th>
				<th class="tb_category">제목</th>
				<th class="tb_category">조회수</th>
				<th class="tb_category">작성일</th>				
			</tr>
			<c:if test="${cv.size() == 0 }">
				<tr>
					<td colspan="6">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="c" items="${cv}">
				<tr>
					<td>${c.csbidx}</td>
					<td>${c.divsn}</td>
					<td>${c.name}</td>
					<td><a href="csList_view.do?csbidx=${c.csbidx}&origincsbidx=${c.origincsbidx}">${c.title}</a></td>
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
					<option value="divsn">문의유형</option>
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
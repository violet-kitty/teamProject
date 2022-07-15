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
a{
	text-decoration-line: none;
}
.tb1 a:visited{
	color: #ccc;
}
.div_header{
	margin-left: 10%;
	margin-right: 10%;
	padding-right: 10%;
	text-align: center;
}
.div_header h3{
	display: inline-block;
}
.a_logo{
	margin-left: 10%;
	float: left;
}
.a_logo img{
	max-width: 100px;
	max-height: 100px;
}
.div_userInfo{	
	display: inline-block;
	float: left;
	margin-left: 10%;
}
.span_userInfo{
	display: inline-block;
	font-weight: bold;
	color : #5B6DCD;
}
.div_logout{
	display: inline-block;
	float: right;
	margin-right: 10%;
}
.a_logout{
	color: #5B6DCD;
	font-weight: bold;
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
	<a href="<%=request.getContextPath()%>/home.do" class="a_logo">
		<img src="<%=request.getContextPath()%>/image/logo/logo.png">
	</a>
	<div class="div_header">		
		<h3>1:1 문의 게시판</h3>
	</div>
	<br><br>
	<c:if test="${login != null }">
		<div class="div_userInfo"><span class="span_userInfo">${login.nickname}</span> 로그인 중 (등급 : <span class="span_userInfo">${login.role}</span>)</div>
		<div class="div_logout"><a href="<%=request.getContextPath()%>/user/logout.do" class="a_logout">로그아웃</a></div>
	</c:if>
	<br>
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
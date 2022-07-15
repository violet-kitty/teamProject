<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table, th, td {
    border: 1px solid #00FF00;
    background-color : #191970;
    color : #F0F8FF;
  }
  table {
    width: 600px;
  }
</style>
</head>
<body>
<h1>공 공 공 공 공 공 공 공</h1>
<h1>지 지 지 지 지 지 지 지</h1>
<h1>사 사 사 사 사 사 사 사</h1>
<h1>항 항 항 항 항 항 항 항</h1>
<h1> 4대 명검 말고는 안 올라오는 곳</h1>
<img src="<%= request.getContextPath() %>/image/4대명검.jpg">
<div>
<button id="push">
아무의미없는공지사항버튼
</button>

<br><p>현재 ${login.nickname}으로 로그인 됨</p>
</div>
<form method="get" action="notice.do">
		<select name="searchType">
			<option value="title" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'title'}">selected</c:if>>제목</option>
			<option value="contentWriter" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'contentWriter'}">selected</c:if>>내용+작성자</option>
		</select>
		<input type="text" name="searchValue" <c:if test="${!empty searchVO.searchValue}">value="${searchVO.searchValue}"</c:if>>
		<input type="submit" value="검색">
</form>

<table border="1">

	<thead>
		<tr>
			<th>NO.</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${list.size() == 0 }">
			<tr>
				<td colspan="4">게시글 없어</td>
			</tr>
			</c:if>
		<c:if test="${list.size() > 0 }">
			<c:set var="i" value="1"/>
			<c:forEach var="vo" items="${list }">
				<tr>

					<td>${i}</td>
					<td>${vo.name} </td>
					<td><a href="noticeone.do?nbidx=${vo.nbidx}">${vo.title }</a></td>
					<td>${vo.wdate }</td>
					<td>${vo.cnt}</td>
					<c:set var="i" value="${i+1}"/>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<div>
		<c:if test="${pageMaker.prev == true} ">
			<a href="notice.do?page=${pageMaker.startPage-1}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}">이전</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" step="1">
    		<a href="notice.do?page=${idx}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue} ">${idx} </a>
    	</c:forEach>
    	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    		<a href="notice.do?page=${pageMaker.endPage+1}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}">다음</a>
    	</c:if> 

</div>

<button id="btn2" onclick="location.href='noticewrite.do'">글 쓸꺼얌</button>
<button id="btn2" onclick="location.href='../'">메인화면</button>
<button id="btn2" onclick="location.href='chattingview.do'">채팅</button>




</body>
</html>
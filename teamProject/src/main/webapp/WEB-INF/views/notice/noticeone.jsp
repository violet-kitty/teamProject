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
<body>
<h1>여기는 공지사항 중 하나의 글이 올라오는 곳입니다.</h1>
<h1>여러분 함부로 들어와서 보지마세요 중요한거 별로 없어요 </h1>
<h1>그냥 4대명검 말고는 없습니다</h1>

<table border="1">

		<tbody>
			<tr>
				<th align="right">글번호</th>
				<td>${vo.nbidx}</td>
			</tr>
			<tr>
				<th align="right">작성자</th>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<th align="right">작성일</th>
				<td>${vo.wdate}</td>
			</tr>
			<tr>
				<th align="right">제목</th>
				<td>${vo.title}</td>
			</tr>
			<tr>
				<th align="right">내용</th>
				<td>${vo.content}</td>
			</tr>
			<c:if test="${vo.filename != null}">
			<tr>
				<th align="right">첨부파일</th>
				<td>
				<img src="<%=request.getContextPath() %>/notice/displayFile.do?filename=${vo.filename}"><br>
				<a href="<%=request.getContextPath() %>/notice/displayFile.do?filename=${vo.filename}&down=1">${vo.filename}</a>
				</td>
			</tr>
			</c:if>
		</tbody>
	
	</table>
	<c:if test="${login == null }">
		<a href="notice.do">목록으로</a>
		<a href="../user/login.do">로그인하려가기</a>
	</c:if>
	<c:if test="${login.midx == vo.midx }">
		<a href="noticemodify.do?nbidx=${vo.nbidx }">수정</a>
		<a href="noticedelete.do?nbidx=${vo.nbidx }">없어져라!</a>
	</c:if>
	
	<button id="btn1" onclick="location.href='notice.do'"> 리스트</button><br>
	<a href="../user/login.do">로그인하려가기</a><br>
</body>
</html>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
    <%@ page session="true" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>공지사항 상세보기</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap5 최신 CSS & JS (Popper.js 포함됨) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Bootstrap5 AwsomeFont -->
<script src="https://kit.fontawesome.com/a54851838a.js" crossorigin="anonymous"></script>
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - 관련CSS를 여기에 연결해주세 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/관련.css" />
</head>

<body>


	<div id="wrap">
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">

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
			<tr>
				<th align="right">조회수</th>
				<td>${vo.cnt}</td>
			</tr>
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
					</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
</body>
</html>
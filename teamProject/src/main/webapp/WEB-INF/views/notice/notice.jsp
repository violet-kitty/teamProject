<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<meta charset="UTF-8">
<title>Insert title here</title>

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


<div>


<h1>공지사항</h1>
<br><p>현재 ${login.nickname}으로 로그인 됨</p>
</div>

<!-- 검색 -->
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
				<td colspan="5" style="text-align: center">게시글 없어</td>
			</tr>
		</c:if>
		<c:if test="${list.size() > 0 }">
			<c:set var="i" value="1"/>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${i}</td>
					<td>${vo.name}</td>
					<td><a href="noticeone.do?nbidx=${vo.nbidx}">${vo.title}</a></td>
					<td>${vo.wdate}</td>
					<td>${vo.cnt}</td>
					<c:set var="i" value="${i+1}"/>
			</c:forEach>
		</c:if>
	</tbody>
</table>

<!-- 페이징  -->
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
<button id="btn2" onclick="location.href='faqboard.do'">FAQFAQFAQFAQ</button>

				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->


</body>
</html>
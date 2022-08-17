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
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<!-- 테이블 꾸미기 -->
<style>
table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
}
th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
thead tr {
    background-color: #0d47a1;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #bbdefb;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #e3f2fd;
  }

</style>

<!-- 페이징 꾸미기 -->
<style type="text/css">
#paging {
	padding: 20px 0 5px;
	line-height: 160%;
	font-size: 16px;
	font-size:1.6em;
	text-align:center;
	cursor: default;
}
#paging a {
	display:inline-block;
	margin: 0 1px 0;
	padding: 0 7px;
	vertical-align:top;
}
#paging .no-more-prev ,#paging .no-more-next {
	color: #aaa;
	cursor: default;
}
#paging .selected {
	 padding: 4px 9px 4px;
	 border-radius: 100%;
	 background-color:#07a;
	 cursor: default;
	 color: #fff;
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

	<!-- 본문 -->
<div>
<h2><a href="notice.do">공지사항</a></h2>
<br><p>현재 ${login.nickname}으로 로그인 됨</p>
</div>

	<!-- 검색 -->
<form method="get" action="notice.do">
		<select name="searchType">
			<option value="title" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'title'}">selected</c:if>>제목</option>
			<option value="contentWriter" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'contentWriter'}">selected</c:if>>내용+작성자</option>
		</select>
		<input type="text" name="searchValue" <c:if test="${!empty searchVO.searchValue}">value="${searchVO.searchValue}"</c:if>>
		<input class="graybtn" type="submit" value="검색">
</form>

<table>

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
<div  id="paging">
    	
    	<c:if test="${pageMaker.prev == true}">

			<a href="notice.do?page=${pageMaker.startPage-1}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}">◀</a>

		</c:if>

		<c:set var="index" value="1"/>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" step="1">
			<c:choose>
			<c:when test="${searchVO.page == index}">
				<a style="color:gray" href="notice.do?page=${idx}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue} ">${idx} </a>
			</c:when>
			<c:otherwise>
				<a href="notice.do?page=${idx}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue} ">${idx} </a>
			</c:otherwise>
			</c:choose>
		<c:set var="index" value="${index+1}"/>
    	</c:forEach>
    	
    	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">

    		<a href="notice.do?page=${pageMaker.endPage+1}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}">▶</a>
 
    	</c:if> 

</div>
<c:if test="${login.role == 'admin'}" >
<button class="bluebtn" onclick="location.href='noticewrite.do'">글 쓸꺼얌</button>
</c:if>
<button class="pinkbtn" onclick="location.href='../'">메인화면</button>
<button class="bluebtn" onclick="location.href='chattingview.do'">채팅(미구현)</button>
<button class="pinkbtn" onclick="location.href='faqboard.do'">FAQ</button>

				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->


</body>
</html>
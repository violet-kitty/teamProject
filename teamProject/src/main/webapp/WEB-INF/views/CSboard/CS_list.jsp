<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF 고객지원</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap5 최신 CSS & JS (Popper.js 포함됨) -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Slick Slider -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- Bootstrap5 AwsomeFont -->
<script src="https://kit.fontawesome.com/a54851838a.js" crossorigin="anonymous"></script>
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav3 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyList.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/parallax.js"></script>

</head>
<body>
	<div id="wrap" class="boardlist cs cslist">
		
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Herotop -->
		<div class="parallax-window" data-parallax="scroll" data-image-src="<%= request.getContextPath() %>/image/picture/support.jpg"></div>
				<nav class="cstopNav">
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a  class="nav-link" href="<%= request.getContextPath() %>/notice/faqboard.do"><img src="<%= request.getContextPath() %>/image/button/tabby1.png"></a>
						<a  class="nav-link active" href="<%= request.getContextPath() %>/CSboard/CS_list.do"><img src="<%= request.getContextPath() %>/image/button/tabby2.png"></a>
						<a  class="nav-link" href="<%= request.getContextPath() %>/notice/notice.do"><img src="<%= request.getContextPath() %>/image/button/tabby3.png"></a>
					</div>
				</nav>
		<!-- Herotop -->

		<!-- Side -->
		
		<div class="right-container">
			
				<div class="docctrl onlypc">
					<a href="<%=request.getContextPath()%>/CSboard/CS_write.do"><img src="<%=request.getContextPath()%>/image/button/add.png"></a>
				</div>
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>

		<!-- #container -->
		<div id="container" class="hbg-whitegray">

			<!-- Tab 내용 컨텐츠 박스 -->
			<div class="tab-content" id="nav-tabContent">

				<!-- 탭2 내용 -->
				<div class="tab-pane fade active show" id="nav-faq" role="tabpanel" aria-labelledby="nav-faq-tab">
					<div class="contents pagehead hbg-whitegray">
						<div class="container" id="featured-2">

							<!--  타이틀과 검색영억 -->
							<div class="pageinfo">
								<!-- 제목 영역 -->
								<div class="title onlypc">
									<a href="<%=request.getContextPath()%>/CSboard/CS_list.do"><h1>1:1문의</h1></a>
								</div>

								<!-- 검색영역 : PC버전 -->
								<c:if test="${login.role == 'admin'}">
								<div class="row rightbox onlypc-inline">
									<!-- 검색창 -->
									<form name="frm2" action="CS_list.do" method="get">
										<div class="search">
											<select name="searchType">
												<option value="total" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'total'}">selected</c:if>>전체</option>
												<option value="divsn" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'divsn'}">selected</c:if>>문의유형</option>
												<option value="title" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'title'}">selected</c:if>>제목</option>
												<option value="content" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'content'}">selected</c:if>>내용</option>
												<option value="nickname" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'nickname'}">selected</c:if>>닉네임</option>
											</select>
											<input type="text" name="searchValue" <c:if test="${!empty searchVO.searchValue}">value="${searchVO.searchValue}"</c:if>>
											<input type="submit" value="검색">
										</div>
									</form>
								</div><!-- .rightbox onlypc-inline-->
								</c:if>
								<!-- / 검색영역 -->
								
								<!-- 타블렛사이즈만 보이는 글쓰기 버튼 -->
								
									<div class="docctrl onlytablet" style="margin-top: 16px;">
										<a href="<%=request.getContextPath()%>/CSboard/CS_write.do"><button class="w-100 bluebtn">
												<i class="fa-solid fa-plus"></i> &nbsp;글쓰기
											</button></a>
									</div>
								<!-- / 타블렛사이즈만 보이는 글쓰기 버튼 -->
								
								<!-- 검색영역 : tablet사이즈 이하 버전 -->
								<c:if test="${login.role == 'admin'}">
								<div class="row rightbox onlytablet">
									<!-- 검색창 -->
									<form action="CS_list.do" method="get" class="form1">
										<div class="search">
											<select name="searchType">
												<option value="total">전체</option>
												<option value="divsn">문의유형</option>
												<option value="title">제목</option>
												<option value="content">내용</option>
												<option value="nickname">닉네임</option>
											</select> 
											<input type="text" name="searchValue">
											<input type="submit" value="검색">
										</div>
									</form>
								</div>
								</c:if>
								<!-- .rightbox onlytablet-->
								<!-- 검색영역 : tablet사이즈 이하 버전 -->

							</div><!-- .pageinfo -->
							<!-- / 타이틀과 검색영억 -->

							<!-- 리스트 박스 -->   <!-- 리스트 카드 hover effect 종류 참고 : https://codepen.io/vavik96/pen/MYdBKz -->
							<div class="clist">
							
								<!-- 리스트영역 -->
								<table border="1" class="table">
									<tbody>
										<tr>
											<th class="hfc-bold hfc-darkgray">문의유형</th>
											<th class="hfc-bold hfc-darkgray">작성자</th>
											<th class="hfc-bold hfc-darkgray">제목</th>
											<th class="hfc-bold hfc-darkgray">답변여부</th>				
										</tr>
										<c:if test="${cv.size() == 0}">
											<tr>
												<td colspan="6" class="td_not_found">등록된 게시글이 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="c" items="${cv}">
											<tr>
												<td class=" hfc-blackgray">${c.divsn}</td>
												<td class=" hfc-blackgray">${c.nickname}</td>
												<td><a class=" hfc-blackgray hfc-semibold" href="CS_view.do?csbidx=${c.csbidx}&origincsbidx=${c.origincsbidx}">${c.title}</a></td>
												<c:if test="${c.answer != 2}">
												<td class=" hfc-pink">답변 대기</td>
												</c:if>
												<c:if test="${c.answer == 2}">
												<td class=" hfc-green">답변 완료</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- /리스트영역 -->

								<!-- 페이징 -->
								<div class="row pagenation">
									<div class="col d-flex justify-content-center">
										<c:if test="${pm.prev == true}">
											<a class="hfc-gray hfc-bold" href="CS_list.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
										</c:if>
										<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
										<c:choose>
										<c:when test="${search.page != null && i == search.page}">
											<a class="hfc-white hfc-bold hbg-pink mx-1" href="CS_list.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
										</c:when>
										<c:otherwise>
											<a class="hfc-gray hfc-bold mx-1" href="CS_list.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
										</c:otherwise>
										</c:choose>
										</c:forEach>
										<c:if test="${pm.next == true}">
											<a class="hfc-gray hfc-bold" href="CS_list.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
										</c:if>
									</div>
								</div>
								<!-- /페이징 -->

							</div><!-- /.clist -->
							<!-- / 리스트 박스 --> 

						</div><!-- /.container -->
					</div><!-- /.contents -->

				</div>
				<!-- / 탭1 내용 -->
				
			</div>
			<!-- / Tab 내용 컨텐츠 박스 -->

			<!-- banner --><%@include file="../banner.jsp"%>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
		
	</div><!-- /#wrap -->

<script>
$('.parallax-window').parallax({imageSrc: '<%= request.getContextPath() %>/image/picture/support.jpg'});
</script>
</body>
</html>
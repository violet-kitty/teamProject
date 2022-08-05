<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>1:1 고객문의 리스트</title>
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
<!-- CSS3 - 관련CSS를 여기에 연결해주세요 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/csBoard/CS_list.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<head>
</head>
<body>
	<div id="wrap">
		<!-- 모달예제 
		<button onclick="modalex()">모달예제</button>
		<script>
		function modalex(){
		
			/* modalex("모달이 완료되었습니다");
		      setTimeout(function(){
		         modalClose();
		      },3000); */
		      modalFn("모달이 완료되었습니다." ,"닫기","알림창");
			
		}
		</script>
		-->
		
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="div_header">		
								<h3>1:1 문의 게시판</h3>
							</div>
							<div class="notice">
								<button onclick="location.href='../notice/notice.do'" >공 지 사 항</button>
							</div>
							<hr>	
							<table border="1" class="table">
								<tbody>
									<tr>
										<th class="th_category">글번호</th>
										<th class="th_category">문의유형</th>
										<th class="th_category">작성자</th>
										<th class="th_category">제목</th>
										<th class="th_category">조회수</th>
										<th class="th_category">작성일</th>
										<th class="th_category">답변여부</th>				
									</tr>
									<c:if test="${cv.size() == 0}">
										<tr>
											<td colspan="6" class="td_not_found">등록된 게시글이 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="c" items="${cv}">
										<tr>
											<td>${c.csbidx}</td>
											<td>${c.divsn}</td>
											<td>${c.name}</td>
											<td><a href="CS_view.do?csbidx=${c.csbidx}&origincsbidx=${c.origincsbidx}">${c.title}</a></td>
											<td>${c.cnt}</td>
											<td>${c.wdate}</td>
											<c:if test="${c.answer != 2}">
											<td>답변 대기</td>
											</c:if>
											<c:if test="${c.answer == 2}">
											<td>답변 완료</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="div1">
								<input type="button" value="등록" onclick="location.href='CS_write.do'" class="btn1">
							</div>
							<br>	
							<table class="tb2">
								<tbody>
									<tr>
										<td>
											<c:if test="${pm.prev == true }">
												<a href="CS_list.do?page=${pm.startPage-1}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}">◀</a>
											</c:if>
										</td>
										<td>
											<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
												<a href="CS_list.do?page=${i}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}">${i}</a>
											</c:forEach>
										</td>
										<td>
											<c:if test="${pm.next && pm.endPage > 0}">
												<a href="CS_list.do?page=${pm.endPage}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}">▶</a>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
							<c:if test="${login.role == 'admin'}">
								<br>
								<div class="div2">
									<form action="CS_list.do" method="get" class="form1">
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
						</div>
					</div>
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div><!-- / #container -->
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->

</body>
</html>
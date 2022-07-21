<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>Home</title>

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
<!-- CSS3 - Home --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css" />
<title>Insert title here</title>
</head>
<body>

	<div id="wrap">
		<!-- Header --><%@include file="../Header.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div class="container">
			<div class="row">
				<div class="col d-flex justify-content-end">
					<form id="form1" action="teamList.do" method="get">
						<select name="searchType">
							<option value="total"<c:if test="${!empty vo.searchType and vo.searchType eq ''}">selected</c:if>>전체</option>
							<option value="title"<c:if test="${!empty vo.searchType and vo.searchType eq 'title'}">selected</c:if>>제목</option>
							<option value="content"<c:if test="${!empty vo.searchType and vo.searchType eq 'content'}">selected</c:if>>내용</option>
							<option value="nickname"<c:if test="${!empty vo.searchType and vo.searchType eq 'nickname'}">selected</c:if>>작성자</option>
						</select>
						<input type="text" name="searchValue" <c:if test="${!empty vo.searchValue }">value="${vo.searchValue}"</c:if>>
						<button id="btn_search">검색</button>
					</form>					
				</div>
			</div>
			<div class="row">
				<div class="col d-flex justify-content-end">
					<button id="filter_team">팀원수</button>
					<button id="filter_cnt">조회수</button>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<table style="width: 100%; text-align: center;">
						<tbody>
							<tr>
								<td>글번호</td>
								<td>작성자</td>
								<td>제목</td>
								<td>작성일</td>
								<td>조회수</td>
								<td>팀원</td>
							</tr>
							<c:forEach items="${tv}" var="tv">
								<tr>
									<td>${tv.tidx}</td>
									<td>${tv.nickname}</td>
									<td><a href="teamView.do?tidx=${tv.tidx}">${tv.title}</a></td>
									<td>${tv.wdate}</td>
									<td>${tv.cnt}</td>
									<td>${tv.people_cnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>			
			</div>
			<div class="row">
				<div class="col d-flex justify-content-center">
					<table>
						<tbody>						
							<tr>
								<c:if test="${pm.prev == true}">
									<td>
										<a href="teamList.do?page=${pm.startPage-1}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}">◀</a>
									</td>
								</c:if>
								<td>
									<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
										<a href="teamList.do?page=${i}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}">${i}</a>
									</c:forEach>
								</td>
								<c:if test="${pm.next && pm.endPage > 0}">
									<td>
										<a href="teamList.do?page=${pm.endPage}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}">▶</a>
									</td>
								</c:if>
							</tr>						
						</tbody>
					</table>
				</div>	
			</div>		
			<div class="row">
				<div class="col d-flex justify-content-center">
					<button id="teamWrite">글쓰기</button>
				</div>
			</div>
			
	

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
<script>
$(function(){
	
	$("#btn_search").click(function(){
		$("#form1").submit();
	});
	
	$("#teamWrite").click(function(){
		if(${login == null}){
			alert("로그인이 필요한 기능입니다.");
			return false;
		}
		$.ajax({
			url: "write_check.do",
			data: "midx=${login.midx}",
			type: "get",
			success:(function(data){
				if(data != 0){
					alert("글은 최대 1개만 작성할 수 있습니다.");
				}
				else{
					location.href = "teamWrite.do";
				}
				
			})
			
		});
		
	});
	
	$("#filter_team").click(function(){
		location.href = "teamList.do?sortType=team";
	});
	
	$("#filter_cnt").click(function(){
		location.href = "teamList.do?sortType=cnt";
	});		

});
</script>	
</body>
</html>
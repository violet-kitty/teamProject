<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>지역이벤트</title>
<!-- jquery -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- css -->
<link href="<%=request.getContextPath()%>/css/howf.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.card-img-top {
	height: 15rem;
	object-fit: cover;
}
</style>
<script>
	var tagArray = new Array();
	function tagParse(json,index){
		var jsonParse = JSON.parse(json);
		var tags = "";
		$.each(jsonParse,function(idx){
			tags = tags+jsonParse[idx]["value"]+" ";
		})
		tagArray[index] = tags;
	}
</script>
</head>
<body>
	<main>
		<!-- 리스트 페이지 히어로 -->
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<c:set var="index" value="0"/>
				<c:forEach var="i" items="${hero}">
					<div class="carousel-item" id="carousel${index}">
						<img class="d-block w-100" src="<%=request.getContextPath() %>/event/displayFile.do?fileName=${i.filename}">
						<div class="container">
							<div class="carousel-caption" style="background:rgba(0,0,0,0.3)">
								<p>${i.title}</p>
								<p>${i.startday} ~ ${i.endday}</p>
								<p><script>tagParse('${i.tag}',${index});</script></p>
								<p id="tagArea${index}"></p>
								<p>
									<a class="btn btn-lg btn-primary" href="eventView.do?ebidx=${i.ebidx}">자세히 보기</a>
								</p>
							</div>
						</div>
					</div>
				<c:set var="index" value="${index+1}"/>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- carousel end -->
		
		<!--  -->
		<div class="container marketing">
			<div class="album py-5 bg-light">
				<div class="container">
					
					<!-- 
					
					
					테스트를 위한 글쓰기 버튼
					
					
					 -->
					 <c:if test="${login!=null && (login.role=='official' || login.role=='admin')}">
					 <div class="row">
					 	<div class="col">
					 		<button class="btn btn-success" onclick="location.href='eventWrite.do'">글 쓰기</button>
					 	</div>
					 </div>
					 </c:if>
					
					<!-- sort 버튼 -->
					<div class="row">
						<div class="col d-flex justify-content-end">
							<!-- searchVO에 sortType ing, will, heart, new 넘김 -->
							<button onclick="location.href='eventList.do?sortType=ing'">진행중</button>
							<button onclick="location.href='eventList.do?sortType=will'">진행예정</button>
							<button onclick="location.href='eventList.do?sortType=heart'">좋아요순</button>
							<button onclick="location.href='eventList.do?sortType=new'">최신순</button>
						</div>
					</div>
					<br>
					<!-- 게시판 이름, 검색창 -->
					<div class="row">
						<div class="col-md-4 d-flex justify-content-start">
							<h3>지역 이벤트</h3>
						</div>
						<div class="col-md-8 d-flex justify-content-end">
							<form class="d-flex input-group" action="eventList.do" method="post">
								<select class="form-select" name="searchType">
									<option value="total" selected>전체</option>
									<option value="title">제목 검색</option>
									<option value="area">지역 검색</option>
								</select>
								<input type="text" class="form-control" name="searchValue" value="${search.searchValue}">
								<button class="btn btn-dark">검색</button>
							</form>
						</div>
					</div><!-- row end -->
					<br>

					<!-- content 시작 -->
					<c:set var="now" value="<%=new java.util.Date()%>"/>
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
					<div class="row row-cols-1 row-cols-lg-3 g-3">
						<c:forEach var="v" items="${event}">
						<div class="col-sm-12 col-md-12 col-lg-4">
							<div class="card shadow-sm" style="cursor:pointer" onclick="location.href='eventView.do?ebidx=${v.ebidx}'">
								<c:if test="${v.filename != null}">
									<img class="card-img-top" src="<%=request.getContextPath() %>/event/displayFile.do?fileName=${v.filename}">
								</c:if>
								<div class="card-body">
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<c:choose>
												<c:when test="${(today < v.endday) && (v.startday < today)}">
													<span style="background: #85A548; border-radius: 5px; color: white;">진행중</span>
												</c:when>
												<c:when test="${today < v.startday}">
													<span style="background: #54ACA8; border-radius: 5px; color: white;">진행예정</span>
												</c:when>
												<c:when test="${v.endday < today}">
													<span style="background: #C1C1C1; border-radius: 5px; color: white;">종료</span>
												</c:when>
											</c:choose>
											<span class="ms-1" style="font-size:0.8em">${v.startday} ~ ${v.endday}</span>
										</div>
										<small class="text-muted"><img
											src="<%=request.getContextPath()%>/image/redheart.png"
											width="30" height="30"><span class="ms-1">${v.heart}</span></small>
									</div>
									<div class="d-flex justify-content-start" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
										<p style="margin-left: 0; margin-right: 0;width:100%;">${v.title}</p>
									</div>
								</div><!-- card-body end -->
							</div>
						</div><!-- col end -->
						</c:forEach>
					</div><!-- row end -->

					<div class="row">
						<div class="col d-flex justify-content-center">
							<c:if test="${pm.prev == true}">
								<a href="eventList.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<a href="eventList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}" class="mx-1">${i}</a>
							</c:forEach>
							<c:if test="${pm.next == true}">
								<a href="eventList.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
							</c:if>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- /.container -->

		<!-- FOOTER -->
		<footer class="container">
			<p class="float-end">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2017–2022 Company, Inc. &middot; <a href="#">Privacy</a>
				&middot; <a href="#">Terms</a>
			</p>
		</footer>
	</main>
	<script>
		$(function(){
			$("#carousel0").addClass("active");
			for(var i=0;i<3;i++){
				$("#tagArea"+i).text(tagArray[i]);
			}
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>

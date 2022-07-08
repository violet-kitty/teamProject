<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HOWF 추천</title>
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
</head>
<body>
	<main>
		<!-- 리스트 페이지 히어로? -->
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
				<div class="carousel-item active">
					<img class="d-block w-100" src="<%=request.getContextPath() %>/howf/displayFile.do?fileName=${hero[0].filename}">
					<div class="container">
						<div class="carousel-caption">
							<h1>${hero[0].title}</h1>
							<p>
								<a class="btn btn-lg btn-primary" href="howfView.do?hbidx=${hero[0].hbidx}">자세히 보기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="<%=request.getContextPath() %>/howf/displayFile.do?fileName=${hero[1].filename}">
					<div class="container">
						<div class="carousel-caption">
							<h1>${hero[1].title}</h1>
							<p>
								<a class="btn btn-lg btn-primary" href="howfView.do?hbidx=${hero[1].hbidx}">자세히 보기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="<%=request.getContextPath() %>/howf/displayFile.do?fileName=${hero[2].filename}">
					<div class="container">
						<div class="carousel-caption">
							<h1>${hero[2].title}</h1>
							<p>
								<a class="btn btn-lg btn-primary" href="howfView.do?hbidx=${hero[2].hbidx}">자세히 보기</a>
							</p>
						</div>
					</div>
				</div>
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
					 <c:if test="${login!=null && login.role=='admin'}">
					 <div class="row">
					 	<div class="col">
					 		<button class="btn btn-success" onclick="location.href='howfWrite.do'">글 쓰기</button>
					 	</div>
					 </div>
					 </c:if>
					
					<!-- sort 버튼 -->
					<div class="row">
						<div class="col d-flex justify-content-end">
							<!-- searchVO에 sortType food, stay, travel, good, new 넘김 -->
							<button onclick="location.href='howfList.do?sortType=food'">맛집추천</button>
							<button onclick="location.href='howfList.do?sortType=stay'">숙박추천</button>
							<button onclick="location.href='howfList.do?sortType=travel'">여행지추천</button>
							<button onclick="location.href='howfList.do?sortType=heart'">좋아요순</button>
							<button onclick="location.href='howfList.do?sortType=new'">최신순</button>
						</div>
					</div>
					<br>
					<!-- 게시판 이름, 검색창 -->
					<div class="row">
						<div class="col-md-4 d-flex justify-content-start">
							<h3>HOWF 추천</h3>
						</div>
						<div class="col-md-8 d-flex justify-content-end">
							<form class="d-flex input-group" action="howfList.do" method="post">
								<select class="form-select" name="searchType">
									<option value="total" selected>전체</option>
									<option value="title">제목 검색</option>
									<option value="tag">태그 검색</option>
								</select>
								<input type="text" class="form-control" name="searchValue">
								<button class="btn btn-dark">검색</button>
							</form>
						</div>
					</div><!-- row end -->
					<br>

					<!-- content 시작 -->
					
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<c:forEach var="v" items="${howf}">
						<div class="col-sm-12 col-md-12 col-lg-4">
							<div class="card shadow-sm" style="cursor:pointer" onclick="location.href='howfView.do?hbidx=${v.hbidx}'">
								<c:if test="${v.filename != null}">
									<img class="card-img-top" src="<%=request.getContextPath() %>/howf/displayFile.do?fileName=${v.filename}">
								</c:if>
								<div class="card-body">
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<c:if test="${v.cate=='숙박추천'}">
												<span style="background: #54ACA8; border-radius: 5px; color: white;">${v.cate}</span>
											</c:if>
											<c:if test="${v.cate=='여행지추천'}">
												<span style="background: #85A548; border-radius: 5px; color: white;">${v.cate}</span>
											</c:if>
											<c:if test="${v.cate=='맛집추천'}">
												<span style="background: #DE8889; border-radius: 5px; color: white;">${v.cate}</span>
											</c:if>
											<span class="ms-1">${v.wdate}</span>
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
								<a href="howfList.do?page=${pm.startPage-1}&sortType=${vo.sortType}&searchType=${vo.searchType}&searchValue=${vo.searchValue}">◀</a>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<a href="howfList.do?page=${i}&sortType=${vo.sortType}&searchType=${vo.searchType}&searchValue=${vo.searchValue}" class="mx-1">${i}</a>
							</c:forEach>
							<c:if test="${pm.next == true}">
								<a href="howfList.do?page=${pm.endPage+1}&sortType=${vo.sortType}&searchType=${vo.searchType}&searchValue=${vo.searchValue}">▶</a>
							</c:if>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- /.container -->

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
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="<%=request.getContextPath()%>/image/eventTest.png">
					<div class="container">
						<div class="carousel-caption">
							<h1>Example headline.</h1>
							<p>Some representative placeholder content for the first
								slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">자세히 보기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="<%=request.getContextPath()%>/image/eventTest.png">
					<div class="container">
						<div class="carousel-caption">
							<h1>Another example headline.</h1>
							<p>Some representative placeholder content for the second
								slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">자세히 보기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="<%=request.getContextPath()%>/image/eventTest.png">
					<div class="container">
						<div class="carousel-caption">
							<h1>One more for good measure.</h1>
							<p>Some representative placeholder content for the third
								slide of this carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">자세히 보기</a>
							</p>
						</div>
					</div>
				</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>

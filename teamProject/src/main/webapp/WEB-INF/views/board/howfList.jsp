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
<!-- Bootstrap core CSS -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/howf.css"
	rel="stylesheet">

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
		
		<!--  -->
		<div class="container marketing">
			<div class="album py-5 bg-light">
				<div class="container">

					<!-- sort 버튼 -->
					<div class="row">
						<div class="col d-flex justify-content-end">
							<button>맛집추천</button>
							<button>숙박추천</button>
							<button>여행지추천</button>
							<button>좋아요순</button>
							<button>최신순</button>
						</div>
					</div>
					<br>
					<!-- 게시판 이름, 검색창 -->
					<div class="row">
						<div class="col-md-4 d-flex justify-content-start">
							<h3>HOWF 추천</h3>
						</div>
						<div class="col-md-8 d-flex justify-content-end">
							<form class="d-flex input-group">
								<select class="form-select" id="searchType">
									<option selected>전체</option>
									<option>제목 검색</option>
									<option>태그 검색</option>
								</select>
								<input type="text" class="form-control">
								<button class="btn btn-dark">검색</button>
							</form>
						</div>
					</div><!-- row end -->
					<br>

					<!-- content 시작 -->
					
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<c:forEach var="i" begin="0" end="8" step="1">
						<div class="col-md-6 col-lg-4">
							<div class="card shadow-sm">
								<img class="card-img-top"
									src="<%=request.getContextPath()%>/image/eventTest.png">
								<div class="card-body">
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<span
												style="background: #54ACA8; border-radius: 5px; color: white;">숙박추천</span>
											<span class="ms-1">2000-00-00</span>
										</div>
										<small class="text-muted"><img
											src="<%=request.getContextPath()%>/image/redheart.png"
											width="30" height="30"><span class="ms-1">0</span></small>
									</div>
									<div class="d-flex justify-content-start" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
										<p style="margin-left: 0; margin-right: 0;width:100%;">제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 </p>
									</div>
								</div><!-- card-body end -->
							</div>
						</div><!-- col end -->
						</c:forEach>
					</div><!-- row end -->

					<div class="row">
						<div class="col d-flex justify-content-center">페이징 번호</div>
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

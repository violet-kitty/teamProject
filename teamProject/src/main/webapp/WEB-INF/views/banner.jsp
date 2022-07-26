<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- banner -->
<div id="carouselExampleDark" class="banner carousel carousel-dark slide" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target=#carouselExampleDark data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner" id="news">
		<div class="carousel-item active" data-bs-interval="3000">
			<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/image/picture/picture3.jpg);"></div>
			<div class="carousel-caption d-md-block">
				<div class="captionset">
					<h5 class="hfc-white hfc-bold">2022 평창자연지키미축제</h5>
					<p class="hfc-semibold hfc-green">2022. 6. 23 ~ 2022.06.28</p>
				</div>

			</div>
		</div>
		<div class="carousel-item" data-bs-interval="3000">
			<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/image/picture/back.jpg);"></div>
			<div class="carousel-caption d-md-block">
				<div class="captionset">
					<h5 class="hfc-white hfc-bold">제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다</h5>
					<p class="hfc-semibold hfc-green">2022.05.01 ~ 2022.05.24</p>
				</div>

			</div>
		</div>
		<div class="carousel-item" data-bs-interval="3000">
			<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/image/picture/picture7.jpeg);"></div>
			<div class="carousel-caption d-md-block">
				<div class="captionset">
					<h5 class="hfc-white hfc-bold">제목입니다 제목입니다 제목입니다 제목입니다 제목입니다 제목입니다</h5>
					<p class="hfc-semibold hfc-green">2022.05.01 ~ 2022.05.24</p>
				</div>

			</div>
		</div>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
	</button>
</div>
<!-- /banner -->

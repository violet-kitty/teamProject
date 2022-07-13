<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</head>

<body>

	<div id="wrap">
		<!-- Header --><%@include file="Header.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container">

			<!-- contents 01 -->
			<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner" id="news">
					<div class="carousel-item active" data-bs-interval="3000">
						<div><img src="<%= request.getContextPath() %>/image/picture/picture1.jpeg"  class="d-block w-100" alt="..."></div>
						<div class="carousel-caption d-none d-md-block">
							<h5 class="lfc-white bold">EU 탄소무역장벽 강화···<br>국내 기업은 ‘남일 보듯’</h5>
							<p class="semibold">EU 탄소국경조정세 강화‧‧‧ 품목 5개→9개, 본격적인 시행도 1년 앞당겨<br>국내 RE100 기업 중 실제 재생에너지 전력 사용은 LG‧현대자동차 2곳뿐</p>
							<a class="whitebtn" href="https://www.hkbs.co.kr/">환경뉴스</a>
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="3000">
						<div><img src="<%= request.getContextPath() %>/image/picture/picture2.jpg"  class="d-block w-100" alt="..."></div>
						<div class="carousel-caption d-none d-md-block">
							<h5 class="lfc-white bold">“토양 속 다이옥신은 전문기관에서 관리해야”</h5>
							<p class="semibold">국회 토론회서 전문기관 및 인력 부족 등 부각<br>환경부 “POPs 기관과 협업해 분석 수요에 대응 계획”</p>
							<a class="whitebtn" href="https://www.hkbs.co.kr/">환경뉴스</a>
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="3000">
						<div><img src="<%= request.getContextPath() %>/image/picture/picture3.jpg"  class="d-block w-100" alt="..."></div>
						<div class="carousel-caption d-none d-md-block">
							<h5 class="lfc-white bold">기계설비 진화···기후변화 적응 바람 확산</h5>
							<p class="semibold">2022 대한민국 기계설비전시회, 소방·환기 설비 트렌드 제시<br>‘에어샤워’·‘막힘 방지 펌프’ 등 눈길, LH 탄소중립 특별관 운영</p>
							<a class="whitebtn" href="https://www.hkbs.co.kr/">환경뉴스</a>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleDark" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- /content 01 -->
	
			<!-- Nav --><%@include file="Nav.jsp"%>
		
			<!-- contents 02 -->

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="Footer.jsp"%>
	</div><!-- /#wrap -->
	
</body>
</html>




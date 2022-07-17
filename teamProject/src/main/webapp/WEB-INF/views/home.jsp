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
			<div id="carouselExampleDark" class="contents01 carousel carousel-dark slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner" id="news">
	
					<div class="carousel-item active" data-bs-interval="3000">
						<div class="imgset" style="background-image: url(<%= request.getContextPath() %>/image/picture/picture1.jpg);"></div>
						<div class="carousel-caption d-md-block">
							<div class="captionset">
								<h5 class="hfc-blackgray hfc-bold">갬성자극! 제주도 여행은 ‘나미송 머무는 곳’</h5>
								<p class="hfc-semibold hfc-darkgray">#민박  #고향민박  #독채<br>#정원  #주방기구  #자연경관</p>
								<button class="greenbtn hbshadow2">HOWF 숙박추천</button>
							</div>
							
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="3000">
						<div class="imgset" style="background-image: url(<%= request.getContextPath() %>/image/picture/picture2.jpg);"></div>
						<div class="carousel-caption d-md-block">
							<div class="captionset">
								<h5 class="hfc-blackgray hfc-bold">벚꽃 여행 떠나보자! 2022년 추천 벚꽃여행지와 지역별 벚꽃명소</h5>
								<p class="hfc-semibold hfc-darkgray">#축제  #힐링  #자연<br>#여행  #봄  #드라이브</p>
								<button class="greenbtn hbshadow2">HOWF 여행지추천</button>
							</div>
							
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="3000">
						<div class="imgset" style="background-image: url(<%= request.getContextPath() %>/image/picture/picture4.jpeg);"></div>
						<div class="carousel-caption d-md-block">
							<div class="captionset">
								<h5 class="hfc-blackgray hfc-bold">맛있게 먹으면 피자도 0칼로리~ 피자의 축제! ’그라덴피자’ 남해 독일마을!</h5>
								<p class="hfc-semibold hfc-darkgray">#남해  #독일마을  #피자<br>#이국적  #이색여행  #미슐랭</p>
								<button class="greenbtn hbshadow2">HOWF 맛집추천</button>
							</div>
							
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
			
			<!-- content 02 -->
			<!-- / .content 02 -->
			
	
			<!-- Nav --><%@include file="Nav.jsp"%>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="Footer.jsp"%>
	</div><!-- /#wrap -->
	
</body>
</html>




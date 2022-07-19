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
<!-- Slick Slider -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
		<div id="container" class="hbg-lightgray">

			<!-- contents 01 -->
			<div id="carouselExampleDark" class="content01 carousel carousel-dark slide"
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
	
			<!-- Nav --><%@include file="Nav.jsp"%>
			
			<!-- content 02 -->
			<div class="contents content02 hbg-lightgray">
				<div class="container" id="featured-2">
					<p class="title hfc-bold hfc-blackgray">행복하고 만족했던 <br class="onlymobile"> 여행리뷰를 들려주세요!</p>
					<p class="subtitle hfc-medium hfc-darkgray">성공적인 여행을 위해 여행전 열람 필수!! <br class="onlymobile">  진정한 여행러들이 나누는 이야기와 팁을 확인하세요! <a class="hfc-pink hfc-bold">‘여행이야기’ 가기</a></p>
					<div class="row row-cols-1 row-cols-lg-2">
						<a class="colitem" href="#">
					      <div class="col d-flex align-items-start">
					        <div class="icon-square bg-light text-dark d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3">
					          <div style="background-image: url(<%= request.getContextPath() %>/image/picture/picture10.jpeg); width: 160px; height: 160px; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
					        </div>
					        <div>
					          	<div class="cprofile">
									<span class="round">
										<!-- 사용자 프로필 보여주기-->
										<div style="background-image: url(<%= request.getContextPath() %>/image/picture/back.jpg); width: 32px; height: 32px; border-radius:100%; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
									</span>
									<p class="profile hfc-regular hfc-blackgray">아임쏘TMI</p>
								</div>
					          <h2 class="hfc-bold hfc-blackgray">직접가본 남해 독일마을 생각보다 평화롭지는 않았음… 살짝 실망한 남해 여행</h2>
					          <p class="hfc-regular hfc-darkgray">#남해 #여행 #독일마을 #비밀 #갈등 #실망 #분위기 #힐링 #실패 #맛있는 #음식</p>
					        </div>
					      </div>
				      	</a>
				      	<a class="colitem" href="#">
					      <div class="col d-flex align-items-start">
					        <div class="icon-square bg-light text-dark d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3">
					          <div style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png); width: 160px; height: 160px; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
					        </div>
					        <div>
					          	<div class="cprofile">
									<span class="round">
										<!-- 사용자 프로필 보여주기-->
										<div style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png); width: 32px; height: 32px; border-radius:100%; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
									</span>
									<p class="profile hfc-regular hfc-blackgray">닉네임</p>
								</div>
					          <h2 class="hfc-bold hfc-blackgray">제목지정 제목지정제목지정 제목지정제목지정 제목지정제목지정 제목지정제목지정 제목지정</h2>
					          <p class="hfc-regular hfc-darkgray">#태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그</p>
					        </div>
					      </div>
					    </a>
					    <a class="colitem" href="#">
					      <div class="col d-flex align-items-start">
					        <div class="icon-square bg-light text-dark d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3">
					          <div style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png); width: 160px; height: 160px; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
					        </div>
					        <div>
					          	<div class="cprofile">
									<span class="round">
										<!-- 사용자 프로필 보여주기-->
										<div style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png); width: 32px; height: 32px; border-radius:100%; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
									</span>
									<p class="profile hfc-regular hfc-blackgray">닉네임</p>
								</div>
					          <h2 class="hfc-bold hfc-blackgray">제목지정 제목지정제목지정 제목지정제목지정 제목지정제목지정 제목지정제목지정 제목지정</h2>
					          <p class="hfc-regular hfc-darkgray">#태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그</p>
					        </div>
					      </div>
					    </a>
					    <a class="colitem" href="#">
					      <div class="col d-flex align-items-start">
					        <div class="icon-square bg-light text-dark d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3">
					          <div style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png); width: 160px; height: 160px; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
					        </div>
					        <div>
					          	<div class="cprofile">
									<span class="round">
										<!-- 사용자 프로필 보여주기-->
										<div style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png); width: 32px; height: 32px; border-radius:100%; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
									</span>
									<p class="profile hfc-regular hfc-blackgray">닉네임</p>
								</div>
					          <h2 class="hfc-bold hfc-blackgray">제목지정 제목지정제목지정 제목지정제목지정 제목지정제목지정 제목지정제목지정 제목지정</h2>
					          <p class="hfc-regular hfc-darkgray">#태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그 #태그</p>
					        </div>
					      </div>
					    </a>
				    </div><!-- /.row -->
			    </div><!-- /.container -->
		    </div><!-- /.contents -->
			<!-- / .content 02 -->
			
			<!-- content 03 -->
			<div class="contents content03 hbg-whitegray">
				<div class="container">
					<div class="linediv">
						<p class="title hfc-bold hfc-blackgray">HOWF에서는 <span class="hfc-green">숙박정보 검색</span>, <span class="hfc-pink">예약</span> 모두 가능!</p>
					</div>
				   <div class="my-slider">
				      <a class="colitem" href="#">
					      <div class="hbshadow3">
						    <div class="imgset" style="background-image: url(<%= request.getContextPath() %>/image/picture/stay1.jpeg);"></div>
							<div class="banding">
								<p class="hfc-bold hfc-pink">서귀포시, 서귀포</p><p class="hfc-darkgray dashp">|</p>
								<img src="<%= request.getContextPath() %>/image/icon/star.png"><p class="score hfc-semibold hfc-blue">4.5</p>
								<h3 class="hfc-bold hfc-blackgray">호텔 브릿지 서귀포</h3>
								<h4 class="hfc-medium hfc-darkgray">$400,000 ~ $600,000</h4>
							</div>
					      </div>
				      </a>
				      <a class="colitem" href="#">
					      <div class="hbshadow3">
						    <div class="imgset" style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png);"></div>
							<div class="banding">
								<p class="hfc-bold hfc-pink">지역도, 지역시</p><p class="hfc-darkgray dashp">|</p>
								<img src="<%= request.getContextPath() %>/image/icon/star.png"><p class="score hfc-semibold hfc-blue">4.5</p>
								<h3 class="hfc-bold hfc-blackgray">숙소이름 숙소이름 숙소이름</h3>
								<h4 class="hfc-medium hfc-darkgray">$nnn,nnn ~ $nnn,nnn</h4>
							</div>
					      </div>
					  </a>
				      <a class="colitem" href="#">
					      <div class="hbshadow3">
						    <div class="imgset" style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png);"></div>
							<div class="banding">
								<p class="hfc-bold hfc-pink">지역도, 지역시</p><p class="hfc-darkgray dashp">|</p>
								<img src="<%= request.getContextPath() %>/image/icon/star.png"><p class="score hfc-semibold hfc-blue">4.5</p>
								<h3 class="hfc-bold hfc-blackgray">숙소이름 숙소이름 숙소이름</h3>
								<h4 class="hfc-medium hfc-darkgray">$nnn,nnn ~ $nnn,nnn</h4>
							</div>
					      </div>
					  </a>
					  <a class="colitem" href="#">
					      <div class="hbshadow3">
						    <div class="imgset" style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png);"></div>
							<div class="banding">
								<p class="hfc-bold hfc-pink">지역도, 지역시</p><p class="hfc-darkgray dashp">|</p>
								<img src="<%= request.getContextPath() %>/image/icon/star.png"><p class="score hfc-semibold hfc-blue">4.5</p>
								<h3 class="hfc-bold hfc-blackgray">숙소이름 숙소이름 숙소이름</h3>
								<h4 class="hfc-medium hfc-darkgray">$nnn,nnn ~ $nnn,nnn</h4>
							</div>
					      </div>
					  </a>
					  <a class="colitem" href="#">
					      <div class="hbshadow3">
						    <div class="imgset" style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png);"></div>
							<div class="banding">
								<p class="hfc-bold hfc-pink">지역도, 지역시</p><p class="hfc-darkgray dashp">|</p>
								<img src="<%= request.getContextPath() %>/image/icon/star.png"><p class="score hfc-semibold hfc-blue">4.5</p>
								<h3 class="hfc-bold hfc-blackgray">숙소이름 숙소이름 숙소이름</h3>
								<h4 class="hfc-medium hfc-darkgray">$nnn,nnn ~ $nnn,nnn</h4>
							</div>
					      </div>
					  </a>
					  <a class="colitem" href="#">
					      <div class="hbshadow3">
						    <div class="imgset" style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png);"></div>
							<div class="banding">
								<p class="hfc-bold hfc-pink">지역도, 지역시</p><p class="hfc-darkgray dashp">|</p>
								<img src="<%= request.getContextPath() %>/image/icon/star.png"><p class="score hfc-semibold hfc-blue">4.5</p>
								<h3 class="hfc-bold hfc-blackgray">숙소이름 숙소이름 숙소이름</h3>
								<h4 class="hfc-medium hfc-darkgray">$nnn,nnn ~ $nnn,nnn</h4>
							</div>
					      </div>
					  </a>
				   </div>
				</div>
						
			</div>

<script>
$(document).ready(function(){
    $('.my-slider').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      arrows: true,
      dots: false,
      speed: 300,
      infinite: true,
      autoplaySpeed: 5000,
      autoplay: true,
      responsive: [
    {
      breakpoint: 991,
      settings: {
        slidesToShow: 3,
      }
    },
    {
      breakpoint: 767,
      settings: {
        slidesToShow: 1,
      }
    }
  ]
    });
  });
</script>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="Footer.jsp"%>
	</div><!-- /#wrap -->

</body>
</html>




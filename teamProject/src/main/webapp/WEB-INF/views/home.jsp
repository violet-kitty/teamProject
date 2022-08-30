<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF</title>

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
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Home --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<script>
	function tagParse(tag, id){
		//리스트 태그 값 넣기
		var json = tag;
		var jsonParse = JSON.parse(json);
		var tagData = "";
		$.each(jsonParse,function(idx){
			tagData = tagData+jsonParse[idx]["value"]+"<span>&nbsp;&nbsp;</span>";
		})
		
		$("#"+id).html(tagData);
	}
</script>

	
<!-- 모달 팝업창 -->
	<script type="text/javascript">
		var getCookie = function(name){
			var value = document.cookie.match('(^|;)?'+name+'=([^;]*)(;|$)');
			return value? value[2] : null;
		}
		
		function noticepop(){
			//쿠키에 저장된 값 있는지 가져오기
			var val = getCookie("timemodal");
			
			if(val == null){
				modalFn('${notice.content}',"닫기",'${notice.title}',"3days");
			}
		}
		
		function setCookie(cookie_name, value, days) {
			  var exdate = new Date();
			  exdate.setDate(exdate.getDate() + days);
			  // 설정 일수만큼 현재시간에 만료값으로 지정

			  var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
			  document.cookie = cookie_name + '=' + cookie_value;
			}
		
		//3일 동안 안보기
		function timeCloseModal(){
			//쿠키에 저장하기
			setCookie("timemodal","timemodal",3);
			modalClose();
		}

	</script>

</head>

<body onLoad="noticepop()">

	<div id="wrap">
		<!-- Header --><%@include file="Header.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- contents 01 -->
			<div id="carouselExampleIndicators" class="content01 carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner" id="news">

					<div class="carousel-item active" data-bs-interval="3000">
						<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/howf/displayFile.do?fileName=${howf[0].filename});"></div>
						<div class="carousel-caption d-md-block">
							<div class="captionset">
								<h5 class="hfc-blackgray hfc-bold">${howf[0].title}</h5>
								<p class="hfc-semibold hfc-darkgray" id="howftag0">
									<script>tagParse('${howf[0].tag}','howftag0');</script>
								</p>
								<button class="greenbtn hbshadow2" onclick="location.href='<%= request.getContextPath() %>/howf/howfView.do?hbidx=${howf[0].hbidx}'">HOWF 숙박추천</button>
							</div>

						</div>
					</div>
					<div class="carousel-item" data-bs-interval="3000">
						<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/howf/displayFile.do?fileName=${howf[1].filename});"></div>
						<div class="carousel-caption d-md-block">
							<div class="captionset">
								<h5 class="hfc-blackgray hfc-bold">${howf[1].title}</h5>
								<p class="hfc-semibold hfc-darkgray" id="howftag1">
									<script>tagParse('${howf[1].tag}','howftag1');</script>
								</p>
								<button class="greenbtn hbshadow2" onclick="location.href='<%= request.getContextPath() %>/howf/howfView.do?hbidx=${howf[1].hbidx}'">HOWF 여행지추천</button>
							</div>

						</div>
					</div>
					<div class="carousel-item" data-bs-interval="3000">
						<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/howf/displayFile.do?fileName=${howf[2].filename});"></div>
						<div class="carousel-caption d-md-block">
							<div class="captionset">
								<h5 class="hfc-blackgray hfc-bold">${howf[2].title}</h5>
								<p class="hfc-semibold hfc-darkgray" id="howftag2">
									<script>tagParse('${howf[2].tag}','howftag2');</script>
								</p>
								<button class="greenbtn hbshadow2" onclick="location.href='<%= request.getContextPath() %>/howf/howfView.do?hbidx=${howf[2].hbidx}'">HOWF 맛집추천</button>
							</div>

						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- /content 01 -->

			<!-- Nav --><%@include file="Nav.jsp"%>
			
			<!-- content 02 -->
			<div class="contents content02 hbg-lightgray">
				<div class="container" id="featured-2">
					<p class="title hfc-bold hfc-blackgray">행복하고 만족했던 <br class="onlymobile"> 여행리뷰를 들려주세요!</p>
					<p class="subtitle hfc-medium hfc-darkgray">성공적인 여행을 위해 여행전 열람 필수!! <br class="onlymobile">  진정한 여행러들이 나누는 이야기와 팁을 확인하세요! <a class="hfc-pink hfc-bold" href="story/storyList.do">‘여행이야기’ 가기</a></p>
					<div class="row row-cols-1 row-cols-lg-2">
						
						<!-- 여행 이야기 글 없을 떄! -->
						<c:if test="${empty story}">
						글이 없어요!
						</c:if>
						<c:forEach var="s" items="${story}">
						<a class="colitem" href="story/storyView.do?sbidx=${s.sbidx}">
					      <div class="col d-flex align-items-start">
					        <div class="icon-square bg-light text-dark d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3">
					          <div style="background-image: url(<%= request.getContextPath() %>/howf/displayFile.do?fileName=${s.filename}); width: 160px; height: 160px; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
					        </div>
					        <div>
					          	<div class="cprofile">
									<span class="round">
										<!-- 사용자 프로필 보여주기-->
										<c:choose>
										<c:when test="${s.img != null}">
										<div style="background-image: url(<%= request.getContextPath() %>/howf/displayFile.do?fileName=${s.img}); width: 32px; height: 32px; border-radius:100%; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
										</c:when>
										<c:otherwise>
										<div style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png); width: 32px; height: 32px; border-radius:100%; background-size: cover;background-position: center top; background-repeat: no-repeat;"></div>
										</c:otherwise>
										</c:choose>
									</span>
									<p class="profile hfc-regular hfc-blackgray">${s.nickname}</p>
								</div>
					          <h2 class="hfc-bold hfc-blackgray">${s.title}</h2>
					          <p class="hfc-regular hfc-darkgray" id="storytag${s.sbidx}"><script>tagParse('${s.tag}','storytag${s.sbidx}');</script></p>
					        </div>
					      </div>
				      	</a>
				      	</c:forEach>
				    </div><!-- /.row -->
			    </div><!-- /.container -->
		    </div><!-- /.contents -->
			<!-- / .content 02 -->

			<!-- content 03 -->
			<div class="contents content03 hbg-whitegray">
				<div class="container">
					<div class="linediv">
						<p class="title hfc-bold hfc-blackgray">
							HOWF에서는 <span class="hfc-green">숙박정보 검색</span>, <span class="hfc-pink">예약</span> 모두 가능!
						</p>
					</div>
					<div class="my-slider">
					
						<c:forEach var="t" items="${stay}">
						<a class="colitem" href="stay/stayView.do?sidx=${t.sidx}">
							<div class="hbshadow3">
								<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/howf/displayFile.do?fileName=${fn:split(t.photo,',')[0]});"></div>
								<div class="banding">
									<p class="hfc-bold hfc-pink">${fn:split(t.addr,' ')[0]} ${fn:split(t.addr,' ')[1]}</p>
									<p class="hfc-darkgray dashp">|</p>
									<img src="<%=request.getContextPath()%>/image/icon/star.png">
									<p class="score hfc-semibold hfc-blue">${t.star}</p>
									<h3 class="hfc-bold hfc-blackgray">${t.name}</h3>
									<h4 class="hfc-medium hfc-darkgray">&#8361; ${t.min} ~ &#8361; ${t.max}</h4>
								</div>
							</div>
						</a>
						</c:forEach>
						
					</div>
				</div>
			</div>
			<script>
				$(document).ready(function() {
					$('.my-slider').slick({
						slidesToShow : 3,
						slidesToScroll : 1,
						arrows : true,
						dots : false,
						speed : 300,
						infinite : true,
						autoplaySpeed : 5000,
						autoplay : true,
						responsive : [ {
							breakpoint : 992,
							settings : {
								slidesToShow : 3,
							}
						}, {
							breakpoint : 992,
							settings : {
								slidesToShow : 1,
							}
						} ]
					});
				});
			</script>
			<!-- / .content 03 -->

			<!-- banner --><%@include file="banner.jsp"%>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="Footer.jsp"%>
	</div><!-- /#wrap -->

</body>

</html>




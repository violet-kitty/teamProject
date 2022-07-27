<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF추천</title>

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
<!-- CSS3 - Howf --> <link href="<%=request.getContextPath()%>/css/howf.css" rel="stylesheet">

</head>

<body>

	<div id="wrap" class="howflist">
		<!-- Header --><%@include file="../Header.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<div class="docctrl">
				<a href="<%=request.getContextPath()%>/community/Write.do"><img src="<%=request.getContextPath()%>/image/button/add.png"></a>
			</div>
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- hero -->
			<div id="carouselExampleIndicators" class="hero content01 carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner" id="howfhero">

					<div class="carousel-item active" data-bs-interval="4000">
						<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/howf/displayFile.do?fileName=${hero[0].filename});"></div>
						<div class="carousel-caption d-md-block">
							<div class="captionset">
								<h5 class="hfc-blackgray hfc-bold"><${hero[0].cate}> ${hero[0].title}</h5>
								<p class="hfc-semibold hfc-darkgray" id="tagArea0"></p>
								<button class="greenbtn hbshadow2">자세히보기</button>
							</div>
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="4000">
						<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/howf/displayFile.do?fileName=${hero[1].filename});"></div>

						<div class="carousel-caption d-md-block">
							<div class="captionset">
								<h5 class="hfc-blackgray hfc-bold"><${hero[1].cate}> ${hero[1].title}</h5>
								<p class="hfc-semibold hfc-darkgray" id="tagArea1"></p>
								<button class="greenbtn hbshadow2">자세히보기</button>
							</div>

						</div>
					</div>
					<div class="carousel-item" data-bs-interval="4000">
						<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/howf/displayFile.do?fileName=${hero[2].filename});"></div>

						<div class="carousel-caption d-md-block">
							<div class="captionset">
								<h5 class="hfc-blackgray hfc-bold"><${hero[2].cate}> ${hero[2].title}</h5>
								<p class="hfc-semibold hfc-darkgray" id="tagArea2"></p>
								<button class="greenbtn hbshadow2">자세히보기</button>
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
			<!-- /.hero -->

			<!-- Nav --><%@include file="../Nav.jsp"%>
			
			<!-- pagehead  -->
			<div class="contents pagehead hbg-lightgray">
				<div class="container" id="featured-2">
				
					<!-- pagehead -->
					<div class="pageinfo">
						<!-- 페이지 제목 -->
						<div class="title">
							<a href="<%= request.getContextPath() %>/howf/howfList.do"><h1>HOWF추천</h1></a>
						</div>
						
						<!-- rightbox -->
						<div class="row rightbox">
							<!-- sort 버튼 -->
							<div class="col d-flex justify-content-end filterbtn">
								<!-- searchVO에 sortType food, stay, travel, heart, new 넘김 -->
								<button onclick="location.href='howfList.do?sortType=food'">맛집추천</button>
								<button onclick="location.href='howfList.do?sortType=stay'">숙박추천</button>
								<button onclick="location.href='howfList.do?sortType=travel'">여행지추천</button>
								<button onclick="location.href='howfList.do?sortType=heart'">좋아요순</button>
								<button  class="active"  onclick="location.href='howfList.do?sortType=new'">최신순</button>
							</div>
							<!-- 검색창 Search --><%@include file="../Search.jsp"%>
						</div><!-- .rightbox -->
					</div><!-- .pageinfo -->
					<!-- / pagehead -->
					
					<!-- 여기서부터 -->

					 <c:if test="${login!=null && login.role=='admin'}">
					 <div class="row">
					 	<div class="col">
					 		<button class="btn btn-success" onclick="location.href='howfWrite.do'">글 쓰기</button>
					 	</div>
					 </div>
					 </c:if>
					
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
								<a href="howfList.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<a href="howfList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}" class="mx-1">${i}</a>
							</c:forEach>
							<c:if test="${pm.next == true}">
								<a href="howfList.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
							</c:if>
						</div>
					</div>

		<!-- /.여기서부터 -->
			    </div><!-- /.container -->
		    </div>
			<!-- / .pagehead -->
			

			<!-- banner --><%@include file="../banner.jsp"%>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
	
	<script>
		$(function(){
			//태그 파싱
			var json0 = '${hero[0].tag}';
			var json1 = '${hero[1].tag}';
			var json2 = '${hero[2].tag}';
			
			var jsonParse = JSON.parse(json0);
			var tags = "";
			$.each(jsonParse,function(idx){
				tags = tags+jsonParse[idx]["value"]+" ";
			})
			$("#tagArea0").text(tags);
			
			var jsonParse = JSON.parse(json1);
			var tags = "";
			$.each(jsonParse,function(idx){
				tags = tags+jsonParse[idx]["value"]+" ";
			})
			$("#tagArea1").text(tags);
			
			var jsonParse = JSON.parse(json2);
			var tags = "";
			$.each(jsonParse,function(idx){
				tags = tags+jsonParse[idx]["value"]+" ";
			})
			$("#tagArea2").text(tags);
		});
	</script>

</body>
</html>
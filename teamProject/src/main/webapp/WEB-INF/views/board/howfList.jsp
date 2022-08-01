<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html lang="ko">
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

<script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link href="<%=request.getContextPath()%>/css/board.css" rel="stylesheet">
<!-- CSS3 - Howf --> <link href="<%=request.getContextPath()%>/css/howf.css" rel="stylesheet">

</head>

<body>

	<div id="wrap" class="boardlist howf howflist">
		
		<!-- Header --><%@include file="../Header.jsp"%>
		
		<!-- Side -->
		
		<div class="right-container">
			<c:if test="${login!=null && login.role=='admin'}">
				<div class="docctrl">
					<a href="<%=request.getContextPath()%>/howf/howfWrite.do"><img src="<%=request.getContextPath()%>/image/button/add.png"></a>
				</div>
			</c:if>
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">

			<!-- hero -->
			<div id="carouselExampleIndicators" class="hero content01 carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators onlypc">
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
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
				
					<!-- pagehead -->
					<div class="pageinfo">
						<!-- 페이지 제목 -->
						<div class="title onlypc">
							<a href="<%= request.getContextPath() %>/howf/howfList.do"><h1>HOWF추천</h1></a>
						</div>
						
						<!-- rightbox : tablet 사이즈 이하에서 숨기기 -->
						<div class="row rightbox onlypc-inline">
							<!-- sort 버튼 -->
							<div class="col d-flex justify-content-end filterbtn">
								<!-- searchVO에 sortType food, stay, travel, heart, new 넘김 -->
								<!-- <ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item active"><a class="nav-link" onclick="location.href='howfList.do?sortType=food'">맛집추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='howfList.do?sortType=stay'">숙박추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='howfList.do?sortType=travel'">여행지추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='howfList.do?sortType=heart'">좋아요순</a></li>
									<li class="nav-item"><a class="nav-link active" onclick="location.href='howfList.do?sortType=new'">최신순</a></li>
								</ul> -->
								<!-- searchVO에 sortType food, stay, travel, heart, new 넘김 -->
								<button onclick="location.href='howfList.do?sortType=food'">맛집추천</button>
								<button onclick="location.href='howfList.do?sortType=stay'">숙박추천</button>
								<button onclick="location.href='howfList.do?sortType=travel'">여행지추천</button>
								<button onclick="location.href='howfList.do?sortType=heart'">좋아요순</button>
								<button  class="active"  onclick="location.href='howfList.do?sortType=new'">최신순</button>
							</div>
							<!-- 검색창 Search --><%@include file="../Search.jsp"%>
						</div><!-- .rightbox -->
						
						<!-- rightbox : tablet 사이즈 이하에서만 보이기-->
						
						<div class="row rightbox onlytablet">
							<div class="btn-group">
								<button class="w-100 dropdown-toggle bluebtn" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">카테고리 정렬</button>
								<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
									<li><a class="dropdown-item" href="howfList.do?sortType=new">최신순</a></li>
									<li><a class="dropdown-item" href="howfList.do?sortType=heart">좋아요순</a></li>
									<li><a class="dropdown-item" href="howfList.do?sortType=food">맛집추천</a></li>
									<li><a class="dropdown-item" href="howfList.do?sortType=stay">숙박추천</a></li>
									<li><a class="dropdown-item" href="howfList.do?sortType=travel">여행지추천</a></li>
								</ul>
							</div>
							<!-- 검색창 Search --><%@include file="../Search.jsp"%>
						</div><!-- .rightbox -->
						
					</div><!-- .pageinfo -->
					<!-- / pagehead -->
					
					
					<!-- ----------------------------------------------------------------------------------------------------- -->
					
					<!-- 리스트 카드 -->
					<!-- 리스트 카드 hover effect 종류 참고 : https://codepen.io/vavik96/pen/MYdBKz -->
					<div class="clist">
						
						<div class="row grid">
							<!-- C리스트 14. 반복 -->
							<c:forEach var="v" items="${howf}">
							<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
								<a style="cursor:pointer" onclick="location.href='howfView.do?hbidx=${v.hbidx}'">
									<div class="thumbnail hbshadow3">

											<figure class="effect-ming">
												<!-- 메인이미지 보여주기-->
												<c:if test="${v.filename != null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/howf/displayFile.do?fileName=${v.filename});"></div>
												</c:if>

												<c:if test="${v.filename == null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:if>

												<!-- 이미지 규격 사이즈 355px * 240px 권장  -->
												<figcaption>
													<p id="howftag">${v.tag}</p>
												</figcaption>
											</figure>
											<div class="writerinfo">
												<p>
													<c:if test="${v.cate=='숙박추천'}">
														<span class="cate" style="background: #54ACA8; color: white;">${v.cate}</span>
													</c:if>
													<c:if test="${v.cate=='여행지추천'}">
														<span class="cate" style="background: #85A548; color: white;">${v.cate}</span>
													</c:if>
													<c:if test="${v.cate=='맛집추천'}">
														<span class="cate" style="background: #DE8889; color: white;">${v.cate}</span>
													</c:if>
													<span class="hfc-semibold hfc-blackgray"> ${v.wdate}</span>
												</p>
												<div class="small"><img src="<%=request.getContextPath()%>/image/icon/heart.png"><span class="hfc-semibold hfc-darkgray">${v.heart}</span></div>
											</div>
											<div class="caption">
												<h4>${v.title}</h4>
											</div>
										</div><!-- /.thumbnail -->
									</a>
							</div><!--/. thumbnailitem -->
							</c:forEach>
						</div>
						<!--/row-->
						
						<!-- C페이징 01 : 페이징 paging 공간 만들기 -->
						<div class="row pagenation">
							<div class="col d-flex justify-content-center">
								<c:if test="${pm.prev == true}">
									<a class="hfc-gray hfc-bold" href="howfList.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
								</c:if>
								<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<c:choose>
								<c:when test="${search.page != null && i == search.page}">
									<a class="hfc-white hfc-bold hbg-pink mx-1" href="howfList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
								</c:when>
								<c:otherwise>
									<a class="hfc-gray hfc-bold mx-1" href="howfList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
								</c:otherwise>
								</c:choose>
								</c:forEach>
								<c:if test="${pm.next == true}">
									<a class="hfc-gray hfc-bold" href="howfList.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
								</c:if>
							</div>
						</div>
						<!-- /페이징 -->
						
					</div>
					<!-- /.clist -->
					
					<!-- ----------------------------------------------------------------------------------------------------- -->
					
	
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
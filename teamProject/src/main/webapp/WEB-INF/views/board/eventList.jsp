<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>지역이벤트</title>

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
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardList.css">

</head>
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
<script>
	function tagParse(tag, hbidx){
		//리스트 태그 값 넣기
		var json = tag;
		var jsonParse = JSON.parse(json);
		var tagData = "";
		$.each(jsonParse,function(idx){
			tagData = tagData+jsonParse[idx]["value"]+"<span>&nbsp;&nbsp;</span>";
		})
		
		$("#eventtag"+hbidx).html(tagData);
	}
</script>
</head>
<body>

	<div id="wrap" class="boardlist event eventlist">
		
		<!-- Header --><%@include file="../Header.jsp"%>
		
		<!-- Side -->
		
		<div class="right-container">
			<c:if test="${login!=null && login.role=='official'}">
				<div class="docctrl onlypc">
					<a href="<%=request.getContextPath()%>/event/eventWrite.do"><img src="<%=request.getContextPath()%>/image/button/add.png"></a>
				</div>
			</c:if>
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">

			<!-- hero -->
			<div id="carouselExampleIndicators" class="hero content01 carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner" id="eventhero">
					<c:set var="index" value="0" />
						<c:forEach var="i" items="${hero}">
							
							<div class="carousel-item" id="carousel${index}" data-bs-interval="3000">
								<div class="imgset" style="background-image: url(<%=request.getContextPath()%>/event/displayFile.do?fileName=${i.filename});"></div>
								<div class="carousel-caption d-md-block">
									<a href="eventView.do?ebidx=${i.ebidx}">
									<div class="captionset">
										<h5 class="hfc-blackgray hfc-bold">${i.title}</h5>
										<p class="hfc-semibold hfc-pink datep">${i.startday} ~ ${i.endday}</p>
										<script>tagParse('${i.tag}',${index});</script>
										<p class="hfc-semibold hfc-darkgray" id="tagArea${index}"></p>
									</div>
									</a>
								</div>
							</div>
						<c:set var="index" value="${index+1}" />
					</c:forEach>
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
							<a href="<%= request.getContextPath() %>/event/eventList.do"><h1>지역이벤트</h1></a>
						</div>
						
						<!-- rightbox : tablet 사이즈 이하에서 숨기기 -->
						<div class="row rightbox onlypc-inline">
							<!-- sort 버튼 -->
							<div class="col d-flex justify-content-end filterbtn">
								<!-- searchVO에 sortType food, stay, travel, heart, new 넘김 -->
								<!-- <ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item active"><a class="nav-link" onclick="location.href='eventList.do?sortType=food'">맛집추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='eventList.do?sortType=stay'">숙박추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='eventList.do?sortType=travel'">여행지추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='eventList.do?sortType=heart'">좋아요순</a></li>
									<li class="nav-item"><a class="nav-link active" onclick="location.href='eventList.do?sortType=new'">최신순</a></li>
								</ul> -->
								<!-- searchVO에 sortType food, stay, travel, heart, new 넘김 -->
								<button onclick="location.href='eventList.do?sortType=ing'" id="ingBtn">진행중</button>
								<button onclick="location.href='eventList.do?sortType=will'" id="willBtn">진행예정</button>
								<button onclick="location.href='eventList.do?sortType=heart'" id="heartBtn">좋아요순</button>
								<button class="active" onclick="location.href='eventList.do?sortType=new'" id="newBtn">최신순</button>
							</div>
							<!-- 검색창 Search -->
							<form name="frm2" action="eventList.do" method="post">
							<div class="search">
								<select name="searchType" id="sfilterID">
									<option value="total" selected>전체</option>
									<option value="title">제목 검색</option>
									<option value="tag">태그 검색</option>
									<option value="area">지역 검색</option>
									
								</select> 
								<input type="text" name="searchValue" value="${search.searchValue}" placeholder="방방곡곡 주최하는 이벤트에 참여하고 다양한 추억을 쌓아요!">
								<input type="submit" value="검색">
							</div>
							</form>
						</div><!-- .rightbox -->
						
						<!-- rightbox : tablet 사이즈 이하에서만 보이기-->
						
						<c:if test="${login!=null && (login.role=='official' || login.role=='admin')}">
							<div class="docctrl onlytablet" style="margin-top:16px;">
								<a href="<%=request.getContextPath()%>/event/eventWrite.do"><button class="w-100 bluebtn"><i class="fa-solid fa-plus"></i> &nbsp;글쓰기</button></a>
							</div>
						</c:if>
						
						<div class="row rightbox onlytablet">
							<div class="btn-group">
								<button class="w-100 dropdown-toggle pinkbtn" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">카테고리 정렬 &nbsp;</button>
								<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
									<li><a class="dropdown-item" href="eventList.do?sortType=ing">진행중</a></li>
									<li><a class="dropdown-item" href="eventList.do?sortType=will">진행예정</a></li>
									<li><a class="dropdown-item" href="eventList.do?sortType=heart">좋아요순</a></li>
									<li><a class="dropdown-item" href="eventList.do?sortType=new">최신순</a></li>
								</ul>
							</div>
							<!-- 검색창 Search -->
							<form name="frm2" action="eventList.do" method="post">
							<div class="search">
								<select name="searchType" id="sfilterID">
									<option value="total" selected>전체</option>
									<option value="title">제목 검색</option>
									<option value="tag">태그 검색</option>
									<option value="area">지역 검색</option>
									
								</select> 
								<input type="text" name="searchValue" value="${search.searchValue}" placeholder="방방곡곡 주최하는 이벤트에 참여하고 다양한 추억을 쌓아요!">
								<input type="submit" value="검색">
							</div>
							</form>
						</div><!-- .rightbox -->

					</div><!-- .pageinfo -->
					<!-- / pagehead -->
					
					
					<!-- ----------------------------------------------------------------------------------------------------- -->
					
					<!-- 리스트 카드 -->
					<!-- 리스트 카드 hover effect 종류 참고 : https://codepen.io/vavik96/pen/MYdBKz -->
					<div class="clist">
						
						<div class="row grid">
							<!-- C리스트 14. 반복 -->
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							<c:forEach var="v" items="${event}">
							<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
								<a style="cursor:pointer" onclick="location.href='eventView.do?ebidx=${v.ebidx}'">
									<div class="thumbnail hbshadow3">

											<figure class="effect-ming">
												<!-- 메인이미지 보여주기-->
												<c:if test="${v.filename != null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/event/displayFile.do?fileName=${v.filename});"></div>
												</c:if>

												<c:if test="${v.filename == null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:if>

												<!-- 이미지 규격 사이즈 355px * 240px 권장  -->
												<figcaption>
													<p id="eventtag${v.ebidx}"></p>
												</figcaption>
												<!-- 태그 파싱하는 함수 호출 -->
												<script>tagParse('${v.tag}','${v.ebidx}');</script>
											</figure>
											<div class="writerinfo">
												<p>
													<c:choose>
														<c:when test="${(today <= v.endday) && (v.startday <= today)}">
															<span class="cate" style="background: #54ACA8; color: white;">진행중</span>
														</c:when>
														<c:when test="${today < v.startday}">
															<span class="cate" style="background: #85A548; color: white;">진행예정</span>
														</c:when>
														<c:when test="${v.endday < today}">
															<span class="cate" style="background: #DE8889; color: white;">종료</span>
														</c:when>
													</c:choose>
													<span class="hfc-semibold hfc-blackgray"> ${v.startday} ~ ${v.endday}</span>
												</p>
												<div class="small"><img src="<%=request.getContextPath()%>/image/icon/heart.png"><span class="hfc-semibold hfc-darkgray">${v.heart}</span></div>
											</div>
											<div class="caption">
												<h4>&lt;${v.city}&gt; ${v.title}</h4>
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
									<a class="hfc-gray hfc-bold" href="eventList.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
								</c:if>
								<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<c:choose>
								<c:when test="${search.page != null && i == search.page}">
									<a class="hfc-white hfc-bold hbg-pink mx-1" href="eventList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
								</c:when>
								<c:otherwise>
									<a class="hfc-gray hfc-bold mx-1" href="eventList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
								</c:otherwise>
								</c:choose>
								</c:forEach>
								<c:if test="${pm.next == true}">
									<a class="hfc-gray hfc-bold" href="eventList.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
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
		

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
	<script>
		$(function(){
			//부트스트랩 슬라이더
			$("#carousel0").addClass("active");
			for(var i=0;i<3;i++){
				$("#tagArea"+i).text(tagArray[i]);
			}
			
			//검색시 카테고리
			var sfilter = "${search.searchType}";
			if(sfilter != "")
			$("#sfilterID").val(sfilter).prop("selected", true);
			
			//sort 버튼
			var sortBtn = "${search.sortType}";
			if(sortBtn != ""){
				$("#"+sortBtn+"Btn").css("background","none");
				$("#"+sortBtn+"Btn").css("color","#DE8889");
				$("#"+sortBtn+"Btn").css("border","2px solid #DE8889");
			}
		});
	</script>
</body>
</html>

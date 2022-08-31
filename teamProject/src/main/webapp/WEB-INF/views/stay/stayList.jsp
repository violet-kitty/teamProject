<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF숙박정보</title>

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

<script>
	function tagParseto(tag, sidx){
		//리스트 태그 값 넣기
		var json = tag;
		var jsonParse = JSON.parse(json);
		var tagData = "";
		$.each(jsonParse,function(idx){
			tagData = tagData+"<span>"+jsonParse[idx]["value"]+"&nbsp;&nbsp;</span>";
		})
		
		$("#staytag"+sidx).html(tagData);
	}
</script>

<script>
	var tagArray = new Array();
	function tagParse(json,index){
		var jsonParse = JSON.parse(json);
		var tags = "";
		$.each(jsonParse,function(idx){
			tags = tags+"<span>"+jsonParse[idx]["value"]+"&nbsp;&nbsp;</span>";
		})
		tagArray[index] = tags;
	}
</script>

</head>

<body>

	<div id="wrap" class="boardlist stay staylist">
		
		<!-- Header --><%@include file="../Header.jsp"%>
		
		<!-- Side -->
		
		<div class="right-container">
			<c:if test="${login!=null && (login.role=='business' || login.role=='admin')}">
				<div class="docctrl onlypc">
					<a href="<%=request.getContextPath()%>/stay/stayWrite.do"><img src="<%=request.getContextPath()%>/image/button/add.png"></a>
				</div>
			</c:if>
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">

			<!-- hero -->
			<div id="carouselExampleIndicators" class="hero content01 carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators onlypc-flex">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<c:set var="index" value="0" />
					<c:forEach var="i" items="${hero}">
						<div class="carousel-item" id="carousel${index}" data-bs-interval="4000">
							<div class="imgset" style="background-image: url(<%=request.getContextPath() %>/stay/displayFile.do?fileName=${fn:split(i.photo,',')[0]});"></div>
							<div class="carousel-caption d-md-block">
								<div class="captionset">
									<h5 class="hfc-blackgray hfc-bold">
										<span class="onlypc"></span> ${i.name}
									</h5>
									<p class="hfc-pink">${fn:split(i.addr,' ')[0]} ${fn:split(i.addr,' ')[1]}</p>
								    <script>tagParse('${i.tag}',${index});</script>
									<p class="hfc-semibold hfc-darkgray" id="tagArea${index}"></p>
									<a href="stayView.do?sidx=${i.sidx}"><button class="greenbtn hbshadow2">자세히보기</button></a>
								</div>
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
							<a href="<%= request.getContextPath() %>/stay/stayList.do"><h1>숙박정보</h1></a>
						</div>
						
						<!-- rightbox : tablet 사이즈 이하에서 숨기기 -->
						<div class="row rightbox onlypc-inline">
							<!-- sort 버튼 -->
							<div class="col d-flex justify-content-end filterbtn">
								<!-- searchVO에 sortType food, stay, travel, heart, new 넘김 -->
								<!-- <ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item active"><a class="nav-link" onclick="location.href='stayList.do?sortType=food'">맛집추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='stayList.do?sortType=stay'">숙박추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='stayList.do?sortType=travel'">여행지추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='stayList.do?sortType=heart'">좋아요순</a></li>
									<li class="nav-item"><a class="nav-link active" onclick="location.href='stayList.do?sortType=new'">최신순</a></li>
								</ul> -->
								<!-- searchVO에 sortType max, min, heart, star 넘김 -->
								<button onclick="location.href='stayList.do?sortType=max'">높은가격순</button>
								<button onclick="location.href='stayList.do?sortType=min'">낮은가격순</button>
								<button onclick="location.href='stayList.do?sortType=heart'">좋아요순</button>
								<button onclick="location.href='stayList.do?sortType=star'">별점순</button>
							</div>
							<!-- 검색창 -->
							<form name="frm2" action="stayList.do" method="post">
							<div class="search">
								<select name="searchType" id="searchType">
									<option value="total" selected>전체</option>
									<option value="name">이름 검색</option>
									<option value="area">지역 검색</option>
									<option value="tag">태그 검색</option>
								</select> 
								<input type="text" name="searchValue" value="${search.searchValue}" placeholder="방방곡곡 주최하는 이벤트에 참여하고 다양한 추억을 쌓아요!">
								<input type="submit" value="검색">
							</div>
							</form>
						</div><!-- .rightbox -->
						
						<!-- rightbox : tablet 사이즈 이하에서만 보이기-->
						
						<c:if test="${login!=null && (login.role=='business' || login.role=='admin')}">
							<div class="docctrl onlytablet" style="margin-top:16px;">
								<a href="<%=request.getContextPath()%>/stay/stayWrite.do"><button class="w-100 bluebtn"><i class="fa-solid fa-plus"></i> &nbsp;글쓰기</button></a>
							</div>
						</c:if>
						
						<div class="row rightbox onlytablet">
							<div class="btn-group">
								<button class="w-100 dropdown-toggle pinkbtn" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">카테고리 정렬 &nbsp;</button>
								<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
									<li><a class="dropdown-item" href="stayList.do?sortType=max">높은가격순</a></li>
									<li><a class="dropdown-item" href="stayList.do?sortType=min">낮은가격순</a></li>
									<li><a class="dropdown-item" href="stayList.do?sortType=heart">좋아요순</a></li>
									<li><a class="dropdown-item" href="stayList.do?sortType=star">별점순</a></li>
								</ul>
							</div>
							<!-- 검색창 -->
							<form name="frm2" action="stayList.do" method="post">
							<div class="search">
								<select name="searchType" id="sfilterID">
									<option value="total" selected>전체</option>
									<option value="name">이름 검색</option>
									<option value="area">지역 검색</option>
									<option value="tag">태그 검색</option>
								</select> 
								<input type="text" name="searchValue" value="${search.searchValue}" placeholder="방방곡곡 주최하는 이벤트에 참여하고 다양한 추억을 쌓아요!">
								<input type="submit" value="검색">
							</div>
							</form>
						</div><!-- .rightbox -->

					</div><!-- .pageinfo -->
					<!-- / pagehead -->
					
					
					<!-- ----------------------------------------------------------------------------------------------------- -->

					<div class="row">
						<!-- 사이드 필터 ----------------------------------------------------->
						<div class="col-4 bd-sidebar hbshadow2">
							<form action="stayList.do" method="get" id="filterFrm">
								<div class="sfilter">
									<h3 class="hfc-semibold hfc-blackgray">필터검색</h3>
									<h4 class="hfc-medium hfc-darkgray">인원</h4>
									<div class="people">
										<button type="button" class="hfc-semibold hfc-darkgray" id="peopleMinus">-</button>
										<input type="text" class="hfc-blue hfc-bold" name="filter.people" id="people" value="1" size="1" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');">
										<button type="button" class="hfc-semibold hfc-darkgray" id="peoplePlus">+</button>
									</div>
									<br>
									<h4 class="pricet hfc-medium hfc-darkgray">가격</h4>
									<div class="price">
										<input type="text" name="filter.min" id="minPrice" value="10,000" class="priceholder hfc-darkgray col-5" oninput="this.value = this.value.replace(/[^,0-9.]/g,'').replace(/(\..*)\./g,'$1');">&nbsp;~&nbsp;
										<input type="text" name="filter.max" id="maxPrice" value="10,000" class="priceholder hfc-darkgray col-5" oninput="this.value = this.value.replace(/[^,0-9.]/g,'').replace(/(\..*)\./g,'$1');">
									</div>
									<br>
									<h4 class="optiont hfc-medium hfc-darkgray">옵션</h4>
									<div class="checkoption">
										<table>
											<tr>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag1" value="싱글베드"> <label class="form-check-label" for="tag1">싱글베드</label>
													</div></td>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag2" value="더블베드"> <label class="form-check-label" for="tag2">더블베드</label>
													</div></td>
											</tr>
											<tr>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag3" value="퀸베드"> <label class="form-check-label" for="tag3">퀸베드</label>
													</div></td>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag4" value="킹베드"> <label class="form-check-label" for="tag4">킹베드</label>
													</div></td>
											</tr>
											<tr>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag5" value="원룸"> <label class="form-check-label" for="tag5">원룸</label>
													</div></td>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag6" value="분리형원룸"> <label class="form-check-label" for="tag6">분리형원룸</label>
													</div></td>
											</tr>
											<tr>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag7" value="투룸"> <label class="form-check-label" for="tag7">투룸</label>
													</div></td>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag8" value="쓰리룸"> <label class="form-check-label" for="tag8">쓰리룸</label>
													</div></td>
											</tr>
											<tr>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag9" value="포룸"> <label class="form-check-label" for="tag9">포룸</label>
													</div></td>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag10" value="방5개이상"> <label class="form-check-label" for="tag10">방5개이상</label>
													</div></td>
											</tr>
											<tr>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag11" value="주방/식당"> <label class="form-check-label" for="tag11">주방/식당</label>
													</div></td>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag12" value="욕실"> <label class="form-check-label" for="tag12">욕실</label>
													</div></td>
											</tr>
											<tr>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag13" value="욕조"> <label class="form-check-label" for="tag13">욕조</label>
													</div></td>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag14" value="욕실용품"> <label class="form-check-label" for="tag14">욕실용품</label>
													</div></td>
											</tr>
											<tr>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag15" value="드라이기"> <label class="form-check-label" for="tag15">드라이기</label>
													</div></td>
												<td><div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox" name="filter.option" id="tag16" value="에어컨"> <label class="form-check-label" for="tag16">에어컨</label>
													</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag17" value="전자렌지"> <label class="form-check-label" for="tag17">전자렌지</label>
									</div></td>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag18" value="밥솥"> <label class="form-check-label" for="tag18">밥솥</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag19" value="세탁기"> <label class="form-check-label" for="tag19">세탁기</label>
									</div></td>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag20" value="건조기"> <label class="form-check-label" for="tag20">건조기</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag21" value="반려동물가능"> <label class="form-check-label" for="tag21">반려동물가능</label>
									</div></td>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag22" value="주차장"> <label class="form-check-label" for="tag22">주차장</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag23" value="와이파이"> <label class="form-check-label" for="tag23">와이파이</label>
									</div></td>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag24" value="무료주차장"> <label class="form-check-label" for="tag24">무료주차장</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag25" value="BBQ"> <label class="form-check-label" for="tag25">BBQ</label>
									</div></td>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag26" value="라운지"> <label class="form-check-label" for="tag26">라운지</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag27" value="엘레베이터"> <label class="form-check-label" for="tag27">엘레베이터</label>
									</div></td>
									<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag28" value="수영장"> <label class="form-check-label" for="tag28">수영장</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag29" value="편의점"> <label class="form-check-label" for="tag29">편의점</label>
									</div></td>
									<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag30" value="커피숍"> <label class="form-check-label" for="tag30">커피숍</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag31" value="골프장"> <label class="form-check-label" for="tag31">골프장</label>
									</div></td>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag32" value="족구장"> <label class="form-check-label" for="tag32">족구장</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag33" value="농구장"> <label class="form-check-label" for="tag33">농구장</label>
									</div></td>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag34" value="실내낚시터"> <label class="form-check-label" for="tag34">실내낚시터</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag35" value="산책로"> <label class="form-check-label" for="tag35">산책로</label>
									</div></td>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag36" value="익스트림체험장"> <label class="form-check-label" for="tag36">익스트림체험장</label>
									</div></td>
											</tr>
											<tr>
											<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag27" value="세차장"> <label class="form-check-label" for="tag27">세차장</label>
									</div></td>
									<td><div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="filter.option" id="tag28" value="키드존"> <label class="form-check-label" for="tag28">키드존</label>
									</div></td>
											</tr>
											
										</table>
									</div>

									

									<button class="w-100 greenbtn" onclick="filterFn()">필터 적용하기</button>
								</div>
								<!-- /필터 div -->
							</form>
							<br>
						</div>
						<!-- /bd-sidebar -->
						<!-- ----------------------------------------------------->

						<!-- 리스트 카드 -->
						<!-- 리스트 카드 hover effect 종류 참고 : https://codepen.io/vavik96/pen/MYdBKz -->
						<div class="col-8 clist">

							<div class="row grid">
								<!-- C리스트 14. 반복 -->
								<c:forEach var="v" items="${stay}">
									<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-6">
										<a style="cursor: pointer" onclick="location.href='stayView.do?sidx=${v.sidx}'">
											<div class="thumbnail hbshadow3">

												<figure class="effect-ming">
													<!-- 메인이미지 보여주기-->
													<c:if test="${v.photo != null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/stay/displayFile.do?fileName=${fn:split(v.photo,',')[0]});"></div>
													</c:if>

													<c:if test="${v.photo == null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
													</c:if>
													
													<figcaption>
														<p id="staytag${v.sidx}"></p>
													</figcaption>
													<!-- 태그 파싱하는 함수 호출 -->
												<script>tagParseto('${v.tag}','${v.sidx}');</script>
												
												</figure>
												<div class="banding">
													<p class="hfc-pink hfc-bold">${fn:split(v.addr,' ')[0]} ${fn:split(v.addr,' ')[1]}</p>
													<div class="small score">
														<img src="<%=request.getContextPath()%>/image/icon/star.png"><span class="hfc-semibold hfc-darkgray">${v.star}</span>&nbsp;&nbsp;
														<img src="<%=request.getContextPath()%>/image/icon/heart.png"><span class="hfc-semibold hfc-darkgray">${v.heart}</span>
													</div>
													<h4 class="hfc-bold hfc-blackgray">${v.name}</h4>
													<p class="priceinfo hfc-medium hfc-darkgray">${v.min}~ ${v.max}</p>
												</div>
													
											</div>
											<!-- /.thumbnail -->
										</a>
									</div>
									<!--/. thumbnailitem -->
								</c:forEach>
							</div>
							<!--/row-->

							<!-- C페이징 01 : 페이징 paging 공간 만들기 -->
							<div class="row pagenation">
								<div class="col d-flex justify-content-center">
									<c:if test="${pm.prev == true}">
										<a class="hfc-gray hfc-bold" href="stayList.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
									</c:if>
									<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
										<c:choose>
											<c:when test="${search.page != null && i == search.page}">
												<a class="hfc-white hfc-bold hbg-pink mx-1" href="stayList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
											</c:when>
											<c:otherwise>
												<a class="hfc-gray hfc-bold mx-1" href="stayList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pm.next == true}">
										<a class="hfc-gray hfc-bold" href="stayList.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
									</c:if>
								</div>
							</div>
							<!-- /페이징 -->

						</div>
						<!-- /.clist -->


					</div><!-- /.row -->
					
					<!-- ----------------------------------------------------------------------------------------------------- -->
					
	
			    </div><!-- /.container -->
		    </div>
			<!-- / .pagehead -->
			

			<!-- banner --><%@include file="../banner.jsp"%>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
	
	<script>
	$("#minPrice").on("propertychange change keyup paste input",function(){
		var min = $("#minPrice");
		min.val(min.val().replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g,','));
	});
	$("#maxPrice").on("propertychange change keyup paste input",function(){
		var max = $("#maxPrice");
		max.val(max.val().replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g,','));
	});
	
	$("#peopleMinus").on("click", function(){
		if($("#people").val()==1){
			$("#people").val("1");
		}
		else {
			$("#people").val(Number($("#people").val())-1);
		}
	});
	
	$("#peoplePlus").on("click", function(){
		$("#people").val(Number($("#people").val())+1);
	});
	
	function filterFn(){
		$("#maxPrice").val($("#maxPrice").val().replaceAll(',',''));
		$("#minPrice").val($("#minPrice").val().replaceAll(',',''));
		$("#filterFrm").submit();
	}
	
	$(function(){
		$("#carousel0").addClass("active");
		for(var i=0;i<3;i++){
			$("#tagArea"+i).html(tagArray[i]);
		}
		
		if(${search.filter.people != null}){
			$("#people").val("${search.filter.people}");
			var minPrice = "${search.filter.min}";
			
			$("#minPrice").val("${search.filter.min}");
			$("#maxPrice").val("${search.filter.max}");
			
			<c:forEach var="i" items="${search.filter.option}">
			$("input[name='filter.option'][value='${i}']").prop("checked",true);
			</c:forEach>
		}
	});
</script>

</body>
</html>
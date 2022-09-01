<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF여행이야기</title>

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
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
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
	function tagParse(tag, sbidx){
		//리스트 태그 값 넣기
		var json = tag;
		var jsonParse = JSON.parse(json);
		var tagData = "";
		$.each(jsonParse,function(idx){
			tagData = tagData+"<span>"+jsonParse[idx]["value"]+"&nbsp;&nbsp;</span>";
		})
		
		$("#storytag"+sbidx).html(tagData);
	}
</script>

<body>

	<div id="wrap" class="boardlist story storylist">

		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>

		<!-- Side -->
		<div class="right-container">
			<c:if test="${login!=null && login.role=='normal'}">
				<div class="docctrl onlypc">
					<a href="<%=request.getContextPath()%>/story/storyWrite.do"><img src="<%=request.getContextPath()%>/image/button/add.png"></a>
				</div>
			</c:if>
			<a href="#"><img src="<%=request.getContextPath()%>/image/button/top.png" class="gotop"></a>
		</div>

		<!-- container -->
		<div id="container" class="hbg-whitegray">

			<!-- 리스트 content -->
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">

					<!-- pagehead -->
					<div class="pageinfo">
						<!-- 페이지 제목 -->
						<div class="title onlypc">
							<a href="<%=request.getContextPath()%>/story/storyList.do"><h1>여행이야기</h1></a>
						</div>

						<!-- rightbox : tablet 사이즈 이하에서 숨기기 -->
						<div class="row rightbox onlypc-inline">
							<!-- sort 버튼 -->
							<div class="col d-flex justify-content-end filterbtn">
								<!-- searchVO에 sortType food, stay, travel, heart, new 넘김 -->
								<!-- <ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item active"><a class="nav-link" onclick="location.href='storyList.do?sortType=food'">맛집추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='storyList.do?sortType=stay'">숙박추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='storyList.do?sortType=travel'">여행지추천</a></li>
									<li class="nav-item"><a class="nav-link" onclick="location.href='storyList.do?sortType=heart'">좋아요순</a></li>
									<li class="nav-item"><a class="nav-link active" onclick="location.href='storyList.do?sortType=new'">최신순</a></li>
								</ul> -->
								<!-- searchVO에 sortType food, stay, travel, heart, new 넘김 -->
								<button onclick="location.href='storyList.do?sortType=heart'" id="heartBtn">좋아요순</button>
								<button class="active" onclick="location.href='storyList.do?sortType=new'" id="newBtn">최신순</button>
							</div>
							<!-- 검색창 Search -->
							<form name="frm2" action="storyList.do" method="post">
							<div class="search">
								<select name="searchType" id="sfilterID">
									<option value="total" selected>전체</option>
									<option value="title">제목 검색</option>
									<option value="tag">태그 검색</option>
									<option value="writer">작성자 검색</option>
									
								</select> 
								<input type="text" name="searchValue" value="${search.searchValue}" placeholder="검색어를 입력해 주세요">
								<input type="submit" value="검색">
							</div>
							</form>
						</div>
						<!-- .rightbox -->

						<!-- rightbox : tablet 사이즈 이하에서만 보이기-->

						<c:if test="${login!=null && login.role=='normal'}">
							<div class="docctrl onlytablet" style="margin-top: 16px;">
								<a href="<%=request.getContextPath()%>/story/storyWrite.do">
									<button class="w-100 bluebtn"><i class="fa-solid fa-plus"></i> &nbsp;글쓰기</button>
								</a>
							</div>
						</c:if>

						<div class="row rightbox onlytablet">
							<div class="btn-group">
								<button class="w-100 dropdown-toggle pinkbtn" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">카테고리 정렬 &nbsp;</button>
								<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
									<li><a class="dropdown-item" href="storyList.do?sortType=new">최신순</a></li>
									<li><a class="dropdown-item" href="storyList.do?sortType=heart">좋아요순</a></li>
								</ul>
							</div>
							<!-- 검색창 -->
							<form name="frm2" action="storyList.do" method="post">
							<div class="search">
								<select name="searchType"id="sfilterID">
									<option value="total" selected>전체</option>
									<option value="title">제목 검색</option>
									<option value="tag">태그 검색</option>
									<option value="writer">작성자 검색</option>
									
								</select> 
								<input type="text" name="searchValue" value="${search.searchValue}" placeholder="검색어를 입력해 주세요">
								<input type="submit" value="검색">
							</div>
							</form>
						</div>
						<!-- .rightbox -->

					</div>
					<!-- .pageinfo -->
					<!-- / pagehead -->


					<!-- ----------------------------------------------------------------------------------------------------- -->

					<!-- 리스트 -->
					<div class="clist">

						<!-- 리스트 카드 -->
						<div class="row grid">
							<c:forEach var="s" items="${story}"> <!-- 8. 변수명 정해주기 -->
								<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
									<a style="cursor: pointer" onclick="location.href='storyView.do?sbidx=${s.sbidx}'">
										<div class="thumbnail hbshadow3">

											<figure class="effect-ming">
												<!-- 메인이미지 보여주기-->
												<c:if test="${s.filename != null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/story/displayFile.do?fileName=${s.filename});"></div>
												</c:if>

												<c:if test="${s.filename == null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:if>

												<!-- 이미지 규격 사이즈 355px * 240px 권장  -->
												<figcaption>
													<p id="storytag${s.sbidx}"></p>
												</figcaption>
												<!-- 태그 파싱하는 함수 호출 -->
												<script>tagParse('${s.tag}','${s.sbidx}');</script>
											</figure>
											<div class="writerinfo">
												<c:if test="${s.img != null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/story/displayFile.do?fileName=${s.img});"></div>
												</c:if>
												<c:if test="${s.img == null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:if>
												
												<p>
													<span class="hfc-darkgray">${s.nickname} </span>
													<span class="hfc-semibold hfc-gray"> | ${s.wdate}</span>
												</p>
												<div class="small">
													<img src="<%=request.getContextPath()%>/image/icon/heart.png"><span class="hfc-semibold hfc-darkgray">${s.heart}</span>
												</div>
											</div>
											<div class="caption">
												<h4>${s.title}</h4>
											</div>
										</div>
										<!-- /.thumbnail -->
									</a>
								</div>
								<!--/. thumbnailitem -->
							</c:forEach>
						</div>
						<!-- /.row .grid -->
						<!-- / 리스트 카드 -->

						<!-- 페이징 : 페이징 paging 공간 만들기 -->
						<div class="row pagenation">
							<div class="col d-flex justify-content-center">
								<c:if test="${pm.prev == true}">
									<a class="hfc-gray hfc-bold" href="storyList.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
								</c:if>
								<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
									<c:choose>
										<c:when test="${search.page != null && i == search.page}">
											<a class="hfc-white hfc-bold hbg-pink mx-1" href="storyList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
										</c:when>
										<c:otherwise>
											<a class="hfc-gray hfc-bold mx-1" href="storyList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pm.next == true}">
									<a class="hfc-gray hfc-bold" href="storyList.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
								</c:if>
							</div>
						</div>
						<!-- /페이징 -->

					</div>
					<!-- /.clist -->
					<!-- / 리스트 -->

					<!-- ----------------------------------------------------------------------------------------------------- -->


				</div>
				<!-- /.container -->
			</div>
			<!-- /.contents -->
			<!-- / 리스트 content -->


			<!-- banner --><%@include file="../banner.jsp"%>

		</div>
		<!-- / #container -->

		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div>
	<!-- /#wrap -->

	<script>
		//검색시 카테고리
		var sfilter = "${search.searchType}";
		if (sfilter != "")
		$("#sfilterID").val(sfilter).prop("selected", true);
		
		//sort 버튼
		var sortBtn = "${search.sortType}";
		if(sortBtn != ""){
			$("#"+sortBtn+"Btn").css("background","none");
			$("#"+sortBtn+"Btn").css("color","#DE8889");
			$("#"+sortBtn+"Btn").css("border","2px solid #DE8889");
		}
	</script>

</body>
</html>
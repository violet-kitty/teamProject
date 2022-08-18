<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardList.css">

<script>
	function tagParse(tag, bidx){
		//리스트 태그 값 넣기
		var json = tag;
		var jsonParse = JSON.parse(json);
		var tagData = "";
		$.each(jsonParse,function(idx){
			tagData = tagData+jsonParse[idx]["value"]+"<span>&nbsp;&nbsp;</span>";
		})
		
		$("#tag"+bidx).html(tagData);
	}
</script>

</head>

<body>

	<div id="wrap" class="boardlist howf howflist">
		
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Side -->
		
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">
			
			<!-- pagehead  -->
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
				
					<!-- pagehead -->
					<div class="pageinfo">
						<!-- 페이지 제목 -->
						<div class="title">
							<a href="<%= request.getContextPath() %>/mypage/myStay.do"><h1>내 숙소</h1></a>
						</div>
						
						<!-- rightbox : tablet 사이즈 이하에서 숨기기 -->
						<div class="row rightbox onlypc-inline">
							<!-- sort 버튼 -->
							<div class="col d-flex justify-content-end filterbtn">
								<button onclick="location.href='myStay.do?sortType=name'" id="nameBtn">이름순</button>
								<button onclick="location.href='myStay.do?sortType=heart'" id="heartBtn">좋아요순</button>
								<button onclick="location.href='myStay.do?sortType=star'" id="starBtn">별점순</button>
							</div>
							<!-- 검색창 -->
							<form name="frm2" action="myStay.do" method="post">
							<div class="search">
								<select name="searchType" id="sfilterID">
									<option value="total" selected>전체</option>
									<option value="name">이름 검색</option>
									<option value="area">지역 검색</option>
									
								</select> 
								<input type="text" name="searchValue" value="${search.searchValue}">
								<input type="submit" value="검색">
							</div>
							</form>
						</div><!-- .rightbox -->
						
						<!-- rightbox : tablet 사이즈 이하에서만 보이기-->
						
						<div class="row rightbox onlytablet">
							<div class="btn-group">
								<button class="w-100 dropdown-toggle pinkbtn" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">카테고리 정렬 &nbsp;</button>
								<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
									<li><a class="dropdown-item" href="myStay.do?sortType=name">이름순</a></li>
									<li><a class="dropdown-item" href="myStay.do?sortType=heart">좋아요순</a></li>
									<li><a class="dropdown-item" href="myStay.do?sortType=star">별점순</a></li>
								</ul>
							</div>
							<!-- 검색창 -->
							<form name="frm2" action="myStay.do" method="post">
							<div class="search">
								<select name="searchType" id="sfilterID">
									<option value="total" selected>전체</option>
									<option value="name">이름 검색</option>
									<option value="area">지역 검색</option>
									
								</select> 
								<input type="text" name="searchValue" value="${search.searchValue}">
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
							<c:forEach var="v" items="${stay}">
							<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
								<a style="cursor:pointer" onclick="location.href='<%= request.getContextPath() %>/stay/stayView.do?sidx=${v.sidx}'">
									<div class="thumbnail hbshadow3">

											<figure class="effect-ming">
												<!-- 메인이미지 보여주기-->
												<c:if test="${v.photo != null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/howf/displayFile.do?fileName=${fn:split(v.photo,',')[0]});"></div>
												</c:if>

												<c:if test="${v.photo == null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:if>

												<!-- 이미지 규격 사이즈 355px * 240px 권장  -->
												<figcaption>
													<p id="tag${v.sidx}"></p>
												</figcaption>
												<!-- 태그 파싱하는 함수 호출 -->
												<script>tagParse('${v.tag}','${v.sidx}');</script>
											</figure>
											<div class="writerinfo">
												<div class="small"><img src="<%=request.getContextPath()%>/image/icon/heart.png"><span class="hfc-semibold hfc-darkgray">${v.heart}</span></div>
												<div class="small"><img src="<%=request.getContextPath()%>/image/icon/star.png"><span class="hfc-semibold hfc-darkgray">${v.star}</span></div>
											</div>
											<div class="caption">
												<h4>${v.name}</h4>
												<p>${v.addr} ${v.detailaddr}</p>
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
									<a class="hfc-gray hfc-bold" href="myStay.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
								</c:if>
								<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<c:choose>
								<c:when test="${search.page != null && i == search.page}">
									<a class="hfc-white hfc-bold hbg-pink mx-1" href="myStay.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
								</c:when>
								<c:otherwise>
									<a class="hfc-gray hfc-bold mx-1" href="myStay.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
								</c:otherwise>
								</c:choose>
								</c:forEach>
								<c:if test="${pm.next == true}">
									<a class="hfc-gray hfc-bold" href="myStay.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
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
			

			<!-- banner --><%@include file="/WEB-INF/views/banner.jsp"%>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
	<script>
		$(function(){
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
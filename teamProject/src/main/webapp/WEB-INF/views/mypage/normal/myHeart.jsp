<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF마이페이지</title>

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
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardList.css">
<!-- CSS3 - Mypage --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage.css">
<style>
	.tabby button{
		border:none;
		background:none;
		padding:12px;
		font-size:1.2em;
	}
</style>
</head>
<body>
	<div id="wrap" class="boardlist">
		
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
				
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>찜목록</h1>
						</div>
					</div>
					
					<!-- 게시판 별 탭 -->
					<div class="row tabby">
						<div class="col">
							<button id="howfTab" onclick="location.href='myHeart.do?type=howf'">HOWF추천</button>
							<button id="storyTab" onclick="location.href='myHeart.do?type=story'">여행이야기</button>
							<button id="eventTab" onclick="location.href='myHeart.do?type=event'">지역이벤트</button>
							<button id="stayTab" onclick="location.href='myHeart.do?type=stay'">숙박정보</button>
						</div>
					</div>
					
					<div class="clist">
					
					<!-- 찜목록 보여주기 -->
					
					<c:if test="${tabType == 'howf'}">
					<div id="howfArea">
						<c:choose>
						<c:when test="${empty list}">
						<p>찜 목록이 비었습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="v" items="${list}">
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-lg-4" onclick="movePage('${v.bidx}')" style="cursor:pointer;">
											<img src="<%= request.getContextPath() %>/mypage/displayFile.do?fileName=${v.filename}" class="card-img">
										</div>
										<div class="col-lg-8" onclick="movePage('${v.bidx}')" style="cursor:pointer;">
											<div class="card-body">
												<h5 class="card-title">${v.title}</h5>
												<p class="card-text">${v.nickname}</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
					</c:if>
					
					<c:if test="${tabType == 'story'}">
					<div id="storyArea">
						<c:choose>
						<c:when test="${empty list}">
						<p>찜 목록이 비었습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="v" items="${list}">
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-lg-4" onclick="movePage('${v.bidx}')" style="cursor:pointer;">
											<img src="<%= request.getContextPath() %>/mypage/displayFile.do?fileName=${v.filename}" class="card-img">
										</div>
										<div class="col-lg-8" onclick="movePage('${v.bidx}')" style="cursor:pointer;">
											<div class="card-body">
												<h5 class="card-title">${v.title}</h5>
												<p class="card-text">${v.nickname}</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
					</c:if>
					
					<c:if test="${tabType == 'event'}">
					<div id="eventArea">
						<c:choose>
						<c:when test="${empty list}">
						<p>찜 목록이 비었습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="v" items="${list}">
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-lg-4" onclick="movePage('${v.bidx}')" style="cursor:pointer;">
											<img src="<%= request.getContextPath() %>/mypage/displayFile.do?fileName=${v.filename}" class="card-img">
										</div>
										<div class="col-lg-8" onclick="movePage('${v.bidx}')" style="cursor:pointer;">
											<div class="card-body">
												<h5 class="card-title">${v.title}</h5>
												<p class="card-text">${v.nickname}</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
					</c:if>
					
					<c:if test="${tabType == 'stay'}">
					<div id="stayArea">
						<c:choose>
						<c:when test="${empty stay}">
						<p>찜 목록이 비었습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="v" items="${stay}">
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-lg-4" onclick="movePage('${v.bidx}')" style="cursor:pointer;">
											<img src="<%= request.getContextPath() %>/mypage/displayFile.do?fileName=${fn:split(v.filename,',')[0]}" class="card-img">
										</div>
										<div class="col-lg-8" onclick="movePage('${v.bidx}')" style="cursor:pointer;">
											<div class="card-body">
												<h5 class="card-title">${v.name}</h5>
												<p class="card-text">${v.min} ~ ${v.max}</p>
												<p class="card-text">${v.addr}</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
					</c:if>
					
					
					<!-- C페이징 01 : 페이징 paging 공간 만들기 -->
					<div class="row pagenation">
						<div class="col d-flex justify-content-center">
							<c:if test="${pm.prev == true}">
								<a class="hfc-gray hfc-bold" href="myHeart.do?page=${pm.startPage-1}&type=${tabType}">◀</a>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
							<c:choose>
							<c:when test="${search.page != null && i == search.page}">
								<a class="hfc-white hfc-bold hbg-pink mx-1" href="myHeart.do?page=${i}&type=${tabType}">${i}</a>
							</c:when>
							<c:otherwise>
								<a class="hfc-gray hfc-bold mx-1" href="myHeart.do?page=${i}&type=${tabType}">${i}</a>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							<c:if test="${pm.next == true}">
								<a class="hfc-gray hfc-bold" href="myHeart.do?page=${pm.endPage+1}&type=${tabType}">▶</a>
							</c:if>
						</div>
					</div>
					<!-- /페이징 -->
					
					</div><!-- clist -->
				
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
	
<script>
	//탭 설정
	var tabType = "${tabType}";
	
	if(tabType == "howf"){
		$("#howfTab").css("color","#D43654");
		$("#howfTab").css("border-bottom","4px solid #D43654");
	}
	else if(tabType == "event"){
		$("#eventTab").css("color","#D43654");
		$("#eventTab").css("border-bottom","4px solid #D43654");
	}
	else if(tabType == "story"){
		$("#storyTab").css("color","#D43654");
		$("#storyTab").css("border-bottom","4px solid #D43654");
	}
	else if(tabType == "stay"){
		$("#stayTab").css("color","#D43654");
		$("#stayTab").css("border-bottom","4px solid #D43654");
	}
	
	
	function movePage(bidx){
		if(tabType == "howf") location.href="<%= request.getContextPath() %>/howf/howfView.do?hbidx="+bidx;
		else if(tabType == "event") location.href="<%= request.getContextPath() %>/event/eventView.do?ebidx="+bidx;
		else if(tabType == "story") location.href="<%= request.getContextPath() %>/story/storyView.do?sbidx="+bidx;
		else if(tabType == "stay") location.href="<%= request.getContextPath() %>/stay/stayView.do?sidx="+bidx;
	}
</script>	
</body>
</html>
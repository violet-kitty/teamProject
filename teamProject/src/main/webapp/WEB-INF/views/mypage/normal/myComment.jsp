<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>페이지 제목</title>

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
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
</head>
<body>
	<div id="wrap">
		
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
				
					<!-- 페이지 제목 -->
					<div class="title">
						<h1>내 리뷰, 댓글</h1>
					</div>
					
					
					<!-- 게시판 별 탭 -->
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active" id="reviewTab" aria-current="page" href="javascript:tabChange('review')">리뷰</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="commentTab" aria-current="page" href="javascript:tabChange('comment')">댓글</a>
						</li>
					</ul>
					
					
					<!-- 내 리뷰, 댓글 목록 보여주기 -->
					<!-- 리뷰 -->
					<div id="reviewArea">
						<c:choose>
						<c:when test="${empty review}">
						<p>작성한 리뷰가 없습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="v" items="${review}">
								<div class="card mb-3">
									<div class="row g-0">
										<c:choose>
										<c:when test="${v.photo != null}">
											<div class="col-lg-4" onclick="movePage('review','${v.bidx}')" style="cursor:pointer;">
												<img src="<%= request.getContextPath() %>/mypage/displayFile.do?fileName=${v.photo}" style="width:100%;height:100%;">
											</div>
											<div class="col-lg-8" onclick="movePage('review','${v.bidx}')" style="cursor:pointer;">
												<div class="card-body">
													<h5 class="card-title">${v.name}</h5>
													<p class="card-text">
														<img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">
														${v.star}
													</p>
													<p class="card-text">${v.content}</p>
													<p class="card-text">${v.wdate} 작성</p>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-lg-12" onclick="movePage('review','${v.bidx}')" style="cursor:pointer;">
												<div class="card-body">
													<h5 class="card-title">${v.name}</h5>
													<p class="card-text">
														<img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">
														${v.star}
													</p>
													<p class="card-text">${v.content}</p>
													<p class="card-text">${v.wdate} 작성</p>
												</div>
											</div>
										</c:otherwise>
										</c:choose>
										
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
						
						
						<!-- 리뷰 페이징 -->
						<!-- C페이징 01 : 페이징 paging 공간 만들기 -->
						<div class="row pagenation">
							<div class="col d-flex justify-content-center" id="pagingArea">
								<c:if test="${pm.prev == true}">
									<a class="hfc-gray hfc-bold" href="myComment.do?page=${pm.startPage-1}">◀</a>
								</c:if>
								<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<c:choose>
								<c:when test="${search.page != null && i == search.page}">
									<a class="hfc-white hfc-bold hbg-pink mx-1" href="myComment.do?page=${i}">${i}</a>
								</c:when>
								<c:otherwise>
									<a class="hfc-gray hfc-bold mx-1" href="myComment.do?page=${i}">${i}</a>
								</c:otherwise>
								</c:choose>
								</c:forEach>
								<c:if test="${pm.next == true}">
									<a class="hfc-gray hfc-bold" href="myComment.do?page=${pm.endPage+1}">▶</a>
								</c:if>
							</div>
						</div>
						<!-- /페이징 -->
						
					</div>
					
					<!-- 댓글 -->
					<div id="commentArea" style="display:none;">
						<c:choose>
						<c:when test="${empty comment}">
						<p>작성한 댓글이 없습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="v" items="${comment}">
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col" onclick="movePage('comment','${v.bidx}')" style="cursor:pointer;">
											<div class="card-body">
												<h5 class="card-title">글 제목</h5>
												<p class="card-text">${v.content}</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
						
						<!-- 댓글 페이징 -->
						
						
						
					</div>
				
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
			

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	

<script>
	//탭 변경
	function tabChange(type){
		if(type == 'review'){
			$("#reviewArea").show();
			$("#commentArea").hide();
			$("#reviewTab").addClass("active");
			$("#commentTab").removeClass("active");
		}
		else if(type == 'comment'){
			$("#reviewArea").hide();
			$("#commentArea").show();
			$("#reviewTab").removeClass("active");
			$("#commentTab").addClass("active");
		}
	}
	
	//click 페이지 이동
	function movePage(type, bidx){
		if(type == 'review'){
			location.href='<%= request.getContextPath() %>/stay/stayView.do?sidx='+bidx;
		}
		else if(type == 'comment'){
			
		}
	}
	
	//페이지 이동
	function reviewPaging(index){
		$("#page").val(index);
		reviewListAjax(index);
	}
	
	//페이징
	function paging(){
		$.ajax({
			url:"reviewPaging.do",
			success:function(paging){
				
			}
		});
	}
	
	//리뷰 그리기
	function reviewListAjax(page){
		
	}
	
	//댓글 그리기
	
	
</script>	
	
	
</body>
</html>
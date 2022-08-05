<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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

</head>
<body>
	<div id="wrap">
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- contents 02 -->
			<style>
			.feature {text-align:center;}
			.feature img {margin:auto; margin-bottom:40px;}
			.feature p {margin-bottom: 56px;}
			.feature h2 {margin-bottom:24px;}
			.title {border-bottom:2px solid #CFCFCF; padding-bottom:16px;display: inline; margin-bottom:70px;
    width: auto;}
.title h1 {font: normal normal 32px/42px Noto Sans; font-weight:600; color:#3D3D3D;display: inline;
    width: auto;}
			</style>
			
			<div class="contents lbg-lightestgray">
				<div class="container lbg-lightestgray" id="featured-3" style="text-align:center;">
					<!-- 페이지 제목 -->
						<div class="title">
							<h1>마이페이지</h1>
						</div>
					<div class="row g-4 py-5 row-cols-1 row-cols-lg-3" style="margin-top: 15px;">
						<div class="feature col">
							<img src="<%= request.getContextPath() %>/image/heart.png" style="width:56px;">
							<a class="mainbtn" href="myInfo.do">내 정보</a>
						</div>
						<div class="feature col">
							<img src="<%= request.getContextPath() %>/image/heart.png" style="width:56px;">
							<a class="mainbtn" href="myStory.do">내 여행이야기 관리</a>
						</div>
						<div class="feature col">
							<img src="<%= request.getContextPath() %>/image/heart.png" style="width:56px;">
							<a class="mainbtn" href="myHeart.do">내 찜 목록</a>
						</div>
						<div class="feature col">
							<img src="<%= request.getContextPath() %>/image/heart.png" style="width:56px;">
							<a class="mainbtn" href="myReservation.do">예약한 숙소</a>
						</div>
						<div class="feature col">
							<img src="<%= request.getContextPath() %>/image/heart.png" style="width:56px;">
							<a class="mainbtn" href="myComment.do">내 리뷰, 댓글</a>
						</div>
						<div class="feature col">
							<img src="<%= request.getContextPath() %>/image/heart.png" style="width:56px;">
							<a class="mainbtn" href="">너나들이</a>
						</div>
						<div class="feature col">
							<img src="<%= request.getContextPath() %>/image/heart.png" style="width:56px;">
							<a class="mainbtn" href="">문의 내역</a>
						</div>
					</div>
				</div>
			</div>
			<!-- / .content01 -->
			

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
</body>
</html>
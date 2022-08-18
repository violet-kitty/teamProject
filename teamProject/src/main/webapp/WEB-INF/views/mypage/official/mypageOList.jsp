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

<script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabList.css">
<!-- CSS3 - Mypage --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/parallax.js"></script>

</head>
<body>
	<div id="wrap">
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Herotop -->
		<div class="parallax-window" data-parallax="scroll" data-image-src="<%= request.getContextPath() %>/image/picture/diary.jpg"></div>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">

			<!-- contents 02 -->
			
			<div class="contents lbg-lightestgray">
				<div class="container lbg-lightestgray" id="featured-3" style="text-align:center;">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>마이페이지</h1>
						</div>
					</div>
					
					<div class="row g-4 py-5 row-cols-1 row-cols-lg-3" style="margin-top: 15px;">
						<div class="feature col">
							<a class="mainbtn" href="myEvent.do">
								<img src="<%= request.getContextPath() %>/image/icon/my1.png" style="width:56px;margin-bottom:20px;"><br>지역이벤트 관리
							</a>
						</div>
						<div class="feature col">
							<a class="mainbtn" href="<%= request.getContextPath() %>/CSboard/CS_list.do">
								<img src="<%= request.getContextPath() %>/image/icon/my5.png" style="width:56px;margin-bottom:20px;"><br>문의 내역
							</a>
						</div>
					</div>
				</div>
			</div>
			

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
</body>
</html>
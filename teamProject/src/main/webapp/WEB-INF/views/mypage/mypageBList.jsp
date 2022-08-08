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
<!-- 달력 -->
<script src="<%= request.getContextPath() %>/js/main.min.js"></script>
<script src="<%= request.getContextPath() %>/js/locales-all.min.js"></script>
<link href="<%= request.getContextPath() %>/css/main.min.css" rel="stylesheet">

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />

<!-- 달력 스크립트 -->
<script>
	document.addEventListener('DOMContentLoaded', function(){
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale: "ko",
			selectable: true,
		    select: function(arg) {
				var title = prompt('숙소 이름:');
				if (title) {
					calendar.addEvent({
		            title: title,
		            start: arg.start,
		            end: arg.end,
		            allDay: arg.allDay
		          })
		        }
		        calendar.unselect()
			},
		    eventClick: function(arg) {
				if (confirm('정말 삭제하시겠습니까?')) {
		            arg.event.remove()
		        }
		    },
		    dayMaxEvents: true,
		    //이벤트. 왜인지 모르지만 끝나는 날짜가 이상하다
		    events : [{
		    	title:'qwe'
		    	,start:'2022-07-21'
		    	,end:'2022-07-22'
		    }
		    ,{
		    	title:'asd'
			    ,start:'2022-07-24'
			    ,end:'2022-07-27'
		    }],
/* 		    eventContent: {//이벤트 바꾸기(모양이 아예 바뀜)
		    	html: '<div style="background:blue;"></div>'
		    }, */
		    eventDidMount: function(info){//이벤트 색 바꾸기
		    	info.el.style.backgroundColor = 'lightGreen';
		    }
		});
		calendar.render();
	});
</script>
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
							<a class="mainbtn" href="">내 숙소 관리</a>
						</div>
						<div class="feature col">
							<img src="<%= request.getContextPath() %>/image/heart.png" style="width:56px;">
							<a class="mainbtn" href="">예약자 관리</a>
						</div>
						<div class="feature col">
							<img src="<%= request.getContextPath() %>/image/heart.png" style="width:56px;">
							<a class="mainbtn" href="">문의 내역</a>
						</div>
					</div>
				</div>
			</div>
			<!-- / .content01 -->
			<div class="container">
				<div id="calendar" ></div>
			</div>
			

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
</body>
</html>
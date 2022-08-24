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
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Mypage --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/teamInfo.css" />

<script type="text/javascript" src="<%= request.getContextPath() %>/js/parallax.js"></script>
<style>
.content01{
	padding-top:100px;
	padding-bottom:100px;
}
</style>
</head>
<body>
	<div id="wrap">
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Herotop -->
		<div class="parallax-window" style="min-height:300px;" data-parallax="scroll" data-image-src="<%= request.getContextPath() %>/image/picture/diary.jpg"></div>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">
			<img src="<%= request.getContextPath() %>/image/teamInfo/first.png" style="width:100%;height:1300px;">
			
			<!-- content01 -->
			<div class="contents content01 hbg-whitegray" style="text-align:center;">
				<div class="container" id="featured-1">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>팀 소개</h1>
						</div>
					</div>
					
					<div style="text-align:left;">
						<h2>tripDJ</h2>
						<p>팀원들 이름의 이니셜 끝자리와 여행을 뜻하는 'trip'을 합쳐 만들어진 이름</p>
					</div>
					<br><br>
					<div class="row g-4 py-5 row-cols-1 row-cols-lg-4" style="margin-top: 15px;">
						<div class="feature col">
							<div class="hbg-blue" style="border-radius:10px;width:270px;height:500px;padding-top:10px;">
								<img src="<%= request.getContextPath() %>/image/logo/logo.png" style="height:100px;"><br>
								<div class="hbg-white" style="margin-left:10px;margin-right:10px;padding:5px;height:375px;">
									<h3>허유진</h3>
									<p><br>HOWF 추천<br><br>숙박정보<br><br>지역이벤트<br><br>마이페이지</p>
								</div>
							</div>
						</div>
						<div class="feature col">
							<div class="hbg-pink" style="border-radius:10px;width:270px;height:500px;padding-top:10px;">
								<img src="<%= request.getContextPath() %>/image/logo/logo.png" style="height:100px;"><br>
								<div class="hbg-white" style="margin-left:10px;margin-right:10px;padding:5px;height:375px;">
									<h3>이은지</h3>
									<p><br>프론트<br><br>디자인<br><br>퍼블리싱<br><br>여행이야기</p>
								</div>
							</div>
						</div>
						<div class="feature col">
							<div class="hbg-green" style="border-radius:10px;width:270px;height:500px;padding-top:10px;">
								<img src="<%= request.getContextPath() %>/image/logo/logo.png" style="height:100px;"><br>
								<div class="hbg-white" style="margin-left:10px;margin-right:10px;padding:5px;height:375px;">
									<h3>강희재</h3>
									<p><br>1:1 문의<br><br>너나들이<br><br>투표<br><br>채팅</p>
								</div>
							</div>
						</div>
						<div class="feature col">
							<div class="hbg-blue" style="border-radius:10px;width:270px;height:500px;padding-top:10px;">
								<img src="<%= request.getContextPath() %>/image/logo/logo.png" style="height:100px;"><br>
								<div class="hbg-white" style="margin-left:10px;margin-right:10px;padding:5px;height:375px;">
									<h3>김남도</h3>
									<p><br>공지사항<br><br>FAQ<br><br>QA<br><br>디버깅</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- / #featured-1 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-left" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-2">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>프로젝트 소개</h1>
						</div>
					</div>
					
					<div style="text-align:left;line-height:3;">
						<h2>HOWF</h2>
						<p style="line-height:2">각 팀원들의 여행하면 떠오르는 단어 Healing, Ocean, Where, Food의 앞글자를 따서 ‘머물다’ 라는 뜻의 HOWF라는 단어를 조합함</p>
						<br><br>
						<h2>프로젝트 취지</h2>
						<p style="line-height:2">코로나 19 대유행 이후 사람들의 여행 욕구 증가<br>여행 인구가 서서히 증가하는 추세<br>여행 관련 데이터를 하나의 사이트로  서비스하는 것을 목표로 해당 시기에 가장 적절하고 필요한 프로젝트라고 생각되어 추진</p>
					</div>
					
				</div>
				<!-- / #featured-2 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-right" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-3">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>디자인 컨셉</h1>
						</div>
					</div>
					
					<div style="text-align:left;line-height:3;">
						<h2>디자인 컨셉</h2>
						<p>파스텔, 미니멀, 라운드박스, 플로우배치, 아웃라이닝아이콘, 로고와 심플라운드버튼 세트, morphism design</p>
						<br><br>
						<h2>색상 테마</h2>
						<p><img src="<%= request.getContextPath() %>/image/teamInfo/color.png" style="min-width:60%;height:250px;"></p>
						<br><br>
						<h2>로고</h2>
						<p>지도 핀 모티브<br>
						<img src="<%= request.getContextPath() %>/image/logo/logo.png" style="height:100px;">
						</p>
					</div>
					
				</div>
				<!-- / #featured-3 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-left" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-4">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>사용 언어 및 툴</h1>
						</div>
					</div>
					<br><br><br>
					<div style="text-align:left;line-height:4;">
						<img src="<%= request.getContextPath() %>/image/teamInfo/xd.png" style="width:120px;height:120px;"> 
						<img src="<%= request.getContextPath() %>/image/teamInfo/html.jpg" style="width:200px;height:120px;"> 
						<img src="<%= request.getContextPath() %>/image/teamInfo/js.png" style="width:120px;height:120px;"> 
						<img src="<%= request.getContextPath() %>/image/teamInfo/ajax.png" style="width:200px;height:120px;"> 
						<img src="<%= request.getContextPath() %>/image/teamInfo/jquery.png" style="width:200px;height:120px;"> 
						<img src="<%= request.getContextPath() %>/image/teamInfo/bootstrap.jpg" style="width:120px;height:120px;"> 
						<img src="<%= request.getContextPath() %>/image/teamInfo/java.png" style="width:200px;height:120px;"> 
						<img src="<%= request.getContextPath() %>/image/teamInfo/spring.png" style="width:200px;height:120px;"> 
						<img src="<%= request.getContextPath() %>/image/teamInfo/mysql.png" style="width:200px;height:120px;"> 
					</div>
					
				</div>
				<!-- / #featured-4 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-left" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-5">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>개발일정</h1>
						</div>
					</div>
					<br>
					<div style="text-align:left;line-height:3;">
						
					</div>
					
				</div>
				<!-- / #featured-5 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-left" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-6">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>클래스 다이어그램</h1>
						</div>
					</div>
					<br>
					<div style="text-align:left;line-height:3;">
						
					</div>
					
				</div>
				<!-- / #featured-6 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-left" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-7">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>ERD</h1>
						</div>
					</div>
					<br>
					<div style="text-align:left;line-height:3;">
						
					</div>
					
				</div>
				<!-- / #featured-7 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-left" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-7">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>SITE MAP</h1>
						</div>
					</div>
					<br>
					<div style="text-align:center;line-height:3;">
						<img src="<%= request.getContextPath() %>/image/teamInfo/siteMap.png" style="max-width:100%"> 
					</div>
					
				</div>
				<!-- / #featured-7 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-left" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-8">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>사용한 기능 및 API</h1>
						</div>
					</div>
					<br>
					<div style="text-align:center;line-height:2;">
						<p>1. 스프링 시큐리티 - 비밀번호 암호화</p><br>
						<p>2. 우편 검색 API</p><br>
						<p>3. 카카오 로그인 API</p><br>
						<p>4. 구글 로그인 API</p><br>
						<p>5. 지도 API</p><br>
						<p>6. 결제 API - 아임포트</p><br>
						<p>7. 문자 전송 API - COOLSMS</p><br>
						<p>8. 채팅 API - NCLOUD</p><br>
					</div>
					
				</div>
				<!-- / #featured-8 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-left" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-8">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>사용자 분류</h1>
						</div>
					</div>
					<br>
					<div style="text-align:center;line-height:3;">
						<h1>일반회원</h1>
						<p></p>
						<br>
						<h1>사업자</h1>
						<p></p>
						<br>
						<h1>공무원</h1>
						<p></p>
						<br>
						<h1>관리자</h1>
						<p></p>
					</div>
					
				</div>
				<!-- / #featured-8 -->
			</div>
			<!-- / .content01 -->
			
			
			<div class="contents content01 hbg-whitegray" style="text-align:center;" data-aos="fade-left" data-aos-offset="300" data-aos-duration="300">
				<div class="container" id="featured-8">
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1></h1>
						</div>
					</div>
					<br>
					<div style="text-align:center;line-height:3;">
						<h1>시연</h1>
					</div>
					
				</div>
				<!-- / #featured-8 -->
			</div>
			<!-- / .content01 -->
			
			

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
</body>
</html>
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
<title>Home</title>

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
<!-- CSS3 - Home --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<title>Insert title here</title>
<style>
.team_title{
	font-size: 2.5em;
	font-weight: bold;
}
.join_btn{
	display: block;
	width: 25%;
	height: 100px;
	color: white;
	background-color: #54ACA8;
	border: 1px solid white;
}
</style>
</head>
<body>

	<div id="wrap">
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="<%= request.getContextPath() %>/"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div class="container">
		
		
		
			<div class="row">
				<div class="col">
					<div class="thumbnail">${tv.filename}</div>
				</div>			
			</div>
			
			<div class="row">
				<div class="text-center col-md-6 col-lg-3 d-flex justify-content-start">
						(프로필 사진 영역(선택))
				</div>
				<div class="text-center col-md-6 col-lg-3">
						${tv.wdate}
				</div>
				<div class="text-center col-md-6 col-lg-3">
						${tv.nickname}
				</div>
				<div class="text-center col-md-6 col-lg-3 d-flex justify-content-end">
						팀원 ${tv.people_cnt}
				</div>
			</div>
			<div class="row">
				<div class="col team_title">
					${tv.title}
				</div>
			</div>
			<div class="row">
				<div class="col" style="min-height: 500px;">
					${tv.content}
				</div>
			</div>			
			<div class="row">
				<div class="col d-flex justify-content-center">
					<c:if test="${login != null && tv.applyyn == 'Y'}">
						<c:if test="${check.joinyn != 'Y'}">
							<c:if test="${check.jidx == 0}">
								<input type="button" id="join_btn" class="join_btn" value="가입신청">
								<input type="button" id="join_cancel_btn" class="join_btn" value="가입신청 취소" style="display: none;">
							</c:if>
							<c:if test="${check.jidx != 0}">
								<input type="button" id="join_btn" class="join_btn" value="가입신청" style="display: none;">
								<input type="button" id="join_cancel_btn" class="join_btn" value="가입신청 취소">
							</c:if>
						</c:if>
					</c:if>
				</div>
			</div>
			<c:if test="${check.joinyn == 'Y'}">
				<div class="row">
					<div class="col">
						<button onclick="javascript:location.href='teamTeam.do?tidx=${tv.tidx}'">팀 페이지</button>
					</div>
				</div>
			</c:if>
			<div class="row">
				<div class="col d-flex justify-content-center">
					<c:if test="${login!=null && login.midx == tv.midx}">
						<button id="teamDelete">삭제</button>
						<button id="teamModify">수정</button>
					</c:if>
					<button id="teamList">목록</button>
				</div>
			</div>
	

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
<script>
	$(function(){

		$("#teamList").click(function(){
			location.href = "teamList.do";			
		});
		
		$("#teamModify").click(function(){
			location.href = "teamModify.do?tidx=${tv.tidx}";
		});
		
		$("#teamDelete").click(function(){
			location.href = "teamDelete.do?tidx=${tv.tidx}";
		});
		
		$("#join_btn").click(function(){
			$.ajax({
				url: "join_apply.do",
				data: "tidx=${tv.tidx}",
				type: "get",
				success:function(data){
					if(data != 0){
						$("#join_btn").toggle();
						$("#join_cancel_btn").toggle();
					}
				}
			});
			
		});
		
		$("#join_cancel_btn").click(function(){
			$.ajax({
				url: "join_apply_cancel.do",
				data: "tidx=${tv.tidx}",
				type: "get",
				success: function(data){
					if(data != 0){
						$("#join_btn").toggle();
						$("#join_cancel_btn").toggle();
					}
				}
			});
		});
		
	});
</script>
</body>
</html>
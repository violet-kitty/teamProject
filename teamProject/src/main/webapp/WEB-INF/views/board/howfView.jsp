<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- jquery -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- css -->
<link href="<%=request.getContextPath()%>/css/howf.css" rel="stylesheet">
<style>
	h1{
		font-size:1.5em;
		font-weight:bold; 
	}
</style>
</head>
<body>
<main>
	<div class="container">
		<div class="row">
			<div class="col">
				<a href="howfList.do">&lt;목록으로 돌아가기</a>
			</div>
		</div><!-- row end -->
		
		<!-- 썸네일 이미지 -->
		<div class="row">
			<div class="col">
				사진
			</div>
		</div>
		
		<!-- 카테고리, 작성일, 하트 -->
		<div class="row">
			<div class="col-lg-6 d-flex justify-content-start">
				<c:if test="${vo.cate=='숙박추천'}">
					<span style="background: #54ACA8; border-radius: 5px; color: white;">${vo.cate}</span>
				</c:if>
				<c:if test="${vo.cate=='여행지추천'}">
					<span style="background: #85A548; border-radius: 5px; color: white;">${vo.cate}</span>
				</c:if>
				<c:if test="${vo.cate=='맛집추천'}">
					<span style="background: #DE8889; border-radius: 5px; color: white;">${vo.cate}</span>
				</c:if>
				<span class="ms-1">${v.wdate}</span>
			</div>
			<div class="col-lg-6 d-flex justify-content-end">
				<img src="<%=request.getContextPath()%>/image/redheart.png" width="30" height="30">
				<span class="ms-1">${vo.heart}</span>
			</div>
		</div>
		
		<!-- 글 제목 -->
		<div class="row">
			<div class="col">
				${vo.title}
			</div>
		</div>
		
		<!-- 태그 -->
		<div class="row">
			<div class="col">
				${vo.tag}
			</div>
		</div>
		<hr class="my-2">
		
		<!-- 글 내용 -->
		<div class="row">
			<div class="col">
				${vo.content}
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-6 d-flex justify-content-start">
				<c:if test="${login.role=='admin'}">
				<button>x</button>
				<button>w</button>
				<button>p</button>
			</c:if>
			</div>
			<div class="col-lg-6 d-flex justify-content-end">
				<button>x</button>
				<button>w</button>
				<button>p</button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-6">
				<a href="howfList.do">&lt;목록으로 돌아가기</a>
			</div>
			<div class="col-lg-6 d-flex justify-content-end">
				<button>글 작성 완료</button>
			</div>
		</div><!-- row end -->
	</div><!-- container end -->
</main>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
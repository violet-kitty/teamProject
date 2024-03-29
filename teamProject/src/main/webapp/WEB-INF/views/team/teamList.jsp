<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF 너나들이</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

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

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav3 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav2.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardList.css">
<!-- CSS3 - BoardList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/normaltable.css">

</head>
<body>
	
	<div id="wrap" class="boardlist story storylist">
	
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
		
			<div class="docctrl onlypc">
				<a href="javascript:void(0)" id="teamWrite"><img src="<%=request.getContextPath()%>/image/button/add.png"></a>
			</div>
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>	
		</div>
		
		<!-- #container -->
		<div id="container" class="hbg-whitegray">
		
			<!-- 리스트 content -->
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
				
					<!-- pagehead -->
					<div class="pageinfo">
						<!-- 페이지 제목 -->
						<div class="title onlypc">
							<a href="<%=request.getContextPath()%>/team/teamList.do"><h1>너나들이</h1></a>
						</div>
					
						<!-- rightbox : tablet 사이즈 이하에서 숨기기 -->
						<div class="row rightbox onlypc-inline">
							<!-- sort 버튼 -->
							<div class="col d-flex justify-content-end filterbtn">
								<button id="teamBtn" onclick="location.href='teamList.do?sortType=team'">팀원수</button>
								<button id="cntBtn" onclick="location.href='teamList.do?sortType=cnt'">조회수</button>
							</div>	
							<!-- 검색창 -->
							<form id="form1" name="frm2" action="teamList.do" method="get">
								<div class="search">
									<select name="searchType" id="sfilterID">
										<option value="total"<c:if test="${!empty vo.searchType and vo.searchType eq ''}">selected</c:if>>전체</option>
										<option value="title"<c:if test="${!empty vo.searchType and vo.searchType eq 'title'}">selected</c:if>>제목</option>
										<option value="content"<c:if test="${!empty vo.searchType and vo.searchType eq 'content'}">selected</c:if>>내용</option>
										<option value="nickname"<c:if test="${!empty vo.searchType and vo.searchType eq 'nickname'}">selected</c:if>>작성자</option>
									</select>
									<input type="text" name="searchValue" <c:if test="${!empty vo.searchValue }">value="${vo.searchValue}"</c:if>>
									<input type="submit" id="btn_search" value="검색">
								</div>
							</form>
								
						</div><!-- .rightbox onlypc-inline-->
						<!-- / 검색영역 -->
						
						<!-- rightbox : tablet 사이즈 이하에서만 보이기-->
						
							<div class="docctrl onlytablet" style="margin-top: 16px;">
								<a href="<%=request.getContextPath()%>/team/teamWrite.do">
									<button class="w-100 bluebtn"><i class="fa-solid fa-plus"></i> &nbsp;글쓰기</button>
								</a>
							</div>
							
							<div class="row rightbox onlytablet">
								<div class="btn-group">
									<button class="w-100 dropdown-toggle pinkbtn" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">카테고리 정렬 &nbsp;</button>
									<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
										<li><a class="dropdown-item" href="teamList.do?sortType=team">팀원수</a></li>
										<li><a class="dropdown-item" href="teamList.do?sortType=cnt">조회수</a></li>
									</ul>
								</div>
								
								<!-- 검색창 -->
								<form id="form1" name="frm2" action="teamList.do" method="get">
								<div class="search">
									<select name="searchType" id="sfilterID">
										<option value="total"<c:if test="${!empty vo.searchType and vo.searchType eq ''}">selected</c:if>>전체</option>
										<option value="title"<c:if test="${!empty vo.searchType and vo.searchType eq 'title'}">selected</c:if>>제목</option>
										<option value="content"<c:if test="${!empty vo.searchType and vo.searchType eq 'content'}">selected</c:if>>내용</option>
										<option value="nickname"<c:if test="${!empty vo.searchType and vo.searchType eq 'nickname'}">selected</c:if>>작성자</option>
									</select> 
									<input type="text" name="searchValue" <c:if test="${!empty vo.searchValue }">value="${vo.searchValue}"</c:if>>
									<input type="submit" id="btn_search" value="검색">
								</div>
								</form>
							</div>
							<!-- .rightbox -->
					</div>
					<!-- .pageinfo -->
					<!-- / pagehead -->
					
					
					<!-- 리스트 박스 -->   <!-- 리스트 카드 hover effect 종류 참고 : https://codepen.io/vavik96/pen/MYdBKz -->
					<div class="clist">
						
						<!-- 리스트영역 -->
						<div class="row grid">
							<!-- C리스트 14. 반복 -->
							<c:forEach var="tv" items="${tv}">
							<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
								<a style="cursor:pointer" onclick="location.href='teamView.do?tidx=${tv.tidx}'">
									<div class="thumbnail hbshadow3">
										<div class="writerinfo">
											<c:if test="${tv.img != null}">
												<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/story/displayFile.do?fileName=${tv.img});"></div>
											</c:if>
											<c:if test="${tv.img == null}">
												<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
											</c:if>
											
											<p>
												<span class="hfc-darkgray">${tv.nickname} </span>
												<span class="hfc-semibold hfc-gray"> | ${tv.wdate}</span>
											</p>
											<div class="small">
												<!-- 조회수, 참여자 -->
												<img src="<%=request.getContextPath()%>/image/icon/eye.png"><span class="hfc-semibold hfc-darkgray">${tv.cnt}</span>
												<img src="<%=request.getContextPath()%>/image/icon/people.png" style="vertical-align:bottom"><span class="hfc-semibold hfc-darkgray">${tv.people_cnt}</span>
											</div>
										</div>
										<div class="caption">
											<h4>${tv.title}</h4>
										</div>
									</div><!-- /.thumbnail -->
								</a>
							</div><!--/. thumbnailitem -->
							</c:forEach>
						</div>
						<!--/row-->
						
						<!-- 페이징 -->
						<div class="row pagenation">
							<div class="col d-flex justify-content-center">
							
								<table>
									<tbody>						
										<tr>
											<c:if test="${pm.prev == true}">
												<td>
													<a href="teamList.do?page=${pm.startPage-1}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}" class="hfc-gray hfc-bold">◀</a>
												</td>
											</c:if>
											<td>
												<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
													<a href="teamList.do?page=${i}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}" class="hfc-gray hfc-bold  mx-1">${i}</a>
												</c:forEach>
											</td>
											<c:if test="${pm.next && pm.endPage > 0}">
												<td>
													<a href="teamList.do?page=${pm.endPage}&searchType=${pm.search.searchType}&searchValue=${pm.search.searchValue}" class="hfc-gray hfc-bold">▶</a>
												</td>
											</c:if>
										</tr>						
									</tbody>
								</table>
							</div>	
						</div>
						<!-- /페이징 -->

					</div><!-- /.clist -->
					<!-- / 리스트 박스 --> 
					
				</div><!-- / .container -->
			</div><!-- .contents -->

			<!-- banner --><%@include file="../banner.jsp"%>
			
		</div><!-- #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
		
	</div><!-- /#wrap -->
<script>
$(function(){
	//sort 버튼
	var sortBtn = "${pm.search.sortType}";
	if(sortBtn != ""){
		$("#"+sortBtn+"Btn").css("background","none");
		$("#"+sortBtn+"Btn").css("color","#DE8889");
		$("#"+sortBtn+"Btn").css("border","2px solid #DE8889");
	}
	
	$("#btn_search").click(function(){
		$("#form1").submit();
	});
	
	$("#teamWrite").click(function(){
		if(${login == null}){
			modalFn("로그인이 필요한 기능입니다.", "닫기")
			return false;
		}
		$.ajax({
			url: "write_check.do",
			data: "midx=${login.midx}",
			type: "get",
			success:function(data){
				if(data != 0){
					modalFn("글은 최대 1개만 작성할 수 있습니다.", "닫기");
				}
				else{
					location.href = "teamWrite.do";
				}
				
			}
			
		});
		
	});
	
});
</script>	
</body>
</html>
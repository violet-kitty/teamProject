<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
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
						<h1>예약한 숙소 목록</h1>
					</div>
						
					
					<!-- sort 버튼 -->
					<div class="row">
						<div class="col d-flex justify-content-end">
							<button onclick="location.href='myReservation.do?sortType=new'">최신순</button>
							<button onclick="location.href='myReservation.do?sortType=payY'">예약 완료</button>
							<button onclick="location.href='myReservation.do?sortType=payN'">결제 필요</button>
						</div>
					</div>
					<br>
					<!-- 게시판 이름, 검색창 -->
					<div class="row">
						<div class="col d-flex justify-content-end">
							<form class="d-flex input-group" action="myReservation.do" method="post">
								<select class="form-select" name="searchType">
									<option value="total" selected>전체</option>
								</select>
								<input type="text" class="form-control" name="searchValue" value="${search.searchValue}">
								<button class="btn btn-dark">검색</button>
							</form>
						</div>
					</div><!-- row end -->
					<br>
					
						
					<div class="row g-4 py-5 row-cols-1 row-cols-lg-3" style="margin-top: 15px;">
						<c:forEach var="i" items="${res}">
						<div class="feature col">
							<img src="<%=request.getContextPath() %>/event/displayFile.do?fileName=${i.photo}" style="width:56px;">
							<h2>숙소이름 : ${i.sname}</h2>
							<h3>객실 이름 : ${i.rname}</h3>
							<p>예약한 날짜 : ${i.wdate}<br>
							체크인 : ${i.date1} 체크아웃 : ${i.date2}<br>
							가격 : ${i.price}<br>
							<c:choose>
								<c:when test="${i.delyn == 'Y'}">
									예약 취소됨
									<c:if test="${i.pay == 'B'}">
									<br>
									취소 사유 : ${i.content}
									</c:if>
								</c:when>
								<c:when test="${i.pay == 'N'}">
									결제 필요
								</c:when>
								<c:otherwise>
									예약됨
								</c:otherwise>
							</c:choose>
							</p>
							<!-- 오늘 날짜 -->
							<c:set var="today"><fm:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/></c:set>
							<!-- 결제 안했고 삭제 안됐고 체크인이 오늘 이후이면 -->
							<c:if test="${i.pay == 'N' && i.delyn == 'N' && i.date1>=today}">
							<button onclick="payment('${i.sname}','${i.ridx}','${i.rname}','${i.price}','${i.date1}','${i.date2}','${i.merchant}')">결제하기</button>
							</c:if>
							<!-- 결제 했고 삭제 안됐고 체크인이 오늘보다 크면(당일 예약 취소 안됨) -->
							<c:if test="${i.pay == 'Y' && i.delyn == 'N' && i.date1>today}">
							<button onclick="resCancel('${i.reidx}')">예약 취소</button>
							</c:if>
						</div>
						</c:forEach>
						<!-- 예약 취소를 위한 hidden input -->
						<input type="hidden" name="reidx" id="reidx">
						<input type="hidden" id="pay">
					</div>
					
					<!-- 페이징 -->
					<div class="row">
						<div class="col d-flex justify-content-center">
							<c:if test="${pm.prev == true}">
								<a href="myReservation.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<a href="myReservation.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}" class="mx-1">${i}</a>
							</c:forEach>
							<c:if test="${pm.next == true}">
								<a href="myReservation.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
							</c:if>
						</div>
					</div>
					
					
				</div>
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
	
<script>
	//결제
	function payment(sname, ridx, rname, price, date1, date2, merchant){
		var data = "sname="+sname+"&ridx="+ridx+"&name="+rname+"&price="+price+"&date1="+date1+"&date2="+date2+"&merchant="+merchant;
		location.href='<%= request.getContextPath() %>/stay/stayReservation.do?'+data;
	}
	
	//예약 취소
	function resCancel(reidx, pay){
		$("#reidx").val(reidx);
		$("#pay").val(pay);
		modalFn("정말 예약을 취소하시겠습니까?","예약 취소", "예약 취소","닫기");
	}
	
	function modalOkFn(){
		modalClose();
		var pay = $("#pay").val();
		
		$.ajax({
			url:"<%= request.getContextPath() %>/stay/resDelete.do",
			data:"reidx="+$("#reidx").val(),
			type:"post",
			success:function(data){
				if(pay == "Y"){//환불 처리
					$.ajax({
						url:"payCancel.do",
						data:"merchant="+data,
						type:"post",
						success:function(result){
							if(result==1){
								modalFn("예약 취소 되었습니다");
								setTimeout(function(){
									modalClose();
									location.reload();
								},1000);
							}
							else {
								modalFn("예약 취소에 실패했습니다");
								setTimeout(function(){
									modalClose();
									location.reload();
								},1000);
							}
						}
					});
				}
				else {
					modalFn("예약이 취소되었습니다");
					setTimeout(function(){
						modalClose();
						location.reload();
					},1500);
				}
			}
		});
		
	}
</script>	
</body>
</html>
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
<!-- CSS3 - Mypage --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage.css">
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardList.css">

<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
</head>
<body>
	<div id="wrap" class="boardlist event eventlist">
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">

			<!-- contents 02 -->
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
				
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<a href="<%= request.getContextPath() %>/mypage/myReservation.do"><h1>예약한 숙소 목록</h1></a>
						</div>
						
						<!-- rightbox : tablet 사이즈 이하에서 숨기기 -->
						<div class="row rightbox onlypc-inline">
							<div class="col d-flex justify-content-end filterbtn">
								<button onclick="location.href='myReservation.do?sortType=new'" id="newBtn">최신순</button>
								<button onclick="location.href='myReservation.do?sortType=payY'" id="payYBtn">예약 완료</button>
								<button onclick="location.href='myReservation.do?sortType=payN'" id="payNBtn">결제 필요</button>
							</div>
							<form class="d-flex input-group" action="myReservation.do" method="post">
								<div class="search">
									<select name="searchType">
										<option value="total" selected>전체</option>
									</select>
									<input type="text" name="searchValue" value="${search.searchValue}">
									<input type="submit" value="검색">
								</div>
							</form>
						</div>
						
						
						<div class="row rightbox onlytablet">
							<div class="btn-group">
								<button class="w-100 dropdown-toggle pinkbtn" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">카테고리 정렬 &nbsp;</button>
								<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
									<li><a class="dropdown-item" href="myReservation.do?sortType=new">최신순</a></li>
									<li><a class="dropdown-item" href="myReservation.do?sortType=payY">예약 완료</a></li>
									<li><a class="dropdown-item" href="myReservation.do?sortType=payN">결제 필요</a></li>
								</ul>
							</div>
							<!-- 검색창 Search -->
							<form name="frm2" action="myReservation.do" method="post">
							<div class="search">
								<select name="searchType" id="sfilterID">
									<option value="total" selected>전체</option>
								</select> 
								<input type="text" name="searchValue" value="${search.searchValue}">
								<input type="submit" value="검색">
							</div>
							</form>
						</div><!-- .rightbox -->
						
					</div>
					
					
					
					
					<!-- ----------------------------------------------------------------------------------------------------- -->
					
					<!-- 리스트 카드 -->
					<div class="clist">
						
						<div class="row grid">
							<!-- C리스트 14. 반복 -->
							<c:forEach var="v" items="${res}">
							<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
								<div class="thumbnail hbshadow3">
									<a style="cursor:pointer" onclick="location.href='<%= request.getContextPath() %>/stay/stayView.do?sidx=${v.sidx}'">
									<figure class="effect-ming">
										<!-- 메인이미지 보여주기-->
										<c:if test="${v.photo != null}">
											<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/event/displayFile.do?fileName=${v.photo});"></div>
										</c:if>

										<c:if test="${v.photo == null}">
											<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
										</c:if>
									</figure>
									</a>
									
									<div class="writerinfo">
										<p>
											<span class="hfc-semibold hfc-blackgray">${v.date1} ~ ${v.date2}</span>
										</p>
										<p><span class="hfc-semibold hfc-blackgray">예약한 날짜 ${v.wdate}</span></p><br>
										<p><span class="hfc-semibold hfc-blackgray">${v.price}원</span></p><br>
										<!-- 오늘 날짜 -->
										<c:set var="today"><fm:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/></c:set>
										<c:choose>
											<c:when test="${v.delyn == 'Y'}">
												예약 취소됨
												<c:if test="${v.pay == 'B'}">
												<br>
												사유 : ${v.content}
												</c:if>
											</c:when>
											<c:when test="${v.pay == 'N' && v.date1>=today}">
												결제 필요
											</c:when>
											<c:when test="${v.pay == 'N' && v.date1<today}">
												결제 기간 지남
											</c:when>
											<c:otherwise>
												예약됨
											</c:otherwise>
										</c:choose>
										
										<!-- 결제 안했고 삭제 안됐고 체크인이 오늘 이후이면 -->
										<c:if test="${v.pay == 'N' && v.delyn == 'N' && v.date1>=today}">
										<button onclick="payment('${v.sname}','${v.ridx}','${v.rname}','${v.price}','${v.date1}','${v.date2}','${v.merchant}')">결제하기</button>
										</c:if>
										<!-- 결제 했고 삭제 안됐고 체크인이 오늘보다 크면(당일 예약 취소 안됨) -->
										<c:if test="${v.pay == 'Y' && v.delyn == 'N' && v.date1>today}">
										<button onclick="resCancel('${v.reidx}')">예약 취소</button>
										</c:if>
									</div>
									<div class="caption">
										<h4>&lt;${v.sname}&gt; ${v.rname}</h4>
									</div>
								</div><!-- /.thumbnail -->
							</div><!--/. thumbnailitem -->
							</c:forEach>
							<!-- 예약 취소를 위한 hidden input -->
							<input type="hidden" name="reidx" id="reidx">
							<input type="hidden" id="pay">
						</div>
					
					
						<!-- C페이징 01 : 페이징 paging 공간 만들기 -->
						<div class="row pagenation">
							<div class="col d-flex justify-content-center">
								<c:if test="${pm.prev == true}">
									<a class="hfc-gray hfc-bold" href="myReservation.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
								</c:if>
								<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<c:choose>
								<c:when test="${search.page != null && i == search.page}">
									<a class="hfc-white hfc-bold hbg-pink mx-1" href="myReservation.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
								</c:when>
								<c:otherwise>
									<a class="hfc-gray hfc-bold mx-1" href="myReservation.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
								</c:otherwise>
								</c:choose>
								</c:forEach>
								<c:if test="${pm.next == true}">
									<a class="hfc-gray hfc-bold" href="myReservation.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
								</c:if>
							</div>
						</div>
						<!-- /페이징 -->
					
					
					</div>
					<!-- /.clist -->
				
				</div>
				<!-- / .contents -->
				
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
<script>
	$(function(){
		//sort 버튼
		var sortBtn = "${search.sortType}";
		if(sortBtn != ""){
			$("#"+sortBtn+"Btn").css("background","none");
			$("#"+sortBtn+"Btn").css("color","#DE8889");
			$("#"+sortBtn+"Btn").css("border","2px solid #DE8889");
		}
	});
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
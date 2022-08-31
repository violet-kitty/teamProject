<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="edu.howf.vo.UserVO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF숙박정보</title>

<!-- jQuery -->
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap5 최신 CSS & JS (Popper.js 포함됨) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Slick Slider -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- Bootstrap5 AwsomeFont -->
<script src="https://kit.fontawesome.com/a54851838a.js" crossorigin="anonymous"></script>
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- 카카오 지도 api --><script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35c7c8bf307063859390df8e61188fbf&libraries=services"></script>

<!-- CSS3 - Theme --><link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --><link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --><link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
<!-- CSS3 - Side --><link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --><link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --><link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --><link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - stayView --><link href="<%=request.getContextPath()%>/css/stayView.css" rel="stylesheet">

<script>
var heartDup = false;

if(${heart!=null && heart==1}){
	var heartDup = true;
}
else {
	var heartDup = false;
}
</script>

</head>

<body>
	<div id="wrap" class="boardview stay stayView">

		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>

		<!-- Side (top버튼)-->
		<div class="right-container">
			<a href="#"><img src="<%=request.getContextPath()%>/image/button/top.png" class="gotop"></a>
		</div>

		<!-- container -->
		<div id="container" class="hbg-whitegray">

			<div class="contents hbg-whitegray">
				<div class="container">
				
					<!-- 돌아가기  -->
					<a class=" onlypc" href="stayList.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>

					<!-- 썸네일과 요약정보 -->
					<div class="row slick">
						<!-- 썸네일 (Slick Slider) -->
						<div class="col-lg-6 thumbbanner">
							<c:if test="${stay.photo != null}">
								<section class="banner-section">
									<div class="vehicle-detail-banner banner-content clearfix">
										<div class="banner-slider">
											<div class="slider slider-for">
												<c:forEach var="item" items="${fn:split(stay.photo,',')}">
													<div class="slider-banner-image">
														<img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${item}">
													</div>
												</c:forEach>
											</div>
											<div class="slider slider-nav thumb-image">
												<c:forEach var="item" items="${fn:split(stay.photo,',')}">
													<div class="thumbnail-image">
														<div class="thumbImg">
															<img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${item}">
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</section>
							</c:if>
						</div>
						<!-- 요약정보 -->
						<div class="col-lg-6 infosummary">
							<div class="row">
								<div class="col-lg-8 d-flex">
									<c:choose>
										<c:when test="${login != null && login.role == 'normal'}">
											<c:if test="${heart!=null && heart==1}">
												<img class="pointheart" src="<%=request.getContextPath()%>/image/button/heart.png" style="cursor: pointer;" id="heartBtn">
											</c:if>
											<c:if test="${heart!=null && heart==0}">
												<img class="pointheart" src="<%=request.getContextPath()%>/image/button/lineheart.png" style="cursor: pointer;" id="heartBtn">
											</c:if>
										</c:when>
										<c:otherwise>
											<img class="pointheart" src="<%=request.getContextPath()%>/image/button/heart.png">
										</c:otherwise>
									</c:choose>
									<h3>${stay.name}</h3>
								</div>
								<div class="col-lg-4 d-flex justify-content-end iconarea">
									<img src="<%=request.getContextPath()%>/image/icon/star.png">
									<p class="hfc-darkgray reckon" id="stayStarArea">${stay.star}</p>
									<img src="<%=request.getContextPath()%>/image/icon/heart.png">
									<p class="hfc-darkgray" id="heartNum">${stay.heart}</p>
								</div>
							</div>
							<div class="row addrarea">
								<div class="col-lg-12">
									<p>${stay.addr}</p>
								</div>
							</div>
							<div class="row summaryarea">
								<div class="col">
									<p>간단정보</p>
									<p>${fn:split(stay.contents,',')[0]}</p>
								</div>
							</div>
							<div class="row tagarea">
								<p class="col hfc-blue" id="tagArea"></p>
							</div>
						</div>

					</div> <!-- / 썸네일과 요약정보 -->


					<!-- 탭 -->
					<div class="row tabby">
						<div class="col">
							<button id="roomTabBtn" style="color: #D43654; border-bottom:4px solid #D43654;">객실안내/예약</button>
							<button id="stayTabBtn">숙소정보</button>
							<button id="reviewTabBtn">리뷰</button>
						</div>
					</div>


					<c:set var="index" value="0" />
					<!-- 객실 안내/예약 -->
					<div class="row" id="roomTab">
						<!-- 날짜 -->
						<div class="col-12 dating" style="text-align:center;">
							<div class="col">
								<input class="form-control" type="date" id="date1" name="date1" value="${res.date1}">
							</div>
							<div class="col">
								<span class="hfc-gray">~</span>
							</div>
							<div class="col">
								<input class="form-control" type="date" id="date2" name="date2" value="${res.date2}">
							</div>
							<div class="col">
								<button class="greenbtn" onclick="dateSearch()">날짜 검색</button>
							</div>
						</div>
						<!-- 객실리스트 -->
						<div class="listcard">

							<div class="row grid">
								<!-- C리스트 14. 반복 -->
								<c:forEach var="v" items="${stay.room}">
									<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
										
											<div class="thumbnail hbshadow3">

												<figure class="effect-ming">
													<!-- 메인이미지 보여주기-->
													<c:if test="${v.photo != null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/stay/displayFile.do?fileName=${fn:split(v.photo,',')[0]});"></div>
													</c:if>

													<c:if test="${v.photo == null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
													</c:if>
												</figure>
												<div class="writerinfo">
													<p>
													<c:if test="${v.sbed != 0}">
														<span class="hfc-semibold hfc-pink">S침대 : ${v.sbed} </span>
													</c:if>
													<c:if test="${v.dbed != 0}">
														<span class="hfc-semibold hfc-pink">| D침대 : ${v.dbed} </span>
													</c:if>
													<c:if test="${v.qbed != 0}">
														<span class="hfc-semibold hfc-pink">| Q침대 : ${v.qbed} </span>
													</c:if>
													<c:if test="${v.kbed != 0}">
														<span class="hfc-semibold hfc-pink">| K침대 : ${v.kbed} </span>
													</c:if>				
													</p>
													<div class="small">
														<span class="hfc-semibold hfc-darkgray">남은 객실 ${v.cnt}개</span>
													</div>
												</div>
												<div class="caption">
													<h4>${v.name}</h4>
													<p>&#8361;${v.price}</p>
													<button onclick="roomInfoFn('${index}')">객실 이용 안내</button>
												</div>
												<div class="d-flex justify-content-start bookingarea">
													<c:if test="${login != null && login.role == 'normal'}">
														<c:if test="${v.cnt != 0}">
															<button class="w-100 bluebtn" onclick="stayReservation('${stay.sidx}','${stay.name}','${v.name}','${v.price}','${v.people}','${v.square}','${v.tags}')">예약하기</button>
														</c:if>
														<c:if test="${v.cnt == 0}">
															<button class="w-100 graybtn"  style="cursor: default">예약불가</button>
														</c:if>
													</c:if>
												</div>
										</div><!-- /.thumbnail -->
									</div><!--/. thumbnailitem -->
									<div class="col modalwindow" style="display: none" id="roomInfoModal${index}">
										<div class="modalsquare">
											<div class="titlearea"><p class="title">객실 이용 안내</p><button onclick="roomInfoClose('${index}')"><img src="<%=request.getContextPath()%>/image/button/x.png"></button></div>
											<div class="bodyarea">
												<p class="hfc-blackgray">기본정보</p>
												<p class="hfc-darkgray">&nbsp;&nbsp;* 적정 인원 ${v.people}인</p>
												<p class="hfc-darkgray">&nbsp;&nbsp;* 객실+욕실/${v.square}평</p>
												<p class="hfc-darkgray">&nbsp;&nbsp;* 
													<c:if test="${v.sbed != 0}">
														<span>싱글베드 : ${v.sbed}개 </span>
													</c:if>
													<c:if test="${v.dbed != 0}">
														<span>더블베드 : ${v.dbed}개 </span>
													</c:if>
													<c:if test="${v.qbed != 0}">
														<span>퀸베드 : ${v.qbed}개 </span>
													</c:if>
													<c:if test="${v.kbed != 0}">
														<span>킹베드 : ${v.kbed}개 </span>
													</c:if>
												</p>
												<hr>
												<p>편의시설</p>
												<p class="hfc-darkgray">&nbsp;&nbsp;* ${v.tags}</p>
											</div>
										</div>
									</div>

									<c:set var="index" value="${index+1}" />
								</c:forEach>
							</div>
							<!--/row-->

						</div>
						<!-- 객실리스트 -->
					</div>


					<!-- 숙소정보 -->
					<div class="row" id="stayTab" style="display: none">
						<div class="col divp">
							<div>
								<h3>주변정보</h3>
								<!-- 아래 내용 꼭 div에 넣기. 안그럼 줄바꿈 안됨 -->
								<div class="divp">${fn:split(stay.contents,',')[1]}</div>
							</div>
							<div>
								<h3>공지사항</h3>
								<div class="divp">${fn:split(stay.contents,',')[2]}</div>
							</div>
							<div>
								<h3>기본정보</h3>
								<div class="divp">${fn:split(stay.contents,',')[3]}</div>
							</div>
							<div>
								<h3>현장 결제</h3>
								<div class="divp">${fn:split(stay.contents,',')[4]}</div>
							</div>
							<div>
								<h3>확인사항 및 기타</h3>
								<div class="divp">${fn:split(stay.contents,',')[5]}</div>
							</div>
							<div id="map" style="width: 100%; height: 350px;"></div>
							<hr>
							<div>
								<h3 style="margin-bottom:16px;">편의시설 및 서비스</h3>
								<c:if test="${stay.services != null}">
									<c:forEach var="s" items="${fn:split(stay.services,',')}">
										<span style="border:2px solid #DE8889; padding:8px 16px; color:#DE8889; border-radius:25px; margin:8px; line-height:62px;">${s}</span>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>

					<!-- 리뷰 -->
					<div class="row" id="reviewTab" style="display: none">
						<div class="col">
							<div class="contents hbg-whitegray">
								<!-- 리뷰쓰기 창 -->
								<div>
									<h1>이 숙소 리뷰 ${stay.cnt}</h1>
									<br>
									<div>
										<form id="reviewFrm" enctype="multipart/form-data" class="row g-2">
											<div class="col-11">
												<textarea placeholder="댓글" name="content" id="reviewContent" class="form-control" style="resize:none;"></textarea>
												<div class="star-rating">
													<input type="radio" id="5-stars" name="star" value="5" checked /> <label for="5-stars" class="star">&#9733;</label>
													<input type="radio" id="4-stars" name="star" value="4" /> <label for="4-stars" class="star">&#9733;</label>
													<input type="radio" id="3-stars" name="star" value="3" /> <label for="3-stars" class="star">&#9733;</label>
													<input type="radio" id="2-stars" name="star" value="2" /> <label for="2-stars" class="star">&#9733;</label>
													<input type="radio" id="1-star" name="star" value="1" /> <label for="1-star" class="star">&#9733;</label>
												</div><br>
												<input type="file" id="file" name="file"> <input type="hidden" name="bidx" value="${stay.sidx}">
											</div>
											<div class="col-1">
												<button type="button" id="reviewWriteBtn" style="border:none;background:none;"><img src="<%=request.getContextPath()%>/image/button/add.png" style="max-heigth:50px; max-width:50px;"></button>
											</div>
										</form>
									</div>
								</div>

								<br><br>


								<!-- page 정보 -->
								<input type="hidden" id="page" value="${vo.page}">
								<!-- 리뷰 리스트 -->
								<div id="reviewList">
									<c:forEach var="i" items="${review}">
										<div class="thumbnail hbshadow3" style="padding:15px;" id="review${i.cbidx}">
											<div class="writerinfo">
												<c:if test="${i.img != null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/stay/displayFile.do?fileName=${i.img});"></div>
												</c:if>
												<c:if test="${i.img == null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:if>
												
												<p style="display:inline-block;">
													<span class="hfc-darkgray">${i.nickname} </span>
													<span class="hfc-semibold hfc-gray"> | ${i.wdate} </span>
													<span style="vertical-align:text-bottom"> <img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30" style="vertical-align:text-bottom"> ${i.star} </span>
													<c:if test="${i.midx == login.midx}">
													<button onclick="reviewDeleteFn(${i.cbidx})" style="background:none;border:none;"><img src="<%=request.getContextPath()%>/image/button/delete.png" style="width:25px;"></button>
													<button onclick="reviewModifyFn(${i.cbidx})" style="background:none;border:none;"><img src="<%=request.getContextPath()%>/image/button/edit.png" style="width:25px;"></button>
												</c:if>
												</p>
											</div>
											<div class="caption">
												<c:if test="${i.photo != null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/stay/displayFile.do?fileName=${i.photo});"></div>
												</c:if>
												<h4>${i.content}</h4>
											</div>
										</div>
										<br>
									</c:forEach>
								</div>


								<!-- 리뷰 페이징 -->
								<div class="row pagenation" id="reviewPaging">
									<div class="col d-flex justify-content-center">
										<c:if test="${pm.prev == true}">
											<a class="hfc-gray hfc-bold" href="javascript:reviewPaging(${pm.startPage-1})">◀</a>
										</c:if>
										<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
										<c:choose>
										<c:when test="${search.page != null && i == search.page}">
											<a class="hfc-white hfc-bold hbg-pink mx-1" href="javascript:reviewPaging(${i})">${i}</a>
										</c:when>
										<c:otherwise>
											<a class="hfc-gray hfc-bold mx-1" href="javascript:reviewPaging(${i})">${i}</a>
										</c:otherwise>
										</c:choose>
										</c:forEach>
										<c:if test="${pm.next == true}">
											<a class="hfc-gray hfc-bold" href="javascript:reviewPaging(${pm.endPage+1})">▶</a>
										</c:if>
									</div>
								</div>


							</div>
						</div>
						<!-- /리뷰 col -->
					</div>
					<!-- /리뷰 row -->

					
					<div class="row btnarea">
						<div class="col-6 d-flex justify-content-start">
							<c:if test="${login != null && (login.midx == stay.midx || login.role == 'admin')}">
								<button id="stayDeleteBtn"><img src="<%=request.getContextPath()%>/image/button/delete.png"></button>
								<button onclick="location.href='stayModify.do?sidx=${stay.sidx}'"><img src="<%=request.getContextPath()%>/image/button/edit.png"></button>
								<button onclick="location.href='stayWrite.do'"><img src="<%=request.getContextPath()%>/image/button/add.png"></button>
							</c:if>
						</div>
						<div class="col-6 d-flex justify-content-end">
							<%-- <button onclick="shareSNS('facebook')">
								<img src="<%=request.getContextPath()%>/image/button/sns5.png">
							</button>
							<button onclick="shareSNS('twitter')">
								<img src="<%=request.getContextPath()%>/image/button/sns8.png">
							</button> --%>
							<button onclick="shareSNS('kakao')" id="kakaoBtn">
								<img src="<%=request.getContextPath()%>/image/button/share.png" style="width:25px;">
							</button>
						</div>
					</div>
					

					<hr class="lastline">

					<a class=" onlypc" href="stayList.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					<!-- 리스트 카드 -->




				</div><!-- /.container -->
			</div><!-- /.contents -->

			<!-- banner --><%@include file="../banner.jsp"%>

		</div><!-- / #container -->

		<!-- Footer --><%@include file="../Footer.jsp"%>

	</div>
	<!-- /#wrap -->

	<script>
	jQuery(document).ready(function($) {
	    $('.slider-for').slick({
	        slidesToShow: 1,
	        slidesToScroll: 1,
	        arrows: false,
	        fade: true,
	        asNavFor: '.slider-nav'
	    });
	    $('.slider-nav').slick({
	        slidesToShow: 6,
	        slidesToScroll: 1,

	        asNavFor: '.slider-for',
	        dots: false,
	        focusOnSelect: true,
	        responsive: [{
	                breakpoint: 992,
	                settings: {
	                    vertical: false,
	                }
	            },
	            {
	                breakpoint: 768,
	                settings: {
	                    vertical: false,
	                }
	            },
	            {
	                breakpoint: 580,
	                settings: {
	                    vertical: false,
	                    slidesToShow: 3,
	                }
	            },
	            {
	                breakpoint: 380,
	                settings: {
	                    vertical: false,
	                    slidesToShow: 2,
	                }
	            }
	        ]
	    });
	});

	</script>


	<script>
	$(function(){
		//태그 파싱
		var json = '${stay.tag}';
		var jsonParse = JSON.parse(json);
		var tags = "";
		$.each(jsonParse,function(idx){
			tags = tags+jsonParse[idx]["value"]+"<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
		})
		$("#tagArea").html(tags);
		
		
		//tab 버튼 이벤트
		$("#roomTabBtn").on("click", function(){
			$("#roomTab").show();
			$("#stayTab").hide();
			$("#reviewTab").hide();
			
			$("#roomTabBtn").css("color","#D43654");
			$("#roomTabBtn").css("border-bottom","4px solid #D43654");
			$("#stayTabBtn").css("color","#9E9E9E");
			$("#stayTabBtn").css("border-bottom","none");
			$("#reviewTabBtn").css("color","#9E9E9E");
			$("#reviewTabBtn").css("border-bottom","none");
		});
		$("#stayTabBtn").on("click",function(){
			$("#roomTab").hide();
			$("#stayTab").show();
			$("#reviewTab").hide();
			
			$("#roomTabBtn").css("color","#9E9E9E");
			$("#roomTabBtn").css("border-bottom","none");
			$("#stayTabBtn").css("color","#D43654");
			$("#stayTabBtn").css("border-bottom","4px solid #D43654");
			$("#reviewTabBtn").css("color","#9E9E9E");
			$("#reviewTabBtn").css("border-bottom","none");
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(0, 0), // 지도의 중심좌표
			        level: 4 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${stay.addr}', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			        	map: map,
			            position: coords
			        });
			        
			    	// 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:1px 0;">${stay.name}</div>'
			        });
			        infowindow.open(map, marker);
			        
			        setTimeout(function(){
			        	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
			        	map.relayout();
			        	map.setCenter(coords);
			        	map.relayout();
			        },1000);
			    }
			});
		});
		$("#reviewTabBtn").on("click",function(){
			$("#roomTab").hide();
			$("#stayTab").hide();
			$("#reviewTab").show();
			
			$("#roomTabBtn").css("color","#9E9E9E");
			$("#roomTabBtn").css("border-bottom","none");
			
			$("#stayTabBtn").css("color","#9E9E9E");
			$("#stayTabBtn").css("border-bottom","none");
			
			$("#reviewTabBtn").css("color","#D43654");
			$("#reviewTabBtn").css("border-bottom","4px solid #D43654");
		});
		
		
		//숙박 정보 삭제
		$("#stayDeleteBtn").on("click",function(){
			var check = confirm("정말로 숙박정보를 삭제하시겠습니까?");
			
			if(check == false) return;
			else if(check == true){
				var sidx = "${stay.sidx}";
				$.ajax({
					url:"stayDelete.do",
					data:"sidx="+sidx,
					type:"post",
					success:function(data){
						if(data == 1){
							modalFn("글이 삭제되었습니다.");
							setTimeout(function(){
								modalClose();
								location.href="stayList.do";
							},1000);
							//alert("글이 삭제되었습니다");
							
						}
					}
				});
			}
		});//숙박 정보 삭제
		
		
		//오늘 날짜 이전 선택 못하게 하기
		var nowDate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -14);//오늘날짜
		var nownow = new Date();
		nownow.setDate(nownow.getDate()+1);
		var nextDate = nownow.getFullYear()+"-"+('0'+(nownow.getMonth()+1)).slice(-2)+"-"+('0'+nownow.getDate()).slice(-2);//내일날짜
		$("#date1").attr("min",nowDate);//오늘 날짜 이전 선택 못하게 하기
		$("#date2").attr("min",nextDate);//내일 날짜 이전 선택 못하게 하기
		
		
		//시작날짜 - 종료날짜 이후 선택 불가
		$("#date2").on("change",function(){
			var endday = $("#date2").val();
			$("#date1").attr("max",endday);
		});
		
		//종료날짜 - 시작날짜 이전 선택 불가
		$("#date1").on("change",function(){
			var startday = $("#date1").val();
			$("#date2").attr("min",startday);
		});
		
		
		//찜 버튼 이벤트
		$("#heartBtn").click(function(){
			var bidx = "${stay.sidx}";
			
			if(heartDup == true){
				$.ajax({
					url:"<%= request.getContextPath() %>/howf/heartDelete.do",
					type:"post",
					data:"type=stay&bidx="+bidx,
					success:function(data){
						if(data==1){
							heartDup = false;
							$("#heartBtn").attr("src","<%=request.getContextPath()%>/image/button/lineheart.png");
							var n = $("#heartNum").text();
							var heartNum = Number(n);
							$("#heartNum").text(heartNum-1);
							modalFn("찜 목록에서 제거되었습니다.");
							setTimeout(function(){
								modalClose();
							},1000);
						}
					}
				});
			}
			else if(heartDup == false){
				$.ajax({
					url:"<%= request.getContextPath() %>/howf/heartInsert.do",
					type:"post",
					data:"type=stay&bidx="+bidx,
					success:function(data){
						if(data==1){
							heartDup = true;
							$("#heartBtn").attr("src","<%=request.getContextPath()%>/image/button/heart.png");
							var n = $("#heartNum").text();
							var heartNum = Number(n);
							$("#heartNum").text(heartNum+1);
							modalFn("찜 목록에 추가되었습니다.");
							setTimeout(function(){
								modalClose();
							},1000);
						}
						else {
							modalFn("찜 목록 추가 오류입니다.");
							setTimeout(function(){
								modalClose();
							},1000);
						}
					}
				});
			}
		});
	});
	
	//객실이용 안내 보이기
	function roomInfoFn(index){
		$("#roomInfoModal"+index).show();
	}
	//객실 이용 안내 닫기
	function roomInfoClose(index){
		$("#roomInfoModal"+index).hide();
	}
	
	//리뷰 페이지 이동
	function reviewPaging(index){
		$("#page").val(index);
		reviewListAjax(index);
	}
	
	//사진 누르면 큰 사진 바꾸기
	function photoChange(photo){
		$("#mainImage").attr("src","<%=request.getContextPath() %>/stay/displayFile.do?fileName="+photo);
	}
	
	
	//리뷰쓰기
	$("#reviewWriteBtn").on("click",function(){
		var login = '<%= (UserVO)session.getAttribute("login") %>';
		var loginRole = '${login.role}';
		if(login == "null"){
			modalFn("로그인이 필요합니다.");
			setTimeout(function(){
				modalClose();
				return;
			},1000);
		}
		else if(loginRole != 'normal'){
			modalFn("일반회원만 글쓰기가 가능합니다.");
			setTimeout(function(){
				modalClose();
				return;
			},1000);
		}
		else {
			//유효성 검사
			if($("#reviewContent").val()==""){
				modalFn("리뷰 내용을 작성해주세요");
				setTimeout(function(){
					modalClose();
					return;
				},1000);
			}
			else {
				//리뷰 중복 체크 ajax
				$.ajax({
					url:"reviewDup.do",
					data:"bidx=${stay.sidx}",
					type:"post",
					success:function(dup){
						if(dup == 0){
							//리뷰 작성 ajax
							var formData = new FormData($("#reviewFrm")[0]);
							$.ajax({
								url:"reviewWrite.do",
								data:formData,
								type:"post",
								cache:false,
								contentType:false,
								processData:false,
								success:function(data){
									if(data==1){
										modalFn("글이 작성되었습니다.");
										setTimeout(function(){
											modalClose();
											$("#reviewContent").val("");
											$("#file").val("");
											$("#file").replaceWith($("#file").clone(true));
											reviewListAjax(1);
										},1000);
									}
								}
							});//리뷰 작성 ajax
							
						}
						else {
							modalFn("리뷰는 한번만 등록할 수 있습니다.");
							setTimeout(function(){
								modalClose();
								$("#reviewContent").val("");
								$("#file").val("");
								$("#file").replaceWith($("#file").clone(true));
								return;
							},1000);
						}
					}
				});//리뷰 중복 체크 ajax
			}
		}
	});//리뷰쓰기 function
	
	
	//리뷰 리스트 그리기
	function reviewListAjax(page){
		//리뷰 리스트 불러오기
		$.ajax({
			url:"reviewSelect.do",
			data:"bidx=${stay.sidx}&page="+page,
			type:"post",
			success:function(list){
				//그려주기
				var html = '';
				for(var i=0;i<list.length;i++){
					html = html + '<div class="thumbnail hbshadow3" style="padding:15px;" id="review'+list[i].cbidx+'">'
						+ '<div class="writerinfo">';
						
					if(list[i].img != null){
						html = html
						+ '<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/stay/displayFile.do?fileName='+list[i].img+');"></div>';
						
					}
					else {
						html = html
						+ '<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>';
					}
						
					html = html
					+ '<p style="display:inline-block;">'
					+ '<span class="hfc-darkgray">'+list[i].nickname+' </span>'
					+ '<span class="hfc-semibold hfc-gray"> | '+list[i].wdate+' </span>'
					+ '<span style="vertical-align:text-bottom"> <img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30" style="vertical-align:text-bottom"> '+list[i].star+' </span>';
					
					
					<c:if test="${login != null}">
					var login = "${login.midx}";
					if(login == list[i].midx){
						html = html
						+ '<button onclick="reviewDeleteFn('+list[i].cbidx+')" style="background:none;border:none;"><img src="<%=request.getContextPath()%>/image/button/delete.png" style="width:25px;"></button>'
						+ '<button onclick="reviewModifyFn('+list[i].cbidx+')" style="background:none;border:none;"><img src="<%=request.getContextPath()%>/image/button/edit.png" style="width:25px;"></button>';
					}
					</c:if>
					
					html  = html
					+ '</p>'
					+ '</div>'
					+ '<div class="caption">';
					
					if(list[i].photo != null){
						html = html
						+ '<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/stay/displayFile.do?fileName='+list[i].photo+');"></div>';
					}
					
					html = html
					+ '<h4>'+list[i].content+'</h4>'
					+ '</div>'
					+ '</div><br>';
				}//for
				
				$("#reviewList").html(html);
				
				//리뷰 페이징
				$.ajax({
					url:"reviewPaging.do",
					data:"bidx=${stay.sidx}",
					type:"post",
					success:function(paging){
						//페이징 만들기
						var p = '';
						
						p = p
						+ '<div class="col d-flex justify-content-center">';
						
						if(paging.prev == true){
							p = p + '<a class="hfc-gray hfc-bold" href="javascript:reviewPaging('+(paging.startPage-1)+')">◀</a>';
						}
						
						for(var i=paging.startPage;i<=paging.endPage;i++){
							if(page == i){
								p = p + '<a href="javascript:reviewPaging('+i+')" class="hfc-white hfc-bold hbg-pink mx-1">'+i+'</a>';
							}
							else {
								p = p + '<a href="javascript:reviewPaging('+i+')" class="hfc-gray hfc-bold mx-1">'+i+'</a>';
							}
						}
						
						if(paging.next == true){
							p = p + '<a class="hfc-gray hfc-bold" href="javascript:reviewPaging('+(paging.endPage+1)+')">▶</a>';
						}
						
						p = p
						+ '</div>';
						
						$("#reviewPaging").html(p);
						
						//별점 변경
						$.ajax({
							url:"stayStar.do",
							data:"bidx=${stay.sidx}",
							type:"post",
							success:function(star){
								$("#stayStarArea").html(star.toFixed(1));
							}
						});
						
					}
				});//페이징 ajax
			}
		});//리스트 ajax
	}//리뷰 리스트 그리기
	
	
	
	//리뷰 수정
	function reviewModifyFn(cbidx){
		var index = $("#page").val();
		$("#reviewM").remove();
		
		$.ajax({
			url:"reviewModify.do",
			data:"cbidx="+cbidx,
			type:"get",
			async:false,
			success:function(list){
				var html = '<div>'
					+ '<form id="reviewM" enctype="multipart/form-data" class="row g-2">'
					+ '<div class="col-11">'
					+ '<textarea placeholder="리뷰를 작성해주세요" name="content" id="reviewMContent" class="form-control" style="resize:none;">'+list.content+'</textarea>'
					+ '<div class="star-rating">'
					+ '<input type="radio" id="M5-stars" name="star" value="5"/>'
					+ '<label for="M5-stars" class="star">&#9733;</label>'
					+ '<input type="radio" id="M4-stars" name="star" value="4" />'
					+ '<label for="M4-stars" class="star">&#9733;</label>'
					+ '<input type="radio" id="M3-stars" name="star" value="3"/>'
					+ '<label for="M3-stars" class="star">&#9733;</label>'
					+ '<input type="radio" id="M2-stars" name="star" value="2" />'
					+ '<label for="M2-stars" class="star">&#9733;</label>'
					+ '<input type="radio" id="M1-star" name="star" value="1" />'
					+ '<label for="M1-star" class="star">&#9733;</label>'
					+ '</div><br>'
					+ '<input type="file" id="Mfile" name="file">'
					+ '<input type="hidden" name="cbidx" value="'+cbidx+'">'
					+ '<input type="hidden" name="bidx" value="${stay.sidx}">'
					+ '</div>'
					+ '<div class="col-1">'
					+ '<button type="button" onclick="reviewMFn('+index+')" style="border:none;background:none;"><img src="<%=request.getContextPath()%>/image/button/add.png" style="max-heigth:50px; max-width:50px;"></button>'
					+ '</div>'
					+ '</form></div>';
				
				$("#review"+cbidx).html(html);
				$("input:radio[name=star]:input[value="+list.star+"]").prop("checked",true);
				
				
			}//success
			
		});

	}//리뷰 수정
	
	//리뷰 수정 클릭 이벤트
	function reviewMFn(index){
		var content = $("#reviewMContent");
		if(content.val()==""){
			modalFn("리뷰 내용을 입력해주세요");
			setTimeout(function(){
				modalClose();
				content.focus();
				return;
			},1000);
		}
		else {
			var formData = new FormData($("#reviewM")[0]);
			$.ajax({
				url:"reviewModify.do",
				data:formData,
				cache:false,
				contentType:false,
				processData:false,
				async:false,
				type:"post",
				success:function(data){
					if(data == 1){
						modalFn("리뷰가 수정되었습니다.");
						setTimeout(function(){
							modalClose();
							reviewListAjax(index);
							return;
						},1000);
					}
				}
			});
		}
	}
	
	//리뷰 삭제
	function reviewDeleteFn(cbidx){
		$("#review"+cbidx).append("<input type='hidden' id='tmpIndex' value='"+cbidx+"'>");
		modalFn("정말로 해당 리뷰를 삭제하시겠습니까?","삭제","삭제하기","취소","reviewDeleteModalFn");
	}
	function reviewDeleteModalFn(){
		var cbidx = $("#tmpIndex").val();
		$.ajax({
			url:"reviewDelete.do",
			data:"cbidx="+cbidx,
			type:"post",
			async:false,
			success:function(data){
				if(data == 1){
					modalClose();
					modalFn("리뷰가 삭제되었습니다.");
					setTimeout(function(){
						$("#tmpIndex").remove();
						modalClose();
						reviewListAjax(1);
						return;
					},1000);
				}
			}
		});
	}
	
	//예약하기
	function stayReservation(sidx, stayName, roomName, price, people, square, tags){
		//날짜 받아와서 날짜 선택 안했으면 날짜 선택해 달라고 띄우기
		//남은 객실이 없으면 해당 날짜에 남은 객실이 없다고 띄우기
		//날짜도 잘 선택했고 남은 객실도 잇으면 예약 페이지로 이동
		//예약 페이지로 이동시 객실 정보 가지고 가기
		
		var date1 = $("#date1").val();
		var date2 = $("#date2").val();
		
		var login = '<%=(UserVO) session.getAttribute("login")%>';
		if(login == "null"){
			modalFn("로그인이 필요합니다.");
			setTimeout(function(){
				modalClose();
				return;
			},1000);
		}
		else if(date1==""){
			modalFn("체크인 날짜를 선택해주세요");
			setTimeout(function(){
				modalClose();
				return;
			},1000);
		}
		else if(date2==""){
			modalFn("체크아웃 날짜를 선택해주세요");
			setTimeout(function(){
				modalClose();
				return;
			},1000);
		}
		else if(date1>date2){
			modalFn("체크인 날짜가 체크아웃 날짜보다 이후일 수 없습니다.");
			setTimeout(function(){
				modalClose();
				return;
			},1000)
			
		}
		else {
			var dd = "sidx="+sidx+"&rname="+roomName+"&price="+price+"&people="+people+"&square="+square+"&tags="+tags+"&date1="+date1+"&date2="+date2;
			//중복 가예약인지 아닌지 여부 판단
			$.ajax({
				url:"resDup.do",
				data:dd,
				type:"post",
				success:function(dup){
					if(dup.ridx != undefined){
						modalFn("예약이 진행중인 건이 있습니다. 해당 건의 결제를 완료해주세요");
						setTimeout(function(){
							modalClose();
							var data1 = "sname="+stayName+"&ridx="+dup.ridx+"&rname="+roomName+"&price="+price+"&date1="+dup.date1+"&date2="+dup.date2+"&merchant="+dup.merchant;
							location.href='stayReservation.do?'+data1;
							return;
						},1000);
						
					}
					else {
						//ajax로 해당 유형의 숙소 ridx 가져오기
						$.ajax({
							url:"roomRidx.do",
							data:dd,
							type:"post",
							success:function(data){
								//숙소 이름, 객실 이름, 객실 가격, 체크인 날짜, 체크아웃 날짜
								var data2 = "sname="+stayName+"&ridx="+data+"&rname="+roomName+"&price="+price+"&date1="+date1+"&date2="+date2;
								location.href='stayReservation.do?'+data2;
							}
						});//ridx 가져오고 이동
					}
				}
			});//가예약 중복 여부 판단 후 이동
		}
		
	}//예약하기
	
	//날짜 검색
	function dateSearch(){
		var date1 = $("#date1").val();
		var date2 = $("#date2").val();
		
		if(date1>date2){
			modalFn("체크인 날짜가 체크아웃 날짜보다 이후일 수 없습니다.");
			setTimeout(function(){
				modalClose();
				return;
			},1000);
		}
		else {
			location.href='stayView.do?sidx=${stay.sidx}&date1='+date1+'&date2='+date2;
		}
	}
	
	//sns 공유
	function shareSNS(sns){
		var thisUrl = document.URL;
		console.log(thisUrl);
		
		var snsTitle = "${stay.name}";
		if(sns=='facebook'){
			var url = "http://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(thisUrl);
	        window.open(url, "", "width=486, height=286");
		}
		else if(sns=='twitter'){
			var url = "http://twitter.com/share?url="+encodeURIComponent(thisUrl)+"&text="+encodeURIComponent(snsTitle);
	        window.open(url, "tweetPop", "width=486, height=286,scrollbars=yes");
		}
		else if(sns=='kakao'){
			var photo = "${fn:split(stay.photo,',')[0]}";
			console.log(photo);
			Kakao.init('35c7c8bf307063859390df8e61188fbf');
			//Kakao.isInitialized();
			Kakao.Link.createDefaultButton({
				container:'#kakaoBtn',
				objectType:'feed',
				content:{
					title:snsTitle,
					description: snsTitle,
					imageUrl:'http://jjezen.cafe24.com/howf/stay/displayFile.do?fileName='+photo,
					link:{
						mobileWebUrl:thisUrl,
						webUrl:thisUrl
					}
				}
			});
		}
	}
	
</script>
</body>
</html>
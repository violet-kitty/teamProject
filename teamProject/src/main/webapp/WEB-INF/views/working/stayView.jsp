<%@page import="edu.howf.vo.UserVO"%>
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

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
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

<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- 카카오 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35c7c8bf307063859390df8e61188fbf&libraries=services"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardView공용세팅 --> <link href="<%=request.getContextPath()%>/css/boardView.css" rel="stylesheet">

<style>
.star-rating {
	  display:flex;
	  flex-direction: row-reverse;
	  font-size:1em;
	  justify-content:space-around;
	  padding:0 .2em;
	  text-align:center;
	  width:5em;
	}

	.star-rating input[type=radio] {
	  display:none;
	}

	.star-rating label {
	  color:#ccc;
	  cursor:pointer;
	}

	.star-rating :checked ~ label {
	  color:#f90;
	}

	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  color:#fc0;
	}
</style>

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
	<div id="wrap" class="boardview stay stayview">
	
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side (top버튼)-->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">
			
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
				    <!-- pagehead  -->
					<a class=" onlypc" href="stayList.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					
					<!-- 뷰 -->
					<div class="row">
				<div class="col-lg-6">
		<c:if test="${stay.photo != null}">
			<div id="page">
				<div class="row">
					<div class="column small-11 small-centered">
						<h2>Slick Slider Syncing</h2>
						<div class="slider slider-single">
							<div><img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${fn:split(stay.photo,',')[0]}" style="max-width:200px" id="mainImage"><br></div>
						</div>
						<div class="slider slider-nav">
							<c:forEach var="item" items="${fn:split(stay.photo,',')}">
								<div><img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${item}" style="max-width:100px;cursor:pointer;" onclick="photoChange('${item}')"></div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:if>
			<style>

.js .slider-single > div:nth-child(1n+2) { display: none }

.js .slider-single.slick-initialized > div:nth-child(1n+2) { display: block }

h3 {
	background: #f0f0f0;
	color: #3498db;
	font-size: 2.25rem;
	margin: .5rem;
	padding: 2%;
	position: relative;
	text-align: center;
}

.slider-single h3 {
	line-height: 10rem;
}

.slider-nav h3::before {
	content: "";
	display: block;
	padding-top: 75%;
}

.slider-nav h3 span {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.slider-nav .slick-slide { cursor: pointer; }

.slick-slide.is-active h3 {
	color: #c00;
	background-color: #fff
}
			</style>
			<script>
			 $('.slider-single').slick({
				 	slidesToShow: 1,
				 	slidesToScroll: 1,
				 	arrows: true,
				 	fade: false,
				 	adaptiveHeight: true,
				 	infinite: false,
					useTransform: true,
				 	speed: 400,
				 	cssEase: 'cubic-bezier(0.77, 0, 0.18, 1)',
				 });

				 $('.slider-nav')
				 	.on('init', function(event, slick) {
				 		$('.slider-nav .slick-slide.slick-current').addClass('is-active');
				 	})
				 	.slick({
				 		slidesToShow: 7,
				 		slidesToScroll: 7,
				 		dots: false,
				 		focusOnSelect: false,
				 		infinite: false,
				 		responsive: [{
				 			breakpoint: 1024,
				 			settings: {
				 				slidesToShow: 5,
				 				slidesToScroll: 5,
				 			}
				 		}, {
				 			breakpoint: 640,
				 			settings: {
				 				slidesToShow: 4,
				 				slidesToScroll: 4,
							}
				 		}, {
				 			breakpoint: 420,
				 			settings: {
				 				slidesToShow: 3,
				 				slidesToScroll: 3,
						}
				 		}]
				 	});

				 $('.slider-single').on('afterChange', function(event, slick, currentSlide) {
				 	$('.slider-nav').slick('slickGoTo', currentSlide);
				 	var currrentNavSlideElem = '.slider-nav .slick-slide[data-slick-index="' + currentSlide + '"]';
				 	$('.slider-nav .slick-slide.is-active').removeClass('is-active');
				 	$(currrentNavSlideElem).addClass('is-active');
				 });

				 $('.slider-nav').on('click', '.slick-slide', function(event) {
				 	event.preventDefault();
				 	var goToSingleSlide = $(this).data('slick-index');

				 	$('.slider-single').slick('slickGoTo', goToSingleSlide);
				 });
			</script>
					
				</div>
				<div class="col-lg-6">
					<div class="col-lg-8 d-flex justify-content-start">
						<c:choose>
							<c:when test="${login != null && login.role == 'normal'}">
								<c:if test="${heart!=null && heart==1}">
									<img src="<%=request.getContextPath()%>/image/button/heart.png" style="cursor:pointer;" id="heartBtn">
								</c:if>
								<c:if test="${heart!=null && heart==0}">
								<img src="<%=request.getContextPath()%>/image/button/lineheart.png" style="cursor:pointer;" id="heartBtn">
								</c:if>
							</c:when>
							<c:otherwise>
								<img src="<%=request.getContextPath()%>/image/button/heart.png">
							</c:otherwise>
						</c:choose>
						${stay.name}
					</div>
					<div class="col-lg-4 d-flex justify-content-end">
						<img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">
						<span class="ms-1" id="stayStarArea">${stay.star}</span>
						<img src="<%=request.getContextPath()%>/image/redheart.png" width="30" height="30">
						<span class="ms-1" id="heartNum">${stay.heart}</span>
					</div>
					<div class="col-lg-6">
						<div class="col-lg-12 d-flex justify-content-start">
							${stay.addr}
						</div>
					</div>
					<div class="col-lg-6" style="border:1px solid black">
						<p>간단정보</p>
						<p>${fn:split(stay.contents,',')[0]}</p>
					</div>
					<div class="col-lg-6" id="tagArea">
					</div>
				</div>
				
			</div>
			
			
			<!-- 객실안내, 숙소정보, 리뷰 탭 -->
			<div class="row">
				<div class="col">
					<button id="roomTabBtn" style="color:green">객실안내/예약</button>
					<button id="stayTabBtn">숙소정보</button>
					<button id="reviewTabBtn">리뷰</button>
				</div>
			</div>
			
			<c:set var="index" value="0" />
			<!-- 객실 안내/예약 -->
			<div class="row" id="roomTab">
				<div class="col-12 d-flex justify-content-center" style="text-align:center">
					<div class="col-4 d-flex justify-content-end">
						<input class="form-control" type="date" id="date1" name="date1" value="${res.date1}">
					</div>
					<div class="col-1 d-flex justify-content-center">
						<span> - </span>
					</div>
					<div class="col-4 d-flex justify-content-start">
						<input class="form-control" type="date" id="date2" name="date2" value="${res.date2}">
					</div>
					<div class="col-3 d-flex justify-content-start">
						<button class="mx-3" onclick="dateSearch()">날짜 검색</button>
					</div>
				</div>
				<c:forEach var="v" items="${stay.room}">
		    		<div class="col-sm-12 col-md-12 col-lg-4" >
				    	<div class="card shadow-sm">
							<c:if test="${v.photo != null}">
								<img class="card-img-top" src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${fn:split(v.photo,',')[0]}">
							</c:if>
							<div class="card-body">
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<span>${v.name}</span>
									</div>
									<small class="text-muted">
										<span>남은 객실 ${v.cnt}개</span>
									</small>
								</div>
								<div class="d-flex justify-content-start">
									<p>${v.price}</p>
								</div>
								<div class="d-flex justify-content-start">
									<button onclick="roomInfoFn('${index}')">객실 이용 안내</button>
								</div>
								<div class="d-flex justify-content-start">
									<c:if test="${login != null && login.role == 'normal'}">
									<c:if test="${v.cnt != 0}">
										<button onclick="stayReservation('${stay.sidx}','${stay.name}','${v.name}','${v.price}','${v.people}','${v.square}','${v.tags}')">예약하기</button>
									</c:if>
									<c:if test="${v.cnt == 0}">
										<button style="cursor:default">예약불가</button>
									</c:if>
									</c:if>
									
								</div>
							</div><!-- card-body end -->
						</div>
					</div>
					
					<div class="col" style="display:none" id="roomInfoModal${index}">
						<div><button onclick="roomInfoClose('${index}')">x</button></div>
			    		<p>객실 이용 안내</p>
			    		<hr>
			    		<p>기본 정보</p>
			    		<p>적정 인원 ${v.people}인</p>
			    		<p>객실+욕실/${v.square}평</p>
			    		<p>침대</p>
			    		<p>
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
			    		<p>${v.tags}</p>
			    	</div>
			    	<c:set var="index"  value="${index+1}"/>
		    	</c:forEach>
			</div>
			
			
			<!-- 숙소정보 -->
			<div class="row" id="stayTab" style="display:none">
				<div class="col">
					<div>
						<p>주변정보</p>
						<!-- 아래 내용 꼭 div에 넣기. 안그럼 줄바꿈 안됨 -->
						<div>${fn:split(stay.contents,',')[1]}</div>
					</div>
					<div>
						<p>공지사항</p>
						<div>${fn:split(stay.contents,',')[2]}</div>
					</div>
					<div>
						<p>기본 정보</p>
						<div>${fn:split(stay.contents,',')[3]}</div>
					</div>
					<div>
						<p>현장 결제</p>
						<div>${fn:split(stay.contents,',')[4]}</div>
					</div>
					<div>
						<p>확인사항 및 기타</p>
						<div>${fn:split(stay.contents,',')[5]}</div>
					</div>
					<p>지도</p>
					<div id="map" style="width:100%;height:350px;"></div>
					<div>
						<p>편의시설 및 서비스</p>
						<c:if test="${stay.services != null}">
						<c:forEach var="s" items="${fn:split(stay.services,',')}">
						<span style="border:1px solid black">${s}</span> 
						</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			
			<!-- 리뷰 -->
			<div class="row" id="reviewTab" style="display:none">
				<div class="col">
					<p>리뷰</p>
					<div>
						<!-- 리뷰쓰기 창 -->
						<div style="border:1px solid black">
							<p>이 숙소 리뷰 ${stay.cnt}</p>
							<form id="reviewFrm" enctype="multipart/form-data">
								<textarea rows="3" cols="20" placeholder="댓글" name="content" id="reviewContent"></textarea>
								<div class="star-rating">
									<input type="radio" id="5-stars" name="star" value="5" checked/>
									<label for="5-stars" class="star">&#9733;</label>
									<input type="radio" id="4-stars" name="star" value="4" />
									<label for="4-stars" class="star">&#9733;</label>
									<input type="radio" id="3-stars" name="star" value="3"/>
									<label for="3-stars" class="star">&#9733;</label>
									<input type="radio" id="2-stars" name="star" value="2" />
									<label for="2-stars" class="star">&#9733;</label>
									<input type="radio" id="1-star" name="star" value="1" />
									<label for="1-star" class="star">&#9733;</label>
								</div>
								<input type="file" id="file" name="file">
								<input type="hidden" name="bidx" value="${stay.sidx}">
								<button type="button" id="reviewWriteBtn">리뷰 작성</button>
							</form>
						</div>
						
						<br>
						
						
						<!-- page 정보 -->
						<input type="hidden" id="page" value="${vo.page}">
						<!-- 리뷰 리스트 -->
						<div id="reviewList">
							<c:forEach var="i" items="${review}">
							<div style="border:1px solid black" id="reviewL${i.cbidx}">
								<p>${i.nickname}</p>
								<p>
								<img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">
								${i.star}
								</p>
								<c:if test="${i.photo != null}">
								<p><img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${i.photo}" style="max-width:100px"></p>
								</c:if>
								<p>${i.content}</p>
								<c:if test="${i.midx == login.midx}">
								<button onclick="reviewModifyFn(${i.cbidx})">수정</button>
								<button onclick="reviewDeleteFn(${i.cbidx})">삭제</button>
								</c:if>
							</div>
							</c:forEach>
						</div>
						
						
						<!-- 리뷰 페이징 -->
						<div id="reviewPaging">
							<c:if test="${pm.prev == true}">
								<a href="javascript:reviewPaging(${pm.startPage-1})">◀</a>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<c:if test="${i==pm.startPage}">
									<a href="javascript:reviewPaging(${i})" style="font-weight:bold;color:green;">${i}</a>
								</c:if>
								<c:if test="${i!=pm.startPage}">
								<a href="javascript:reviewPaging(${i})">${i}</a>
								</c:if>
							</c:forEach>
							<c:if test="${pm.next == true}">
								<a href="javascript:reviewPaging(${pm.endPage+1})">▶</a>
							</c:if>
						</div>
						
						
					</div>
				</div><!-- /리뷰 col -->
			</div><!-- /리뷰 row -->
			
			
			<!-- 삭제, 수정, 글쓰기 버튼 -->
			<div class="row">
				<div class="col">
					<c:if test="${login != null && (login.midx == stay.midx || login.role == 'admin')}">
					<button id="stayDeleteBtn">삭제</button>
					<button onclick="location.href='stayModify.do?sidx=${stay.sidx}'">수정</button>
					<button onclick="location.href='stayWrite.do'">글쓰기</button>
					</c:if>
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
			<!-- /pagehead -->
			
			<!-- banner --><%@include file="../banner.jsp"%>
			
		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	
	</div><!-- /#wrap -->


<script>
	$(function(){
		//태그 파싱
		var json = '${stay.tag}';
		var jsonParse = JSON.parse(json);
		var tags = "";
		$.each(jsonParse,function(idx){
			tags = tags+jsonParse[idx]["value"]+" ";
		})
		$("#tagArea").text(tags);
		
		
		//tab 버튼 이벤트
		$("#roomTabBtn").on("click", function(){
			$("#roomTab").show();
			$("#stayTab").hide();
			$("#reviewTab").hide();
			
			$("#roomTabBtn").css("color","green");
			$("#stayTabBtn").css("color","black");
			$("#reviewTabBtn").css("color","black");
		});
		$("#stayTabBtn").on("click",function(){
			$("#roomTab").hide();
			$("#stayTab").show();
			$("#reviewTab").hide();
			
			$("#roomTabBtn").css("color","black");
			$("#stayTabBtn").css("color","green");
			$("#reviewTabBtn").css("color","black");
			
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
			
			$("#roomTabBtn").css("color","black");
			$("#stayTabBtn").css("color","black");
			$("#reviewTabBtn").css("color","green");
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
				var num = 0;
				for(var i=0;i<list.length;i++){
					html = html + '<div style="border:1px solid black" id="reviewL'+list[i].cbidx+'">'
						+ '<p>'+list[i].nickname+'</p>'
						+ '<p><img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">'
						+ list[i].star+'</p>';
						
					if(list[i].photo != null){
						html = html+'<p><img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName='+list[i].photo+'" style="max-width:100px"></p>';
					}
						
					html = html + '<p>'+list[i].content+'</p>';
					
					<c:if test="${login != null}">
					var login = "${login.midx}";
					if(login == list[i].midx){
						html = html + '<button onclick="reviewModifyFn('+list[i].cbidx+')">수정</button>'
						+ '<button onclick="reviewDeleteFn('+list[i].cbidx+')">삭제</button>';
						
						num++;
					}
					</c:if>
					
					html = html + '</div>';
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
						
						if(paging.prev == true){
							p = p + '<a href="javascript:reviewPaging('+(paging.startPage-1)+')">◀</a>';
						}
						
						for(var i=paging.startPage;i<=paging.endPage;i++){
							if(page == i){
								p = p + '<a href="javascript:reviewPaging('+i+')" class="mx-1" style="font-weight:bold;color:green;">'+i+'</a>';
							}
							else {
								p = p + '<a href="javascript:reviewPaging('+i+')" class="mx-1">'+i+'</a>';
							}
						}
						
						if(paging.next == true){
							p = p + '<a href="javascript:reviewPaging('+(paging.endPage+1)+')">▶</a>';
						}
						
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
				var html = '<form id="reviewM" enctype="multipart/form-data">'
					+ '<textarea rows="3" cols="20" placeholder="댓글" name="content" id="reviewMContent">'+list.content+'</textarea>'
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
					+ '</div>'
					+ '<input type="file" id="Mfile" name="file">'
					+ '<input type="hidden" name="cbidx" value="'+cbidx+'">'
					+ '<button type="button" onclick="reviewMFn('+index+')">리뷰 작성</button>'
					+ '</form>';
				
				$("#reviewL"+cbidx).html(html);
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
		var check = confirm("정말로 해당 리뷰를 삭제하시겠습니까?");
		
		if(check == false) return;
		else if(check == true){
			$.ajax({
				url:"reviewDelete.do",
				data:"cbidx="+cbidx,
				type:"post",
				async:false,
				success:function(data){
					if(data == 1){
						modalFn("리뷰가 삭제되었습니다.");
						setTimeout(function(){
							modalClose();
							reviewListAjax(1);
							return;
						},1000);
					}
				}
			});
			
		}
	}
	
	//예약하기
	function stayReservation(sidx, stayName, roomName, price, people, square, tags){
		//날짜 받아와서 날짜 선택 안했으면 날짜 선택해 달라고 띄우기
		//남은 객실이 없으면 해당 날짜에 남은 객실이 없다고 띄우기
		//날짜도 잘 선택했고 남은 객실도 잇으면 예약 페이지로 이동
		//예약 페이지로 이동시 객실 정보 가지고 가기
		
		var date1 = $("#date1").val();
		var date2 = $("#date2").val();
		
		var login = '<%= (UserVO)session.getAttribute("login") %>';
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
	
</script>
</body>
</html>
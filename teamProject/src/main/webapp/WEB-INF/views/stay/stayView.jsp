<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="wrap">
		<div class="container">
		
			<div class="row">
				<div class="col">
					<a href="stayList.do">&lt;목록으로 돌아가기</a>
				</div>
			</div>
		
			<div class="row">
				<div class="col-lg-6">
					<c:if test="${stay.photo != null}">
						<img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${fn:split(stay.photo,',')[0]}" style="max-width:200px"><br>
						<c:forEach var="item" items="${fn:split(stay.photo,',')}">
							<img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${item}" style="max-width:100px">
						</c:forEach>
					</c:if>
				</div>
				<div class="col-lg-6">
					<div class="col-lg-8 d-flex justify-content-start">
						${stay.name}
					</div>
					<div class="col-lg-4 d-flex justify-content-end">
						<img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">
						<span class="ms-1">${stay.star}</span>
						<img src="<%=request.getContextPath()%>/image/redheart.png" width="30" height="30">
						<span class="ms-1">${stay.heart}</span>
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
									<button>예약하기</button>
								</div>
							</div><!-- card-body end -->
						</div>
					</div>
					
					<div class="col" style="display:none" id="roomInfoModal${index}">
						<div><button onclick="modalClose('${index}')">x</button></div>
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
						<p>${fn:split(stay.contents,',')[1]}</p>
					</div>
					<div>
						<p>공지사항</p>
						<p>${fn:split(stay.contents,',')[2]}</p>
					</div>
					<div>
						<p>기본 정보</p>
						<p>${fn:split(stay.contents,',')[3]}</p>
					</div>
					<div>
						<p>현장 결제</p>
						<p>${fn:split(stay.contents,',')[4]}</p>
					</div>
					<div>
						<p>확인사항 및 기타</p>
						<p>${fn:split(stay.contents,',')[5]}</p>
					</div>
					<div>
						지도
					</div>
					<div>
						<p>편의시설 및 서비스</p>
						${stay.services}
					</div>
				</div>
			</div>
			
			<!-- 리뷰 -->
			<div class="row" id="reviewTab" style="display:none">
				<div class="col">
					리뷰
				</div>
			</div>
			
			
			
			<div class="row">
				<div class="col">
					<a href="stayList.do">&lt;목록으로 돌아가기</a>
				</div>
			</div>
			
		</div><!-- /container -->
	</div><!-- /wrap -->

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
		});
		$("#reviewTabBtn").on("click",function(){
			$("#roomTab").hide();
			$("#stayTab").hide();
			$("#reviewTab").show();
			
			$("#roomTabBtn").css("color","black");
			$("#stayTabBtn").css("color","black");
			$("#reviewTabBtn").css("color","green");
		});
		
	});
	
	function roomInfoFn(index){
		$("#roomInfoModal"+index).show();
	}
	
	function modalClose(index){
		$("#roomInfoModal"+index).hide();
	}
	
</script>



<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
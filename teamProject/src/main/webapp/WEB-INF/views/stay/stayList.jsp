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
<style>
.bd-navbar {
  position: sticky;
  top: 0;
  z-index: 1071;
  box-shadow: 0 0.5rem 1rem rgba(0,0,0,.05), inset 0 -1px 0 rgba(0,0,0,.1);
}
.bd-sidebar {
  position: sticky;
  top: 4rem;
  z-index: 1000;
  background: #eee;
  border-right: 1px solid rgba(0,0,0,.1);
}
</style>
<script>
	var tagArray = new Array();
	function tagParse(json,index){
		var jsonParse = JSON.parse(json);
		var tags = "";
		$.each(jsonParse,function(idx){
			tags = tags+jsonParse[idx]["value"]+" ";
		})
		tagArray[index] = tags;
	}
</script>
</head>
<body>
<main>
	<!-- 리스트 페이지 히어로 -->
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<c:set var="index" value="0"/>
				<c:forEach var="i" items="${hero}">
					<div class="carousel-item" id="carousel${index}">
						<img class="d-block w-100" src="<%=request.getContextPath() %>/event/displayFile.do?fileName=${i.filename}">
						<div class="container">
							<div class="carousel-caption" style="background:rgba(0,0,0,0.3)">
								<p>${i.title}</p>
								<p>${i.startday} ~ ${i.endday}</p>
								<p><script>tagParse('${i.tag}',${index});</script></p>
								<p id="tagArea${index}"></p>
								<p>
									<a class="btn btn-lg btn-primary" href="eventView.do?ebidx=${i.ebidx}">자세히 보기</a>
								</p>
							</div>
						</div>
					</div>
				<c:set var="index" value="${index+1}"/>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- carousel end -->
		
		
	<div class="container">
		<c:if test="${login!=null && (login.role=='business' || login.role=='admin')}">
			<div class="row">
				<div class="col">
					<button class="btn btn-success" onclick="location.href='stayWrite.do'">글 쓰기</button>
				</div>
			</div>
		</c:if>
					
		<!-- sort 버튼 -->
		<div class="row">
			<div class="col d-flex justify-content-end">
				<!-- searchVO에 sortType max, min, heart, star 넘김 -->
				<button onclick="location.href='stayList.do?sortType=max'">높은가격순</button>
				<button onclick="location.href='stayList.do?sortType=min'">낮은가격순</button>
				<button onclick="location.href='stayList.do?sortType=heart'">좋아요순</button>
				<button onclick="location.href='stayList.do?sortType=star'">별점순</button>
			</div>
		</div>
		<br>
		<!-- 게시판 이름, 검색창 -->
		<div class="row">
			<div class="col-md-4 d-flex justify-content-start">
				<h3>숙박정보</h3>
			</div>
			<div class="col-md-8 d-flex justify-content-end">
				<form class="d-flex input-group" action="stayList.do" method="post">
					<select class="form-select" name="searchType">
						<option value="total" selected>전체</option>
						<option value="name">이름 검색</option>
						<option value="area">지역 검색</option>
					</select>
					<input type="text" class="form-control" name="searchValue" value="${search.searchValue}">
					<button class="btn btn-dark">검색</button>
				</form>
			</div>
		</div><!-- row end -->
		<br>
		
		<div class="row">
		
			<!-- 사이드 필터 -->
			<div class="col-3 bd-sidebar">
				<form action="stayList.do" method="get" id="filterFrm">
					<div>
						<span>필터검색</span><br>
						
						<span>인원</span><br>
						<button type="button" id="peopleMinus">-</button>
				        <input type="text" name="filter.people" id="people" value="1" size="1" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');">
				        <button type="button" id="peoplePlus">+</button><br>
				        
				        <span>가격</span><br>
				        <input type="text" name="filter.min" id="minPrice" value="10,000" maxlength="9" oninput="this.value = this.value.replace(/[^,0-9.]/g,'').replace(/(\..*)\./g,'$1');">~
				        <input type="text" name="filter.max" id="maxPrice" value="10,000" maxlength="9" oninput="this.value = this.value.replace(/[^,0-9.]/g,'').replace(/(\..*)\./g,'$1');"><br>
				        
				        <span>옵션</span><br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag1" value="싱글베드">
				        	<label class="form-check-label" for="tag1">싱글베드</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag2" value="더블베드">
				        	<label class="form-check-label" for="tag2">더블베드</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag3" value="퀸베드">
				        	<label class="form-check-label" for="tag3">퀸베드</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag4" value="킹베드">
				        	<label class="form-check-label" for="tag4">킹베드</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag5" value="원룸">
				        	<label class="form-check-label" for="tag5">원룸</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag6" value="분리형원룸">
				        	<label class="form-check-label" for="tag6">분리형원룸</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag7" value="투룸">
				        	<label class="form-check-label" for="tag7">투룸</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag8" value="쓰리룸">
				        	<label class="form-check-label" for="tag8">쓰리룸</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag9" value="포룸">
				        	<label class="form-check-label" for="tag9">포룸</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag10" value="방5개이상">
				        	<label class="form-check-label" for="tag10">방5개이상</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag11" value="주방/식당">
				        	<label class="form-check-label" for="tag11">주방/식당</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag12" value="욕실">
				        	<label class="form-check-label" for="tag12">욕실</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag13" value="욕조">
				        	<label class="form-check-label" for="tag13">욕조</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag14" value="욕실용품">
				        	<label class="form-check-label" for="tag14">욕실용품</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag15" value="드라이기">
				        	<label class="form-check-label" for="tag15">드라이기</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag16" value="에어컨">
				        	<label class="form-check-label" for="tag16">에어컨</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag17" value="전자렌지">
				        	<label class="form-check-label" for="tag17">전자렌지</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag18" value="밥솥">
				        	<label class="form-check-label" for="tag18">밥솥</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag19" value="세탁기">
				        	<label class="form-check-label" for="tag19">세탁기</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag20" value="건조기">
				        	<label class="form-check-label" for="tag20">건조기</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag21" value="반려동물가능">
				        	<label class="form-check-label" for="tag21">반려동물가능</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag22" value="주차장">
				        	<label class="form-check-label" for="tag22">주차장</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag23" value="와이파이">
				        	<label class="form-check-label" for="tag23">와이파이</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag24" value="무료주차장">
				        	<label class="form-check-label" for="tag24">무료주차장</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag25" value="BBQ">
				        	<label class="form-check-label" for="tag25">BBQ</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag26" value="라운지">
				        	<label class="form-check-label" for="tag26">라운지</label>
				        </div>
				        <br>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag27" value="엘레베이터">
				        	<label class="form-check-label" for="tag27">엘레베이터</label>
				        </div>
				        <div class="form-check form-check-inline">
				        	<input class="form-check-input" type="checkbox" name="filter.option" id="tag28" value="수영장">
				        	<label class="form-check-label" for="tag28">수영장</label>
				        </div>
				        <br>
				        
				        <button onclick="filterFn()">필터 적용하기</button>
					</div><!-- /필터 div -->
				</form>
		      <br>
		    </div><!-- /bd-sidebar -->
		    
		    <!-- content -->
		    <div class="col-9" style="background:gray">
		    	<c:forEach var="v" items="${stay}">
		    		<div class="col-sm-12 col-md-12 col-lg-4">
				    	<div class="card shadow-sm" style="cursor:pointer" onclick="location.href='stayView.do?sidx=${v.sidx}'">
							<c:if test="${v.photo != null}">
								<img class="card-img-top" src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${fn:split(v.photo,',')[0]}">
							</c:if>
							<div class="card-body">
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<span>${fn:split(v.addr,' ')[0]} ${fn:split(v.addr,' ')[1]}</span>
									</div>
									<small class="text-muted">
										<img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">
										<span class="ms-1">${v.star}</span>
										<img src="<%=request.getContextPath()%>/image/redheart.png" width="30" height="30">
										<span class="ms-1">${v.heart}</span>
									</small>
								</div>
								<div class="d-flex justify-content-start" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
									<p>${v.name}</p>
								</div>
								<div class="d-flex justify-content-start">
									<p>${v.min} ~ ${v.max}</p>
								</div>
							</div><!-- card-body end -->
						</div>
					</div>
		    	</c:forEach>
		    	
		    </div>
		    
		    <!-- 페이징 -->
		    <div class="row">
				<div class="col d-flex justify-content-center">
					<c:if test="${pm.prev == true}">
						<a href="stayList.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
					</c:if>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
						<a href="stayList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}" class="mx-1">${i}</a>
					</c:forEach>
					<c:if test="${pm.next == true}">
						<a href="stayList.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
					</c:if>
				</div>
			</div>
		    
		</div><!-- /row -->
	</div><!-- /container -->
</main>
<script>
	$("#minPrice").on("propertychange change keyup paste input",function(){
		var min = $("#minPrice");
		min.val(min.val().replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g,','));
	});
	$("#maxPrice").on("propertychange change keyup paste input",function(){
		var max = $("#maxPrice");
		max.val(max.val().replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g,','));
	});
	
	$("#peopleMinus").on("click", function(){
		if($("#people").val()==1){
			$("#people").val("1");
		}
		else {
			$("#people").val(Number($("#people").val())-1);
		}
	});
	
	$("#peoplePlus").on("click", function(){
		$("#people").val(Number($("#people").val())+1);
	});
	
	function filterFn(){
		$("#maxPrice").val($("#maxPrice").val().replaceAll(',',''));
		$("#minPrice").val($("#minPrice").val().replaceAll(',',''));
		$("#filterFrm").submit();
	}
	
	$(function(){
		$("#carousel0").addClass("active");
		for(var i=0;i<3;i++){
			$("#tagArea"+i).text(tagArray[i]);
		}
		
		if(${search.filter.people != null}){
			$("#people").val("${search.filter.people}");
			var minPrice = "${search.filter.min}";
			
			$("#minPrice").val("${search.filter.min}");
			$("#maxPrice").val("${search.filter.max}");
			
			<c:forEach var="i" items="${search.filter.option}">
			$("input[name='filter.option'][value='${i}']").prop("checked",true);
			</c:forEach>
		}
	});
</script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
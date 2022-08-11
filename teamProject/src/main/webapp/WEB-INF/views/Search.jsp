<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardList.css">

<script>
	function tagParse(tag, id){
		//리스트 태그 값 넣기
		var json = tag;
		var jsonParse = JSON.parse(json);
		var tagData = "";
		$.each(jsonParse,function(idx){
			tagData = tagData+jsonParse[idx]["value"]+"<span>&nbsp;&nbsp;</span>";
		})
		
		$("#"+id).html(tagData);
	}
</script>
</head>
<body>
	<div id="wrap">
		
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
					
					<!-- HOWF 추천 -->
					<div>
						<h1>HOWF 추천</h1>
						<div>
							<c:if test="${empty howf}">
								검색 결과가 없습니다
							</c:if>
							<c:forEach var="v" items="${howf}">
								<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
									<a style="cursor:pointer" onclick="location.href='howf/howfView.do?hbidx=${v.hbidx}'">
										<div class="thumbnail hbshadow3">
	
												<figure class="effect-ming">
													<!-- 메인이미지 보여주기-->
													<c:if test="${v.filename != null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/howf/displayFile.do?fileName=${v.filename});"></div>
													</c:if>
	
													<c:if test="${v.filename == null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
													</c:if>
	
													<!-- 이미지 규격 사이즈 355px * 240px 권장  -->
													<figcaption>
														<p id="howftag${v.hbidx}"></p>
													</figcaption>
													<!-- 태그 파싱하는 함수 호출 -->
													<script>tagParse('${v.tag}','howftag${v.hbidx}');</script>
												</figure>
												<div class="writerinfo">
													<p>
														<c:if test="${v.cate=='숙박추천'}">
															<span class="cate" style="background: #54ACA8; color: white;">${v.cate}</span>
														</c:if>
														<c:if test="${v.cate=='여행지추천'}">
															<span class="cate" style="background: #85A548; color: white;">${v.cate}</span>
														</c:if>
														<c:if test="${v.cate=='맛집추천'}">
															<span class="cate" style="background: #DE8889; color: white;">${v.cate}</span>
														</c:if>
														<span class="hfc-semibold hfc-blackgray"> ${v.wdate}</span>
													</p>
													<div class="small"><img src="<%=request.getContextPath()%>/image/icon/heart.png"><span class="hfc-semibold hfc-darkgray">${v.heart}</span></div>
												</div>
												<div class="caption">
													<h4>${v.title}</h4>
												</div>
											</div><!-- /.thumbnail -->
										</a>
								</div><!--/. thumbnailitem -->
							</c:forEach>
						</div>
						<c:choose>
						<c:when test="${empty howf}">
							<button onclick="location.href='<%= request.getContextPath() %>/howf/howfList.do'">'HOWF 추천' 가기</button>
						</c:when>
						<c:otherwise>
							<button onclick="location.href='<%= request.getContextPath() %>/howf/howfList.do?searchType=total&searchValue=${searchValue}'">'HOWF 추천' 가기</button>
						</c:otherwise>
						</c:choose>
					</div>
					
					
					<!-- 여행이야기 -->
					<div>
						<h1>여행이야기</h1>
						<div>
							<c:if test="${empty story}">
								검색 결과가 없습니다
							</c:if>
							<c:forEach var="s" items="${story}">
								<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
									<a style="cursor: pointer" onclick="location.href='story/storyView.do?sbidx=${s.sbidx}'">
										<div class="thumbnail hbshadow3">

											<figure class="effect-ming">
												<!-- 메인이미지 보여주기-->
												<c:if test="${s.filename != null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/story/displayFile.do?fileName=${s.filename});"></div>
												</c:if>

												<c:if test="${s.filename == null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:if>

												<!-- 이미지 규격 사이즈 355px * 240px 권장  -->
												<figcaption>
													<p id="storytag${s.sbidx}"></p>
												</figcaption>
												<!-- 태그 파싱하는 함수 호출 -->
												<script>tagParse('${s.tag}','storytag${s.sbidx}');</script>
											</figure>
											<div class="writerinfo">
												<c:if test="${s.img != null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/story/displayFile.do?fileName=${s.img});"></div>
												</c:if>
												<c:if test="${s.img == null}">
													<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:if>
												
												<p>
													<span class="">${s.nickname}</span>
													<span class="hfc-semibold hfc-blackgray"> ${s.wdate}</span>
												</p>
												<div class="small">
													<img src="<%=request.getContextPath()%>/image/icon/heart.png"><span class="hfc-semibold hfc-darkgray">${s.heart}</span>
												</div>
											</div>
											<div class="caption">
												<h4>${s.title}</h4>
											</div>
										</div>
										<!-- /.thumbnail -->
									</a>
								</div>
							</c:forEach>
						</div>
						<c:choose>
						<c:when test="${empty story}">
							<button onclick="location.href='<%= request.getContextPath() %>/story/storyList.do'">'여행이야기' 가기</button>
						</c:when>
						<c:otherwise>
							<button onclick="location.href='<%= request.getContextPath() %>/story/storyList.do?searchType=total&searchValue=${searchValue}'">'여행이야기' 가기</button>
						</c:otherwise>
						</c:choose>
					</div>
					
					
					<!-- 지역 이벤트 -->
					<div>
						<h1>지역 이벤트</h1>
						<div>
							<c:if test="${empty event}">
								검색 결과가 없습니다
							</c:if>
							<c:forEach var="v" items="${event}">
								<div class="thumbnailitem col-xs-12 col-sm-12 col-md-12 col-lg-4">
									<a style="cursor:pointer" onclick="location.href='event/eventView.do?ebidx=${v.ebidx}'">
										<div class="thumbnail hbshadow3">
	
												<figure class="effect-ming">
													<!-- 메인이미지 보여주기-->
													<c:if test="${v.filename != null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/event/displayFile.do?fileName=${v.filename});"></div>
													</c:if>
	
													<c:if test="${v.filename == null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
													</c:if>
	
													<!-- 이미지 규격 사이즈 355px * 240px 권장  -->
													<figcaption>
														<p id="eventtag${v.ebidx}"></p>
													</figcaption>
													<!-- 태그 파싱하는 함수 호출 -->
													<script>tagParse('${v.tag}','eventtag${v.ebidx}');</script>
												</figure>
												<div class="writerinfo">
													<p>
														<c:choose>
															<c:when test="${(today < v.endday) && (v.startday < today)}">
																<span class="cate" style="background: #54ACA8; color: white;">진행중</span>
															</c:when>
															<c:when test="${today < v.startday}">
																<span class="cate" style="background: #85A548; color: white;">진행예정</span>
															</c:when>
															<c:when test="${v.endday < today}">
																<span class="cate" style="background: #DE8889; color: white;">종료</span>
															</c:when>
														</c:choose>
														<span class="hfc-semibold hfc-blackgray"> ${v.startday} ~ ${v.endday}</span>
													</p>
													<div class="small"><img src="<%=request.getContextPath()%>/image/icon/heart.png"><span class="hfc-semibold hfc-darkgray">${v.heart}</span></div>
												</div>
												<div class="caption">
													<h4>&lt;${v.city}&gt; ${v.title}</h4>
												</div>
											</div><!-- /.thumbnail -->
										</a>
								</div><!--/. thumbnailitem -->
							</c:forEach>
						</div>
						<c:choose>
						<c:when test="${empty event}">
							<button onclick="location.href='<%= request.getContextPath() %>/event/eventList.do'">'지역 이벤트' 가기</button>
						</c:when>
						<c:otherwise>
							<button onclick="location.href='<%= request.getContextPath() %>/event/eventList.do?searchType=total&searchValue=${searchValue}'">'지역 이벤트' 가기</button>
						</c:otherwise>
						</c:choose>
						
					</div>
					
					
					<!-- 숙박정보 -->
					<div>
						<h1>숙박 정보</h1>
						숙박정보는 차후 디자인 입히고 수정할 예쩡임
						<div>
							<c:if test="${empty stay}">
								검색 결과가 없습니다
							</c:if>
							<c:forEach var="t" items="${stay}">
								
							</c:forEach>
						</div>
						<c:choose>
						<c:when test="${empty stay}">
							<button onclick="location.href='<%= request.getContextPath() %>/stay/stayList.do'">'숙박 정보' 가기</button>
						</c:when>
						<c:otherwise>
							<button onclick="location.href='<%= request.getContextPath() %>/stay/stayList.do?searchType=total&searchValue=${searchValue}'">'숙박 정보' 가기</button>
						</c:otherwise>
						</c:choose>
					</div>
					
					
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div>
		<!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
</body>
</html>
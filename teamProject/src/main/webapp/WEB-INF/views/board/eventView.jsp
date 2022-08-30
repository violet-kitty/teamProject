<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>지역이벤트</title>

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

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardView공용세팅 --> <link href="<%=request.getContextPath()%>/css/boardView.css" rel="stylesheet">



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
	<div id="wrap" class="boardview event eventview">
	
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">
			
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
				    <!-- pagehead  -->
					<a class=" onlypc" href="eventList.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					
					<!-- 뷰 -->
					<!-- 리스트 카드 hover effect 종류 참고 : https://codepen.io/vavik96/pen/MYdBKz -->
					<div class="clist">
						
							<!-- C리스트 14. 반복 -->
							<div class="thumbnailitem">
								
									<div class="thumbnail">

											<!-- 메인이미지 보여주기-->
											<!-- 이미지 규격 사이즈 355px * 240px 권장  -->
												<c:if test="${event.filename != null}">
													<img class="thumbnailimg" src="<%=request.getContextPath() %>/event/displayFile.do?fileName=${event.filename}">
												</c:if>

												<c:if test="${event.filename == null}">
													<img class="thumbnailimg" src="<%=request.getContextPath()%>/image/null/null_thumbnail.png">
												</c:if>

											
											<div class="writerinfo">
												<p>
													<c:if test="${event.img != null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath() %>/event/displayFile.do?fileName=${event.img});"></div>
													</c:if>
													<c:if test="${event.img == null}">
														<div class="imgbox" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
													</c:if>
													<span class="">${event.nickname}</span>
													<span class="hfc-semibold hfc-darkgray"> ${event.startday} ~ ${event.endday}</span>
												</p>
												<div class="small">
													<div class="col-lg-6 d-flex justify-content-end">
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
														<span class="hfc-semibold hfc-darkgray ms-1" id="heartNum">${event.heart}</span>
													</div>
												</div>
											</div>
											<div class="caption">
												<h4>${event.title}</h4>
											</div>

											<!-- 태그 -->
											<div class="row">
												<div class="col hfc-darkgray" id="tagArea"></div>
											</div>
											<hr class="middleline">
											<!-- 글 내용 -->
											<div class="row contentrow">
												<div class="col" id="eventContent">
													${event.content}
												</div>
											</div>
								
					<div class="row btnarea">
						<div class="col-6 d-flex justify-content-start">
							<c:if test="${(login.midx == event.midx) || (login.role == 'admin')}">
								<button onclick="delOk()"><img src="<%=request.getContextPath()%>/image/button/delete.png"></button>
								<button onclick="location.href='eventModify.do?ebidx=${event.ebidx}'"><img src="<%=request.getContextPath()%>/image/button/edit.png"></button>
							</c:if>
							<c:if test="${login != null && (login.role == 'official' || login.role == 'admin')}">
							<button onclick="location.href='eventWrite.do'"><img src="<%=request.getContextPath()%>/image/button/add.png"></button>
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
					

								
								
							</div><!-- /.thumbnail -->
										
							</div><!--/. thumbnailitem -->
					
					</div>
					<!-- /.clist -->
					<hr class="lastline">
					
					<a class=" onlypc" href="eventList.do">
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
		var json = '${event.tag}';
		var jsonParse = JSON.parse(json);
		var tags = "";
		$.each(jsonParse,function(idx){
			tags = tags+"  "+jsonParse[idx]["value"]+"  ";
		})
		$("#tagArea").text(tags);
		
		//찜 버튼 이벤트
		$("#heartBtn").click(function(){
			var bidx = "${event.ebidx}";
			
			if(heartDup == true){
				$.ajax({
					url:"heartDelete.do",
					type:"post",
					data:"type=event&bidx="+bidx,
					success:function(data){
						if(data==1){
							heartDup = false;
							$("#heartBtn").attr("src","<%=request.getContextPath()%>/image/button/lineheart.png");
							var n = $("#heartNum").text();
							var heartNum = Number(n);
							$("#heartNum").text(heartNum-1);
							modalFn("찜 목록에서 제거되었습니다");
							setTimeout(function(){
								modalClose();
							},1000);
						}
					}
				});
			}
			else if(heartDup == false){
				$.ajax({
					url:"heartInsert.do",
					type:"post",
					data:"type=event&bidx="+bidx,
					success:function(data){
						if(data==1){
							heartDup = true;
							$("#heartBtn").attr("src","<%=request.getContextPath()%>/image/button/heart.png");
							var n = $("#heartNum").text();
							var heartNum = Number(n);
							$("#heartNum").text(heartNum+1);
							modalFn("찜 목록에 추가되었습니다");
							setTimeout(function(){
								modalClose();
							},1000);
						}
						else {
							modalFn("찜 목록 추가 오류입니다");
							setTimeout(function(){
								modalClose();
							},1000);
						}
					}
				});
			}
		});
		
		//h1 태그 가진 텍스트로 제목 만들기
		var titleIndex = [];
		var num = 0;
		if($("#eventContent h1").length == 0) $("#ind").css("display","none");
		else {
			$("#eventContent h1").each(function(i,e){
				var offset = $(this).offset();
				titleIndex[i] = offset.top;
				$("#ind").append("<p id='index"+num+"' style='cursor:pointer'>"+$(this).text()+"</p><br>");
				$("#index"+num).on("click",function() {
					$('html, body').animate({scrollTop : offset.top}, 200);
				});
				num++;
			});
			
			$(window).scroll(function(){
				var height = $(document).scrollTop();
				
				for(var i=0;i<titleIndex.length;i++){
					if(titleIndex[i]-10 <= height){
						$("#ind p").css("font-size","1em");
						$("#index"+i).css("font-size","1.5em");
					}
				}
			});
		}
		
	
		
	});

	
	//글 삭제
	function delOk(){
		//모달창 띄우기
	modalFn("정말 게시글을 삭제하시겠습니까? \n 삭제된 게시글은 복구가 되지 않습니다.","삭제하기","글 삭제","아니오")
	}
	
	function modalOkFn(){
		modalClose();
		var ebidx = "${event.ebidx}";
		$.ajax({
			url:"eventDelete.do",
			data:"ebidx="+ebidx,
			type:"post",
			success:function(data){
				if(data == 1){
					modalFn("글이 삭제되었습니다.");
					setTimeout(function(){
						modalClose();
						location.href="eventList.do";
						return;
					},1500);

				}
			}
		});
	}

	
	function shareSNS(sns){
		var thisUrl = document.URL;
		console.log(thisUrl);
		
		var snsTitle = "${event.title}";
		if(sns=='facebook'){
			var url = "http://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(thisUrl);
	        window.open(url, "", "width=486, height=286");
		}
		else if(sns=='twitter'){
			var url = "http://twitter.com/share?url="+encodeURIComponent(thisUrl)+"&text="+encodeURIComponent(snsTitle);
	        window.open(url, "tweetPop", "width=486, height=286,scrollbars=yes");
		}
		else if(sns=='kakao'){
			Kakao.init('35c7c8bf307063859390df8e61188fbf');
			//Kakao.isInitialized();
			Kakao.Link.createDefaultButton({
				container:'#kakaoBtn',
				objectType:'feed',
				content:{
					title:snsTitle,
					description: snsTitle,
					imageUrl:'http://jjezen.cafe24.com/howf/event/displayFile.do?fileName=${event.filename}',
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
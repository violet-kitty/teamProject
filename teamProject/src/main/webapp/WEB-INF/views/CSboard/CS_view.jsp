<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF고객지원</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- summernote -->

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

<script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabWrite --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyView.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/parallax.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">

<style>
.replies button {border:none; background:none;}
.replies button img {width:30px;}
.btnarea {text-align:left; margin-top:20px;}
.replycon {margin-bottom:20px;}
.replies div {line-height:30px;}
</style>

</head>

<body>
	<div id="wrap" class="boardView cs csview">
	
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Herotop -->
		<div class="parallax-window" data-parallax="scroll" data-image-src="<%= request.getContextPath() %>/image/picture/support.jpg"></div>
				<nav class="cstopNav">
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a  class="nav-link" href="<%= request.getContextPath() %>/notice/faqboard.do"><img src="<%= request.getContextPath() %>/image/button/tabby1.png"></a>
						<a  class="nav-link active" href="<%= request.getContextPath() %>/CSboard/CS_list.do"><img src="<%= request.getContextPath() %>/image/button/tabby2.png"></a>
						<a  class="nav-link" href="<%= request.getContextPath() %>/notice/notice.do"><img src="<%= request.getContextPath() %>/image/button/tabby3.png"></a>
					</div>
				</nav>
		<!-- Herotop -->
		
		<!-- Side -->
		
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">
			
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
				    <!-- pagehead  -->
					<a class=" onlypc" href="<%= request.getContextPath() %>/CSboard/CS_list.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					<!-- /pagehead -->
					
					<!-- 뷰 -->
					<!-- 리스트 카드 hover effect 종류 참고 : https://codepen.io/vavik96/pen/MYdBKz -->
					<div class="clist">
						
						<!-- C리스트 14. 반복 -->
						<div class="thumbnailitem">
							
							<div class="thumbnail">
									
								<div class="writerinfo">
									<p>
										<span class="cate" style="background: #A4C266; color: white;">${cv.divsn}</span>
										<span class="hfc-semibold hfc-darkgray">${cv.nickname} | ${cv.wdate}</span>
									</p>
									<div class="small">
										<div class="col-lg-6 d-flex justify-content-end">
											<img src="<%=request.getContextPath()%>/image/icon/eye.png">
											<span class="hfc-semibold hfc-darkgray ms-1" id="heartNum">${cv.cnt}</span>
										</div>
									</div>
								</div>
								<div class="caption">
									<h4>${cv.title}</h4>
								</div>

								<!-- 태그 -->
								<div class="row">
									<div class="col hfc-darkgray" id="tagArea"></div>
								</div>
								<hr class="middleline">
								<!-- 글 내용 -->
								<div class="row contentrow">
									<div class="col" id="howfContent" style="word-break: break-all;">
										${cv.content}
									</div>
								</div>
					
								<div class="row btnarea">
									<div class="col-6 d-flex justify-content-start">
										<c:if test="${login.midx == cv.midx || login.role == 'admin'}">		
											<button onclick="delOk()" id="delete" value="삭제"><img src="<%=request.getContextPath()%>/image/button/delete.png"></button>
											<button value="수정" onclick="location.href='CS_modify.do?csbidx=${cv.csbidx}'"><img src="<%=request.getContextPath()%>/image/button/edit.png"></button>
										</c:if>
										<c:if test="${login.role == 'admin' && cvr == null}">
										<button id="reply_btn" type="button" value="답변" class="btn1" onclick="location.href='CS_replyWrite.do?csbidx=${cv.csbidx}'"><img src="<%=request.getContextPath()%>/image/button/reply.png"></button>
									</c:if>
									</div>
									<div class="col-6 d-flex justify-content-end">
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
					
					<c:if test="${cvr != null}">
						<h3 class="replycon">답변내용</h3>
						<div class="replies">
							<div><p>${cvr.content}</p></div>
							<div style="text-align:right; margin-top:30px;"><span class="hfc-semibold hfc-darkgray">${cvr.wdate}</span><br><p class="hfc-semibold hfc-darkgray">HOWF Support</p></div>
							<c:if test="${login.midx == cvr.midx || login.role == 'admin'}">
								<div class="btnarea">
									<button id="reply_delete" value="삭제">
										<img src="<%=request.getContextPath()%>/image/button/delete.png">
									</button>
									<button value="수정" onclick="location.href='CS_replyModify.do?csbidx=${cvr.csbidx}'">
										<img src="<%=request.getContextPath()%>/image/button/edit.png">
									</button>
								</div>
							</c:if>
						</div>
						<hr class="lastline">
					</c:if>
					<a class=" onlypc" href="CS_list.do">
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
	
	</div><!-- /#wrap -->


<script>
	function modalOkFn(){
		location.href = "CS_delete.do?origincsbidx=${cv.origincsbidx}";
	}
	
	function CS_replyDelete(){
		location.href = "CS_replyDelete.do?csbidx=${cvr.csbidx}&origincsbidx=${cvr.origincsbidx}";
	}
	
	$(function(){	
		
		$("#delete").click(function(){
			modalFn("삭제하시면 복구할 수 없습니다. 정말로 삭제하시겠습니까?", "확인", "1:1 문의 삭제", "취소");		
		});
		
		$("#reply_delete").click(function(){
			modalFn("정말로 삭제하시겠습니까?", "확인", "1:1 문의 답변 삭제", "취소", "CS_replyDelete");		
		});
		
	});
	
	function shareSNS(sns){
		var thisUrl = document.URL;
		console.log(thisUrl);
		
		var snsTitle = "${cv.title}";
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
					description:snsTitle,
					imageUrl:thisUrl,
					link:{
						mobileWebUrl:thisUrl,
						webUrl:thisUrl
					}
				}
			});
		}
	}
</script>

<script>
$('.parallax-window').parallax({imageSrc: '<%= request.getContextPath() %>/image/picture/support.jpg'});
</script>

</body>

</html>
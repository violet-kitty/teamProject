<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF 고객지원</title>

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

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav3 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyWrite.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/parallax.js"></script>

</head>
<body>
	<div id="wrap" class="boardWrite cs cswrite">
		
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
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

			<!-- content01 -->
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
					
					<!-- pagehead  -->
					<a id="cancel" class="onlypc" href="<%=request.getContextPath()%>/CSboard/CS_view.do?csbidx=${cv.origincsbidx}&origincsbidx=${cv.origincsbidx}">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					<!-- /pagehead -->
					
					<!-- 제목 영역 -->
					<div class="pageinfo">
						<div class="title onlypc">
							<a id="cancel2" href="<%=request.getContextPath()%>/CSboard/CS_view.do?csbidx=${cv.origincsbidx}&origincsbidx=${cv.origincsbidx}"><h1>1:1 문의 답변 수정</h1></a>
						</div>
					</div>
					<!-- /제목 영역 -->
					
								<form id="form1" action="CS_replyModify.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}" method="post">
									
									<!-- 에디터 -->
									<div class="row h-input">
										<div class="col">
											<input type="hidden" name="title" value="${cv.title}">
											<textarea id="summernote" name="content" class="tb_textarea">${cv.content}</textarea>
										</div>
									</div><!-- row end -->
									
								</form>
								<hr class="lastline">
								
								<!-- CS_view로 돌아가기, 글 수정 버튼 -->
								<div class="row buttonarea">
									<div class="col-lg-6">
										<a id="cancel3" class="onlypc" href="<%=request.getContextPath()%>/CSboard/CS_view.do?csbidx=${cv.origincsbidx}&origincsbidx=${cv.origincsbidx}">
											<div class="backto lastbackto">
												<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
											</div>
										</a>
									</div>
									<div class="col-lg-6 okbutton">
										<button type="button" class="bluebtn" onclick="ModifyFn()">수정 완료</button>
									</div>
								</div><!-- row end -->
								
				</div><!-- /.container -->
				
			</div><!-- / .content01 -->
			
			<!-- banner --><%@include file="../banner.jsp"%>
			
		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
		
	</div><!-- /#wrap -->
	
<script>
	function modalOkFn(){
		modalClose();
		history.back();
	}
	
	$(function(){
		
		$("#cancel").click(function(){
			
			var content = "${cv.content}";
			
			if($("#summernote").val() != content){
				modalFn("변경된 내용이 있습니다. 수정을 취소하시겠습니까?", "확인", "1:1 문의 답변 수정", "취소");
				return false;
	    	}
	    	else{
    			history.back();
    		}
	    });
	    
		$("#cancel2").click(function(){
			
			var content = "${cv.content}";
			
			if($("#summernote").val() != content){
				modalFn("변경된 내용이 있습니다. 수정을 취소하시겠습니까?", "확인", "1:1 문의 답변 수정", "취소");
				return false;
			}
			else{
				history.back();
			}
		});
		
		$("#cancel3").click(function(){
			
			var content = "${cv.content}";
			
			if($("#summernote").val() != content){
				modalFn("변경된 내용이 있습니다. 수정을 취소하시겠습니까?", "확인", "1:1 문의 답변 수정", "취소");
				return false;
	    	}
	    	else{
    			history.back();
    		}
	    });
		
		$("#summernote").summernote({
			height:500,
			minHeight: null,
			maxHeight: null,
			focus: false,
			lang:"ko-KR",
			placeholder:"최대 2000자까지 쓸 수 있습니다.&#13;&#10;제목1로 지정한 텍스트는 제목 목록에 표시됩니다.",
			toolbar: [
				['style',['style']],
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			styleTags: ['h1']
		});		
	});
	
	function ModifyFn(){
		
		var content = $("#summernote");
		
		if(content.val() == ""){
			modalFn("내용을 입력해주세요");
			setTimeout(function(){
				modalClose();
				$("#summernote").summernote('focus');
				return;
			}, 1000);
		}
		else {
			modalFn("정말로 수정하시겠습니까?", "확인", "1:1 문의 답변 수정", "취소", "CS_replyModifyCheck");
		}
	};
	
	function CS_replyModifyCheck(){
		$("#form1").submit();
	}
</script>
</body>
</html>
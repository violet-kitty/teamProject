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
<title>HOWF고객지원</title>

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

<script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabWrite --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyWrite.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/parallax.js"></script>

<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- /summernote -->

</head>
<body>
	<div id="wrap" class="boardWrite cs cswrite">
		<!-- 모달예제 
		<button onclick="modalex()">모달예제</button>
		<script>
		function modalex(){
		
			/* modalex("모달이 완료되었습니다");
		      setTimeout(function(){
		         modalClose();
		      },3000); */
		      modalFn("모달이 완료되었습니다." ,"닫기","알림창");
			
		}
		</script>
		-->
		
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
			
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
					<!-- pagehead  -->
					<a class=" onlypc" href="<%=request.getContextPath()%>/CSboard/CS_list.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					
					<!-- 제목 영역 -->
							<div class="pageinfo">
								<div class="title onlypc">
									<a href="<%=request.getContextPath()%>/CSboard/CS_list.do"><h1>1:1문의 답변작성</h1></a>
								</div>
							</div>

					<!-- 폼 시작 -->
					
					<form id="form1" action="CS_replyWrite.do?origincsbidx=${cv.origincsbidx}" method="post">
						
<!-- 						카테고리 선택, 제목 입력
						<div class="row h-input ">
							<div class="col">
								<input class="form-control" type="text" name="title" id="title" placeholder="제목을 작성해주세요">
							</div>
						</div>row end -->
				
						
						<!-- 에디터 -->
						<div class="row h-input">
							<div class="col">
								<h3>문의 제목 : ${cv.title}</h3>
								<br>
								<p>문의 내용 : <br>${cv.content}</p>
								<br>
								<input type="hidden" id="title" name="title" class="input_title" value="${cv.title}">
								<textarea id="summernote" name="content"></textarea>
							</div>
						</div><!-- row end -->
						
						<!-- 에디터 -->
						<div class="row h-input">
							<div class="col">
								<p>이미지 첨부 파일</p>
							</div>
							<div class="col">
								<label><input type="file" id="file" name="file"></label>
								<!-- div id="div_img" style="display: none;"><img id="img"></div>
								<div id="div_img2" style="display: none;"><input type="button" id="img_del_btn" value="파일 삭제"></div> -->
							</div>
						</div><!-- row end -->
						
					<!-- /.clist -->
					</form>
					<hr class="lastline">
				
					
					<!-- 목록으로 돌아가기, 글 작성 버튼 -->
						<div class="row buttonarea">
							<div class="col-lg-6">
								<a class=" onlypc" href="<%=request.getContextPath()%>/CSboard/CS_list.do">
									<div class="backto lastbackto">
										<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
									</div>
								</a>
							</div>
							<div class="col-lg-6 okbutton">
								<button type="button" class="bluebtn" onclick="CS_replyWriteCheck()">답변완료</button>
							</div>
						</div><!-- row end -->
					<!-- 리스트 카드 -->
					
					
		
					
				</div><!-- /.container -->
			</div><!-- /.contents -->
			<!-- /pagehead -->
			
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
		
		$("#summernote").summernote({
			height:300,
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
		
		$("#cancel").click(function(){
			
			var title = '${cv.title}';
			var content = $("#summernote");
			
			if($("#title").val() != title){
	    		modalFn("제목이 변경 되었습니다. 답변 작성을 취소하시겠습니까?", "확인", "1:1 고객문의 답변 취소", "취소");
	    	}
			else if(content.val() != ""){
				modalFn("작성된 내용이 있습니다. 답변 작성을 취소하시겠습니까?", "확인", "1:1 고객문의 답변 취소", "취소");
	    	}
	    	else{
    			history.back();
    		}
	    });
		
	});
	
	function CS_replyWriteCheck(){
		
		var title = $("#title");
		var content = $("#summernote");
		
		if(title.val() == ""){
			modalFn("제목을 입력해주세요");
			setTimeout(function(){
				modalClose();
				title.focus();
				return;
			}, 1000);

		}
		else if(content.val() == ""){
			modalFn("내용을 입력해주세요");
			setTimeout(function(){
				modalClose();
				$("#summernote").summernote('focus');
				return;
			}, 1000);

		}
		else {
			modalFn("1:1 고객문의 답변을 등록하시겠습니까?", "확인", "1:1 고객문의 답변 등록", "취소", "CS_replyWrite");
		}
	}
	
	function CS_replyWrite(){
		$("#form1").submit();
	}
</script>
</body>
</html>
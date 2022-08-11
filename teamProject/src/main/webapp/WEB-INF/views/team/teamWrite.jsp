<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>    
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
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- /summernote -->
<style>
input[type=checkbox]{
	zoom: 1.5;
}
</style>
</head>
<body>
	<div id="wrap">
		<!-- Header --><%@include file="../Header.jsp"%>
		<div style="height:50px;"></div>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="<%=request.getContextPath()%>/"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
					<form id="form1" method="post">
						<div class="row">
							<div class="col text-center">
								<div class="thumbnail"><input type="file" id="thumbnail" name="filename"></div>
							</div>			
						</div>
						<div class="row">
							<div class="col d-flex justify-content-start">
									(프로필 사진 영역(선택))
							</div>
						</div>
						<div class="row">
							<div class="col bd-highlight">
								<input type="text" id="title" class="fs-3 fw-bold" name="title" placeholder="제목">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<textarea id="summernote" name="content"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<span>가입신청 활성화/비활성화</span> <input type="checkbox" id="check" name="applyyn" value="Y" checked>
							</div>
						</div>
						<div class="row">
							<div class="col d-flex justify-content-center">
								<button type="button" id="btn_write">등록</button>
								<button type="button" id="btn_cancel">취소</button>
							</div>
						</div>
					</form>
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
</body>
<script>
	function teamWriteCheck(){
		$("#form1").submit();
	}
	
	function modalOkFn(){
		modalClose();
		history.back();
	}
	
	$(function(){
		
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
				
		$("#btn_write").click(function(){
			
			var title = $("#title");
			var content = $("#summernote");
			
			if(title.val() == ""){
				modalFn("제목을 입력해주세요");
				setTimeout(function(){
					modalClose();
					title.focus();
					return false;
				},1000);

			}
			else if(content.val() == ""){
				modalFn("내용을 입력해주세요");
				setTimeout(function(){
					modalClose();
					$("#summernote").summernote('focus');
					return false;
				},1000);

			}
			else{
				modalFn("팀 페이지를 등록하시겠습니까?", "확인", "1:1 고객문의 등록", "취소", "teamWriteCheck");
			}
			
		});
	
		$("#btn_cancel").click(function(){
			if($("#title").val() != ""){
				modalFn("작성된 제목이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 고객문의 등록", "취소");
			}
			else if($("#summernote").val() != ""){
				modalFn("작성된 내용이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 고객문의 등록", "취소");
	    	}
			else if($("#thumbnail").val() != ""){
				modalFn("첨부된 파일이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 고객문의 등록", "취소");
			}
	    	else{
				history.back();
			}
		});
		
	});
</script>
</html>
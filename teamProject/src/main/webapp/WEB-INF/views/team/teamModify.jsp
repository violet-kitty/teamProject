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
<title>Home</title>

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
<!-- CSS3 - Home --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- /summernote -->
<title>Insert title here</title>
<style>
.check_apply{
	display: block;
	width: 10%;
	height: 100%;
	color: white;
	background-color: #54ACA8;
	border: 1px solid white;
}
input[type=checkbox]{
	zoom: 1.5;
}
</style>
</head>
<body>

	<div id="wrap">
		<!-- Header --><%@include file="../Header.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="<%= request.getContextPath() %>/"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div class="container">
		<form id="form1" action="teamModify.do?tidx=${tv.tidx}" method="post">
			<div class="row">
				<div class="col text-center">
					<div class="thumbnail"><input type="file" id="thumbnail" name="filename">${tv.filename}</div>
				</div>			
			</div>
			<div class="row">
				<div class="text-center col-md-6 col-lg-3 d-flex justify-content-start">
						(프로필 사진 영역(선택))
				</div>
				<div class="text-center col-md-6 col-lg-3">
						${tv.wdate}<input type="hidden" name="wdate">
				</div>
				<div class="text-center col-md-6 col-lg-3">
						${tv.nickname}
				</div>
				<div class="text-center col-md-6 col-lg-3 d-flex justify-content-end">
						${tv.people_cnt}
				</div>
			</div>
			<div class="row">
				<div class="col bd-highlight">
					<input type="text" id="title" class="fs-3 fw-bold" name="title" value="${tv.title}">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<textarea id="summernote" name="content">${tv.content}</textarea>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<c:if test="${tv.applyyn == 'Y'}">
						<span class="align-self-center">가입신청 활성화/비활성화</span> <input type="checkbox" id="check" name="applyyn" value="Y"  class="align-self-center" checked>
					</c:if>
					<c:if test="${tv.applyyn != 'Y'}">
						<span class="align-self-center">가입신청 활성화/비활성화</span> <input type="checkbox" id="check" name="applyyn" value="Y"  class="align-self-center">
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
				<c:if test="${login.midx == tv.midx}">
					<button onclick="btn_modify">수정</button>
				</c:if>
					<button type="button" id="btn_cancel">취소</button>
				</div>
			</div>
		</form>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
<script>
	function modalOkFn(){
		history.back();
	}

	$(function(){
		
		$("#summernote").summernote({
			height: 500,
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
		
		$("#btn_cancel").click(function(){
			
			var title = '${tv.title}';
			var content = '${tv.content}';
			
			if($("#title").val() != title){
				modalFn("제목이 수정되었습니다. 수정을 취소하시겠습니까?", "확인", "팀 페이지", "취소");
			}
			else if($("#summernote").val() != content){
				modalFn("내용이 수정되었습니다. 수정을 취소하시겠습니까?", "확인", "팀 페이지", "취소");
	    	}
			else if($("#thumbnail").val() != ""){				
				modalFn("첨부된 파일이 변경되었습니다. 수정을 취소하시겠습니까?", "확인", "팀 페이지", "취소");
			}
	    	else{
	    		history.back();
	    	}
		});
		
		
	});
	
	function btn_modify(){
		
		var title = $("#title");
		var content = $("#summernote");
		
		if(title.val() == ""){
			modalFn("제목을 입력해주세요.");
			setTimeout(function(){
				modalClose();
				title.focus();
				return;
			},1000);

		}
		else if(content.val() == ""){
			modalFn("내용을 입력해주세요.");
			setTimeout(function(){
				modalClose();
				$("#summernote").summernote('focus');
				return;
			},1000);

		}
		else {
			modalFn("수정하시겠습니까?", "확인", "팀 페이지", "취소", "teamModifyCheck");
		}
	}
	
	function teamModifyCheck(){
		$("#form1").submit();
	}
</script>
</body>
</html>
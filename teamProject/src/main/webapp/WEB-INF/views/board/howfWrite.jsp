<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF추천</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap5 최신 CSS & JS (Popper.js 포함됨) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Slick Slider -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- Bootstrap5 AwsomeFont -->
<script src="https://kit.fontawesome.com/a54851838a.js" crossorigin="anonymous"></script>
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- tagify -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
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
<!-- CSS3 - BoardWrite공용세팅 --> <link rel="stylesheet" href="<%=request.getContextPath()%>/css/boardWrite.css">

</head>

<body>
	<div id="wrap" class="boardWrite howf howfWrite">
	
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
					<a class=" onlypc" href="howfList.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>

					<!-- 폼 시작 -->
					
					<form method="post" enctype="multipart/form-data" id="frm">
						<!-- 파일 첨부, 이미지 미리보기 -->
						<div class="row imgThumbView">
							<div class="col">
								<div id="imageAttach">
								    <img class="attachimg1" src="<%=request.getContextPath()%>/image/null/attach.png">
									<img class="attachimg2" src="<%=request.getContextPath()%>/image/null/mattach.png">
								</div>
								<input type="file" name="file" id="file">
								<div id="imageArea">
									<img id="image">
								</div>
							</div>
						</div><!-- row end -->
						
						<!-- 카테고리 선택, 제목 입력 -->
						<div class="row h-input ">
							<div class="col-lg-4 selection">
								<select class="form-control form-select" name="cate">
									<option value="여행지추천" selected>카테고리 선택</option>
									<option value="여행지추천">여행지추천</option>
									<option value="숙박추천">숙박추천</option>
									<option value="맛집추천">맛집추천</option>
								</select>
							</div>
							<div class="col-lg-8">
								<input class="form-control" type="text" name="title" id="title" placeholder="제목을 작성해주세요">
							</div>
						</div><!-- row end -->
						
						<!-- 태그 입력 -->
						<div class="row h-input">
							<div class="col custom">
								<p>태그를 나열해주세요. &#13;&#10;&#35;과 &#44;를 이용해 태그를 작성할 수 있습니다</p>
								<input class="form-control tagcon" name="tag" id="tag" size="40">
							</div>
						</div><!-- row end -->
						
				
						
						<!-- 에디터 -->
						<div class="row h-input">
							<div class="col">
								<textarea id="summernote" name="content"></textarea>
							</div>
						</div><!-- row end -->
						
					<!-- /.clist -->
					</form>
					<hr class="lastline">
				
					
					<!-- 목록으로 돌아가기, 글 작성 버튼 -->
						<div class="row buttonarea">
							<div class="col-lg-6">
								<a class=" onlypc" href="howfList.do">
									<div class="backto lastbackto">
										<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
									</div>
								</a>
							</div>
							<div class="col-lg-6 okbutton">
								<button type="button" class="bluebtn" onclick="writeFn()">글 작성 완료</button>
							</div>
						</div><!-- row end -->
					<!-- 리스트 카드 -->
					
					
		
					
				</div><!-- /.container -->
			</div><!-- /.contents -->
			<!-- /pagehead -->
			
			<!-- banner --><%@include file="../banner.jsp"%>
			
		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	
	</div><!-- /#wrap -->



<script>
	//에디터
	$(function(){
		$("#summernote").summernote({
			height:300,
			minHeight:null,
			maxHeight:null,
			focus:true,
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
		
		//tagify
		var input = document.querySelector("#tag");
		new Tagify(input);
		
		//파일 첨부(썸네일)
		$("#imageAttach").click(function(){
			$("#file").click();
		});
		
		$("#image").click(function(){
			$("#file").click();
		});
		
		//썸네일 이미지 미리보기
		$("#file").on("change",upload);
		
		function upload(e){
			console.log("file name : ",e.value);
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;//이미지 확장자만 받음
			
			filesArr.forEach(function(f){
				if(!f.type.match(reg)){
					alert("이미지 파일만 등록 가능합니다");
					return;
				}
				
				sel_file = f;
				
				var reader = new FileReader();
				$("#imageAttach").css("display","none");
				$("#imageArea").css("display","block");
				reader.onload = function(e){
					$("#image").attr("src",e.target.result);//이미지 변경
				}
				reader.readAsDataURL(f);
			});
		}
	});
	
	function writeFn(){
		var title = $("#title");
		var content = $("#summernote");
		var tag = $("#tag");
		var file = $("#file");
		
		if(title.val()==""){
			alert("제목을 입력해 주세요");
			title.focus();
			return;
		}
		else if(content.val()==""){
			alert("내용을 입력해 주세요");
			content.focus();
			return;
		}
		else if(tag.val()==""){
			alert("태그를 입력해 주세요");
			tag.focus();
			return;
		}
		else if(file.val()==""){
			alert("썸네일을 등록해 주세요");
			return;
		}
		else {
			$("#frm").submit();
		}
	}
</script>

</body>
</html>
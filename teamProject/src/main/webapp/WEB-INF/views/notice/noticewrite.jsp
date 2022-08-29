<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF 고객지원</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
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

<script type="text/javascript">
 	function check() {
		
		var title = $("#title");
		var content = $("#summernote");
		
		if (title.val() == ""){
			modalFn("제목을 입력해 주세요");
			setTimeout(function(){
				modalClose();
				title.focus();
				return;
			},1000);
		} else if (content.val() == ""){
			modalFn("내용을 입력해 주세요");
			setTimeout(function(){
			modalClose();
			content.focus();
			return ;
			},1000);
		} else {
			var formData = new FormData($("#form")[0]);
			$.ajax({
				url:"noticewrite.do",
				type:"post",
				data:formData,
				cache:false,
				contentType:false,
				processData:false,
				success:function(data){
					if(data == 1){
						//modalFn("메시지","확인텍스트","타이틀","취소텍스트","test");
						modalFn("등록되었습니다");
						setTimeout(function(){
							modalClose();
							location.href="notice.do";
							return;
						},1500);
					}
					else {
						modalFn("등록 실패");
						setTimeout(function(){
							modalClose();
							return;
						},1500);
					}
				}
			});
		}
	}

 	function test(){
 		location.href="notice.do";
 	}
 	
 	function cancel(){
 		modalFn("취소되었습니다");
 			setTimeout(function(){
 			modalClose();
 			location.href="notice.do";
 			return;
 		},1000);
 	}
 	
	function filter(options) {
		var is = true;
		
		jQuery(options).each(function(){
			var item = this;
			
			switch (item.filter){
			case 'empty' :
				var val = jQuery(item.target).val();
				if (val == ''){
					modalFn(item.title + "을(를) 입력하세요");
					setTimeout(function(){
						modalClose();
					},1000);
					//alert(item.title + '을(를) 입력하세요');
					jQuery(item.target).focus();
					is = false;
				}
				
			}
			
		});
		return is;
	}
	// 스마트에디터 textarea 유효성검사 라는데...
 	function submitContents() {
        var elClickedObj = $("#form");
        oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
        var ir1 = $("#ir1").val();

        if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
             alert("내용을 입력하세요.");
             oEditors.getById["ir1"].exec("FOCUS"); //포커싱
             return;
        }

        try {
            elClickedObj.submit();
        } catch(e) {}
    }
	

</script>

</head>

<body>
	<div id="wrap" class="boardWrite cs cswrite">
	
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Herotop -->
		<div class="parallax-window" data-parallax="scroll" data-image-src="<%= request.getContextPath() %>/image/picture/support.jpg"></div>
				<nav class="cstopNav">
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a  class="nav-link" href="<%= request.getContextPath() %>/notice/faqboard.do"><img src="<%= request.getContextPath() %>/image/button/tabby1.png"></a>
						<a  class="nav-link" href="<%= request.getContextPath() %>/CSboard/CS_list.do"><img src="<%= request.getContextPath() %>/image/button/tabby2.png"></a>
						<a  class="nav-link active" href="<%= request.getContextPath() %>/notice/notice.do"><img src="<%= request.getContextPath() %>/image/button/tabby3.png"></a>
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
					<a class=" onlypc" href="<%=request.getContextPath()%>/notice/notice.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					
					<!-- 제목 영역 -->
							<div class="pageinfo">
								<div class="title onlypc">
									<a href="<%=request.getContextPath()%>/notice/notice.do"><h1>공지사항 작성</h1></a>
								</div>
							</div>

					<!-- 폼 시작 -->
					
					<form id="form" action="noticewrite.do" method="post" enctype="multipart/form-data">
						
						<!-- 카테고리 선택, 제목 입력 -->
						<div class="row h-input ">
							<div class="col">
								<input class="form-control" type="text" name="title" id="title" placeholder="제목을 작성해주세요">
							</div>
						</div><!-- row end -->
				
						
						<!-- 에디터 -->
						<div class="row h-input">
							<div class="col">
								<textarea name="content" id="summernote"  placeholder="내용을 작성해주세요"></textarea>
							</div>
						</div><!-- row end -->
						
						<!-- 파일첨부 -->
						<div class="row h-input">
							<div class="col">
								<input type="file" name="fileupload" />
							</div>
						</div><!-- row end -->
						
					<!-- /.clist -->
					</form>
					<hr class="lastline">
				
					
					<!-- 목록으로 돌아가기, 글 작성 버튼 -->
						<div class="row buttonarea">
							<div class="col-lg-6">
								<a class=" onlypc" href="<%=request.getContextPath()%>/notice/notice.do">
									<div class="backto lastbackto">
										<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
									</div>
								</a>
							</div>
							<div class="col-lg-6 okbutton">
								<button type="button" class="bluebtn" onclick="check()">글 작성 완료</button>
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
$('.parallax-window').parallax({imageSrc: '<%= request.getContextPath() %>/image/picture/support.jpg'});
</script>

<script>
$(function(){
	$("#summernote").summernote({
		height:600,
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
});
</script>

</body>

</html>
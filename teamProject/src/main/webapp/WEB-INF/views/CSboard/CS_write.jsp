<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
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
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabWrite --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyWrite.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/parallax.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">


<!-- 	modalFn('<lottie-player src="https://assets2.lottiefiles.com/packages/lf20_7i8hse0z.json"  background="transparent"  speed="1"  style="width: 300px; height: 300px;"    autoplay></lottie-player><br>제목을 입력해 주세요','확인'); -->
<!-- 	modalFn('<lottie-player src="https://assets2.lottiefiles.com/packages/lf20_7i8hse0z.json"  background="transparent"  speed="1"  style="width: 300px; height: 300px;"    autoplay></lottie-player><br>내용을 입력해 주세요','확인'); -->
<!-- 	modalFn('<lottie-player src="https://assets6.lottiefiles.com/packages/lf20_ynaicab2.json"  background="transparent"  speed="3"  style="width: 300px; height: 300px;"  autoplay></lottie-player><br> 작성이 완료되었습니다'); -->
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
					<a id="cancel" class="onlypc" href="<%=request.getContextPath()%>/CSboard/CS_list.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					
					<!-- 제목 영역 -->
							<div class="pageinfo">
								<div class="title onlypc">
									<a href="<%=request.getContextPath()%>/CSboard/CS_list.do"><h1>1:1 문의 작성</h1></a>
								</div>
							</div>

					<!-- 폼 시작 -->
					
					<form id="form1" action="CS_write.do" method="post" enctype="multipart/form-data">
						
						<!-- 카테고리 선택, 제목 입력 -->
						<div class="row h-input ">
							<div class="col-2">
								<select id="divsn" class="form-select" name="divsn">
									<option value="질문" selected>문의유형</option>
									<option value="질문">질문</option>
									<option value="환불">환불</option>
									<option value="신고">신고</option>
									<option value="계정">계정</option>
									<option value="건의">건의</option>
									<option value="기타">기타</option>
								</select>
							</div>
							<div class="col-10">
								<input class="form-control" type="text" name="title" id="title" placeholder="제목을 작성해주세요">
							</div>
						</div><!-- row end -->
				
						
						<!-- 에디터 -->
						<div class="row h-input">
							<div class="col">
								<textarea id="summernote" name="content" class="tb_textarea"></textarea>
							</div>
						</div><!-- row end -->
						
					</form>
					<hr class="lastline">
				
					
					<!-- 목록으로 돌아가기, 글 작성 버튼 -->
						<div class="row buttonarea">
							<div class="col-lg-6">
								<a id="cancel2" class=" onlypc" href="<%=request.getContextPath()%>/CSboard/CS_list.do">
									<div class="backto lastbackto">
										<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
									</div>
								</a>
							</div>
							<div class="col-lg-6 okbutton">
								<button type="button" class="bluebtn" onclick="CS_write()">작성 완료</button>
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
	function modalOkFn(){
		modalClose();
		history.back();
	}
	
	$(function(){
		
		$("#cancel").click(function(){
			if($("#title").val() != ""){
				modalFn("작성된 제목이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 문의 등록", "취소");
				return false;
			}
			else if($("#summernote").val() != ""){
				modalFn("작성된 내용이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 문의 등록", "취소");
				return false;
	    	}
	    	else{
    			history.back();
    		}
	    });
		
		$("#cancel2").click(function(){
			if($("#title").val() != ""){
				modalFn("작성된 제목이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 문의 등록", "취소");
				return false;
			}
			else if($("#summernote").val() != ""){
				modalFn("작성된 내용이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 문의 등록", "취소");
				return false;
	    	}
	    	else{
    			history.back();
    		}
	    });
		
		$("#summernote").summernote({
			height:500,
			minHeight:null,
			maxHeight:null,
			focus: false,
			lang: "ko-KR",
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
		
		
		$("#file").on("change",upload);	      
	      function upload(e){
	    	 $("#div_img").show();
	    	 $("#div_img2").show();
	         console.log("file name : ",e.value);
	         var files = e.target.files;
	         var filesArr = Array.prototype.slice.call(files);
	         var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;	//이미지 확장자만 받음
	         
	         filesArr.forEach(function(f){
	            if(!f.type.match(reg)){
	               alert("이미지 파일만 등록 가능합니다");
	               var clone = $("#file").clone();
 	               clone.val("");
	               $("#file").replaceWith(clone);
	               return;
	            }
	            
	            sel_file = f;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	               $("#img").attr("src",e.target.result);//이미지 변경
	            }
	            reader.readAsDataURL(f);
	         });
	      }
	      
	      $("#img_del_btn").click(function(){
	    	  $("#file").val("");
	    	  $("#div_img").css("display", "none");
	    	  $("#div_img2").css("display", "none");
	    	  
	      });
	     
	});

	
	function CS_write(){
		
		var title = $("#title");
		var content = $("#summernote");
		
		if(title.val() == ""){
			modalFn("제목을 입력해 주세요");
			setTimeout(function(){
				modalClose();
				title.focus();
				return;
			},1000);

		}
		else if(content.val() == ""){
			modalFn("내용을 입력해 주세요");
			setTimeout(function(){
				modalClose();
				$("#summernote").summernote('focus');
				return;
			},1000);

		}
		else {
			modalFn("1:1 문의를 등록하시겠습니까?", "확인", "1:1  문의 등록", "취소", "CS_writeCheck");	
		}
	}
	
	function CS_writeCheck(){
		$("#form1").submit();
	}
</script>

<script>
$('.parallax-window').parallax({imageSrc: '<%= request.getContextPath() %>/image/picture/support.jpg'});
</script>

</body>

</html>
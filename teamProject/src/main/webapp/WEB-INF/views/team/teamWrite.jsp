<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF 너나들이</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- 채팅 --><script src="https://ncloudchat.gcdn.ntruss.com/ncloudchat-lastest.min.js"></script>
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- /summernote -->

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
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabWrite --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyWrite.css">

<style>
input[type=checkbox]{zoom: 1.1;}
</style>
</head>
<body>
	<div id="wrap" class="boardWrite cs cswrite">
	
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
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
					<a id="cancel" class=" onlypc" href="<%=request.getContextPath()%>/team/teamList.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					<!-- 제목 영역 -->
					<div class="pageinfo">
						<div class="title onlypc">
							<a id="cancel2" href="<%=request.getContextPath()%>/team/teamList.do"><h1>너나들이 작성</h1></a>
						</div>
					</div>
					
					<!-- 폼 시작 -->
					<form id="form1" method="post" enctype="multipart/form-data">
						
						<!-- 카테고리 선택, 제목 입력 -->
						<div class="row h-input ">
							<div class="col">
								<input class="form-control" type="text" name="title" id="title" placeholder="제목을 입력해 주세요">
							</div>
						</div><!-- row end -->
						
						<!-- 에디터 -->
						<div class="row h-input">
							<div class="col">
								<textarea name="content" id="summernote" cols="80" rows="20" placeholder="내용을 작성해주세요"></textarea>
							</div>
						</div><!-- row end -->
						
						<div class="align-middle">
							<div class="form-check-inline align-middle">
								<label class="form-check-label" for="applyyn">가입신청 허용 / 차단</label>
								<input class="form-check-input" type="checkbox" name="applyyn" id="applyyn" value="Y" checked style="margin: 0 0;">
							</div>
						</div>
						
					</form>
					<hr class="lastline">
					
					<!-- 목록으로 돌아가기, 글 작성 버튼 -->
					<div class="row buttonarea">
						<div class="col-lg-6">
							<a id="cancel3" class=" onlypc" href="<%=request.getContextPath()%>/team/teamList.do">
								<div class="backto lastbackto">
									<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
								</div>
							</a>
						</div>
						<div class="col-lg-6 okbutton">
							<button type="button" class="bluebtn" id="btn_write">작성 완료</button>
						</div>
					</div><!-- row end -->
					<!-- 리스트 카드 -->
					
				</div><!-- /.container -->
				
			</div><!-- / .content01 -->
			
			<!-- banner --><%@include file="../banner.jsp"%>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
		
	</div><!-- /#wrap -->
</body>
<script>
	//채팅 api 초기화
	const nc = new ncloudchat.Chat();
	nc.initialize("200ead48-efb1-42e9-acc8-32ab84b2039a");
	var re = userConnect();
	
	async function userConnect(){
		const user = await nc.connect({
		    id: "howf_${login.midx}",
		    name: "${login.nickname}"
		});
		return 1;
	}
	
	function teamWriteCheck(){
		modalClose();
		var frm = $("#form1").serialize();
		$.ajax({
			url : "teamWrite.do",
			data : frm,
			type : "post",
			success : function(data){
				createChat(data);
				setTimeout(function(){
					modalClose();
					modalFn("글이 등록되었습니다");
					setTimeout(function(){
						modalClose();
						location.href = "teamView.do?tidx="+data;
					},1000);
				},1000);
			}
				
		});
		
	}
	
	async function createChat(tidx){
		var cha_id = "HOWF_"+tidx;
		const channel = await nc.createChannel({type:"PUBLIC", name:cha_id, id:cha_id});
		return 1;
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
				modalFn("팀 페이지를 등록하시겠습니까?", "확인", "너나들이 글 등록", "취소", "teamWriteCheck");
			}
			
		});
	
		$("#cancel").click(function(){
			if($("#title").val() != ""){
				modalFn("작성된 제목이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "너나들이 글 등록", "취소");
				return false;
			}
			else if($("#summernote").val() != ""){
				modalFn("작성된 내용이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "너나들이 글 등록", "취소");
				return false;
	    	}
	    	else{
				location.href = "/team/teamList.do";
			}
		});
		
		$("#cancel2").click(function(){
			if($("#title").val() != ""){
				modalFn("작성된 제목이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "너나들이 글 등록", "취소");
				return false;
			}
			else if($("#summernote").val() != ""){
				modalFn("작성된 내용이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "너나들이 글 등록", "취소");
				return false;
	    	}
	    	else{
				location.href = "/team/teamList.do";
			}
		});
		
		$("#cancel3").click(function(){
			if($("#title").val() != ""){
				modalFn("작성된 제목이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "너나들이 글 등록", "취소");
				return false;
			}
			else if($("#summernote").val() != ""){
				modalFn("작성된 내용이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "너나들이 글 등록", "취소");
				return false;
	    	}
	    	else{
				location.href = "/team/teamList.do";
			}
		});
		
	});
</script>
</html>
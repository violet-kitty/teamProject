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
<title>1:1 고객문의 답변 작성</title>
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
<!-- CSS3 - 관련CSS를 여기에 연결해주세요 --> <link rel="stylesheet" href="<%=request.getContextPath()%>/css/csBoard/CS_replyWrite.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- /summernote -->
</head>
<body>
	<div id="wrap">
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
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
					<div class="row">
						<div class="col">

							<div class="div_header">
								<h3>1:1 문의 게시글 답변 작성</h3>
							</div>
							<hr>	
							<div class="replies">
								<form id="form1" action="CS_replyWrite.do?origincsbidx=${cv.origincsbidx}" method="post">
									<table class="table tb1">
										<tbody>			
											<tr>
												<td class="reply_category">제목<span class="span_must_input">*</span></td>
												<td><input type="text" id="title" name="title" class="input_title" value="${cv.title}"></td>
											</tr>
											<tr>
												<td class="reply_category">내용<span class="span_must_input">*</span></td>
												<td class="reply_content" colspan="3"><textarea id="summernote" name="content"></textarea></td>
											</tr>
											<tr>
												<td class="btn_td" colspan="4">
													<input type="hidden" name="origincsbidx" value="${cv.csbidx}">
													<input type="button" class="btn1" value="등록" onclick="CS_replyWriteCheck()">
													<input type="button" class="btn1" value="취소" id="cancel">
												</td>
											</tr>			
										</tbody>
									</table>
								</form>
							</div>		
						</div>
					</div>
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
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
			
			var title = "${cv.title}";
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
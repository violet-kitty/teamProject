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
<!-- CSS3 - Nav3 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyWrite.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/parallax.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- summernote -->

</head>
<body>
	<div id="wrap" class="boardwrite cs cswrite">
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
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
					<div class="row">
						<div class="col">
							<a href="<%=request.getContextPath()%>/home.do" class="a_logo">
								<img src="<%=request.getContextPath()%>/image/logo/logo.png">
							</a>
							<div class="div_header">
								<h3>1:1 문의 게시글 수정</h3>
							</div>
							<br><br>
							<c:if test="${login != null }">
								<div class="div_userInfo"><span class="span_userInfo">${login.nickname}</span> 로그인 중 (등급 : <span class="span_userInfo">${login.role}</span>)</div>
								<div class="div_logout"><a href="<%=request.getContextPath()%>/user/logout.do" class="a_logout">로그아웃</a></div>
							</c:if>
							<br>
							<hr>	
							<br>
							<br>
							<br>
							<div class="div1">
								<form id="form1" action="CS_modify.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}" method="post" enctype="multipart/form-data">
									<table class="tb1">
										<tbody>
											<tr>			
												<td class="tb_category">문의유형</td>
												<td>
													<select name="divsn">
														<option value="질문">문의유형 선택</option>
														<option value="질문">질문</option>
														<option value="환불">환불</option>
														<option value="신고">신고</option>
														<option value="계정">계정</option>
														<option value="건의">건의</option>
														<option value="기타">기타</option>
													</select>
												</td>
											</tr>
											<tr>				
												<td class="tb_category">제목<span class="span_must_input">*</span></td>
												<td style="padding-right: 9px;"><input type="text" name="title" value="${cv.title}" id="title" class="input_title"></td>					
											</tr>
											<tr>
												<td class="tb_category">내용<span class="span_must_input">*</span></td>
												<td><textarea class="tb_textarea" rows="30" name="content" style="resize: none;" id="summernote">${cv.content}</textarea></td>
											</tr>
											<tr>
												<td class="tb_category">이미지 첨부 파일</td>
												<td class="tb_filename">
													<div><input type="file" name="file" id="file" class="file_btn"></div>
												<c:if test="${cv.filename == null}">
													<div id="div_img1" style="display:none"><a href="displayFile.do?fileName=${cv.filename}"><img src="displayFile.do?fileName=${cv.filename}" id="img"></a></div>
													<div id="delArea" style="display: none;"></div>
												</c:if>
												<c:if test="${cv.filename != null}">
													<div id="div_img2"><a href="displayFile.do?fileName=${cv.filename}"><img src="displayFile.do?fileName=${cv.filename}" id="img"></a></div>
													<div id="delArea"><input type="button" id="btn_file_del" value="파일 삭제"></div>
												</c:if>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="div2">
										<input type="button" value="수정" class="btn1" onclick="ModifyFn()">
										<input type="button" value="취소" class="btn1" id="cancel">
									</div>			
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
		location.href = "CS_view.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}";
	}
	
	$(function(){
		
		$("#cancel").click(function(){
			
			var title = "${cv.title}";
			var content = "${cv.content}";
			
			if($("#title").val() != title){
				modalFn("제목이 수정되었습니다. 수정을 취소하시겠습니까?", "확인", "1:1 고객문의 수정", "취소");
			}
			else if($("#summernote").val() != content){
				modalFn("내용이 수정되었습니다. 수정을 취소하시겠습니까?", "확인", "1:1 고객문의 수정", "취소");
	    	}
			else if($("#file").val() != ""){				
				modalFn("첨부된 파일이 변경되었습니다. 수정을 취소하시겠습니까?", "확인", "1:1 고객문의 수정", "취소");
			}
	    	else{
    			location.href="CS_view.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}";
	    	}
	    });
		
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
		
		$("#file").on("change",upload);
	      function upload(e){
	    	 <c:if test="${cv.filename == null}">
	    	 	$("#div_img1").show();
	    	 </c:if>
	    	 <c:if test="${cv.filename != null}">
	    	 	$("#div_img2").show();
	    	 </c:if>
	    	 $("#delArea").empty();
	    	 $("#delArea").html('<input type="button" id="btn_file_del" value="파일 삭제">');
	    	 $("#delArea").show();
	    	 
	    	 $(document).on("click","#btn_file_del",function(){
		    	  $("#file").val("");
		    	  <c:if test="${cv.filename == null}">
			    	 $("#div_img1").css("display", "none");
			      </c:if>
		    	  <c:if test="${cv.filename != null}">
		    	  	$("#div_img2").css("display", "none");
		    	  </c:if>
		    	  $("#delArea").css("display", "none");
		      });
	    	 
	         console.log("file name : ",e.value);
	         var files = e.target.files;
	         var filesArr = Array.prototype.slice.call(files);
	         var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;//이미지 확장자만 받음
	         
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
	      
	      $("#btn_file_del").click(function(){	    	  
	    	  $("#file").val("");
	    	  $("#div_img2").css("display", "none");
	    	  $("#delArea").css("display", "none");
	      })
		
	});
	
	function ModifyFn(){
		
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
			modalFn("수정하시겠습니까?", "확인", "1:1 고객문의 수정", "취소", "CS_modifyCheck");	
		}
	};
	
	function CS_modifyCheck(){
		$("#form1").submit();
	}
</script>
</body>
</html>
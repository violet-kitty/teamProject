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
<title>1:1 고객문의 글 작성</title>
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
<!-- CSS3 - 관련CSS를 여기에 연결해주세요 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/csBoard/CS_write.css"/>
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- summernote -->
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
								<h3>1:1 고객문의 작성</h3>
							</div>
							<hr>	
							<br>
							<br>
							<br>
							<div class="div1">
								<form id="form1" action="CS_write.do" method="post" enctype="multipart/form-data">
									<table class="tb1">
										<tbody>
											<tr>			
												<td class="td_category">문의유형</td>
												<td>
													<select id="divsn" name="divsn">
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
												<td class="td_category">제목<span class="span_must_fill">*</span></td>
												<td><input type="text" id="title" name="title" class="input_title" placeholder="제목을 입력해주세요"></td>					
											</tr>
											<tr>
												<td class="td_category">내용<span class="span_must_fill">*</span></td>
												<td><textarea id="summernote" name="content" class="tb_textarea"></textarea></td>
											</tr>
											<tr>
												<td class="td_category">이미지 첨부 파일</td>
												<td class="tb_filename">
													<label><input type="file" id="file" name="file"></label>
													<div id="div_img" style="display: none;"><img id="img"></div>
													<div id="div_img2" style="display: none;"><input type="button" id="img_del_btn" value="파일 삭제"></div>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="div2">
										<input type="button" onclick="CS_write()" value="등록" class="btn1">
										<input type="button" value="취소" id="cancel" class="btn1">
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
		history.back();
	}
	
	$(function(){
		
		$("#cancel").click(function(){
			if($("#title").val() != ""){
				modalFn("작성된 제목이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 고객문의 등록", "취소");
			}
			else if($("#summernote").val() != ""){
				modalFn("작성된 내용이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 고객문의 등록", "취소");
	    	}
			else if($("#file").val() != ""){
				modalFn("첨부된 파일이 있습니다. 글 작성을 취소하시겠습니까?", "확인", "1:1 고객문의 등록", "취소");
			}
	    	else{
    			history.back();
    		}
	   });
		
		$("#summernote").summernote({
			height:300,
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
			modalFn("1:1 고객문의를 등록하시겠습니까?", "확인", "1:1 고객문의 등록", "취소", "CS_writeCheck");	
		}
	}
	
	function CS_writeCheck(){
		$("#form1").submit();
	}
</script>
</body>
</html>
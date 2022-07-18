<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->      
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 사용시 필요 -->
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- /제이쿼리 사용시 필요 -->
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- summernote -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3{
	text-align: center;
}
a{
	text-decoration-line: none;
}
.div_header{
	margin-left: 10%;
	margin-right: 10%;
	padding-right: 10%;
	text-align: center;
}
.div_header h3{
	display: inline-block;
}
.a_logo{
	margin-left: 10%;
	float: left;
}
.a_logo img{
	max-width: 100px;
	max-height: 100px;
}
.div_userInfo{	
	display: inline-block;
	float: left;
	margin-left: 10%;
}
.span_userInfo{
	display: inline-block;
	font-weight: bold;
	color : #5B6DCD;
}
.div_logout{
	display: inline-block;
	float: right;
	margin-right: 10%;
}
.a_logout{
	color: #5B6DCD;
	font-weight: bold;
}
.div1{
	
}
.tb1{
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
}
.tb_category{
	text-align: center;
	width: 10%;
	background-color: lightgray;
	font-weight: bold;
}
.span_must_input{
	color: red;
}
.input_title{
	width: 100%;
}
.tb_content{
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}
.tb_filename{
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
}
#div_img{
	margin-top: 10px;
}
#div_img2{
	margin-top: 10px;
}
.div2{
	text-align: center;
	width: 80%;
	margin-top: 5px;
	margin-left: 10%;
	margin-right: 10%;
}
.btn1{
	width: 100px;
	height: 30px;
	margin-left: 1%;
}
#img{
	max-width: 480px;
	max-height: 270px;
}
</style>
</head>
<body>
	<a href="<%=request.getContextPath()%>/home.do" class="a_logo">
		<img src="<%=request.getContextPath()%>/image/logo/logo.png">
	</a>
	<div class="div_header">
		<h3>1:1 문의 게시글 작성</h3>
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
		<form id="form1" action="cs_write.do" method="post" enctype="multipart/form-data">
			<table class="tb1">
				<tbody>
					<tr>			
						<td class="tb_category">문의유형</td>
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
						<td class="tb_category">제목<span class="span_must_input">*</span></td>
						<td style="padding-right: 9px;"><input type="text" name="title" id="title" class="input_title" placeholder="제목을 입력해주세요"></td>					
					</tr>
					<tr>
						<td class="tb_category">내용<span class="span_must_input">*</span></td>
						<td><textarea class="tb_textarea" name="content" id="summernote"></textarea></td>
					</tr>
					<tr>
						<td class="tb_category">이미지 첨부 파일</td>
						<td class="tb_filename">
							<label><input type="file" id="file" name="file"></label>
							<div id="div_img" style="display: none;"><img id="img"></div>
							<div id="div_img2" style="display: none;"><input type="button" id="img_del_btn" value="파일 삭제"></div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="div2">
				<input type="button" onclick="writeFn()" value="등록" class="btn1">
				<input type="button" value="취소" id="cancel" class="btn1">
			</div>			
		</form>		
	</div>
<script>
	$(function(){
		
		 $("#cancel").click(function(){
			 if($("#title").val() != ""){
				 if(!confirm("작성된 제목이 있습니다. \n\n글 작성을 취소하시겠습니까?")){
	    			 return false;
	    		 }
	    		 else{
	    			 history.back();
	    		 }
			 }
			 else if($("#summernote").val() != ""){
	    		 if(!confirm("작성된 내용이 있습니다. \n\n글 작성을 취소하시겠습니까?")){
	    			 return false;
	    		 }
	    		 else{
	    			 history.back();
	    		 }
	    	 }
			 else if($("#file").val() != ""){
				 if(!confirm("첨부된 파일이 있습니다. \n\n글 작성을 취소하시겠습니까?")){
	    			 return false;
	    		 }
	    		 else{
	    			 history.back();
	    		 }
			 }
	    	 else{
    			 history.back();
    		 }
	    });
		
		$("#summernote").summernote({
			height:300,
			minHeight:null,
			maxHeight:null,
			focus:false,
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
	
	function writeFn(){
		var title = $("#title");
		var content = $("#summernote");
		if(title.val() == ""){
			alert("제목을 입력해주세요");
			title.focus();
			return;
		}
		else if(content.val() == ""){
			alert("내용을 입력해주세요");
			content.focus();
			return;
		}
		else {
			if(!confirm("정말로 등록하시겠습니까?")){
				return false;
			}
			else{
				$("#form1").submit();
			}			
		}
	};
</script>
</body>
</html>
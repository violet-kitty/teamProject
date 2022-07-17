<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- /summernote -->
<style>
h3{
	text-align: center;
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
.tb_textarea{
	width: 100%;
	text-align: left;
	vertical-align: top;
	padding-top: 10px;
	padding-left: 10px;
}
.tb_filename{
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
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
#div_img1{
	margin-top: 10px;
	margin-bottom: 10px;
}
#div_img2{
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
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
		<form id="form1" action="csList_modify.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}" method="post" enctype="multipart/form-data">
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
<script>
	$(function(){
		
		$("#cancel").click(function(){
			var title = "${cv.title}";
			var content = "${cv.content}";
			if($("#title").val() != title){
				if(!confirm("제목이 수정되었습니다. \n\n수정을 취소하시겠습니까?")){
	    			return false;
	    		}
	    		else{
	    			location.href="csList_view.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}";
	    		}
			}
			else if($("#summernote").val() != content){
	    		if(!confirm("내용이 수정되었습니다. \n\n수정을 취소하시겠습니까?")){
	    			return false;
	    		}
	    		else{
	    			location.href="csList_view.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}";
	    		}
	    	}
			else if($("#file").val() != ""){				
				if(!confirm("첨부된 파일이 변경되었습니다. \n\n수정을 취소하시겠습니까?")){
	    			return false;
	    		}
	    		else{
	    			location.href="csList_view.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}";
	    		}
			}
	    	else{
    			location.href="csList_view.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}";
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
			if(!confirm("정말로 수정하시겠습니까?")){
				return false;
			}			
			$("#form1").submit();
		}
	};
</script>
</body>
</html>
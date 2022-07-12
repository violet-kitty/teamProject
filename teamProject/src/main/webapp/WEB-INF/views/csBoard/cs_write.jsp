<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->      
<!DOCTYPE html>
<html>
<head>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
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
.tb_content{
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}
.tb_textarea{
/* 	width: 100%; */
/* 	text-align: left; */
/* 	vertical-align: top; */
/* 	padding-top: 10px; */
/* 	padding-left: 10px; */
}
.tb_filename{
	text-align: left;
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
	max-width: 500px;
	max-height: 300px;
}
</style>
</head>
<body>
	<h3>1:1 문의 글 작성</h3>
	<hr>
	<br>
	<br>
	<div class="div1">
		<form id="form1" action="cs_write1.do" method="post" enctype="multipart/form-data">
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
						<td class="tb_category">제목</td>
						<td><input type="text" name="title" id="title"></td>					
					</tr>
					<tr>
						<td class="tb_category">내용</td>
						<td><textarea class="tb_textarea" rows="30" name="content" id="summernote"></textarea></td>
					</tr>
					<tr>
						<td class="tb_category">첨부파일</td>
						<td class="tb_filename">
							<img id="img">
							<br><br><label><input type="file" id="file" name="file"></label>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="div2">
				<input type="button" onclick="checkFn()" value="등록" class="btn1">
				<input type="button" value="취소" onclick="location.href='csList.do'" class="btn1">
			</div>			
		</form>		
	</div>
<script>
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
// 			,callbacks: {
// 				onImageUpload : function(files){
// 					uploadSummernoteImageFile(files[0], this);
// 				},
// 				onPaste: function(e){
// 					var clipboardData = e.originalEvent.clipboardData;
// 					if(clipboardData && clipboardData.items && clipboardData.items.length){
// 						var item = clipboardData.items[0];
// 						if(item.kind == 'file' && item.type.indexOf('image/') !== -1){
// 							e.preventDefault();
// 						}
// 					}
						
// 				}
// 			}
		});
		
// 		function uploadSummernoteImageFile(file, editor){
// 			data = new FormData();
// 			data.append("file", file);
// 			$.ajax({
// 				data : data,
// 				type : "post",
// 				url : "/cs_write_summernote.do",
// 				contentType : false,
// 				processData : false,
// 				success : function(data){
// 					$(editor).summernote('insertImage', data.url);
// 				}
// 			});
// 		};
		
		$("#file").on("change",upload);
	      
	      function upload(e){
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
		
	});
	
	function checkFn(){
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
			alert("글이 등록되었습니다.");
			$("#form1").submit();
		}
	};
</script>
</body>
</html>
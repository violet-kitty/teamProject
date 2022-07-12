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
	width: 100%;
	text-align: left;
	vertical-align: top;
	padding-top: 10px;
	padding-left: 10px;
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
.file_btn{
	
}
#img{
	max-width: 500px;
	max-height: 300px;
}
</style>
</head>
<body>
	<h3>1:1 문의 글 수정</h3>
	<hr>
	<br>
	<br>
	<div class="div1">
		<form id="form1" action="csList_modify.do?csbidx=${cv.csbidx}" method="post" enctype="multipart/form-data">
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
							</select>
						</td>
					</tr>
					<tr>				
						<td class="tb_category">제목</td>
						<td><input type="text" name="title" value="${cv.title}" id="title"></td>					
					</tr>
					<tr>
						<td class="tb_category">내용</td>
						<td><textarea class="tb_textarea" rows="30" name="content" style="resize: none;" id="content">${cv.content}</textarea></td>
					</tr>
					<tr>
						<td class="tb_category">첨부파일</td>
						<td class="tb_filename">						
							<a href="displayFile.do?fileName=${cv.filename}"><img src="displayFile.do?fileName=${cv.filename}" id="img"></a>
							<br><br><label><input type="file" name="file" id="file" class="file_btn"></label>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="div2">
				<input type="button" value="수정" class="btn1" onclick="checkFn()">
				<input type="button" value="취소" onclick="location.href='csList_view.do?csbidx=${cv.csbidx}&origincsbidx=${cv.origincsbidx}'" class="btn1">
			</div>			
		</form>		
	</div>
<script>
	$(function(){
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
	            reader.onload = function(e){
	               $("#img").attr("src",e.target.result);//이미지 변경
	            }
	            reader.readAsDataURL(f);
	         });
	      }
		
	});
	
	function checkFn(){
		var title = $("#title");
		var content = $("#content");
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
			$("#form1").submit();
		}
	};
</script>
</body>
</html>
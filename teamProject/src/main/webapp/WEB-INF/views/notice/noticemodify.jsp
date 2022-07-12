<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<script type="text/javascript">
	function check() {
	
		var title = $("#title");
		var content = $("#summernote");
	
		if (title.val() == ""){
			alert("제목을 입력하세요");
			title.focus();
			return ;			
		}else if (content.val() == ""){
			alert("내용을 입력하세요");
			content.focus();
			return ;
		}else {
			$("#form").submit();
		}
}
	function filter(options) {
		var is = true;
		
		jQuery(options).each(function(){
			var item = this;
			
			switch (item.filter){
			case 'empty' :
				var val = jQuery(item.target).val();
				if (val == ''){
					alert(item.title + '을(를) 입력하세요');
					jQuery(item.target).focus();
					is = false;
				}
				
			}
			
		});
		return is;
	}

</script>
</head>
<h1>수정</h1>
<body>
<%-- <c:if test="${nbidx != vo.nbidx}">
		<script type="text/javascript">
		System.out.println(vo.nbidx());
		alert("작성 회원이 아닙니다")
		location.href="../"
		</script>
		
</c:if> --%>


	<form id="form" action="noticemodify.do" name="noticemodify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="nbidx" value="${vo.nbidx }">
		title : <input type="text"  name="title" id="title" value="${vo.title }"> <br>
		content : <textarea name="content" id="summernote" cols="50" rows="13">${vo.content}</textarea> <br>
		<input type="file" name="fileupload" value="${vo.filename }"/> 
		
		
		<button type="button" onclick="check()">수정</button>
		<input type="reset" value="다시작성">
    </form>
    
    
   
	
<button id="btn1" onclick="location.href='notice.do'"> 리스트</button><br>

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
	});
});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>Insert title here</title>

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

<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- CSS3 - 관련CSS를 여기에 연결해주세 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/관련.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
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
			modalFn("제목을 입력해 주세요");
			setTimeout(function(){
				modalClose();
				title.focus();
				return;
			},1000);
		} else if (content.val() == ""){
			modalFn("내용을 입력해 주세요");
			setTimeout(function(){
			modalClose();
			content.focus();
			return ;
			},1000);
		} else {
			var formData = new FormData($("#form")[0]);
			$.ajax({
				url:"noticewrite.do",
				type:"post",
				data:formData,
				cache:false,
				contentType:false,
				processData:false,
				success:function(data){
					if(data == 1){
						//modalFn("메시지","확인텍스트","타이틀","취소텍스트","test");
						modalFn("등록되었습니다");
						setTimeout(function(){
							modalClose();
							location.href="notice.do";
							return;
						},1500);
					}
					else {
						modalFn("등록 실패");
						setTimeout(function(){
							modalClose();
							return;
						},1500);
					}
				}
			});
		}
	}

 	function test(){
 		location.href="notice.do";
 	}
 	
 	function cancel(){
 		modalFn("취소되었습니다");
 			setTimeout(function(){
 			modalClose();
 			location.href="notice.do";
 			return;
 		},1000);
 	}
 	
	function filter(options) {
		var is = true;
		
		jQuery(options).each(function(){
			var item = this;
			
			switch (item.filter){
			case 'empty' :
				var val = jQuery(item.target).val();
				if (val == ''){
					modalFn(item.title + "을(를) 입력하세요");
					setTimeout(function(){
						modalClose();
					},1000);
					//alert(item.title + '을(를) 입력하세요');
					jQuery(item.target).focus();
					is = false;
				}
				
			}
			
		});
		return is;
	}
	// 스마트에디터 textarea 유효성검사 라는데...
 	function submitContents() {
        var elClickedObj = $("#form");
        oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
        var ir1 = $("#ir1").val();

        if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
             alert("내용을 입력하세요.");
             oEditors.getById["ir1"].exec("FOCUS"); //포커싱
             return;
        }

        try {
            elClickedObj.submit();
        } catch(e) {}
    }
	

</script>

</head>
<body>
	<div id="wrap">
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
				
<!-- 본문 -->
<form id="form" action="noticewrite.do" method="post" enctype="multipart/form-data">
	<table>
 		<tr>
  		<td>
   	<table>
    	<tr>
     	<td><h2>공지사항</h2></td>
    	</tr>
   </table>

   <table>
    	<tr>
    		<td>제목</td>
    		<td><input name="title" id="title" size="50" maxlength="100"></td>
    	</tr>
    	<tr>
    		<td>내용</td>
    		<td><textarea name="content" id="summernote" cols="80" rows="20"></textarea></td>
   	 	</tr>
   </table>
		<input type="file" name="fileupload" />
		
	<table>
	<tr>
		<td><button class="bluebtn" type="button" onclick="check()">저장</button></td>
		<td><button class="pinkbtn" type="button" onclick="cancel()">취소</button></td>
	</tr>
	</table>

		</td>
		</tr>
	</table>
</form>


				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
	
<!-- 서머노트 -->	
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
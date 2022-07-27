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
<!-- CSS3 - 관련CSS를 여기에 연결해주세 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/관련.css" />

<script type="text/javascript">
 	function check() {
		
		var title = $("#title");
		var content = $("#content");
		
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
<form id="form" action="faqwrite.do" method="post" enctype="multipart/form-data">
<table>
    	<tr>
     		<td>FAQ</td>
    	</tr>
</table>
   <table>
    	<tr>
    		<td>제목</td>
    		<td><input name="title" id="title" size="50" maxlength="100"></td>
    	</tr>
    	<tr>
    		<td>내용</td>
    		<td><textarea name="content" id="content" cols="80" rows="20"></textarea></td>
   	 	</tr>
    
   	</table>
   
   	<table>
    	<tr>
    		<td><button type="button" onclick="check()">저장</button></td>
     		<td><a href="notice.do">취소</a></td>
    	</tr>
   </table>

</form>

				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
</body>

</body>
</html>
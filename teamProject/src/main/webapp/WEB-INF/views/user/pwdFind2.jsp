<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF비밀번호찾기</title>

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

<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 구글 로그인 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com">
<script src="https://accounts.google.com/gsi/client" async defer></script>
<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav2.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - user --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/user.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<script>
	var getCookie = function(name){
		var value = document.cookie.match('(^|;)?'+name+'=([^;]*)(;|$)');
		return value? value[2] : null;
	}
	function authCheck(){
		var cookie = getCookie("authNum");	//쿠키에 저장된 인증 번호 가져오기
		var input = $("#code").val();//입력된 값 가져오기
		if(cookie == input){
			location.href="pwdFindComplete.do?email=${email}";
		}
		else {
			modalFn("인증번호가 일치하지 않습니다.");
			setTimeout(function(){
				modalClose();
			},1000);
			//alert("인증번호가 일치하지 않습니다.");
		}
	}
</script>

</head>
<body>

	<div id="wrap" class="login">

		<!-- Header --><%@include file="../Header.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-white">
			<div class="joinbg">
				<div class="container">
					<div class="whitebox">
						<h2 class="hfc-bold">비밀번호찾기</h2>
						<div class="row row-cols-1 row-cols-lg-2">
							<div class="feature col">
								
								<p class="subtitle">${email}로 인증 메일을 보냈습니다. 아래 인증 코드를 입력해 주세요</p>
								<!-- form -->
								<form id="frm" action="pwdFind.do" method="post" style="margin: 8px 0px 16px 0px;">
									<table border="1">
										<tr class="col1">
											<td colspan="2"><input type="text" size="3" id="code" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');" placeholder="인증코드"></td>
										</tr>
									</table>
								</form>
								<!-- /form -->
								
								<!-- 버튼 -->
								<button type="button" onclick="authCheck()" class="greenbtn" style="margin-bottom:0px;">입력완료</button>
								
							</div>
							<div class="feature col">
								<lottie-player src="https://assets5.lottiefiles.com/packages/lf20_syglwy7h.json"  background="transparent"  speed="1"  style="width: auto; height:237px;"  loop autoplay></lottie-player>
								
							</div>
						</div><!-- /.row -->
					</div><!-- /.whitebox --><!-- /.whitebox -->
            
				</div><!-- /.container -->
			</div><!-- /.contents 01 -->
		
			<!-- Nav --><%@include file="../Nav.jsp"%>		
			

		</div><!-- / #container -->
	
		<!-- Footer --><%@include file="../Footer.jsp"%>
		
	</div><!-- /#wrap -->

</body>
</html>



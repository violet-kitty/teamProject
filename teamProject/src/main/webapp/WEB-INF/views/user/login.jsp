<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF로그인</title>

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

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav2.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - user --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/user.css" />

<script>
var nicknameDup = false;
</script>

</head>
<body>

	<div id="wrap" class="login">

		<!-- 닉네임 받는 모달 -->
		<div class="modal py-10 px-3" tabindex="-1" role="dialog" id="modalDiv">
			<div class="modal-dialog hbshadow" role="document">
				<div class="modal-content">
					<h2 class="hfc-bold">나의 닉네임 설정하기</h2>

					<form id="modalFrm" action="nicknameInsert.do" method="post">
						<div class="form-floating ">
							<p class="text-muted">HOWF에서 사용하실 닉네임을 입력해주세요</p>
							<div>
								<input type="text" name="nickname" id="nickname" placeholder="닉네임 입력"><span id="nicknameTxt"></span>
								<input type="hidden" name="email" id="emailHidden">
								<input type="hidden" name="midx" id="midxHidden">
							</div>
							<p class="hfc-pink">최초 닉네임 설정 이후, 닉네임을 변경하실 수 없습니다.</p>
						</div>
					</form>
					<div class="btnarea">
						<!-- <button type="button" class="graybtn w-30" data-bs-dismiss="modalDiv" aria-label="Close">닫기</button> -->
						<button type="button" class="bluebtn w-100" onclick="nicknameFn()">닉네임 입력완료!</button>
					</div>
				</div>
			</div>
		</div>


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
						<h2 class="hfc-bold">로그인</h2>
						<div class="row row-cols-1 row-cols-lg-2">
							<div class="feature col">
								<p class="subtitle">기억이 안나나요?</p><br class="onlymobile"> <a href="emailFind.do">이메일 찾기</a> & <a href="pwdFind.do">비밀번호 찾기</a>
								<!-- form -->
								<form id="frm">
									<table border="1">
										<tr class="col1">
											<td colspan="2"><input type="email" name="email" id="email" placeholder="이메일"></td>
										</tr>
										<tr class="col1">
											<td colspan="2"><input type="password" name="password" id="password" placeholder="비밀번호"></td>
										</tr>
									</table>
								</form>
								<!-- /form -->
								
								<!-- 버튼 -->
								<div class="keepbox"><input type="checkbox" name="autoLogin" id="autoLogin" value="autoLogin"><label for="autoLogin">&nbsp;자동로그인</label></div>
								<button type="button" name ="btn" value="확인" onclick="loginFn();" class="greenbtn">로그인</button>
								
								<div class="joinguard semibold"><span class="hfc-bold">간편</span> 로그인/회원가입</div>
								
								<div class="snsloginbox">
									<!-- 카카오 -->
									<a id="custom-login-btn" href="javascript:loginWithKakao()" class="snslogin"><img src="<%= request.getContextPath() %>/image/button/kakaologin.png"></a>
								
									<!-- 구글 -->
									<div id="g_id_onload" class="snslogin"
										data-client_id="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com"
										data-callback="handleCredentialResponse"
										data-auto_prompt="false">
									</div>
									<div class="g_id_signin snslogin" data-type="standard" data-size="large"
										data-theme="outline" data-text="구글 로그인" data-shape="rectangular"
										data-logo_alignment="left">
									</div>
								</div>
								
								
							</div>
							<div class="feature col">
								<lottie-player src="https://assets5.lottiefiles.com/packages/lf20_1t8na1gy.json"  background="transparent"  speed="1"  style="width: auto; height:auto;"  loop autoplay></lottie-player>
								<div class="joinguard semibold">HOWF의 새로운 회원이 되어보세요!</div>
									<a href="<%=request.getContextPath()%>/user/joinSelect.do"><button class="pinkbtn w-100">회원가입하기</button></a>
							</div>
						</div><!-- /.row -->
					</div><!-- /.whitebox --><!-- /.whitebox -->
            
				</div><!-- /.container -->
			</div><!-- /.contents 01 -->
		
			<!-- Nav --><%@include file="../Nav.jsp"%>		
			

		</div><!-- / #container -->
	
		<!-- Footer --><%@include file="../Footer.jsp"%>
		
	</div><!-- /#wrap -->
	
	<script>
	function loginFn(){
		var id = $("#email");
		var password = $("#password");
		
		if(id.val()==""){
			id.focus();
			return;
		}
		else if(password.val()==""){
			password.focus();
			return;
		}
		else {
			var frm = $("#frm").serialize();
			$.ajax({
				url:"login.do",
				data:frm,
				type:"post",
				success:function(data){
					if(data.trim() == "N"){
						alert("아직 승인이 되지 않았습니다. 승인 이후 로그인 가능합니다.");
					}
					else if(data == "FAIL"){
						alert("아이디 혹은 비밀번호가 다릅니다.");
					}
					else if(data == "FAIL2"){
						alert("존재하지 않는 회원입니다.");
					}
					else if(data == "SOCIAL"){
						alert("소셜 회원입니다. 소셜 로그인을 해주세요.")
					}
					else {
						location.href = "<%= request.getContextPath() %>/";
					}
				}
			});
		}
	}
	
	//카카오 로그인을 위한 코드
	Kakao.init('35c7c8bf307063859390df8e61188fbf');
	Kakao.isInitialized();

	function loginWithKakao() {
		window.Kakao.Auth.login({
			scope : 'profile_nickname,profile_image,account_email',
			success : function(authObj) {
				window.Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						var accessToken = Kakao.Auth.getAccessToken();
						Kakao.Auth.setAccessToken(accessToken);

						var email = response.kakao_account.email;
						var name = response.kakao_account.profile.nickname;
						
						$.ajax({
							url:"socialLogin.do",
							type:"post",
							data:"email="+email+"&name="+name+"&accessToken="+accessToken+"&social=kakao",
							success:function(data){
								if(data == "-1"){
									//해당 이메일로 가입한 유저가 이미 있으면 다른 이메일로 로그인 유도
									alert("해당 이메일로 가입한 유저가 있습니다. 다른 이메일을 사용해주세요");
									return;
								}
								else if(data == "0"){
									//닉네임 있으면 바로 이동
									location.href = "<%= request.getContextPath() %>/";
								}
								else {//닉네임이 존재하지 않는 경우(첫 소셜 로그인)
									$("#midxHidden").val(data);
									$("#emailHidden").val(email);
									//모달 띄우기
									$("#modalDiv").show();
								}
							}
						});
					}
				});
			}
		});
	}//카카오 로그인

	//구글 로그인을 위한 코드
	function handleCredentialResponse(response) {
		const responsePayload = parseJwt(response.credential);
		
		var email = responsePayload.email;
		var name = responsePayload.name;
		var accessToken = response.credential;
		
		$.ajax({
			url:"socialLogin.do",
			type:"post",
			data:"email="+email+"&name="+name+"&accessToken="+accessToken+"&social=google",
			success:function(data){
				if(data == "-1"){
					//해당 이메일로 가입한 유저가 이미 있으면 다른 이메일로 로그인 유도
					alert("해당 이메일로 가입한 유저가 있습니다. 다른 이메일을 사용해주세요");
					return;
				}
				else if(data == "0"){
					//닉네임 있으면 바로 이동
					location.href = "<%= request.getContextPath() %>/";
				}
				else {//닉네임이 존재하지 않는 경우(첫 소셜 로그인)
					$("#midxHidden").val(data);
					$("#emailHidden").val(email);
					//모달 띄우기
					$("#modalDiv").show();
				}
			}
		});
	}
	
	function parseJwt(token){
		var base64Url = token.split('.')[1];
		var base64 = base64Url.replace(/-/g, '+').replace(/_/g,'/');
		var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c){
			return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
		}).join(''));
		return JSON.parse(jsonPayload);
	};
	window.onload = function() {
		google.accounts.id.initialize({
			client_id : "729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com",
			callback : handleCredentialResponse
		});
		google.accounts.id.renderButton(document
				.getElementById("buttonDiv"), {
			theme : "outline",
			size : "large"
		} // customization attributes
		);
		google.accounts.id.prompt(); // also display the One Tap dialog
	}//구글 로그인
	
	//닉네임 입력시 중복 체크
	$(function(){
		$("#nickname").on("propertychange change keyup paste input",function(){
			if($("#nickname").val()==""){
				$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
				$("#nickname").focus();
			}
			else {
				var nickname=$("#nickname").val();
				$.ajax({
					url:"nicknameDup.do",
					data:"nickname="+nickname,
					type:"post",
					success:function(data){
						if(data == 0){
							$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationo.png'>");
							nicknameDup = false;
						}
						else {
							$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
							nicknameDup = true;
						}
					}
				});
			}
		});
	});
	
	//소셜 로그인 후 닉네임 설정
	function nicknameFn(){
		if($("#nickname").val()==""){
			$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
			return;
		}
		else if(nicknameDup == true){
			$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
			$("#nickname").focus();
			return;
		}
		else {
			$("#modalFrm").submit();
		}
	}
</script>

</body>
</html>
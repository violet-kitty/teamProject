<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 구글 로그인 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com">
<script src="https://accounts.google.com/gsi/client" async defer></script>
<!-- jquery -->
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div>
	<form>
		id : <input type="text" name="id" id="id"><br>
		password : <input type="password" name="password" id="password"><br>
		<button type="button" onclick="">로그인</button>
	</form>
	
	<a id="custom-login-btn" href="javascript:loginWithKakao()">
		<img
			src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
			width="222"
			alt="카카오 로그인 버튼"
		/>
	</a><br>
	<div id="g_id_onload"
		data-client_id="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com"
		data-callback="handleCredentialResponse"
		data-auto_prompt="false"></div>
	<div class="g_id_signin" data-type="standard" data-size="large"
		data-theme="outline" data-text="sign_in_with" data-shape="rectangular"
		data-logo_alignment="left">
	</div>
	
</div>
<script>
	function loginFn(){
		var id = $("#id");
		var password = $("#password");
		
		if(id.val()==""){
			
			return;
		}
		else if(password.val()==""){
			
			return;
		}
		else {
			
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

						location.href = "kakao.do?email=" + email
								+ "&nickname=" + name + "&accessToken=" + accessToken;
					}
				});
			}
		});
	}

	//구글 로그인을 위한 코드
	function handleCredentialResponse(response) {
		const responsePayload = parseJwt(response.credential);
	     
	     location.href="google.do?nickname="+responsePayload.name+"&email="+responsePayload.email+"&accessToken="+response.credential;
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
	}
</script>
</body>
</html>
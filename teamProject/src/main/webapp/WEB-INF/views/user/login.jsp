<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 구글 로그인 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com">
<script src="https://accounts.google.com/gsi/client" async defer></script>
<!-- jquery -->
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- 모달 CSS -->
<link href="<%= request.getContextPath() %>/css/modal.css?ver0.1" rel="stylesheet">
<script>
var nicknameDup = false;
</script>
</head>
<body>
<!-- 닉네임 받는 모달 -->
<div id="modalDiv" style="display:none">
	<div id="popupDiv">
		<form id="modalFrm" action="nicknameInsert.do" method="post">
			<p>HOWF에서 사용하실 닉네임을 입력해주세요</p>
			<input type="text" name="nickname" id="nickname" placeholder="닉네임 입력"><br>
			<p id="nicknameTxt"></p><br>
			<button type="button" class="modalBottomBtn" onclick="nicknameFn()">닉네임 입력</button>
		</form>
	</div>
</div>

<div>
	<form id="frm">
		<label>ID : <input type="text" name="email" id="email"></label><br>
		<label>PASSWORD : <input type="password" name="password" id="password"></label><br>
		<label><button type="button" onclick="loginFn()">로그인</button></label>
	</form>
	<br>
	<br>	
	<a id="custom-login-btn" href="javascript:loginWithKakao()">
		<img
			src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
			width="222"
			alt="카카오 로그인 버튼"
		/>
	</a>
	<br>
	<br>
	<div id="g_id_onload"
		data-client_id="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com"
		data-callback="handleCredentialResponse"
		data-auto_prompt="false">
	</div>
	<div class="g_id_signin" data-type="standard" data-size="large"
		data-theme="outline" data-text="sign_in_with" data-shape="rectangular"
		data-logo_alignment="left">
	</div>
</div>
<br><br>
<a href="">이메일 찾기</a>
<a href="">비밀번호 찾기</a>

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
					if(data.trim() == "Y"){
						location.href = "<%= request.getContextPath() %>/";
					}
					else if(data.trim() == "N"){
						alert("아직 승인이 되지 않았습니다. 승인 이후 로그인 가능합니다.");
					}
					else if(data == "FAIL"){
						alert("존재하지 않는 회원이거나 아이디 혹은 비밀번호가 다릅니다.");
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
							data:"email="+email+"&name="+name+"&accessToken="+accessToken,
							success:function(data){
								if(data == "0"){
									//모달 띄우기
									$("#modalDiv").show();
								}
								else {
									//닉네임 있으면 바로 이동
									location.href = "<%= request.getContextPath() %>/";
								}
							}
						});
						
						//location.href = "kakao.do?email=" + email + "&name=" + name + "&accessToken=" + accessToken;
					}
				});
			}
		});
	}

	//구글 로그인을 위한 코드
	function handleCredentialResponse(response) {
		const responsePayload = parseJwt(response.credential);
		
		var email = responsePayload.email;
		var name = responsePayload.name;
		var accessToken = response.credential;
		
		$.ajax({
			url:"socialLogin.do",
			type:"post",
			data:"email="+email+"&name="+name+"&accessToken="+accessToken,
			success:function(data){
				if(data == "0"){
					//모달 띄우기
					$("#modalDiv").show();
				}
				else {
					location.href = "<%= request.getContextPath() %>/";
				}
			}
		});
	     
	     //location.href="google.do?name="+responsePayload.name+"&email="+responsePayload.email+"&accessToken="+response.credential;
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
	
	//닉네임 입력시 중복 체크
	$(function(){
		$("#nickname").on("propertychange change keyup paste input",function(){
			if($("#nickname").val()==""){
				$("#nicknameTxt").text("닉네임을 입력해 주세요");
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
							$("#nicknameTxt").text("사용 가능한 닉네임 입니다");
							nicknameDup = false;
						}
						else {
							$("#nicknameTxt").text("이미 사용중인 닉네임 입니다");
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
			$("#nicknameTxt").text("닉네임을 입력해 주세요");
			return;
		}
		else if(nicknameDup == true){
			$("#nicknameTxt").text("이미 사용중인 닉네임 입니다");
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
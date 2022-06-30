<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta name="google-signin-client_id" content="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
<div>
	<div style="text-align:right;width:45%;display:inline-block;">
		${login.name}님 환영합니다&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:logoutFn();">로그아웃</a>
	</div>
</div>
<script>
	function logoutFn(){
		//카카오톡 로그아웃
		Kakao.init('35c7c8bf307063859390df8e61188fbf');
		Kakao.isInitialized();
		
		if(Kakao.Auth.getAccessToken()){
			Kakao.Auth.logout(function(){
				console.log("카카오톡 로그아웃");
			})
			Kakao.Auth.setAccessToken(undefined);
		}
		
		//구글 로그아웃
		if(!Kakao.Auth.getAccessToken && ${token != null}){
			google.accounts.id.disableAutoSelect();
		}
		
		location.href="<%= request.getContextPath() %>/user/logout.do";
	}
</script>
</body>
</html>
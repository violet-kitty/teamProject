<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
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
	<h1>
		Hello world!  하이d
	</h1>
	<br><p>현재 ${login.nickname}으로 로그인 됨</p><br>
	<c:if test="${login == null}">
		<br><a href="user/login.do">로그인</a><br>
		<br><a href="user/joinSelect.do">회원가입</a><br>
	</c:if>
	<br><a href="csBoard/csList.do">CS게시판(임시)</a><br>
	<c:if test="${login != null}">
		<br><a href="javascript:logoutFn()">로그아웃</a><br>
	</c:if>
	<br><a href="notice/notice.do">공지사항(notice)</a><br>
	<br><a href="howf/howfList.do">howf 추천</a><br>
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

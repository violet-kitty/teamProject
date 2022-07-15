<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 구글 로그인 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com">
<script src="https://accounts.google.com/gsi/client" async defer></script>


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
	
	//자동 로그인 쿠키 만료
	document.cookie = 'autoLoginMidx=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	document.cookie = 'autoLoginToken=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	
	location.href="<%= request.getContextPath() %>/user/logout.do";
}
</script>


<div id="header">
	<div class="topnavbar">
		<div class="container-fluid">
			
			<!-- 로고 -->
			<a href="#" class="brand"><img src="<%= request.getContextPath() %>/image/logo/logo.png"></a>
			
			<!-- 검색창 -->
			<div class="search onlypc-inline">
				<img src="<%= request.getContextPath() %>/image/icon/search.png">
				<input type="text" name="keyword" placeholder="HOWF는 여행정보, 커뮤니티, 숙박정보를 제공합니다!"> <input type="submit" value="검색">
			</div>
			
			<!-- 로그인 로그아웃 회원가입 -->
			<div class="navbtn">
				<c:if test="${login == null}">
					<a href="user/login.do"><button class="bluebtn">로그인</button></a>
					<a href="user/joinSelect.do"><button class="pinkbtn">회원가입</button></a>
				</c:if>
				<c:if test="${login != null}">
					<a href="#"><button class="profile bold">${login.nickname}</button></a>
					<a href="javascript:logoutFn()"><button class="graybtn">로그아웃</button></a>
				</c:if>
			</div>
	
		</div><!-- /.container-fluid -->
	</div><!-- /.topnavbar -->
</div><!-- /#header -->


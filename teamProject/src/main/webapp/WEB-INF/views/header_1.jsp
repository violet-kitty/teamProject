<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta name="google-signin-client_id" content="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	@media screen and (min-width:768px){
		input[type=search]{
			width:500px;
		}
		#loginBtn{
			margin-left:5em;
		}
	}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:rgba(255,255,255,0.4);">
  <div class="container-fluid">
    <a class="navbar-brand me-5" href="#">
			<img src="<%= request.getContextPath() %>/image/logo.svg" alt="HOWF" style="height:45px;">
		</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
    	<div class="justify-content-center">
    		<div style="background:white;">
    			<form class="d-flex align-items-center">
    			<img src="<%= request.getContextPath() %>/image/searchIcon.jpg" style="width:30px;height:30px;" class="mt-1 ms-1 me-2">
				<input class="form-control" style="border:none;" type="search" placeholder="HOWF 검색" aria-label="Search">
		      </form>
    		</div>
    	</div>
    	 <div>
      	<button class="btn me-2 btn-success" id="loginBtn">로그인</button>
      	<button class="btn ms-2 btn-danger">회원가입</button>
      </div>
    </div>
  </div>
</nav>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
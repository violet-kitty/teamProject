<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 구글 로그인 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="729086770108-hbv4086knp5tl5r8l77jjk01gbe4e7nd.apps.googleusercontent.com">
<script src="https://accounts.google.com/gsi/client" async defer></script>
<!-- AOS -->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
	AOS.init();
</script>
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


		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">

				<!-- 로고 -->
				<a href="<%= request.getContextPath() %>" class="brand"><img src="<%= request.getContextPath() %>/image/logo/logo.png"></a>

				<!-- 모바일 메뉴 버튼 -->
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
					<i class="fa-solid fa-bars"></i>
				</button>

				<!-- 모바일에서 접히는 메뉴 -->
				<div class="collapse navbar-collapse" id="main_nav">
					<ul class="navbar-nav ms-auto">
						<!-- <li class="nav-item active"><a class="nav-link lfc-lightgray" href="<%=request.getContextPath() %>/null.jsp"">Home</a></li> -->

						<li class="nav-item">
							<!-- 검색창 -->
							<form action="<%= request.getContextPath() %>/search.do" method="post">
								<div class="search">
									<img src="<%= request.getContextPath() %>/image/icon/search.png"> <input type="text" name="searchValue" value="${searchValue}" placeholder="모두가 나누는 여행정보 HOWF!"> <input type="submit" value="검색">
								</div>
							</form>
						</li>
						<!-- 로그인 로그아웃 회원가입 -->
						<c:if test="${login == null}">
							<li class="nav-item">
								<div class="navbtn">
									<a href="<%=request.getContextPath()%>/user/login.do">
										<button class="bluebtn">로그인</button>
									</a>
								</div>
							</li>
							<li class="nav-item item-join">
								<div class="navbtn">
									 <a href="<%=request.getContextPath()%>/user/joinSelect.do"><button class="pinkbtn">회원가입</button></a>
								</div>
							</li>
						</c:if>
						<c:if test="${login != null}">
							<li class="nav-item">
								<div class="navbtn">
								<c:if test="${login.role=='normal'}">
									<a href="<%=request.getContextPath()%>/mypage/mypage.do">
										<button class="bluebtn">
											<div class="cprofile">

												<!-- 사용자 프로필 보여주기-->
												<c:choose>
												<c:when test="${login.img != null}">
													<div class="profile" style="background-image: url(<%=request.getContextPath()%>/user/displayFile.do?fileName=${login.img});"></div>
												</c:when>
												<c:otherwise>
													<div class="profile" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:otherwise>
												</c:choose>
												${login.nickname}
											</div>
										</button>
									</a>
								</c:if>
								<c:if test="${login.role=='official'}">
									<a href="<%=request.getContextPath()%>/mypage/mypageOfficial.do">
										<button class="bluebtn">
											<div class="cprofile">

												<!-- 사용자 프로필 보여주기-->
												<c:choose>
												<c:when test="${login.img != null}">
													<div class="profile" style="background-image: url(<%=request.getContextPath()%>/user/displayFile.do?fileName=${login.img});"></div>
												</c:when>
												<c:otherwise>
													<div class="profile" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:otherwise>
												</c:choose>
												${login.nickname}
											</div>
										</button>
									</a>
								</c:if>
								<c:if test="${login.role=='business'}">
									<a href="<%=request.getContextPath()%>/mypage/mypageBusiness.do">
										<button class="bluebtn">
											<div class="cprofile">

												<!-- 사용자 프로필 보여주기-->
												<c:choose>
												<c:when test="${login.img != null}">
													<div class="profile" style="background-image: url(<%=request.getContextPath()%>/user/displayFile.do?fileName=${login.img});"></div>
												</c:when>
												<c:otherwise>
													<div class="profile" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:otherwise>
												</c:choose>
												${login.nickname}
											</div>
										</button>
									</a>
								</c:if>
								<c:if test="${login.role=='admin'}">
									<a href="<%=request.getContextPath()%>/mypage/mypageAdmin.do">
										<button class="bluebtn">
											<div class="cprofile">

												<!-- 사용자 프로필 보여주기-->
												<c:choose>
												<c:when test="${login.img != null}">
													<div class="profile" style="background-image: url(<%=request.getContextPath()%>/user/displayFile.do?fileName=${login.img});"></div>
												</c:when>
												<c:otherwise>
													<div class="profile" style="background-image: url(<%=request.getContextPath()%>/image/null/null_thumbnail.png);"></div>
												</c:otherwise>
												</c:choose>
												${login.nickname}
											</div>
										</button>
									</a>
								</c:if>
								</div>
							</li>
							<li class="nav-item item-join">
								<div class="navbtn">
									 <a href="javascript:logoutFn()"><button class="graybtn">로그아웃</button></a>
								</div>
							</li>
						</c:if>

					</ul>
				</div>
				<!-- /모바일에서 접히는 메뉴 -->

			</div>
			<!-- /.container-fluid -->
		</nav>



	</div>
	<!-- /.topnavbar -->
</div>
<!-- /#header -->


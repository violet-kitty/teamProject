<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<<<<<<< HEAD
	
 
=======
	  	
=======
	
>>>>>>> branch 'master' of https://github.com/violet-kitty/teamProject.git

>>>>>>> branch 'master' of https://github.com/violet-kitty/teamProject.git
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
			
			
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					
					<!-- 로고 -->
					<a href="#" class="brand"><img src="<%= request.getContextPath() %>/image/logo/logo.png"></a>
					
					<!-- 모바일 메뉴 버튼 -->
					<button class="navbar-toggler" type="button"data-bs-toggle="collapse" data-bs-target="#main_nav"aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa-solid fa-bars"></i>
					</button>
					
					<!-- 모바일에서 접히는 메뉴 -->
					<div class="collapse navbar-collapse" id="main_nav">
						<ul class="navbar-nav ms-auto">
		    				<!-- <li class="nav-item active"><a class="nav-link lfc-lightgray" href="<%=request.getContextPath() %>/null.jsp"">Home</a></li> -->
							
							<li class="nav-item">
								<!-- 검색창 -->
								<div class="search">
									<img src="<%= request.getContextPath() %>/image/icon/search.png">
									<input type="text" name="keyword" placeholder="HOWF는 여행정보, 커뮤니티, 숙박정보를 제공합니다!"> <input type="submit" value="검색">
								</div>
							</li>
							<li class="nav-item">
								<!-- 로그인 로그아웃 회원가입 -->
								<div class="navbtn">
									<c:if test="${login == null}">
										<a href="user/login.do">
											<button class="bluebtn">로그인</button>
										</a>
										<a href="user/joinSelect.do"><button class="pinkbtn">회원가입</button></a>
									</c:if>
									<c:if test="${login != null}">
										<a href="#">
											<button class="bluebtn">
												<div class="cprofile">
													
														<!-- 사용자 프로필 보여주기-->
														<%
														if (session.getAttribute("community_writerp") != null) {
															%>
															<div class="profile" style="background-image: url(<%= request.getContextPath() %>/image/null/프로필이미지.png);"></div>
														<%
																		
														}else{
															%>
															<div class="profile" style="background-image: url(<%= request.getContextPath() %>/image/null/null_thumbnail.png);"></div>
														<%
														}
														%>
													 
													 ${login.nickname}
												</div>
											</button>
										</a>
										<a href="javascript:logoutFn()"><button class="graybtn">로그아웃</button></a>
									</c:if>
								</div>
							</li>
						</ul>
					</div>
					<!-- /모바일에서 접히는 메뉴 -->
					
				</div> <!-- /.container-fluid -->
			</nav>
			
			

	</div><!-- /.topnavbar -->
</div><!-- /#header -->


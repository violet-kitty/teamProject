<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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


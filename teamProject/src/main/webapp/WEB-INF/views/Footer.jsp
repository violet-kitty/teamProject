<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="footer">
	<!-- bg1 -->
	<div class="bg hbg-gray">
		<div class="container footercontainer1">

			<!--row-->
			<div class="row">
				<div class="col-lg-4 col-md-12 company">
					<!-- 로고 -->
					<a href="#" class="companylogo"><img src="<%= request.getContextPath() %>/image/logo/logo.png"></a>
					<p class="companyinfo hfc-medium">HOWF는 여행정보, 커뮤니티, 숙박정보을 보다 효율적
					이고 쉽고 편리하게 제공하기 위해 노력합니다.<br>
					HOWF와 함께 더 멋진 여행계획을 만들어보세요!</p>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 onlypc"></div>

				<%
				if (session.getAttribute("lmidx") != null) {
					// 회원만 보이는 로그인 경로
					out.println("<div class='col-lg-2 col-md-6  col-sm-6 col-xs-6 sitemap'><p class='text-uppercase'>Account</p><ul class='list-unstyled'><li><a href='null.jsp'>내 정보</a></li><li><a href='null.jsp'>내 글 관리</a></li><li><a href='null.jsp'>내 댓글 관리</a></li></ul></div>");
				} else {
					// 회원이 아니면 숨김
					out.println("<div class='col-lg-2 col-md-6 col-sm-6 col-xs-6 onlypc'></div>");
				}
				%>

				<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 sitemap">
					<p class="text-uppercase hfc-bold">기업정보</p>
					<ul class="list-unstyled hfc-medium">
						<li><a href="<%=request.getContextPath() %>/null.jsp">HOWF</a></li>
						<li><a href="<%=request.getContextPath() %>/null.jsp">연혁</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 sitemap">
					<p class="text-uppercase hfc-bold">문의</p>
					<ul class="list-unstyled hfc-medium">
						<li><a href="<%=request.getContextPath() %>/null.jsp">FAQ</a></li>
						<li><a href="<%=request.getContextPath() %>/null.jsp">1:1 Q&A</a></li>
					</ul>
				</div>
			</div>
			<!--.row-->

			<hr class="mb-4" />

			<!-- snsarea -->
			<div class="snsarea">
				<a href="<%=request.getContextPath() %>/null.jsp"><img src="<%= request.getContextPath() %>/image/button/sns1.png"></a>
				<a href="<%=request.getContextPath() %>/null.jsp"><img src="<%= request.getContextPath() %>/image/button/sns2.png"></a>
				<a href="<%=request.getContextPath() %>/null.jsp"><img src="<%= request.getContextPath() %>/image/button/sns3.png"></a>
				<a href="<%=request.getContextPath() %>/null.jsp"><img src="<%= request.getContextPath() %>/image/button/sns4.png"></a>
				<a href="<%=request.getContextPath() %>/null.jsp"><img src="<%= request.getContextPath() %>/image/button/sns5.png"></a>
				<a href="<%=request.getContextPath() %>/null.jsp"><img src="<%= request.getContextPath() %>/image/button/sns6.png"></a>
			</div>
			<!-- /.snsarea -->

		</div>
		<!-- /.container -->
	</div>
	<!-- /.bg1 -->
	
	<!-- bg2 -->
	<div class="bg hbg-lightgray">
		<div class="container footercontainer2">
			<div class="row">
				<div class="col-sm-6 col-xs-12 copyright hfc-bold">
					<p>© 2022 HOWF. ALL RIGHTS RESERVED</p>
				</div>
				<div class="col-sm-6 col-xs-12 policy hfc-bold">
					<a href="<%=request.getContextPath() %>/null.jsp">Privacy Policy</a>
					<a href="<%=request.getContextPath() %>/null.jsp">Terms of Service</a>
				</div>
				
			</div>
		</div>
	</div><!-- / bg2 -->
	
	<!-- bg3 -->
	<div class="mobilebottom onlymobile">
	<p>.</p>
	</div>
	<!-- /bg3 -->
	
</div>
<!-- /#footer -->

<script>
	// 뒤로가기 (이전페이지로 이동)
	function history_go1() {
		history.go(-1);
	}
</script>

<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
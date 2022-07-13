<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="footer">
	<!-- bg1 -->
	<div class="bg lbg-footer">
		<div class="container footercontainer1">

			<!--row-->
			<div class="row">
				<div class="col-lg-4 col-md-12 company">
					<p class="companylogo">LEAFYeco</p>
					<p class="companyinfo">리피에코는 Zero Waste 정신을 생활화 시키며 Net_Zero를
						목표로 지속가능한 지구를 만들어 세상에 보탬이 되는 기업이 되기 위하여 노력합니다</p>
				</div>
				<div class="col-lg-2 col-md-4 col-xs-12 desktop"></div>

				<%
				if (session.getAttribute("lmidx") != null) {
					// 회원만 보이는 로그인 경로
					out.println("<div class='col-lg-2 col-md-4 col-xs-12 sitemap'><p class='text-uppercase'>Account</p><ul class='list-unstyled'><li><a href='null.jsp'>내 정보</a></li><li><a href='null.jsp'>내 글 관리</a></li><li><a href='null.jsp'>내 댓글 관리</a></li></ul></div>");
				} else {
					// 회원이 아니면 숨김
					out.println("<div class='col-lg-2 col-md-4 col-xs-12 desktop'></div>");
				}
				%>

				<div class="col-lg-2 col-md-4 col-xs-12 sitemap">
					<p class="text-uppercase">기업정보</p>
					<ul class="list-unstyled">
						<li><a href="<%=request.getContextPath() %>/null.jsp">LEAFYeco</a></li>
						<li><a href="<%=request.getContextPath() %>/null.jsp">연혁</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-4 col-xs-12 sitemap">
					<p class="text-uppercase">FAQs</p>
					<ul class="list-unstyled">
						<li><a href="<%=request.getContextPath() %>/null.jsp">문의</a></li>
					</ul>
				</div>
			</div>
			<!--.row-->

			<hr class="mb-4" />

			<!-- snsarea -->
			<div class="snsarea">
				<a href="<%=request.getContextPath() %>/null.jsp"><img src="/LeafyWeb/images/sns1.png"></a> <a
					href="<%=request.getContextPath() %>/null.jsp"><img src="/LeafyWeb/images/sns2.png"></a> <a
					href="<%=request.getContextPath() %>/null.jsp"><img src="/LeafyWeb/images/sns3.png"></a> <a
					href="<%=request.getContextPath() %>/null.jsp"><img src="/LeafyWeb/images/sns4.png"></a> <a
					href="<%=request.getContextPath() %>/null.jsp"><img src="/LeafyWeb/images/sns5.png"></a>
			</div>
			<!-- /.snsarea -->

		</div>
		<!-- /.container -->
	</div>
	<!-- /.bg1 -->
	
	<!-- bg2 -->
	<div class="bg lbg-lightergray">
		<div class="container footercontainer2">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-xs-12 copyright">
					<p>© 2022 LEAFYeco. ALL RIGHTS RESERVED</p>
				</div>
				<div class="col-lg-2 col-md-3 col-xs-12 desktop"></div>
				<div class="col-lg-2 col-md-3 col-xs-12 desktop"></div>
				<div class="col-lg-2 col-md-3  policy">
					<a href="<%=request.getContextPath() %>/null.jsp">Privacy Policy</a>
				</div>
				<div class="col-lg-2 col-md-3 policy">
					<a href="<%=request.getContextPath() %>/null.jsp">Terms of Service</a>
				</div>
				
			</div>
		</div>
	</div>
</div>
<!-- /#footer -->

<script>
	// 뒤로가기 (이전페이지로 이동)
	function history_go1() {
		history.go(-1);
	}
</script>

<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
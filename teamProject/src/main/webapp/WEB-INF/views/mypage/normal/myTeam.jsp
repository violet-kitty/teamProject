<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>페이지 제목</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap5 최신 CSS & JS (Popper.js 포함됨) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Bootstrap5 AwsomeFont -->
<script src="https://kit.fontawesome.com/a54851838a.js" crossorigin="anonymous"></script>
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<style>
.table a{
	color: #54ACA8;
}
</style>
</head>
<body>
	<div id="wrap">
		
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
				<table class="table text-center">
					<tbody>
						<tr>
							<th width="60%">너나들이 팀 이름</th>
							<th width="20%">너나들이 팀 가입신청</th>
							<th width="20%">너나들이 팀 가입신청일</th>
						</tr>
						<c:if test="${jv.size() == 0}">
							<tr>
								<td colspan="3">가입신청 한 너나들이 팀이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="jv" items="${jv}">
							<tr>
								<c:if test="${jv.joinyn == 'N'}">
									<td><a href="#" id="joinN" style="color: #DE8889">${jv.title}</a></td>
								</c:if>
								<c:if test="${jv.joinyn == 'Y'}">
									<td><a href="<%=request.getContextPath()%>/team/teamTeam.do?tidx=${jv.tidx}">${jv.title}</a></td>
								</c:if>
								<c:if test="${jv.joinyn == 'N'}">
									<td style="color: #DE8889">${jv.joinyn}</td>
								</c:if>
								<c:if test="${jv.joinyn == 'Y'}">
									<td style="color: #54ACA8">${jv.joinyn}</td>
								</c:if>
								<c:if test="${jv.joinyn == 'N'}">
									<td style="color: #DE8889">${jv.jdate}</td>
								</c:if>
								<c:if test="${jv.joinyn == 'Y'}">
									<td style="color: #54ACA8">${jv.jdate}</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
<script>
	$(function(){
		$("#joinN").click(function(){
			modalFn("가입승인되지 않은 너나들이 팀 페이지에는 참여하실 수 없습니다.", "확인");
			return;
		});
	});
</script>
</body>
</html>
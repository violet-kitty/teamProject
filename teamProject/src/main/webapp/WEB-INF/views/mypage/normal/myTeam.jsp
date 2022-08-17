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
					<thead>
						<tr>
							<th width="30%">너나들이 이름</th>
							<th width="20%">관리자</th>
							<th width="20%">가입여부</th>
							<th width="20%">가입 신청일</th>
							<th width="10%">신청목록</th>
						</tr>
					</thead>
					<tbody>
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
								<td>
									${jv.nickname}
								</td>
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
								<td>
									<c:if test="${login.midx == jv.midx}">
										<button type="button" onclick="applyList('${jv.tidx}')">목록</button>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="showList">
					
				</div>
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
<script>
	$(function(){
		$("#joinN").click(function(){
			modalFn("가입승인되지 않은 너나들이 팀에는 참여하실 수 없습니다.", "확인");
			return;
		});
	});
	
	function applyList(tidx){
		$.ajax({
			url: "applyList.do",
			data: "tidx="+tidx,
			type:"post",
			success: function(data){
				var html = "";
				if(data.length == 0) html = "신청한 사람이 존재하지 않습니다.";
				else {
					html = '<table class="table">'
						+ '<thead>'
						+ '<tr>'
						+ '<th width="30%">닉네임</th><th width="40%">가입일</th><th width="30%">가입승인</th>'
						+ '</tr>'
						+ '<tbody>';
					
					for(var j=0; j<data.length; j++){
						html = html + "<tr><td rowspan='2'>"+data[j].nickname+"</td><td rowspan='2'>"+data[j].jdate+"</td>"
						+ "<td><button onclick='apply_Y("+data[j].jidx+")' style='width:30px;border:none;cursor:pointer;border-radius:100%'><img src='<%= request.getContextPath() %>/image/icon/verificationo.png' style='width:20px;height:20px;'></button></td></tr>"
						+ "<tr><td><button onclick='apply_N("+data[j].jidx+")' style='width:30px;border:none;cursor:pointer;border-radius:100%'><img src='<%= request.getContextPath() %>/image/icon/verificationx.png' style='width:20px;height:20px;'></button></td>"
						+ "</tr>";
					}
					
					html = html + "</tbody></table>";
					
				}
				modalFn(html, "닫기");
				
			}
		});
		
		
	}
	
	function apply_Y(jidx){
		 $.ajax({
			url: "apply_Y.do",
			data: "jidx="+jidx,
			type: "post",
			success:function(data){
				modalFn("가입신청을 승인하였습니다.");
				setTimeout(function(){
					modalClose();
					location.reload();
				}, 1000);
				
			}
		});
	}
	
	function apply_N(jidx){
 		$.ajax({
			url: "apply_N.do",
			data:"jidx="+jidx,
			type: "post",
			success:function(data){
				modalFn("가입신청을 거절하였습니다.");
				setTimeout(function(){
					modalClose();
					location.reload();
				}, 1000);
			}
		});
	}
</script>
</body>
</html>
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

<!-- 이미지 자르기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- CSS3 - Mypage --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage.css">

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
				<div class="container hbg-whitegray bgpadding">
					
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>내정보</h1>
						</div>
					</div>
					<br><br>
					
					<!-- 프로필 이미지 -->
					<div class="row" style="text-align:center;">
						<div class="col-lg-4">
							
							<!-- 프로필 이미지 -->
							<c:choose>
							<c:when test="${login.img ==  null}">
								<img src="<%=request.getContextPath()%>/image/null/null_thumbnail.png" style="border-radius:50%;width:200px;height:200px;">
							</c:when>
							<c:otherwise>
								<img src="<%=request.getContextPath()%>/mypage/displayFile.do?fileName=${login.img}" style="border-radius:50%;width:200px;height:200px;">
							</c:otherwise>
							</c:choose>
							<img><br><br>
							<button onclick="location.href='profileImg.do'" class="bluebtn">프로필 이미지 수정하기</button>
							
						</div>
						
						<div class="col-lg-8 onlypc">
							이름 ${profile.name}<br><br>
							닉네임 ${profile.nickname}<br><br>
							생년월일 ${profile.jumin}<br><br>
							이메일 ${profile.email}<br><br>
							연락처 ${profile.phone}<br><br>
							주소 ${profile.addr} ${profile.detailaddr}<br><br>
							<br>
							<button onclick="location.href='profile.do'" class="bluebtn">정보 수정</button>
						</div>
					</div>
					
					<br><hr><br>
					
					<div class="row onlytablet" style="text-align:center;">
						<div class="col">
							이름 ${profile.name}<br><br>
							닉네임 ${profile.nickname}<br><br>
							생년월일 ${profile.jumin}<br><br>
							이메일 ${profile.email}<br><br>
							연락처 ${profile.phone}<br><br>
							주소 ${profile.addr} ${profile.detailaddr}<br><br>
							<br>
							<button onclick="location.href='profile.do'" class="bluebtn">정보 수정</button>
						</div>
					</div>
					
					
					<!-- 탈퇴 버튼 -->
					<br><br><br><br><br><br><br><br><br>
					<button onclick="delyn()" class="pinkbtn">회원 탈퇴</button>
					
				
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
<script>
	function delyn(){
		modalFn("정말 탈퇴하시겠습니까?","탈퇴","회원 탈퇴","취소");
	}
	
	function modalOkFn(){
		modalClose();
		$.ajax({
			url:"delyn.do",
			success:function(data){
				if(data == 1){
					modalFn("탈퇴가 완료되었습니다");
					setTimeout(function(){
						modalClose();
						location.href="<%= request.getContextPath() %>/user/logout.do";
					},1000);
				}
				else {
					modalFn("탈퇴 실패!");
					setTimeout(function(){
						modalClose();
						location.reload();
					},1000);
				}
			}
		});
	}
</script>
	
</body>
</html>
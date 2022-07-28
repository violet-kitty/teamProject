<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF회원가입</title>

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

<!-- 주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav2.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - user --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/user.css" />

<script>
	var emailDup = false;
	var nicknameDup = false;
</script>

</head>
<body>
	<div id="wrap" class="joinUs">
		<!-- Header --><%@include file="../Header.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-white">
			<div class="joinbg">
				<div class="container">
					<div class="whitebox">
						<h2 class="hfc-bold">일반회원 회원가입</h2>
						<p class="subtitle">이미 계정이 있나요? <a href="<%=request.getContextPath()%>/user/login.do">로그인하러가기</a> </p>
						<div class="row row-cols-1 row-cols-lg-2">
							<div class="feature col">
								<!-- form -->
								<form id="frm" action="join.do" method="post" enctype="multipart/form-data">
									<table border="1">
										<tr class="col2">
											<td><input type="text" name="name" id="name" placeholder="이름" placeholder="이름"><span id="nameTxt"></span></td>
											<td><input type="text" name="nickname" id="nickname" placeholder="닉네임"><span id="nicknameTxt"></span></td>
										</tr>
										<tr class="col1">
											<td colspan="2"><input type="date" id="jumin" name="jumin" placeholder="생년월일"></td>
										</tr>
										<tr class="col1">
											<td colspan="2"><input type="email" id="email" name="email" placeholder="이메일" required=""><br><span id="emailTxt"></span></td>
										</tr>
										<tr class="col1">
											<td colspan="2"><input type="text" id="phone" name="phone" placeholder="연락처(-빼고 입력해 주세요)" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"></td>
										</tr>
										<tr class="col2">
											<td><input type="password" id="password" name="password" placeholder="새 비밀번호"><br><span id="pwdTxt"></span></td>
											<td><input type="password" id="passwordOk" name="passwordOk" placeholder="비밀번호 확인"><br><span id="pwdOkTxt"></span></td>
										</tr>
										<tr class="col1">
											<td colspan="2"><input type="text" class="address" id="address" name="addr" placeholder="주소 (도,시,구,동)" readOnly>
											<input type="button" onclick="addrFn()" class="graybtn" value="주소 찾기"></td>
										</tr>
										<tr class="col1">
											<td colspan="2">
												<input type="text" id="detailAddress" name="detailaddr" placeholder="상세주소" readOnly style="border-bottom:none;"><br>
											</td>
										</tr>
									</table>
								</form>
								<!-- /form -->
								
								<!-- 버튼 -->
								<button type="button" name ="btn" value="확인" onclick="joinFn()" class="greenbtn">회원가입</button>
							</div>
							<div class="feature col onlypc">
									<lottie-player src="https://assets6.lottiefiles.com/packages/lf20_boJRmE.json"  background="transparent"  speed="1"  style="width: 100%;"  loop autoplay></lottie-player>
							</div>
						</div><!-- /.row -->
					</div><!-- /.whitebox -->
            
				</div><!-- /.container -->
			</div><!-- /.contents 01 -->
		
			<!-- Nav --><%@include file="../Nav.jsp"%>		
			

		</div><!-- / #container -->
	
		<!-- Footer --><%@include file="../Footer.jsp"%>
		
	</div><!-- /#wrap -->


	<script>
		$(function() {
			//필수입력 값들 blur, change 이벤트
			$("#name").on("propertychange change keyup paste input",
					function() {
						if ($("#name").val() == "") {
							$("#nameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
							$("#name").focus();
						} else {
							$("#nameTxt").text("");
						}
					});
			$("#nickname").on(
					"propertychange change keyup paste input",
					function() {
						if ($("#nickname").val() == "") {
							$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
							$("#nickname").focus();
						} else {
							var nickname = $("#nickname").val();
							$.ajax({
								url : "nicknameDup.do",
								data : "nickname=" + nickname,
								type : "post",
								success : function(data) {
									if (data == 0) {
										$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationo.png'>");
										nicknameDup = false;
									} else {
										$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
										nicknameDup = true;
									}
								}
							});
						}
					});
			
			
			$("#email").on("propertychange change keyup paste input",
					function() {
			      
						var email = $("#email").val();
						
						if(email.includes('@')==false){
							$("#emailTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
							return;
						}
						else if (email == "") {
							$("#emailTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
							$("#email").focus();
							return;
						} else {
							$.ajax({
								url : "emailDup.do",
								data : "email=" + email,
								type : "post",
								success : function(data) {
									if (data == 0) {
										$("#emailTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationo.png'>");
										emailDup = false;
									} else {
										$("#emailTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
										emailDup = true;
									}
								}
							});
						}
					});
			$("#password").on(
					"propertychange change keyup paste input",
					function() {
						if ($("#password").val() == "") {
							$("#pwdTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
							$("#password").focus();
						} else {
							if ($("#passwordOk").val() != ""
									&& $("#password").val() != $("#passwordOk")
											.val()) {
								$("#pwdOkTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
								$("#passwordOk").focus();
							} else {
								$("#pwdTxt").text("");
								$("#pwdOkTxt").text("");
							}
						}
					});
			$("#passwordOk").on(
					"propertychange change keyup paste input",
					function() {
						if ($("#passwordOk").val() == "") {
							$("#pwdOkTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
							$("#passwordOk").focus();
						} else {
							if ($("#password").val() != ""
									&& $("#password").val() != $("#passwordOk")
											.val()) {
								$("#pwdOkTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
								$("#passwordOk").focus();
							} else {
								$("#pwdTxt").text("");
								$("#pwdOkTxt").text("");
							}
						}
					});
		});
		//주소 입력 api
		function addrFn() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$("#address").val(addr);
					// 커서를 상세주소 필드로 이동한다.
					$("#detailAddress").removeAttr("readonly");
					$("#detailAddress").focus();
				}
			}).open();
		}
		//입력값 체크,이동
		function joinFn() {
			var name = $("#name");
			var nickname = $("#nickname");
			var email = $("#email");
			var password = $("#password");
			var passwordOk = $("#passwordOk");
			
			if(email.val().includes('@')==false){
				alert("이메일이 아닙니");
				return;
			}
			if (name.val() == "") {
				$("#nameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
				name.focus();
				return;
			} else if (nickname.val() == "") {
				$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
				nickname.focus();
				return;
			} else if (nicknameDup == true) {
				$("#nicknameTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
				nickname.focus();
				return;
			} else if (email.val() == "") {
				$("#emailTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
				email.focus();
				return;
			} else if (emailDup == true) {
				$("#emailTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
				email.focus();
				return;
			} else if (password.val() == "") {
				$("#pwdTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
				password.focus();
				return;
			} else if (passwordOk.val() == "") {
				$("#pwdOkTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
				passwordOk.focus();
				return;
			} else if (password.val() != passwordOk.val()) {
				$("#pwdOkTxt").html("<img src='<%= request.getContextPath() %>/image/icon/verificationx.png'>");
				passwordOk.focus();
				return;
			} else {
				$("#frm").submit();
			}
		}
	</script>

</body>
</html>
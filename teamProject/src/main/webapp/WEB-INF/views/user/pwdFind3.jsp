<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- jquery -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col">
			<form id="frm" action="pwdFindComplete.do" method="post">
				<input type="password" name="password" id="password" placeholder="비밀번호"><br>
				<span id="txt1"></span>
				<input type="password" name="passwordOK" id="passwordOK" placeholder="비밀번호 확인"><br>
				<span id="txt2"></span>
				<button  type="button" onclick="inputCheck()">확인</button>
			</form>
		</div>
	</div>
</div>
<script>
	$("#password").on("propertychange change keyup paste input",function(){
		if($("#password").val()==""){
			$("#txt1").text("비밀번호를 입력해 주세요");
			$("#password").focus();
		}
		else {
			if($("#passwordOK").val()!="" && $("#password").val() != $("#passwordOK").val()){
				$("#txt2").text("비밀번호가 다릅니다");
				$("#passwordOK").focus();
			}
			else {
				$("#txt1").text("");
				$("#txt2").text("");
			}
		}
	});
	
	$("#passwordOK").on("propertychange change keyup paste input",function(){
		if($("#passwordOK").val()==""){
			$("#txt2").text("비밀번호 확인을 입력해 주세요");
			$("#passwordOK").focus();
		}
		else {
			if($("#password").val()!="" && $("#password").val() != $("#passwordOK").val()){
				$("#txt2").text("비밀번호가 다릅니다");
				$("#passwordOK").focus();
			}
			else {
				$("#txt1").text("");
				$("#txt2").text("");
			}
		}
	});

	function inputCheck(){
		var pwd = $("#password");
		var pwdOK = $("#passwordOK");
		
		if(pwd.val()==""){
			pwd.focus();
			$("#txt1").text("비밀번호를 입력해 주세요");
			return;
		}
		else if(pwdOK.val()==""){
			pwdOK.focus();
			$("#txt2").text("비밀번호 확인을 입력해 주세요");
			return;
		}
		else if(pwd.val()!=pwdOK.val()){
			pwdOk.focus();
			$("#txt2").text("비밀번호가 다릅니다");
			return;
		}
		else {
			var frm = $("#frm").serialize();
			$.ajax({
				url:"pwdFindComplete.do",
				data:frm,
				type:"post",
				success:function(data){
					if(data==0){
						alert("비밀번호 변경에 실패했습니다. 다시 시도해 주세요");
						return;
					}
					else {
						alert("비밀번호가 변경되었습니다");
						location.href='login.do';
					}
				}
			});
		}
	}
</script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
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
<script>
	var getCookie = function(name){
		var value = document.cookie.match('(^|;)?'+name+'=([^;]*)(;|$)');
		return value? value[2] : null;
	}
	function authCheck(){
		var cookie = getCookie("authNum");	//쿠키에 저장된 인증 번호 가져오기
		var input = $("#code").val();//입력된 값 가져오기
		if(cookie == input){
			location.href="pwdFindComplete.do?email=${email}";
		}
		else {
			alert("인증번호가 일치하지 않습니다");
		}
	}
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col">
			${email}로 인증 메일을 보냈습니다<br>
			아래 인증 코드를 입력해 주세요<br>
			<input type="text" size="3" id="code" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"><br>
			<button onclick="authCheck()">입력</button>
		</div>
	</div>
</div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
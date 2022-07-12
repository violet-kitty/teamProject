<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form id="frm" action="emailFind.do" method="post">
				<p>가입시 사용한 이름과 닉네임을 입력해주세요</p>
				이름 <input type="text" name="name" id="name"><br>
				닉네임 <input type="text" name="nickname" id="nickname"><br>
				<input type="hidden" name="email" id="email">
				<button type="button" id="btn">입력완료</button>
			</form>
		</div>
	</div>
</div>

<script>
	$(function(){
		$("#btn").on("click",function(){
			var name = $("#name");
			var nickname = $("#nickname");
			
			if(name.val()==""){
				alert("이름을 입력해 주세요");
				name.focus();
				return;
			}
			else if(nickname.val()==""){
				alert("닉네임을 입력해 주세요");
				nickname.focus();
				return;
			}
			else {
				var frm = $("#frm").serialize();
				$.ajax({
					url:"userExist.do",
					data:frm,
					type:"post",
					success:function(data){
						if(data==null || data==""){
							alert("일치하는 회원이 없습니다");
							return;
						}
						else {
							$("#email").val(data);
							$("#frm").submit();
						}
					}
				});
			}
		});
	});
</script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
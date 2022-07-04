<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원가입</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var emailDup = false;
	var nicknameDup = false;
</script>
</head>
<body>
	<div>
		<form id="frm" action="join.do" method="post" enctype="multipart/form-data">
			<input type="text" name="name" id="name" placeholder="이름"><br>
			<span id="nameTxt"></span><br>
			<input type="text" name="nickname" id="nickname" placeholder="닉네임"><br>
			<span id="nicknameTxt"></span><br>
			<input type="text" id="jumin" name="jumin"><br>
			<input type="email" id="email" name="email" placeholder="이메일"><br>
			<span id="emailTxt"></span><br>
			<input type="password" id="password" name="password" placeholder="비밀번호"><br>
			<span id="pwdTxt"></span><br>
			<input type="password" id="passwordOk" name="passwordOk" placeholder="비밀번호 확인"><br>
			<span id="pwdOkTxt"></span><br>
			<input type="text" id="phone" name="phone" placeholder="연락처"><br>
			<input type="button" onclick="addrFn()" value="주소 찾기"><br>
			<input type="text" id="address" name="addr" placeholder="주소" readOnly><br>
			<input type="text" id="detailAddress" name="detailaddr" placeholder="상세주소"><br>
			<input type="file" id="document" name="file"><br>
			<button type="button" onclick="joinFn()">회원가입</button>
		</form>
	</div>

<script>
	$(function(){
		//생년월일 입력 datePicker
		$("#jumin").datepicker({
			showOn:'button',
			showButtonPanel:true,
			closeText:'닫기',
			dateFormat:'yy-mm-dd',
			changeMonth:true,
			changeYear:true,
			nextText:'다음 달',
			prevText:'이전 달',
			dayNames:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
			dayNamesMin:['월','화','수','목','금','토','일'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort:['1','2','3','4','5','6','7','8','9','10','11','12']
		});
		//초기값을 오늘 날짜로
		$("#jumin").datepicker("setDate","today");
		
		
		//필수입력 값들 blur, change 이벤트
		$("#name").on("propertychange change keyup paste input",function(){
			if($("#name").val()==""){
				$("#nameTxt").text("이름을 입력해 주세요");
				$("#name").focus();
			}
			else {
				$("#nameTxt").text("");
			}
		});
		$("#nickname").on("propertychange change keyup paste input",function(){
			if($("#nickname").val()==""){
				$("#nicknameTxt").text("닉네임을 입력해 주세요");
				$("#nickname").focus();
			}
			else {
				var nickname=$("#nickname").val();
				$.ajax({
					url:"nicknameDup.do",
					data:"nickname="+nickname,
					type:"post",
					success:function(data){
						if(data == 0){
							$("#nicknameTxt").text("사용 가능한 닉네임 입니다");
							nicknameDup = false;
						}
						else {
							$("#nicknameTxt").text("이미 사용중인 닉네임 입니다");
							nicknameDup = true;
						}
					}
				});
			}
		});
		$("#email").on("propertychange change keyup paste input",function(){
			var email = $("#email").val();
			if(email==""){
				$("#emailTxt").text("이메일을 입력해 주세요");
				$("#email").focus();
			}
			else {
				$.ajax({
					url:"emailDup.do",
					data:"email="+email,
					type:"post",
					success:function(data){
						if(data == 0){
							$("#emailTxt").text("사용 가능한 이메일 입니다");
							emailDup = false;
						}
						else {
							$("#emailTxt").text("이미 사용중인 이메일 입니다");
							emailDup = true;
						}
					}
				});
			}
		});
		$("#password").on("propertychange change keyup paste input",function(){
			if($("#password").val()==""){
				$("#pwdTxt").text("비밀번호를 입력해 주세요");
				$("#password").focus();
			}
			else {
				if($("#passwordOk").val()!="" && $("#password").val() != $("#passwordOk").val()){
					$("#pwdOkTxt").text("비밀번호가 다릅니다");
					$("#passwordOk").focus();
				}
				else {
					$("#pwdTxt").text("");
					$("#pwdOkTxt").text("");
				}
			}
		});
		$("#passwordOk").on("propertychange change keyup paste input",function(){
			if($("#passwordOk").val()==""){
				$("#pwdOkTxt").text("비밀번호 확인을 입력해 주세요");
				$("#passwordOk").focus();
			}
			else {
				if($("#password").val()!="" && $("#password").val() != $("#passwordOk").val()){
					$("#pwdOkTxt").text("비밀번호가 일치하지 않습니다");
					$("#passwordOk").focus();
				}
				else {
					$("#pwdTxt").text("");
					$("#pwdOkTxt").text("");
				}
			}
		});
		
	});
	
	//주소 입력 api
	function addrFn() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	
	//파일 확장자 체크
	$("#document").on("change",function(){
		var fileName = $("#document").val();
		
		fileName = fileName.slice(fileName.indexOf(".")+1).toLowerCase();
		
		if(fileName != "jpg" && fileName != "jpeg" && fileName != "png" && fileName != "gif" && fileName != "bmp"){
			alert("이미지 파일만 등록 가능합니다");
			$("#document").val("");
			return;
		}
	});
	
	//입력값 체크,이동
	function joinFn(){
		var name = $("#name");
		var nickname = $("#nickname");
		var email = $("#email");
		var password = $("#password");
		var passwordOk = $("#passwordOk");
		
		if(name.val()==""){
			$("#nameTxt").text("이름을 입력해 주세요");
			name.focus();
			return;
		}
		else if(nickname.val()==""){
			$("#nicknameTxt").text("닉네임을 입력해 주세요");
			nickname.focus();
			return;
		}
		else if(nicknameDup == true){
			$("#nicknameTxt").text("이미 사용중인 닉네임 입니다");
			nickname.focus();
			return;
		}
		else if(email.val()==""){
			$("#emailTxt").text("이메일을 입력해 주세요");
			email.focus();
			return;
		}
		else if(emailDup == true){
			$("#emailTxt").text("이미 사용중인 이메일 입니다");
			email.focus();
			return;
		}
		else if(password.val()==""){
			$("#pwdTxt").text("비밀번호를 입력해 주세요");
			password.focus();
			return;
		}
		else if(passwordOk.val()==""){
			$("#pwdOkTxt").text("비밀번호 확인을 입력해 주세요");
			passwordOk.focus();
			return;
		}
		else if(password.val()!=passwordOk.val()){
			$("#pwdOkTxt").text("비밀번호가 일치하지 않습니다");
			passwordOk.focus();
			return;
		}
		else if($("#document").val()==""){
			alert("사업자 등록증을 등록해 주세요");
		}
		else {
			$("#frm").submit();
		}
	}
</script>
</body>
</html>
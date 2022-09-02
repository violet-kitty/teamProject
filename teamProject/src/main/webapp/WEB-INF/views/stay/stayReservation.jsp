<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF숙박정보</title>

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
<!-- 결제 api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardWrite공용세팅 --> <link rel="stylesheet" href="<%=request.getContextPath()%>/css/stayWrite.css">


<script>
	//본인인증 여부
	var auth = false;
</script>
</head>
<body>
	<div id="wrap" class="boardWrite stay stayWrite">
	
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container"  style="width:400px;">
					
					<style>
					.infoinfo h3: {margin:0px 0px 24px 0px;}
					.infoinfo p {margin:24px 0px;}
					.infoinfo2 input {margin:8px 0px 16px 0px;}
					</style>
					<!-- 객실 정보 -->
					<div class="row infoinfo hbshadow3 hbg-white" style="padding:32px;margin-bottom:32px;">
						<div class="col">
							<h3>숙소이름 : <span class="hfc-blue hfc-bold">${res.sname}</span></h3>
							<p>객실타입/기간 : <span class="hfc-blue hfc-bold">${res.rname}</span></p>
							<p>체크인 : <span class="hfc-blue hfc-bold">${res.date1}</span></p>
							<p>체크아웃 : <span class="hfc-blue hfc-bold">${res.date2}</span></p>
							<hr>
							<h3 style="margin:24px 0px 0px 0px;">총 결제 금액 : <span class="hfc-pink hfc-bold">${res.price} 원</span></h3>
						</div>
					</div>
					<!-- 예약 페이지 -->
					
					<div class="row infoinfo2">
						<div class="col"> 
							<form>
								예약자 이름<br>
								<input type="text" name="name" id="name" placeholder="체크인시 필요한 정보입니다"><br>
								휴대폰 번호<br>
								<!-- 10~11개 숫자만 받기 -->
								<div style="position:relative;">
									<input type="text" name="phone" id="phone" placeholder="번호숫자만 입력해 주세요" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');" size="11">
									<button type="button" class="greenbtn" onclick="authFn()" style=" border-radius:10px; top:16px; right:10px; padding: 8px 16px 8px 16px; width:150px; position:absolute;">인증번호전송</button>
									<p  style="position:block; width:100%; text-align:right;"  id="txt"></p>
								</div>
								
								<div style="position:relative;">
									<input type="text" name="auth" id="auth" placeholder="인증번호 입력">
									<button type="button" class="pinkbtn" onclick="authOkFn()" style=" border-radius:10px; top:16px; right:10px; padding: 8px 16px 8px 16px; width:100px; position:absolute;">인증하기</button>
									<p style="position:block; width:100%; text-align:right;" id="txt2"></p>
								</div>
								
								<hr style="margin:24px 0px 32px 0px;">
								<div style="text-align:center;">
									<button type="button" class="bluebtn" onclick="tradeFn()">결제하기</button>
								</div>
								
							</form>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col">
							
						</div>
					</div>
					
					
					
					
					
					
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
	
	<script>
		$(function(){
			//아임 포트
			var IMP = window.IMP;
			IMP.init("imp18334167");
		});
		
		//인증번호 받기
		function authFn(){
			$.ajax({
				url:"authPerson.do",
				data:"phone="+$("#phone").val(),
				type:"post",
				success:function(){
					$("#txt").text("인증번호가 발송되었습니다. 인증번호를 입력해주세요");
					return;
				}
			});
		}
		
		//쿠키 가져오기
		var getCookie = function(name){
			var value = document.cookie.match('(^|;)?'+name+'=([^;]*)(;|$)');
			return value? value[2] : null;
		}
		
		//인증번호 입력
		function authOkFn(){
			//쿠키의 값과 비교
			var cookie = getCookie("authNum");	//쿠키에 저장된 인증 번호 가져오기
			var input = $("#auth").val();//입력된 값 가져오기
			if(cookie == input){
				auth = true;
				$("#txt").text("");
				$("#txt2").text("인증되었습니다");
				return;
			}
			else {
				$("#txt").text("");
				$("#txt2").text("인증번호가 일치하지 않습니다");
				return;
			}
		}
		
		function tradeFn(){
			if(auth == false){
				modalFn("본인인증을 해주세요");
				setTimeout(function(){
					modalClose();
				},1000);
				//alert("본인인증을 해주세요");
				return;
			}
			else {
				var name = $("#name").val();
				var phone = $("#phone").val();
				// IMP.request_pay(param, callback) 결제창 호출
				IMP.request_pay({ // param
					pg: 'kcp',
					pay_method: 'card',
					merchant_uid: "${res.merchant}",
					name: '${res.sname}',
					amount: ${res.price},
					buyer_name: $("#name").val(),
					buyer_tel: $("#phone").val()
				}, function (rsp) { // callback
				    if (rsp.success) {
				    	var resData = "merchant="+rsp.merchant_uid+"&price="+rsp.paid_amount+"&name="+name+"&phone="+phone;
				    	$.ajax({
			    			url:"tradeAuth.do",
			    			data:resData,
			    			type:"post",
			    			success:function(status){
			    				if(status=="success"){
			    					modalFn("예약되었습니다.");
			    					setTimeout(function(){
			    						modalClose();
			    					},1000);
			    					//alert("예약되었습니다");
			    					location.href='<%= request.getContextPath() %>/mypage/myReservation.do';
			    					return;
			    				}
			    				else {
			    					modalFn("예약에 실패했습니다.");
			    					setTimeout(function(){
			    						modalClose();
			    					},1000);
			    					//alert("예약에 실패했습니다.")
			    					return;
			    				}
			    			}
			    		});
				    }
					else {
						modalFn("결제에 실패했습니다. \n 에러 내용 : " + rsp.error_msg);
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("결제에 실패했습니다. \n 에러 내용:"+rsp.error_msg);
				    }
				});//callback
			}
		}//tradeFn
		
	</script>
</body>
</html>
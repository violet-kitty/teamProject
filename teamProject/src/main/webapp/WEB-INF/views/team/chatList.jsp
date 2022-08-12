<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page session="true" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>chatList</title>
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
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
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
					<div class="wrapper">
	
					</div>
					 
					 <script type="text/javascript">
					 
					 //home.jsp에 있는 email 정보를 받아줌
					 	var email = document.getElementById('emailInput').value;
					 //html(JSP)파일이 로드되면 바로 initialize() 메서드를 실행시킴
						$(document).ready(initialize());
						
						function initialize() {
							getChatList();
							getUnreadMessageInfo();
							unreadAlertInfinite();
						}
						 
						//async(비동기)로 일정간격 업뎃되지 않아도 되는 img 파일을 불러옴
						function getChatList() {
							console.log("getChatList inprocess");
							$.ajax({
								url: "/chatList/ajax",
								type: "POST",
								data: JSON.stringify({
									email: email
								}),
								contentType: "application/json",
								//전달을 성공했을때 Controller로부터 data를 return 받아 처리해주는 메서드	
								success: function(data) {
									
									 var parsed = JSON.parse(data);
									 var length = parsed.chatList.length;
									 for (var i = 0; i < length; i++) {
										 //채팅방 갯수만큼 반복문을 돌면서 채팅방 틀(div, img 태그)를 만들어줌 
										 addChatDivImg(i, parsed.chatList[i].pr_img_1);
									 }
								}
							});
						}
						
						 //async(비동기) 방식으로 일정간격 업데이트 되어야 하는 정보들(메세지 알림기능) 
						 function getUnreadMessageInfo() {
								 $.ajax({
									 url:"/chatUnreadMessageInfo/ajax",
									 type: "POST",
									 data: JSON.stringify({
										 email: email
									 }),
									 contentType: "application/json",
									 success: function(data) {
										 var parsed = JSON.parse(data);
										 var length = parsed.chatList.length;
										 
										 for (var i = 0; i < length; i++) {
											$('.wrapSellerTitle' + i).html('');
										 	addChatList(parsed.chatList[i].pr_id, parsed.chatList[i].buyerId, parsed.chatList[i].senderName, parsed.chatList[i].pr_title, parsed.chatList[i].messageUnread, i);
										 }
									 }
							 });
						 }
					 	
						 
						 //1000milliseconds(==1초) 간격으로 getUnreadMessageInfo()를 실행시키는 반복 메서드
					 	function unreadAlertInfinite() {
					 		setInterval() => {
					 			getUnreadMessageInfo();				
							}, 1000);
					 	}
					 	
					 	//일정 간격으로 업데이트된 데이터를 화면에 출력하는 메서드 됨
					 	function addChatList(pr_id, buyerId, senderName, pr_title, messageUnread, idx) {
					 		var str =
					 		'<a href="/chatRoom/' + 
					 		pr_id +
					 		'/' + 
					 		buyerId + 
					 		'">' +
					 		'<h3><span id="sellerName">' + 
					 		senderName +
					 		'&nbsp;</span>' +
					 		'<span id="title">' + 
					 		pr_title + 
					 		'</span><span id="message">' + 
					 		messageUnread+'</span></h3></div></a>';
					 		
					 		//HTML화면의 <div class="wrapSellerTitle0,1,...etc"> 하위에 str 변수를 추가해준다.		 		 
					 		 $('.wrapSellerTitle' + idx).append(str);
					 	} 
					 	
					 	//페이지가 로드되는 시점 한 번만 출력하면 되는 div, img를 출력하는 메서드
					 	function addChatDivImg(idx, img) {
					 			$(document.body).append('<div class= chatMessageInfo' + idx + '><div class="wrapPr_img"><img class="pr_img" src="' + img + '"></div><div class="wrapSellerTitle' +
					 					idx +
					 					'"></div></div>');
					 	}
					 	
					 	
					 </script>
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div>
		<!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
</body>
</html>
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
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- stomp --><script src="/webjars/stomp-websocket/2.3.3-1/stomp.js" type="text/javascript"></script>
<!-- SockJS --><script src="/webjars/sockjs-client/1.1.2/sockjs.js" type="text/javascript"></script>
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
							<div class="title_text">
								<h2>${pr_title}</h2>
							</div>
							<div class="row">
								<div class="col_6">
									<div class="row_3">
										<div class="input_group">
					
											 
										</div>				
									</div>				
												<div class="col_6">
													<div id="content">
														<div id="content">
															<c:forEach var="chatRoom" items="${chatHistory}">
																<p>
																	<span id="chatRoomSenderName">${chatRoom.senderName}</span><br>
																	<span id="chatRoomContent">${chatRoom.content}</span><br>
																	<span id="chatRoomSendTime">${chatRoom.sendTime}</span><br>
																</p>	
															</c:forEach>
														</div>
													</div>
												</div>
												<div class="row_3">
													<div class="input_group" id="sendMessage">
														<input type="text" placeholder="Message" id="message" class="form_control"/>
														<div class="input_group_append">
															<button id="send" class="btn btn-primary" onclick="send()">보내기</button>
															<input type="hidden" value="${login.nickname}" id="senderName"/>
															<input type="hidden" value="${login.getEmail()}" id="senderId"/>
															<input type="hidden" value="${cv.cidx}" id="id"/>								
															<input type="hidden" value="${buyerId}" id="buyerId"/>					
															<input type="hidden" value="${sellerId}" id="sellerId"/>					
														</div>					
													</div>				
												</div>
								</div>
							</div>

	
	


				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div>
		<!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
<script type="text/javascript">
	
		var stompClient = null;
		var senderName = $('#senderName').val();
		var senderId = $('#senderId').val();
		var sellerId = $('#sellerId').val();
		var buyerId = $('#buyerId').val();
		var pr_id = $('#pr_id').val();
		var id = $('#id').val();
		
		$(document).ready(connect());
		
		function connect() {
			var socket = new SockJS('/broadcast');
			var url = '/user/' + id + '/queue/messages';
			stompClient = Stomp.over(socket);
			ajaxChatRead(id, senderId);
			
			stompClient.connect({}, function() {
				stompClient.subscribe(url, function(output) {
					console.log("broadcastMessage working");
					showBroadcastMessage(createTextNode(JSON.parse(output.body)));
				});
						//setConnected(true);				
				}, 
						function (err) {
							alert('error' + err);
			});
		};
	
		function sendBroadcast(json) {
			
			stompClient.send("/app/broadcast", {}, JSON.stringify(json));
		}
		
		function send() {
			//ajaxChatRoom();
			var content = $('#message').val();
			sendBroadcast({
				'id': id,
				'senderName': senderName,
				'content': content,
				'pr_id': pr_id,
				'buyerId': buyerId,
				'senderId': senderId,
				'sellerId': sellerId
				});
			$('#message').val("");
		}
		
		var inputMessage = document.getElementById('message'); 
		inputMessage.addEventListener('keyup', function enterSend(event) {
			
			if (event.keyCode === null) {
				event.preventDefault();
			}
			
			if (event.keyCode === 13) {
				send();
			}
		});
		
		function createTextNode(messageObj) {
			console.log("createTextNode");
			console.log("messageObj: " + messageObj.content);
            return '<p><div class="row alert alert-info"><div class="col_8">' +
            messageObj.senderName +
            '</div><div class="col_4 text-right">' +
            messageObj.content+
            '</div><div>[' +
            messageObj.sendTime +
            ']</div></p>';
        }
		
		function showBroadcastMessage(message) {
            $("#content").html($("#content").html() + message);
        }
		
		function clearBroadcast() {
			$('#content').html("");
		}
		
		
		<%-- 읽음처리 --%>
	function ajaxChatRead(id, reader) {
		console.log("ajaxChatread");
		var flag = "";
		if (reader == buyerId) {
			flag = "buy";
		} else {
			flag = "sell";
		}
		$.ajax({
			url:'/chatread/chatroom/ajax',
			type: 'POST',
			data: JSON.stringify({
				id: id,
				flag: flag
			}),
			dataType: 'json',
			contentType: 'application/json'
		})
	}

</script>
</body>
</html>
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
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- 채팅 --><script src="https://ncloudchat.gcdn.ntruss.com/ncloudchat-lastest.min.js"></script>
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
					
					<!-- 채팅창 -->
					<div id="chatArea">
						
					</div>
					<input type="text" id="textInput">
					<button onclick="sendMsg()">보내기</button>
					
								
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div>
		<!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
<script>
	//채팅 api 초기화
	const nc = new ncloudchat.Chat();
	nc.initialize("200ead48-efb1-42e9-acc8-32ab84b2039a");
	
	//채팅 이벤트 핸들러
	// 메시지 수신
	nc.bind('onMessageReceived',function(channel, message) {
		if(message.sender.name == "${login.nickname}"){
			$("#chatArea").append("<div style='text-align:right;background:aliceblue;'><p>"+message.sender.name+"</p>"+message.content+"</div><br>");
		}
		else {
			$("#chatArea").append("<div style='background:white;'><p>"+message.sender.name+"</p>"+message.content+"</div><br>");
		}
		window.scrollTo(0,document.body.scrollHeight);
	});
	// 오류 메시지
	nc.bind('onErrorReceived',function(error) {
		console.log("에러 : "+error);
	});
	// 접속 성공
	nc.bind('onConnected',function(socket) {
		console.log("접속 성공");
		loadMsg();
	});
	// 접속 종료
	nc.bind('onDisconnected',function(reason) { 
		console.log("접속 종료 : "+reason);
	});
	
	var re = userConnect();
	
	async function userConnect(){
		const user = await nc.connect({
		    id: "howf_${login.midx}",
		    name: "${login.nickname}"
		});
		return 1;
	}
	
	async function loadMsg(){
		const filter = {channel_id: "${cidx}"};
		const sort = {created_at:-1}; 
		const option = { offset:0, per_page:100};
		const messages = await nc.getMessages(filter, sort, option);
		console.log(messages);
		
		for(var m of messages){
			if(m.sender.name == "${login.nickname}"){
				$("#chatArea").prepend("<div style='text-align:right;background:aliceblue;'><p>"+m.sender.name+"</p>"+m.content+"</div><br>");
			}
			else {
				$("#chatArea").prepend("<div style='background:white;'><p>"+m.sender.name+"</p>"+m.content+"</div><br>");
			}
		}
		window.scrollTo(0,document.body.scrollHeight);
		
		return 1;
	}
	
	async function sendMsg(){
		await nc.sendMessage("${cidx}", {
		      type: "text", 
		      message: $("#textInput").val()
		});
		$("#textInput").val("");
		return 1;
	}
	
</script>	
	
</body>
</html>
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
<title>HOWF 너나들이</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- 채팅 --><script src="https://ncloudchat.gcdn.ntruss.com/ncloudchat-lastest.min.js"></script>

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
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabWrite --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyWrite.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">

<style>
.joinedmenm td {padding:10px 0px; vertical-align:middle; text-align:left; position:relative;}
.joinedmenm td:first-child {width:50px;}

.onoff {width:16px; height: 16px; position:absolute; top:38px; left:27px; border-radius:100%; border:2px solid white;}
</style>

<script>
	function asdasd(){
		
		var li = [];
		var li2 = [];
		
		<c:set var="i" value="0"/>
		<c:forEach var="vv" items="${vote}">
			li[${i}] = "${vv.vote}";
			li2[${i}] = "${vv.cnt}";
		<c:set var="i" value="${i+1}"/>
		</c:forEach>
		
		let pieChartData = {
				labels : li,
				datasets: [{
					data: li2,
					backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)',
						'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)']
				}]
		};
		
		let pieChartDraw = function () {
		    let ctx = document.getElementById('pieChartCanvas').getContext('2d');
		    
		    window.pieChart = new Chart(ctx, {
		        type: 'pie',
		        data: pieChartData,
		        options: {
		        	responsive: false,
		        	title: {
		        		display:true,
		        		text:'투표결과',
		        		fontSize: 20
		        	}
		        }
		    });
		};
		
		
		$("#show_vote_option").hide();
		
		pieChartDraw();

		var html = "";
		
		<c:if test="${rv != null && login.midx == tv.midx}">
			html += '<hr class="lastline">';
			<c:if test="${rv.allow == 'Y'}">
				html += '<br><div class="d-flex justify-content-center"><button type="button" class="greenbtn" onclick="revote()">투표 다시하기</button></div><br>';
			</c:if>
				html += '<div class="d-flex justify-content-center"><button type="button" class="pinkbtn me-3" onclick="remove_vote()">투표  삭제</button>';
			<c:if test="${rv.allow == 'Y'}">
				html += '<button type="button" class="graybtn" onclick="finish_vote()">투표  마감</button></div>';
			</c:if>
		</c:if>
			
		
		$("#selected_vote_option").append(html);
		$("#selected_vote_option").show();
	}
</script>
<style>
.input{
    width: 100%;
    display: block;
    border: 0;
    outline: none;
    padding-right: 11rem;
    padding-left: 1rem;
    padding-top: 0.1rem;
    font-size: 1.4rem;
    line-height: 4rem;
    font-weight: bold;
    box-sizing: border-box;
}
.hbg-lightgreen {background-color:#57c702;}
</style>
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
				<div class="row">
					<div class="col">
						<button type="button" onclick="memberList()" class="greenbtn">채팅 참여자 목록</button>
						<!-- 채팅창 -->
						<div id="chatArea" style="height:500px;overflow-y:scroll;width:100%;padding-left:5px;padding-right:5px;background:#54ACA8">
							
						</div>
						<div style="background:white; position: relative; bottom: 0; left: 0; width: 100%;">
							<input type="text" id="textInput" onkeyup="enterkey()" class="input">
							<button class="pinkbtn" onclick="sendMsg()" style="position: absolute; right: 0.5rem; top:50%; transform: translateY(-50%);">보내기</button>
						</div>
					</div>
				</div><br><br>
					<div class="row">
						<div class="col d-flex justify-content-center text-center">
							<div id="vote">
							<div id="selected_vote_option" style="display: none;">
							<c:if test="${(rv != null && result != 0) || (rv != null && rv.allow == 'N')}">
								<canvas id="pieChartCanvas" style="width: 500px; height: 500px;"></canvas>
								<script>asdasd();</script>
							</c:if>
							</div>
							
							<c:if test="${rv != null && rv.allow == 'Y' && result == 0}">
								<div id="show_vote_option">
									<form id="form1">
										<input type="hidden" name="ridx" value="${rv.ridx}">
										<div class="boardWrite">
											<div class="row h-input">
												<div class="col">
													<input type="text" class="form-control text-center" value="${rv.title}" readonly>
												</div>
											</div>
											<div class="row text-start" style="box-sizing: border-box; padding-left: 10%;">
												<c:if test="${rv.place1 != null}">
													<div class="form-check">
														<label class="form-check-label" for="v1">
															<input class="form-check-input" type="radio" id="v1" name="vote" value="${rv.place1}" checked>${rv.place1}
														</label>
													</div>
												</c:if>
												<c:if test="${rv.place2 != null }">
													<div class="form-check">
														<label class="form-check-label" for="v2">
															<input class="form-check-input" type="radio" id="v2" name="vote" value="${rv.place2}">${rv.place2}
														</label>
													</div>
												</c:if>
												<c:if test="${rv.place3 != null }">
													<div class="form-check">
														<label class="form-check-label" for="v3">
															<input class="form-check-input" type="radio" id="v3" name="vote" value="${rv.place3}">${rv.place3}
														</label>
													</div>
												</c:if>
												<c:if test="${rv.place4 != null }">
													<div class="form-check">
														<label class="form-check-label" for="v4">
															<input class="form-check-input" type="radio" id="v4" name="vote" value="${rv.place4}">${rv.place4}
														</label>
													</div>
												</c:if>
												<c:if test="${rv.place5 != null }">
													<div class="form-check">
														<label class="form-check-label" for="v5">
															<input class="form-check-input" type="radio" id="v5" name="vote" value="${rv.place5}">${rv.place5}
														</label>
													</div>
												</c:if>
											</div>
											<div class="row text-center mt-4">
												<div class="col">
													<button type="button" class="bluebtn" onclick="insert_vote_option()">투표하기</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</c:if>
							<c:if test="${rv == null}">
								<c:if test="${login.midx == tv.midx}">
									<div id="div_create_vote">
										<button onclick="cancel_vote()" id="cancel_vote" class="graybtn" style="display: none;">투표 작성 취소</button><br>
										<button onclick="create_vote()" id="create_vote" class="h-auto greenbtn">투표 만들기</button><br>
										<div id="display" style="display:none">
											<button onclick="add_option()" class="h-auto bluebtn">선택지 추가</button>
											<div id="voteArea">
												<form id="vote_option">
													<!-- 카테고리 선택, 제목 입력 -->
													<div class="row h-input ">
														<div class="col">
															<input class="form-control" type="text" name="title" id="title" placeholder="투표 주제"><br>
														</div>
													</div><!-- row end -->
													<div class="row h-input ">
														<div class="col">
															<input type="text" id="p1" class="form-control" name="place1" placeholder="투표 선택지1">
														</div>
													</div><!-- row end -->
													<div class="row h-input ">
														<div class="col">
															<input type="text" id="p1" class="form-control" name="place1" placeholder="투표 선택지2">
														</div>
													</div><!-- row end -->
												</form>
											</div>
											<button onclick="upload_vote()" class="h-auto greenbtn">투표 올리기</button><br>
										</div>
									</div>
								</c:if>
							</c:if>
							</div>
						</div>
					</div>
					<br>
					<!-- 신고당한 사람 midx -->
					<input type="hidden" id="midx">
					
					<!-- 목록으로 돌아가기, 글 작성 버튼 -->
					<div class="row buttonarea">
						<div class="col-lg-6">
							<a class=" onlypc" href="<%=request.getContextPath()%>/team/teamView.do?tidx=${tidx}">
								<div class="backto lastbackto">
									<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
								</div>
							</a>
						</div>
					</div>
					
				</div><!-- /.container -->
				
			</div><!-- / .content01 -->
			
			<!-- banner --><%@include file="../banner.jsp"%>
			
		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
		
	</div><!-- /#wrap -->
<script>

	function create_vote(){
		$("#create_vote").hide();
		$("#display").show();
		$("#cancel_vote").show();
	}
	
	let index = 3;
	function cancel_vote(){
		
		$("#cancel_vote").hide();
		$("#create_vote").show();
		$("#display").hide();
		
		var html = '<input type="text" class="form-control" name="title" id="title" placeholder="투표 주제 선정"><br>';
			html += '<input type="text" class="form-control" id="p1" name="place1" placeholder="투표 선택지1">';
			html += '<input type="text" class="form-control" id="p2" name="place2" placeholder="투표 선택지2">';
			
		$("#vote_option").html(html);
		index = 3;
	}

	function add_option(){
		if(index > 5){
			modalFn("선택지는 최대 5개까지만 가능합니다.", "확인");
			return;
		}
		else{
			$("#vote_option").append('<input type="text" class="form-control" id="p'+index+'" name="place'+index+'" placeholder="투표 선택지'+index+'">');
			index++;
		}
		
	}
	
	function upload_vote(){
		//recommend에 올리는  ajax
		var frm = $("#vote_option").serialize();
		
		if($("#title").val() == "" || $("#p1").val() == "" || $("#p2").val() == "" || $("#p3").val() == "" || $("#p4").val() == "" || $("#p5").val() == ""){
			modalFn("투표 주제 혹은 선택지를 입력해 주세요.", "확인");
			return;
		}
		else{
			$.ajax({
				url: "upload_vote.do",
				data: frm+"&tidx=${tidx}",
				type: "post",
				success: function(ridx){
					
					$("#div_create_vote").hide();
					
					location.reload();
				}
			});
		}
		
	}
	//투표한 값을 vote 테이블에 반영 후 투표결과 화면에 표시
	function insert_vote_option(){
		
		var form = $("#form1").serialize();
		
		$.ajax({
			url: "insert_vote_option.do?ridx=${rv.ridx}",
			data: form,
			type: "post",
			success: function(vlist){
				location.reload();
			}
		});
	}
	
	function revote(){
		$.ajax({
			url: "revote.do",
			data: "ridx=${rv.ridx}&midx=${login.midx}",
			type: "post",
			success:function(){
				location.reload();
			}
		})
		
	}
	
	function finish_vote(){
		$.ajax({
			url : "finish_vote.do?ridx=${rv.ridx}",
			type : "get",
			success : function(){
				modalFn("투표가 마감되었습니다.");
				setTimeout(function(){
					location.reload();
				}, 1000);
			}
		});
	}

	function remove_vote(){
		$.ajax({
			url: "remove_vote.do?ridx=${rv.ridx}",
			type: "get",
			success: function(){
				modalFn("삭제되었습니다.");
				setTimeout(function(){
					location.reload();
				}, 1000)
				
			}
		});
	}
	
	//채팅 api 초기화
	const nc = new ncloudchat.Chat();
	nc.initialize("200ead48-efb1-42e9-acc8-32ab84b2039a");
	var cidx = "";
	
	//채팅 이벤트 핸들러
	// 메시지 수신
	nc.bind('onMessageReceived',function(channel, message) {
		if(message.sender.id == "howf_${login.midx}"){
			$("#chatArea").append("<div class='d-flex  align-items-end flex-column'><p style='color: white; font-weight:bold;'>${login.nickname}<br></p><div style='padding:10px;min-height:5px;text-align:right;background:aliceblue;max-width:45%;height:auto; word-break:break-all'>"+message.content+"</div></div><br>");
		}
		else {
			var id = message.sender.id.split("_");
			var img = "";
			//프로필 이미지
			<c:forEach var="l" items="${ltv}">
			if(${l.midx} == id[1]){
				<c:choose>
				<c:when test="${l.img != null}">
				img = '<%=request.getContextPath() %>/event/displayFile.do?fileName=${l.img}';
				</c:when>
				<c:otherwise>
				img = '<%=request.getContextPath()%>/image/null/null_thumbnail.png';
				</c:otherwise>
				</c:choose>
				
			}
			</c:forEach>
			$("#chatArea").append("<div class='d-flex  align-items-start flex-column'><span style='color: white; font-weight:bold;'><img src='"+img+"' style='width:40px;height:40px;border-radius:50%;'>"+message.sender.name+"<button type='button' class='pinkbtn' onclick='userOption("+id[1]+")'style='padding:5px;'>신고</button><br></span><div style='padding:10px;min-height:5px;background:white;max-width:45%;height:auto; word-break:break-all'>"+message.content+"</div></div><br>");
		}
		var element = document.getElementById("chatArea");
		element.scrollTop = element.scrollHeight;
	});
	
	// 오류 메시지
	nc.bind('onErrorReceived',function(error) {
		console.log("에러 : "+error);
	});
	// 접속 성공
	nc.bind('onConnected',function(socket) {
		console.log("접속 성공");
		cidxReturn();
		setTimeout(function(){
			loadMsg();
			chatchat(cidx);
		},500);
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
	
	async function cidxReturn(){
		const filter = {state:true};
		const sort = {created_at:-1};
		const option = { offset:0, per_page:100};
		const channels = await nc.getChannels(filter,sort,option);
		
		//채팅 리스트 그리기
		for(var cha of channels){
			if(cha.name == "${cidx}"){
				cidx = cha.id;
			}
		}
		return channels;
	}
	
	async function loadMsg(){
		const filter = {channel_id: cidx};
		const sort = {created_at:-1}; 
		const option = { offset:0, per_page:100};
		const messages = await nc.getMessages(filter, sort, option);
		
		for(var m of messages){
			if(m.sender.id == "howf_${login.midx}"){
				$("#chatArea").prepend("<div class='d-flex align-items-end flex-column'><p style='color: white; font-weight:bold;'>${login.nickname}<br></p><div style='padding:10px;min-height:5px;text-align:right;background:aliceblue;max-width:45%;height:auto; word-break:break-all'>"+m.content+"</div></div><br>");
			}
			else {
				var id = m.sender.id.split("_");
				var img = "";
				//프로필 이미지
				<c:forEach var="l" items="${ltv}">
				if(${l.midx} == id[1]){
					<c:choose>
					<c:when test="${l.img != null}">
					img = '<%=request.getContextPath() %>/event/displayFile.do?fileName=${l.img}';
					</c:when>
					<c:otherwise>
					img = '<%=request.getContextPath()%>/image/null/null_thumbnail.png';
					</c:otherwise>
					</c:choose>
					
				}
				</c:forEach>
				$("#chatArea").prepend("<div class='d-flex align-items-start flex-column'><span style='color: white; font-weight:bold;'><img src='"+img+"' style='width:40px;height:40px;border-radius:50%;'>"+m.sender.name+"<button type='button' class='pinkbtn' onclick='userOption("+id[1]+")' style='padding:5px;'>신고</button><br></span><div style='padding:10px;min-height:5px;background:white;max-width:45%;height:auto; word-break:break-all'>"+m.content+"</div></div><br>");
			}
		}
		var element = document.getElementById("chatArea");
		element.scrollTop = element.scrollHeight;
		
		return 1;
	}
	
	async function sendMsg(){
		await nc.sendMessage(cidx, {
		      type: "text", 
		      message: $("#textInput").val()
		});
		$("#textInput").val("");
		
		return 1;
	}
	
	async function chatchat(CHANNEL_ID){
		await nc.subscribe(CHANNEL_ID);
		return 1;
	}
	
	//채팅방 참여자 목록 불러와 그려주기
	async function memberList(){
		const filter = {channel_id: cidx};
		const sort = {created_at:-1};
		const option = { offset:0, per_page:100};
		const subscriptions = await nc.getSubscriptions(filter, sort, option);
		const filter2 = {channel_id: cidx, online:true};
		const subscriptions2 = await nc.getSubscriptions(filter2, sort, option);
		
				var html = "<h4>채팅 참여자 목록</h4><br>"
					+ "<table class='table joinedmenm' style='text-align:center'>";
/* 					+ "<tr>"
					+ "<th>프로필</th>"
					+ "<th>닉네임</th>"
					+ "<th>접속여부</th>";
					
					<c:if test="${login.midx == rv.midx}">
					html = html
					+ "<th>차단/차단해제</th>";
					</c:if>
					
					html = html
					+ "</tr>"; */
					
				for(var i = 0; i < subscriptions.length; i++){
					var id = subscriptions[i].user_id.split("_");
					html = html
					+ "<tr>"
					+ "<td>";
					
					//프로필 이미지
					<c:forEach var="l" items="${ltv}">
					if(${l.midx} == id[1]){
						<c:choose>
						<c:when test="${l.img != null}">
						html = html
						+ "<img src='<%=request.getContextPath() %>/event/displayFile.do?fileName=${l.img}' style='width:40px;height:40px;border-radius:50%;'>"
						</c:when>
						<c:otherwise>
						html = html
						+ "<img src='<%=request.getContextPath()%>/image/null/null_thumbnail.png' style='width:40px;height:40px;border-radius:50%;'>"
						</c:otherwise>
						</c:choose>
						
					}
					</c:forEach>
					
					var is = 'off';
					for(var j of subscriptions2){
						if(j.user.name == subscriptions[i].user.name) is = 'on';
					}
					
					if(is == 'on'){
						html = html
						+ "<div class='onoff hbg-lightgreen'></div> ";
					}
					else {
						html = html
						+ "<div class='onoff hbg-gray'></div> ";
					}
				
					
					
					html = html
					+ "</td>"
					+ "<td>"
					+ subscriptions[i].user.name
					+ "</td>";
					
					
					<c:if test="${login.midx == tv.midx}">
					if(id[1] != ${login.midx}){
						$("#midx").val(id[1]);
						$.ajax({
							url : "teamUserBanCheck.do",
							data : "midx=" + $("#midx").val() + "&bidx=${tidx}&type=chatting",
							type : "post",
							async: false,
							success : function(data){
								if(data.cbidx == 0){
									html = html
									+ "<td>"
									+ "<button type='button' style='background:none; border:none;' onclick='userBlock("+id[1]+")'><img src='<%=request.getContextPath() %>/image/button/ban.png' style='width:20px;'></button>"
									+ "</td>";
								}
								else {
									html = html
									+ "<td>"
									+ "<button type='button' style='background: none; border: none;' onclick='userUnBlockCheck("+id[1]+")'><img src='<%=request.getContextPath() %>/image/icon/banned.png' style='width:20px;'></button>"
									+ "</td>";
								}
								
							}
						});
						
					}
					</c:if>
					
					html + html
					+ "</tr>"
				}
				
				html = html + "</table>";
				
				modalFn(html, "닫기");
		
		
		return 1;
	}
	
	function enterkey() {
		if (window.event.keyCode == 13) {
			sendMsg();
	    }
	}
	
	function userOption(mm){
		$("#midx").val(mm);
		modalFn("신고 사유를 입력해 주세요", "확인", "신고", "취소", "inputModal");
	}
	
	function inputModal(){
		$.ajax({
			url: "userReport.do",
			data: "midx=${login.midx}&title=유저 신고 시 작성되는 제목입니다.&divsn=신고&content=<p style='display: inline; color: #3D3D3D; font-weight: bold;'>신고사유 : </p>" + $("#textInput").val() + "<br><p style='display: inline; color: #3D3D3D; font-weight: bold;'>너나들이 팀 번호 : </p>" + ${tidx} + "<br><p style='display: inline; color: #3D3D3D; font-weight: bold;'>신고된 회원번호 : </p>" + "<span style='display: inline; color: #DE8889; font-weight: bold;'>" + $("#midx").val() + "</span>",
			type: "post",
			success : function(data){
				modalClose();
				modalFn("신고가 접수되었습니다");
				setTimeout(function(){
					modalClose();
				},1000);
			}
		})
	}
	
	function userBlock(mm){
		modalClose();
		$("#midx").val(mm);
		modalFn("차단 사유를 입력해 주세요", "확인", "차단", "취소", "inputModal2");
	}
	
	function inputModal2(){
		$.ajax({
			url: "userBlock.do",
			data : "tidx=${tidx}&midx="+ $("#midx").val() + "&content=" + $("#textInput2").val(),
			type : "post",
			success : function(data){
				modalClose();
				modalFn("해당 유저가 차단되었습니다.");
				setTimeout(function(){
					modalClose();
				}, 1000)
			}
		});
	}
	
	function userUnBlockCheck(mm){
		modalClose();
		$("#midx").val(mm);
		modalFn("차단해제 하시겠습니까?", "확인", "차단해제", "취소", "userUnBlock");
	}
	
	function userUnBlock(){
		$.ajax({
			url : "userUnBlock.do",
			data : "tidx=${tidx}&midx="+$("#midx").val(),
			type : "post",
			success : function(data){
				modalClose();
				modalFn("해당 유저가 차단 해제되었습니다.");
				setTimeout(function(){
					modalClose();
				}, 1000)
			}
			
		})
	}

	

</script>
</body>
</html>
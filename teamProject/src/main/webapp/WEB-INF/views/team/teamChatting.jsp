<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>페이지 제목</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
<!-- CSS3 - 관련CSS를 여기에 연결해주세요 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/team/teamChatting.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- sockjs.min.js --><script src="<%=request.getContextPath()%>/js/sockjs.min.js"></script>

<!-- stomp.js --><script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
	
</script>
</head>
<body>
	<div id="wrap">
		<!-- 모달예제 
		<button onclick="modalex()">모달예제</button>
		<script>
		function modalex(){
		
			/* modalex("모달이 완료되었습니다");
		      setTimeout(function(){
		         modalClose();
		      },3000); */
		      modalFn("모달이 완료되었습니다." ,"닫기","알림창");
			
		}
		</script>
		-->
		
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
							
							<div id="chat-containerK" class="border border-secondary">
							
								<div class="chatWrap">
								<!-- The Report Modal -->
							
									<div class="modal" id="reportModal">
										<div class="modal-dialog">
											<div class="modal-content">
												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">신고하기</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
							
												<!-- Modal body -->
												<div class="modal-body">
													<input type="hidden" id="contentIdK" value=""/>
													<div class="form-group">
													<label for="reportCategK">신고 카테고리</label>
													<select class="form-control" id="reportCategK" name="reportCategK">
														<option value="1">음담패설</option>
														<option value="2">부적절한 홍보</option>
														<option value="3">비방 또는 욕설</option>
													</select>
													</div>
													<hr />
													<h5>신고 대상 : <strong id="reportIdK"></strong></h5>
													<hr />
													<h5>신고 내용</h5>
													<div id="reportContents" class="text-center p-5">
														
													</div>
												</div>
							
												<!-- Modal footer -->
												<div class="modal-footer">
													<button type="button" class="btn btn-success" data-dismiss="modal" onclick="doReport();">신고하기</button>
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
							<%-- 		<div class="main_tit">
										<h1>방 이름 [ ${roomNo}번 ] 아이디[${loginMember.memberId}]</h1>
									</div> --%>
									<div class="content chatcontent " data-room-no="${roomNo}"
										data-member="${loginMember}">
										<div id="list-guestbook" class="">
											<c:forEach items="${firstList}" var="chat">
												<!-- 내 채팅일 경우 -->
												<c:if test="${loginMember.memberId eq chat.memberId}">
											
												<li data-no="${chat.no}" class="me pr-2">
												<strong class="">${chat.memberId}</strong>
												<div class="me ">
												
												<strong style="display : inline;" class="align-self-end"><fmt:formatDate value="${chat.sendDate }" pattern="yy/MM/dd HH:mm" /></strong>
												<c:if test="${chat.vaildYN eq 'Y'}">
												
												<p class=" myChat text-muted p-2" ><b>신고된 채팅입니다.</b></p> 
											
												</c:if>
												<c:if test="${chat.vaildYN ne 'Y'}">
												
												<p class="myChat text-left p-2" >${chat.chatContent }</p> 
												
												</c:if>
												</div>
												</li>
												
												</c:if>
												<!-- 다른사람의 채팅일 경우 -->
												<c:if test="${loginMember.memberId ne chat.memberId}">
										
												<li data-no="${chat.no}" class="pl-2">
												<strong>${chat.memberId}</strong>
												<div class="row ml-0">
												<c:if test="${chat.vaildYN eq 'Y'}">
												<p class="otherChat bg-light text-muted p-2"><b>신고된 채팅입니다.</b></p> 
												</c:if>
												<c:if test="${chat.vaildYN ne 'Y'}">
												<p class="otherChat bg-light p-2">${chat.chatContent }</p> 
												<strong class="align-self-center"><fmt:formatDate value="${chat.sendDate }" pattern="yy/MM/dd HH:mm" />
												<a href='#' class='reportModalK'>신고</a></strong>
												</c:if>
												</div></li>
												</c:if>
											</c:forEach>
										</div>
										
									</div>
									<div class="chat-fixK">
										<div id="alertK" onclick="moveDown();" class="alert alert-success" role="alert">
											<strong></strong> 
										</div>
										<div class="fix_btn row">
											<textarea name="msg" id="msgi" rows="2" class="form-control col-sm-8"></textarea>
											<!-- <input type="text" id="msgi" name="msg" placeholder="메세지를 입력하세요" /> -->
											<button type="button"  class="send col-sm-4 btn btn-secondary">보내기</button>
										</div>
									</div>
							
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div>
		<!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
<script>
var client;
//채팅 저장
function insertChat(){
	$.ajax({
		url : "${pageContext.request.contextPath}/chat/insertChat.do",
		type : "POST",
		data :
			{
				memberId : "${loginMember.memberId}",
				srNo : "${roomNo}",
				chatContent : $("#msgi").val()
						
			} ,
		dataType : "json",
		success : function(result) {
			sendmsg();
		},
		error : function(xhr, status, err) {
			console.log("처리실패!");
			console.log(xhr);
			console.log(status);
			console.log(err);
		}
	});
}
//생성된 메시지로 가기//맨 아래로 가기
function moveDown(){
	$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
	$('#alertK').css('display','none');
	
}
//신고하기 버튼
function doReport(){
	if(confirm("신고 하시겠습니까?")) {
		$.ajax({
			url : "${pageContext.request.contextPath}/report/insertReport.do",
			type : "POST",
			data :
				{
					contentCategory : "C",
					contentId : $("#contentIdK").val(),
					reporter : "${loginMember.memberId}",
					reportedMember : $("#reportIdK").text(),
					category : $("#reportCategK").val() 
							
				} ,
			dataType : "json",
			success : function(result) {
				if(result > 0){
					alert("신고가 완료되었습니다.");
					//$('[data-no='+$("#contentIdK").val()+']').find("p").html("<b>신고된 채팅입니다.</b>");
					//$('[data-no='+$("#contentIdK").val()+']').find("p").addClass("text-muted");
					//$('[data-no='+$("#contentIdK").val()+']').find("a").html("");
					client.send('/app/report/' + "${roomNo}", {}, JSON
							.stringify({
								contentId : $("#contentIdK").val()
					}));
					}
			},
			error : function(xhr, status, err) {
				console.log("처리실패!");
				console.log(xhr);
				console.log(status);
				console.log(err);
			}
		});
		
	}
}
$(document).ready(function() {
	//시작할때 스크롤 내리기
	$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
	//신고 클릭시 모달창 열기
	$(document).on("click",".reportModalK",function(){
		$("#reportModal").modal('show');
		var content = $(this).closest("strong").prev();
		$("#reportContents").html(content.text());
		var id = content.closest("div").prev();
		$("#reportIdK").html(id.text());
		var contentId = $(this).closest("li");
		$("#contentIdK").val(contentId.attr("data-no"));
		
		
	}); 
	var isEnd = false;
	var isScrolled = false;
	var fetchList = function() {
		
		
		if (isEnd == true) {
			return;
		}
		// 채팅 리스트를 가져올 때 시작 번호
		// renderList 함수에서 html 코드의 <li> 태그에 data-no 속성으로
		// data- 속성의 값을 가져오기 위해 data() 함수 사용
		var endNo = $("#list-guestbook li").first().data("no") || 0;
		console.log("endNo" + endNo);
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/chatList.do?endNo="
					+ endNo + "&roomNo=${roomNo}",
			type : "GET",
			dataType : "json",
			success : function(result) {
				// 컨트롤러에서 가져온 방명록 리스트는 result.data에 담김
				var length = result.size;
				if (length < 10) {
					isEnd = true;
				}
				$.each(result, function(index, vo) {
					var html = renderList(vo,0);
					$("#list-guestbook").prepend(html);
				})
				var position = $('[data-no='+endNo+']').prev().offset();//위치값
				console.log(position);
				document.querySelector('.chatcontent').scrollTo({top : position.top,behavior : 'auto'});
				isScrolled = false;
			},
			error : function(xhr, status, err) {
				console.log("처리실패!");
				console.log(xhr);
				console.log(status);
				console.log(err);
			}
		});
	}
	var renderList = function(vo, endNo) {
		//alert("아뭐냐구");
		// 리스트 html을 정의
		var date = moment(vo.sendDate).format('YY/MM/DD HH:mm');
		var html = "";
		if(endNo==0) endNo = vo.no;
		
		//내가 보낸 채팅일 경우
		if(vo.memberId=="${loginMember.memberId}"){
			//신고된 채팅일 경우
			var content ="";
			if(vo.vaildYN == 'Y'){
				content = "<p class='myChat text-muted p-2'><b>신고된 채팅입니다.</b></p>";
			}
			if(vo.vaildYN != 'Y'){
				content = "<p class='myChat text-left p-2'>"+vo.chatContent+"</p>";
			}
		
		html = 	"<li class='me pr-2' data-no='"+ endNo +"'>"
				+ "<strong>" + vo.memberId + "</strong>"
				+"<div class='me'>"
				+ "<strong style='display : inline;' class='align-self-end'>" + date + "</strong>"
				+ content
				+"</div>"
				+ "</li>";
		
		}
		//남이 보낸 채팅일 경우
		else{
			//신고된 채팅일 경우
			var content ="";
			var report ="";
			if(vo.vaildYN == 'Y'){
				content = "<p class='otherChat bg-light text-muted p-2'><b>신고된 채팅입니다.</b></p>";
			}
			if(vo.vaildYN != 'Y'){
				content = "<p class='otherChat bg-light p-2'>"+vo.chatContent+"</p>";
				report = "신고";
			}
			html = "<li class='pl-2' data-no='"+ vo.no +"'>"
				+ "<strong>" + vo.memberId + "</strong>"
				+"<div class='row ml-0'>"
				+ content
				+ "<strong class='align-self-center'>" + date + "<a href='#' class='reportModalK'>"+report+"</a></strong>"
				+"</div>"
				+ "</li>";
		
		}
		return html;
			
		
	}
	//무한 스크롤
	$(".chatcontent").scroll(function() {
		var $window = $(this);
		var scrollTop = $window.scrollTop();
		var windowHeight = $window.height();
		var documentHeight = $(document).height();
		// scrollbar의 thumb가 위의1px까지 도달 하면 리스트를 가져옴
		if (scrollTop < 1 && isScrolled == false) {
			isScrolled = true;
			fetchList();
		}
	})
	////////////////////socket
	//새로운 메시지 알림
	function newAlerts(content,endNo) {
		$('#alertK').css('display','block');
		$('#alertK').html("<strong>"+content.memberId+"</strong>님이 메시지를 보냈습니다.");
	}
	
	$(function() {
		var chatBox = $('.box');
		var messageInput = $('textarea[name="msg"]');
		var roomNo = "${roomNo}";
		var member = $('.content').data('member');
		var sock = new SockJS(
				"${pageContext.request.contextPath}/endpoint");
		client = Stomp.over(sock);
		function sendmsg() {
			var message = messageInput.val();
			//alert("메시지"+message);
			if (message == "") {
				return false;
			}
			//insertChat();
			client.send('/app/hello/' + roomNo, {}, JSON
					.stringify({
						chatContent : message,
						memberId : "${loginMember.memberId}",
						srNo : "${roomNo}"
					}));
			$("#list-guestbook").append("<div style='min-height:50px;background:blue;color:white;'>"+message+"</div>");
			messageInput.val('');
		}
		client.connect({},function() {
			// 여기는 입장시
			//	           일반메세지 들어오는곳         
			client.subscribe('/subscribe/chat/'+ roomNo,function(chat) {
				//받은 데이터
				var content = JSON.parse(chat.body);
				var endNo = content.no;
				/*var endNo = $("#list-guestbook li").last().data("no");
				if(isNaN(endNo))
					endNo = 1;
				else
					endNo = endNo+1;
				*/
				var html = renderList(content,endNo);
				$("#list-guestbook").append(html);
				newAlerts(content,endNo);
								
							});
			//신고내용 들어오는곳
			client.subscribe('/subscribe/report/'+ roomNo,function(report) {
				//받은 데이터
				var content = JSON.parse(report.body);
				//console.log("content=!!!!"+content.contentId);
				$('[data-no='+content.contentId+']').find("p").html("<b>신고된 채팅입니다.</b>");
				$('[data-no='+content.contentId+']').find("p").addClass("text-muted");
				$('[data-no='+content.contentId+']').find("a").html("");
								
				});
		});
		//	         대화시
		 $('.send').click(function() {
			//alert("눌리나?");
			sendmsg();
		}); 
		//채팅창 떠날시에
		function disconnect() {
			if (client != null) {
				client.disconnect();
			}
		}
		window.onbeforeunload = function(e) {
			disconnect();
		}
		function closeConnection() {
			sock.close();
		}
		function viewList() {
			alert('viewList');
			var url = "/chat/chatList?page=" + page
					+ "&perPageNum=" + perPageNum;
			location.replace(url);
		}
	});
});
</script>
</body>
</html>
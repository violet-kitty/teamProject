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
<!-- 달력 -->
<script src="<%= request.getContextPath() %>/js/main.min.js"></script>
<script src="<%= request.getContextPath() %>/js/locales-all.min.js"></script>
<link href="<%= request.getContextPath() %>/css/main.min.css" rel="stylesheet">
<!-- 결제 api -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- 달력 css --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/calendar.css" />
<!-- CSS3 - Mypage --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage.css">

<script>
	//달력 그리기
	document.addEventListener('DOMContentLoaded', function(){
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar: {
				left:'',
				center:'prev title next',
				right:'today'
			},
			locale: "ko",
			selectable: true,
		    select: function(arg) {//클릭시 이벤트
		    	
		    	 $(".fc .fc-daygrid-day").each(function(index, item){
		    		var t = $(this);
		    		
		    		if(t.attr("data-date") < arg.startStr || t.attr("data-date") >= arg.endStr) t.css("background","");//해당 칸 제외 칸 색 없애기
		    		else t.css("background","aliceblue");//클릭한 칸 색 바꾸기
		    	});
		    	
		    	$("#date1").text(arg.startStr);
		    	$("#date2").text(dateRel(arg.endStr));
		    	
		    	//해당 날짜의 예약 목록 가져오기
		    	$.ajax({
		    		url:"resList.do",
		    		data:"date1="+arg.startStr+"&date2="+dateRel(arg.endStr),
		    		type:"post",
		    		success:function(list){
		    			var html = "<input type='hidden' id='reidx'>"
		    					+ "<input type='hidden' id='pay'>";
		    			
		    			for(var i=0;i<list.length;i++){
		    				html = html
		    				+ "<div class='card mb-3'>"
		    				+ "<div class='row g-0'>"
		    				+ "<div class='col'>"
		    				+ "<div class='card-body'>"
		    				+ "<table class='table'>"
		    				+ "<tr>"
	    					+ "<td><h5 class='card-title'>숙소 이름 " + list[i].sname +"</h5></td>"
	    					+ "<td><h5 class='card-title'>방 이름 " + list[i].rname +"</h5></td>"
	    					+ "</tr>"
	    					+ "<tr>"
	    					+ "<td><p class='card-text'>체크인 " + list[i].date1 +"</p></td>"
	    					+ "<td><p class='card-text'>체크 아웃 " + list[i].date2 +"</p></td>"
	    					+ "</tr>"
	    					+ "<tr>"
	    					+ "<td><p class='card-text'>가격 " + list[i].price +"</p></td>"
	    					+ "<td><p class='card-text'>결제 여부 " + list[i].pay +"</p></td>"
	    					+ "</tr>"
	    					+ "<tr>";
	    					
	    					if(list[i].name != "null")
	    					html = html
	    					+ "<td><p class='card-text'>예약자 이름 " + list[i].name + "</p></td>";
	    					
	    					if(list[i].phone != "null")
							+ "<td><p class='card-text'>핸드폰 번호 " + list[i].phone + "</p></td>";
							
							html = html
							+ "</tr>"
							+ "<tr>"
							+ "<td><p class='card-text'>예약 날짜 " + list[i].wdate +"</p></td>"
							+ "<td><button class='bluebtn' style='padding:8px 16px;' onclick='resDelete("+list[i].reidx+","+list[i].pay+")'>예약 취소</button></td>"
							+ "</tr>"
							+ "</table>"
							+ "</div>"
							+ "</div>"
							+ "</div>"
							+ "</div>"
							+ "<br><br>";
		    			}
		    			
		    			
		    			$("#listArea").html(html);
		    		}
		    	});
		    	
		    	calendar.unselect()
			}
		});
		calendar.render();
	});
	
	//특정일자 하루전
	function dateRel(date){ 
	  var selectDate = date.split("-");
	  var changeDate = new Date();
	  changeDate.setFullYear(selectDate[0], selectDate[1]-1, selectDate[2]-1);
	  
	  var y = changeDate.getFullYear();
	    var m = changeDate.getMonth() + 1;
	    var d = changeDate.getDate();
	    
	    if(m < 10) { 
	        m = "0" + m;
	    }
	 
	    if(d < 10) {
	        d = "0" + d;
	    }
	    var resultDate = y + "-" + m + "-" + d;
	   return resultDate;
	}
	
	//예약 추가
	function resInsert(){
		location.href="resInsert.do?date1="+$("#date1").text()+"&date2="+$("#date2").text();
	}
	
	//예약 취소
	function resDelete(reidx, pay){
		$("#reidx").val(reidx);
		$("#pay").val(pay);
		modalFn("정말 예약을 취소하시겠습니까? 예약을 취소하시려면 사유를 입력해 주세요.","예약 취소","예약 취소","닫기","inputModal");
	}
	
	//예약 취소 insert
	function inputModal(){
		var input = $("#textInput").val();
		modalClose();
		var reidx = $("#reidx").val();
		var pay = $("#pay").val();
		
		//예약 취소 메시지 처리 및 merchant 가져오기
		$.ajax({
			url:"resDelete.do",
			data:"reidx="+reidx+"&content="+input+"&bidx="+reidx,
			type:"post",
			success:function(re){
				//결제를 한 경우 환불 처리
				if(pay == 'Y'){
					//환불
					$.ajax({
						url:"payCancel.do",
						data:"merchant="+re,
						type:"post",
						success:function(result){
							if(result==1){
								modalFn("예약 취소 되었습니다");
								setTimeout(function(){
									modalClose();
									location.reload();
								},1000);
							}
							else {
								modalFn("예약 취소에 실패했습니다");
								setTimeout(function(){
									modalClose();
									location.reload();
								},1000);
							}
						}
					});
				}
				else{//결제하지 않은 경우 예약취소만 처리
					modalFn("예약 취소 되었습니다");
					setTimeout(function(){
						modalClose();
						location.reload();
					},1000);
				}
			}
		});
	}
</script>
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
				
			
				<!-- 달력 -->
				<div class="container">
					<div class="container hbg-whitegray" style="padding-left:20px; padding-right:20px;border-radius:5px;">
						
						<!-- 페이지 제목 -->
						<div class="pageinfo">
							<div class="title onlypc">
								<h1>예약목록</h1>
							</div>
						</div>
						
						<div id="calendar" ></div>
						<br><br>
						
						<button onclick="resInsert()" class="bluebtn">예약 추가하러 가기</button><br><br>
					
						<!-- 날짜가 출력되는 div -->
						<div id="dateArea">
							<span>선택된 날짜 : </span>
							<span id="date1"></span>
							<span> ~ </span>
							<span id="date2"></span>
						</div>
						<br><br>
						
						
						<!-- 예약 목록이 출력되는 div -->
						<div id="listArea">
							<!-- reidx 담는 input -->
							<input type="hidden" id="reidx">
							<input type="hidden" id="pay">
							<c:forEach var="i" items="${res}">
							<div class="card mb-3">
								<div class="row g-0">
									<div class="col">
										<div class="card-body">
										
											<table class="table">
												<tr>
													<td><h5 class="card-title">숙소 이름 ${i.sname}</h5></td>
													<td><h5 class="card-title">방 이름 ${i.rname}</h5></td>
												</tr>
												<tr>
													<td><p class="card-text">체크인 ${i.date1}</p></td>
													<td><p class="card-text">체크 아웃 ${i.date2}</p></td>
												</tr>
												<tr>
													<td><p class="card-text">가격 ${i.price}</p></td>
													<td><p class="card-text">결제 여부 ${i.pay}</p></td>
												</tr>
												<tr>
													<c:if test="${i.name != null}">
													<td><p class="card-text">예약자 이름 ${i.name}</p></td>
													</c:if>
													<c:if test="${i.phone != null}">
													<td><p class="card-text">핸드폰 번호 ${i.phone}</p></td>
													</c:if>
												</tr>
												<tr>
													<td><p class="card-text">예약 날짜 ${i.wdate}</p></td>
													<td><button class='bluebtn' style='padding:8px 16px;' onclick="resDelete('${i.reidx}')">예약 취소</button></td>
												</tr>
											</table>
											
										</div>
									</div>
								</div>
							</div>
							<br><br>
							</c:forEach>
						</div>
						
					</div>	
					
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div>
		<!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
</body>
</html>
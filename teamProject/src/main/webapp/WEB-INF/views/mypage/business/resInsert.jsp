<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF마이페이지</title>
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
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
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
		    	$("#roomArea").html("");
		    	
		    	 $(".fc .fc-daygrid-day").each(function(index, item){
		    		var t = $(this);
		    		
		    		if(t.attr("data-date") < arg.startStr || t.attr("data-date") >= arg.endStr) t.css("background","");//해당 칸 제외 칸 색 없애기
		    		else t.css("background","aliceblue");//클릭한 칸 색 바꾸기
		    	});
		    	
		    	$("#date1").text(arg.startStr);
		    	$("#date2").text(dateRel(arg.endStr));
		    	
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
	
	//선택된 숙소의 남은 방 목록 보여주기
	function staySelect(sidx){
		var date1 = $("#date1").text();
		var date2 = $("#date2").text();
		
		if(date1 == ""){
			modalFn("날짜를 선택해 주세요");
			setTimeout(function(){
				modalClose();
			},1000);
			return;
		}
		else {
			//방 목록 보여주기
			//해당 날짜의 방 목록 가져오기
	    	$.ajax({
	    		url:"roomSelect.do",
	    		data:"sidx="+sidx+"&date1="+date1+"&date2="+date2,
	    		type:"post",
	    		success:function(list){
	    			var html = "";
	    			
	    			for(var r of list.room){
	    				var txt = "'"+list.sidx+"','"+list.name+"','"+r.name+"','"+r.price+"','"+r.people+"','"+r.square+"','"+r.tags+"'";
	    				html = html
	    				+ '<div class="card mb-3">'
	    				+ '<div class="row g-0">'
	    				+ '<div class="col-lg-4">'
	    				+ '<img src="<%= request.getContextPath() %>/mypage/displayFile.do?fileName='+r.photo+'" style="width:100%;height:100%;">'
	    				+ '</div>'
	    				+ '<div class="col-lg-8">'
	    				+ '<div class="card-body">'
	    				+ '<h5 class="card-title">방 이름'+r.name+'</h5>'
	    				+ '<p class="card-text">가격'+r.price+'</p>'
	    				+ '<p class="card-text">남은 방 '+r.cnt+' 개</p>';
	    				
	    				if(r.cnt != 0){
	    					html = html
		    				+ '<button onclick="resInsert('+txt+')">선택</button>';
	    				}
	    				
	    				html = html
	    				+ '</div>'
	    				+ '</div>'
	    				+ '</div>'
	    				+ '</div>';
	    			}
	    			$("#roomArea").html(html);
	    		}
	    	});
		}
	}
	
	//방 예약
	function resInsert(sidx, stayName, roomName, price, people, square, tags){
		var date1 = $("#date1").text();
		var date2 = $("#date2").text();
		var dd = "sidx="+sidx+"&rname="+roomName+"&price="+price+"&people="+people+"&square="+square+"&tags="+tags+"&date1="+date1+"&date2="+date2;
		//ridx 알아오기
		$.ajax({
			url:"<%= request.getContextPath() %>/stay/roomRidx.do",
			data:dd,
			type:"post",
			success:function(ridx){
				$.ajax({
					url:"<%= request.getContextPath() %>/mypage/resInsert.do",
					data:"ridx="+ridx+"&date1="+date1+"&date2="+date2+"&price="+price,
					type:"post",
					success:function(data){
						if(data == 1){
							modalFn("예약을 추가했습니다");
							setTimeout(function(){
								modalClose();
								location.href="reservationList.do";
							},1000);
						}
						else {
							modalFn("예약 추가에 실패했습니다");
							setTimeout(function(){
								modalClose();
							},1000);
						}
					}
				});
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
							<div class="title">
								<h1>예약 추가</h1>
							</div>
						</div>
					
						<div id="calendar" ></div>
						<br><br>
						<!-- 날짜가 출력되는 div -->
						<div id="dateArea">
							<span>선택된 날짜 : </span>
							<span id="date1"></span>
							<span> ~ </span>
							<span id="date2"></span>
						</div>
						<br><br>
						<div class="pageinfo">
							<div class="title onlypc">
								<h1>내 숙소 목록</h1>
							</div>
						</div>
						<br><br>
						<!-- 숙소 목록이 출력되는 div -->
						<div id="stayArea">
							<!-- reidx 담는 input -->
							<input type="hidden" id="reidx">
							<c:forEach var="i" items="${stay}">
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-lg-4">
											<img src="<%= request.getContextPath() %>/mypage/displayFile.do?fileName=${fn:split(i.photo,',')[0]}" style="width:100%;height:100%;">
										</div>
										<div class="col-lg-8">
											<div class="card-body">
												<h5 class="card-title">숙소 이름 ${i.name}</h5>
												<p class="card-text">주소 ${i.addr} ${i.detailaddr}</p>
												<button onclick="staySelect('${i.sidx}')">선택</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<br>
						<div class="pageinfo">
							<div class="title onlypc">
								<h1>방 목록</h1>
							</div>
						</div>
						<br><br>
						<!-- 방 목록이 출력되는 div -->
						<div id="roomArea">
							
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
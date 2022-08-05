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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
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
		
		var html = '<br><div class="d-flex justify-content-center"><button type="button" onclick="revote()">투표 다시하기</button></div><br><br>';
		
		$("#selected_vote_option").append(html);
		$("#selected_vote_option").show();
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
				<div class="container">
					<div class="row">
						<div class="col d-flex justify-content-center text-center">
							<div id="vote">
							<div id="selected_vote_option" style="display: none">
							<c:if test="${rv != null && result != 0}">
								<canvas id="pieChartCanvas" style="width: 500px; height: 500px;"></canvas>
								<script>asdasd();</script>
							</c:if>
							</div>
							<c:if test="${rv != null && result != 0}">

							</c:if>
							<c:if test="${rv != null && result == 0}">
								<div id="show_vote_option">
									<form id="form1">
										<input type="hidden" name="ridx" value="${rv.ridx}">
										<div class="text-center">
											${rv.title}
										</div><br>
										<c:if test="${rv.place1 != null }">
											<input type="radio" name="vote" value="${rv.place1}">${rv.place1}<br>
										</c:if>
										<c:if test="${rv.place2 != null }">
											<input type="radio" name="vote" value="${rv.place2}">${rv.place2}<br>
										</c:if>
										<c:if test="${rv.place3 != null }">
											<input type="radio" name="vote" value="${rv.place3}">${rv.place3}<br>
										</c:if>
										<c:if test="${rv.place4 != null }">
											<input type="radio" name="vote" value="${rv.place4}">${rv.place4}<br>
										</c:if>
										<c:if test="${rv.place5 != null }">
											<input type="radio" name="vote" value="${rv.place5}">${rv.place5}<br>
										</c:if>
										<div class="text-center">
											<br><button type="button" onclick="insert_vote_option()">투표하기</button>
										</div>
									</form>
									<c:if test="${login.midx == rv.midx}">
										<br><button type="button" onclick="remove_vote()">투표  마감 / 삭제</button><br>
									</c:if>
								</div>
							</c:if>
							<c:if test="${rv == null}">
								<div id="div_create_vote">
									<button onclick="cancel_vote()" id="cancel_vote" style="display: none;">투표 작성 취소</button><br>
									<button onclick="create_vote()" id="create_vote" class="h-auto">투표 만들기</button><br>
									<div id="display" style="display:none">
										<button onclick="add_option()" class="h-auto">선택지 추가</button>
										<div id="voteArea">
											<form id="vote_option">
												<input type="text" name="title" id="title" placeholder="투표 주제 선정"><br><br>
												<input type="text" id="p1" name="place1" placeholder="투표 선택지1"><br>
												<input type="text" id="p2" name="place2" placeholder="투표 선택지2"><br>
											</form>
										</div>
										<button onclick="upload_vote()" class="h-auto">투표 올리기</button><br>
									</div>
								</div>
							</c:if>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col d-flex justify-content-center">
							<button type="button" onclick="location.href='teamView.do?tidx=${tidx}'" class="h-auto">팀 글 페이지</button>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div>
<!-- 							<button onclick="clickFn()">sdfs</button> -->
							</div>
						</div>
					</div>
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
<script>
// 	function clickFn(){
// 		취소 버튼 대신 설정한 시간(밀리초) 만큼만 모달을 띄워놓고 싶을 때
// 		modalFn("sdfsdfsdf");
// 		setTimeout(function(){
// 			modalClose();
// 		},1500);
// 		modalFn("sdfsdfsdfsdf ","qweqwe");
// 	}
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
		
		var html = '<input type="text" name="title" id="title" placeholder="투표 주제 선정"><br><br>';
			html += '<input type="text" id="p1" name="place1" placeholder="투표 선택지1"><br>';
			html += '<input type="text" id="p2" name="place2" placeholder="투표 선택지2"><br>';
			
		$("#vote_option").html(html);
		index = 3;
	}

	function add_option(){
		if(index > 5){
			modalFn("선택지는 최대 5개까지만 가능합니다.","확인","타이틀","취소");
			return;
		}
		else{
			$("#vote_option").append('<input type="text" id="p'+index+'" name="place'+index+'" placeholder="투표 선택지'+index+'"><br>');
			index++;
		}
		
	}
	
	function modalOkFn(){
		modalClose();
		modalFn("ddd");
		setTimeout(function(){
 			modalClose();
 		},1500);
		
	}
	
	function upload_vote(){
		//recommend에 올리는  ajax
		var frm = $("#vote_option").serialize();
		
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

	function remove_vote(){
		$.ajax({
			url: "remove_vote.do?ridx=${rv.ridx}",
			type: "get",
			success: function(){
				modalFn("삭제되었습니다.","확인");
				location.reload();
				
			}
		});
	}
	


		
	
</script>
</body>
</html>
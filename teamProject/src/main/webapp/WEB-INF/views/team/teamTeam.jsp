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
							<div id="vote">
							<div id="selected_vote_option" style="display: none">
							
							</div>
							<c:if test="${rv2 != null}">
								<div id="show_vote_option">
									<form id="form1">
										<input type="hidden" name="ridx" value="${rv2.ridx}">
										${rv2.title}<br>
										<c:if test="${rv2.place1 != null }">
											<input type="radio" name="vote" value="${rv2.place1}">${rv2.place1}<br>
										</c:if>
										<c:if test="${rv2.place2 != null }">
											<input type="radio" name="vote" value="${rv2.place2}">${rv2.place2}<br>
										</c:if>
										<c:if test="${rv2.place3 != null }">
											<input type="radio" name="vote" value="${rv2.place3}">${rv2.place3}<br>
										</c:if>
										<c:if test="${rv2.place4 != null }">
											<input type="radio" name="vote" value="${rv2.place4}">${rv2.place4}<br>
										</c:if>
										<c:if test="${rv2.place5 != null }">
											<input type="radio" name="vote" value="${rv2.place5}">${rv2.place5}<br>
										</c:if>
										<button type="button" onclick="insert_vote_option()">투표하기</button>
									</form>
									<c:if test="${login.midx == rv.midx}">
										<button type="button" onclick="remove_vote()">투표  마감 / 삭제</button>
									</c:if>
								</div>
							</c:if>
							<c:if test="${rv == null}">
								<div id="div_create_vote">
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
					<div class="row">
						<div class="col d-flex justify-content-center">
							<button type="button" onclick="location.href='teamView.do?tidx=${tidx}'" class="h-auto">팀 글 페이지</button>
						</div>
					</div>
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
<script>
	function create_vote(){
		if($("#display").css("display") == "none"){
			$("#create_vote").html("취소");
		}
		else {
			$("#create_vote").html("투표 만들기");
		}
		$("#display").toggle();
	}
	var index = 3;
	function add_option(){
		if(index > 5){
			alert("선택지는 최대 5개까지만 가능합니다.");
			return;
		}
		else{
			$("#vote_option").append('<input type="text" id="p'+index+'" name="place'+index+'" placeholder="투표 선택지'+index+'"><br>');
			index++;
		}
		
		
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
	
	function insert_vote_option(){
		
		var form = $("#form1").serialize();
		
		$.ajax({
			url: "insert_vote_option.do?ridx=${rv.ridx}",
			data: form,
			type: "post",
			success: function(){
				
				$("#show_vote_option").hide();
				
				var html = '<br>${rv2.ridx}<br>';
					html += '${rv2.title}<br>';
				/* for(var i = 0; i < ${rv2.places.length}; i++){
					html += '${rv2.places['+i+']} + [ ]<br>'
				} */
					html += '<button type="button" onclick="revote">투표 다시하기</button>'
				
				
				$("#selected_vote_option").html(html);
				$("#selected_vote_option").show();
			}
		});
	}

	function remove_vote(){
		$.ajax({
			url: "remove_vote.do?ridx=${rv.ridx}",
			type: "get",
			success: function(){
				$("#show_vote_option").hide();
			}
			
		});
		
	}


		
	
</script>
</body>
</html>
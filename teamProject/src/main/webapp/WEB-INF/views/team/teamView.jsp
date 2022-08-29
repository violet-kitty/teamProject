<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF 너나들이</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

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
<!-- CSS3 - Home --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabWrite --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyView.css">
</head>
<body>

	<div id="wrap" class="boardView cs csview">
	
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">
		
			<div class="contents pagehead hbg-whitegray">
				<div class="container" id="featured-2">
				    <!-- pagehead  -->
					<a class=" onlypc" href="<%=request.getContextPath()%>/team/teamList.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>
					
					<!-- 뷰 -->
					<!-- 리스트 카드 hover effect 종류 참고 : https://codepen.io/vavik96/pen/MYdBKz -->
					<div class="clist">
					
						<!-- C리스트 14. 반복 -->
						<div class="thumbnailitem">
							
							<div class="thumbnail">
								
								<div class="writerinfo">
									<p>
										<span class="cate" style="background: #A4C266; color: white;">${tv.tidx}</span>
										<span class="hfc-semibold hfc-darkgray">| ${tv.wdate}</span>
										<span class="hfc-semibold hfc-darkgray">| ${tv.nickname}</span>
									</p>
									<div class="small">
										<div class="col-lg-6 d-flex justify-content-end">
											<img src="<%=request.getContextPath()%>/image/icon/eye.png">
											<span class="hfc-semibold hfc-darkgray ms-1" id="heartNum">${tv.cnt}</span>
											<img src="<%=request.getContextPath()%>/image/button/menu5.png">
											<span class="hfc-semibold hfc-darkgray ms-1" id="heartNum">${tv.people_cnt}</span>
										</div>
									</div>
								</div>
								<div class="caption">
									<h4>${tv.title}</h4>
								</div>
								<!-- 글 내용 -->
								<div class="row contentrow">
									<div class="col" id="howfContent">
										${tv.content}
									</div>
									<c:if test="${tv.filename != null}">
										<a href="<%=request.getContextPath() %>/team/displayFile.do?filename=${tv.filename}&down=0">
											<img src="<%=request.getContextPath() %>/team/displayFile.do?filename=${tv.filename}" style="max-width: 300px; max-height: 300px;">
										</a>
									</c:if>	
								</div>
								<div class="row">
									<div class="col d-flex justify-content-center">
										<c:if test="${login != null && tv.applyyn == 'Y'}">
											<c:if test="${check.joinyn == 'B'}">
												해당 너나들이 팀으로부터 차단되었습니다.
											</c:if>
											<c:if test="${check.joinyn == 'N' || check.joinyn == null}">
												<c:if test="${check.jidx == 0}">
													<input type="button" id="join_btn" class="bluebtn" value="가입신청">
													<input type="button" id="join_cancel_btn" class="graybtn" value="가입신청 취소" style="display: none;">
												</c:if>
												<c:if test="${check.jidx != 0}">
													<input type="button" id="join_btn" class="bluebtn" value="가입신청" style="display: none;">
													<input type="button" id="join_cancel_btn" class="graybtn" value="가입신청 취소">
												</c:if>
											</c:if>
										</c:if>
										<c:if test="${check.joinyn == 'Y'}">
											<div class="row">
												<div class="col">
													<button onclick="javascript:location.href='teamTeam.do?tidx=${tv.tidx}'" class="bluebtn">팀 페이지</button>
												</div>
											</div>
										</c:if>
									</div>
								</div>
								
								<div class="row btnarea">
									<div class="col d-flex justify-content-start">
										<c:if test="${login!=null && login.midx == tv.midx}">
											<button type="button" id="teamDelete" value="삭제"><img src="<%=request.getContextPath()%>/image/button/delete.png"></button>
											<button type="button" id="teamModify" value="수정"><img src="<%=request.getContextPath()%>/image/button/edit.png"></button>
										</c:if>
									</div>
								</div>
								
							</div><!-- /.thumbnail -->
							
						</div><!--/. thumbnailitem -->
						
					</div><!-- /.clist -->
					
					<hr class="lastline">
					
					<a class=" onlypc" href="<%=request.getContextPath()%>/team/teamList.do">
					<div class="backto">
						<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
					</div>
					</a>
					<!-- 리스트 카드 -->
					
				</div><!-- /.container -->
				
			</div><!-- /.contents -->
			
			<!-- banner --><%@include file="../banner.jsp"%>
			
		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
		
	</div><!-- /#wrap -->
	
	
<script>
	function modalOkFn(){
		location.href = "teamDelete.do?tidx=${tv.tidx}";
	}

	$(function(){

		$("#teamList").click(function(){
			location.href = "teamList.do";			
		});
		
		$("#teamModify").click(function(){
			location.href = "teamModify.do?tidx=${tv.tidx}";
		});
		
		$("#teamDelete").click(function(){
			modalFn("삭제하시면 복구할 수 없습니다. 정말로 삭제하시겠습니까?", "확인", "1:1 고객문의 삭제", "취소");
		});
		
		$("#join_btn").click(function(){
			$.ajax({
				url: "join_apply.do",
				data: "tidx=${tv.tidx}",
				type: "get",
				success:function(data){
					if(data != 0){
						$("#join_btn").toggle();
						$("#join_cancel_btn").toggle();
					}
				}
			});
			
		});
		
		$("#join_cancel_btn").click(function(){
			$.ajax({
				url: "join_apply_cancel.do",
				data: "tidx=${tv.tidx}",
				type: "get",
				success: function(data){
					if(data != 0){
						$("#join_btn").toggle();
						$("#join_cancel_btn").toggle();
					}
				}
			});
		});
		
	});
</script>
</body>
</html>
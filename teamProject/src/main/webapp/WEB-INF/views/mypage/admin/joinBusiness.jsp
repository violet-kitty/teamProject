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
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyList.css">
<!-- CSS3 - Mypage --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage.css">
</head>
<body>
	<div id="wrap" class="boardlist cs cslist">
		
		
		<!-- Header --><%@include file="/WEB-INF/views/Header.jsp"%>
		<!-- Nav --><%@include file="/WEB-INF/views/Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-whitegray">

			<!-- content01 -->
			<div class="contents pagehead">
				<div class="container" id="featured-2">
				
					<!-- 페이지 제목 -->
					<div class="pageinfo">
						<div class="title">
							<h1>사업자 가입 승인</h1>
						</div>
					</div>
					
					<div class="clist">
					<table border="1" class="table">
						<thead>
							<tr><th width="10%">회원번호</th><th width="25%">이름</th><th width="25%">닉네임</th><th width="20%">사업자 등록증</th><th width="20%">승인하기</th></tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${user}">
							<tr>
								<td>
								${i.midx}
								</td>
								<td>
								${i.name}
								</td>
								<td>
								${i.nickname}
								</td>
								<td>
								<button onclick="busView('${i.document}')">보기</button>
								</td>
								<td style="text-align:center;">
								<button onclick="okFn('${i.midx}')">승인</button>
								<button onclick="delFn('${i.midx}')">거절</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 승인 거부용 midx -->
					<input type="hidden" id="midx">
					
					
					<!-- C페이징 01 : 페이징 paging 공간 만들기 -->
					<div class="row pagenation">
						<div class="col d-flex justify-content-center">
							<c:if test="${pm.prev == true}">
								<a class="hfc-gray hfc-bold" href="joinBusiness.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
							<c:choose>
							<c:when test="${search.page != null && i == search.page}">
								<a class="hfc-white hfc-bold hbg-pink mx-1" href="joinBusiness.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
							</c:when>
							<c:otherwise>
								<a class="hfc-gray hfc-bold mx-1" href="joinBusiness.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							<c:if test="${pm.next == true}">
								<a class="hfc-gray hfc-bold" href="joinBusiness.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
							</c:if>
						</div>
					</div>
					<!-- /페이징 -->
					
					</div><!-- /.clist -->
					
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div>
		<!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
<script>
	//사업자 등록증 보기
	function busView(document){
		var photo = "<div><img src='displayDocument.do?fileName="+document+"' style='width:100%'></div>";
		modalFn(photo,"닫기");
	}
	//승인
	function okFn(midx){
		$.ajax({
			url:"joinBusiness.do",
			type:"post",
			data:"midx="+midx,
			success:function(data){
				if(data == 1){
					modalFn("승인이 완료되었습니다");
					setTimeout(function(){
						modalClose();
						location.reload();
					},1000);
				}
				else {
					modalFn("승인 에러!");
					setTimeout(function(){
						modalClose();
						location.reload();
					},1000);
				}
			}
		});
	}
	//거절
	function delFn(midx){
		$("#midx").val(midx);
		modalFn("정말 가입을 거절하시겠습니까?","확인","가입 거절","취소");
	}
	//거절 ajax
	function modalOkFn(){
		var midx = $("#midx").val();
		modalClose();
		$.ajax({
			url:"denyBusiness.do",
			type:"post",
			data:"midx="+midx,
			success:function(data){
				if(data == 1){
					modalFn("가입 거절이 완료되었습니다");
					setTimeout(function(){
						modalClose();
						location.reload();
					},1000);
				}
				else {
					modalFn("가입 거절 실패!");
					setTimeout(function(){
						modalClose();
						location.reload();
					},1000);
				}
			}
		});
	}
</script>	
	
</body>
</html>
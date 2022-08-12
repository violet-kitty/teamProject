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
				
					<!-- pagehead -->
					<div class="pageinfo">
						<!-- 페이지 제목 -->
						<div class="title onlypc">
							<a href="<%= request.getContextPath() %>/mypage/userList.do"><h1>회원관리</h1></a>
						</div>
						
						<!-- 검색 -->
						<!-- rightbox : tablet 사이즈 이하에서 숨기기 -->
						<div class="row rightbox onlypc-inline">
							<!-- sort 버튼 -->
							<div class="col d-flex justify-content-end filterbtn">
								<button onclick="location.href='userList.do?sortType=dely'" id="ingBtn">탈퇴o</button>
								<button onclick="location.href='userList.do?sortType=deln'" id="willBtn">탈퇴x</button>
								<button onclick="location.href='userList.do?sortType=normal'" id="newBtn">일반회원</button>
								<button onclick="location.href='userList.do?sortType=business'" id="newBtn">사업자</button>
								<button onclick="location.href='userList.do?sortType=official'" id="newBtn">공무원</button>
							</div>
							<!-- 검색창 Search -->
							<form name="frm2" action="userList.do" method="post">
							<div class="search">
								<input type="hidden" name="searchType" value="total">
								<input type="text" name="searchValue" value="${search.searchValue}">
								<input type="submit" value="검색">
							</div>
							</form>
						</div><!-- .rightbox -->
						
						<!-- rightbox : tablet 사이즈 이하에서만 보이기-->
						
						<c:if test="${login!=null && (login.role=='official' || login.role=='admin')}">
							<div class="docctrl onlytablet" style="margin-top:16px;">
								<a href="<%=request.getContextPath()%>/event/eventWrite.do"><button class="w-100 bluebtn"><i class="fa-solid fa-plus"></i> &nbsp;글쓰기</button></a>
							</div>
						</c:if>
						
						<div class="row rightbox onlytablet">
							<div class="btn-group">
								<button class="w-100 dropdown-toggle pinkbtn" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">카테고리 정렬 &nbsp;</button>
								<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
									<li><a class="dropdown-item" href="userList.do?sortType=dely">탈퇴o</a></li>
									<li><a class="dropdown-item" href="userList.do?sortType=deln">탈퇴x</a></li>
									<li><a class="dropdown-item" href="userList.do?sortType=normal">일반회원</a></li>
									<li><a class="dropdown-item" href="userList.do?sortType=business">사업자</a></li>
									<li><a class="dropdown-item" href="userList.do?sortType=official">공무원</a></li>
								</ul>
							</div>
							<!-- 검색창 Search -->
							<form name="frm2" action="userList.do" method="post">
							<div class="search">
								<input type="hidden" name="searchType" value="total">
								<input type="text" name="searchValue" value="${search.searchValue}">
								<input type="submit" value="검색">
							</div>
							</form>
						</div><!-- .rightbox -->

					</div><!-- .pageinfo -->
					<!-- / pagehead -->
					
					<!-- 회원 목록 -->
					<table class="table">
						<thead>
							<tr>
								<th>
								회원번호
								<button onclick="location.href='userList.do?sortType=midxA'">▲</button>
								<button onclick="location.href='userList.do?sortType=midxD'">▼</button>
								</th>
								<th>
								이름
								<button onclick="location.href='userList.do?sortType=nameA'">▲</button>
								<button onclick="location.href='userList.do?sortType=nameD'">▼</button>
								</th>
								<th>
								이메일
								<button onclick="location.href='userList.do?sortType=emailA'">▲</button>
								<button onclick="location.href='userList.do?sortType=emailD'">▼</button>
								</th>
								<th>
								닉네임
								<button onclick="location.href='userList.do?sortType=nicknameA'">▲</button>
								<button onclick="location.href='userList.do?sortType=nicknameD'">▼</button>
								</th>
								<th>
								생년월일
								<button onclick="location.href='userList.do?sortType=juminA'">▲</button>
								<button onclick="location.href='userList.do?sortType=juminD'">▼</button>
								</th>
								<th>
								등급
								<button onclick="location.href='userList.do?sortType=roleA'">▲</button>
								<button onclick="location.href='userList.do?sortType=roleD'">▼</button>
								</th>
								<th>
								소셜여부
								<button onclick="location.href='userList.do?sortType=socialA'">▲</button>
								<button onclick="location.href='userList.do?sortType=socialD'">▼</button>
								</th>
								<th>
								승인여부
								<button onclick="location.href='userList.do?sortType=joinA'">▲</button>
								<button onclick="location.href='userList.do?sortType=joinD'">▼</button>
								</th>
								<th>
								가입일
								<button onclick="location.href='userList.do?sortType=jdateA'">▲</button>
								<button onclick="location.href='userList.do?sortType=jdateD'">▼</button>
								</th>
								<th>
								탈퇴여부
								<button onclick="location.href='userList.do?sortType=delA'">▲</button>
								<button onclick="location.href='userList.do?sortType=delD'">▼</button>
								</th>
								<th>회원 밴</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="u" items="${user}">
							<tr>
								<td>${u.midx}</td>
								<td>${u.name}</td>
								<td>${u.email}</td>
								<td>${u.nickname}</td>
								<td>${u.jumin}</td>
								<td>${u.role}</td>
								<td>${u.social}</td>
								<td>${u.joinyn}</td>
								<td>${u.joindate}</td>
								<td>${u.delyn} ${u.deldate}</td>
								<td><button onclick="banFn('${u.nickname}','${u.midx}')">밴</button></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<!-- 밴을 위한 input -->
					<input type="hidden" id="midx">
					
					<!-- C페이징 01 : 페이징 paging 공간 만들기 -->
					<div class="row pagenation">
						<div class="col d-flex justify-content-center">
							<c:if test="${pm.prev == true}">
								<a class="hfc-gray hfc-bold" href="userList.do?page=${pm.startPage-1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">◀</a>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
							<c:choose>
							<c:when test="${search.page != null && i == search.page}">
								<a class="hfc-white hfc-bold hbg-pink mx-1" href="userList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
							</c:when>
							<c:otherwise>
								<a class="hfc-gray hfc-bold mx-1" href="userList.do?page=${i}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">${i}</a>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							<c:if test="${pm.next == true}">
								<a class="hfc-gray hfc-bold" href="userList.do?page=${pm.endPage+1}&sortType=${search.sortType}&searchType=${search.searchType}&searchValue=${search.searchValue}">▶</a>
							</c:if>
						</div>
					</div>
					<!-- /페이징 -->
					
					
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div>
		<!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
<script>
	function banFn(nickname, midx){
		$("#midx").val(midx);
		var str = "정말 "+nickname+" 회원을 밴 하시겠습니까? 밴 사유를 입력해주세요";
		modalFn(str, "밴", "회원 밴", "취소", "inputModal");
	}
	
	function modalOkFn(){
		var text = $("#textInput").val();
		
		if(text == ""){
			return;
		}
		else {
			modalClose();
			$.ajax({
				url:"userBan.do",
				data:"content="+text+"&midx="+$("#midx").val(),
				type:"post",
				success:function(data){
					if(data == 1){
						modalFn("유저가 밴 되었습니다");
						setTimeout(function(){
							modalClose();
							location.reload();
						},1500);
					}
					else {
						modalFn("밴 실패!");
						setTimeout(function(){
							modalClose();
							location.reload();
						},1500);
					}
				}
			});
		}
	}
</script>	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
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
				
					<!-- pagehead -->
					<div class="pageinfo">
						<!-- 페이지 제목 -->
						<div class="title">
							<a href="<%= request.getContextPath() %>/mypage/userList.do"><h1>회원관리</h1></a>
						</div>
						<br>
						<!-- 검색 -->
						<!-- rightbox : tablet 사이즈 이하에서 숨기기 -->
						<div class="row rightbox onlypc-inline">
							<!-- sort 버튼 -->
							<div class="col d-flex justify-content-end filterbtn">
								<button onclick="location.href='userList.do?sortType=dely'" id="delyBtn">탈퇴o</button>
								<button onclick="location.href='userList.do?sortType=deln'" id="delnBtn">탈퇴x</button>
								<button onclick="location.href='userList.do?sortType=dela'" id="delaBtn">밴</button>
								<button onclick="location.href='userList.do?sortType=normal'" id="normalBtn">일반회원</button>
								<button onclick="location.href='userList.do?sortType=business'" id="businessBtn">사업자</button>
								<button onclick="location.href='userList.do?sortType=official'" id="officialBtn">공무원</button>
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
						<div class="row rightbox onlytablet">
							<div class="btn-group">
								<button class="w-100 dropdown-toggle pinkbtn" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">카테고리 정렬 &nbsp;</button>
								<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
									<li><a class="dropdown-item" href="userList.do?sortType=dely">탈퇴o</a></li>
									<li><a class="dropdown-item" href="userList.do?sortType=deln">탈퇴x</a></li>
									<li><a class="dropdown-item" href="userList.do?sortType=dela">밴</a></li>
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
					<div class="clist">
					<table border="1" class="table" style="text-align:center;">
						<thead>
							<tr>
								<th width="8%">
								회원번호<br>
								<button onclick="location.href='userList.do?sortType=midxA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=midxD'" class="arrowBtn">▼</button>
								</th>
								<th>
								이름<br>
								<button onclick="location.href='userList.do?sortType=nameA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=nameD'" class="arrowBtn">▼</button>
								</th>
								<th>
								이메일<br>
								<button onclick="location.href='userList.do?sortType=emailA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=emailD'" class="arrowBtn">▼</button>
								</th>
								<th>
								닉네임<br>
								<button onclick="location.href='userList.do?sortType=nicknameA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=nicknameD'" class="arrowBtn">▼</button>
								</th>
								<th>
								생년월일<br>
								<button onclick="location.href='userList.do?sortType=juminA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=juminD'" class="arrowBtn">▼</button>
								</th>
								<th width="8%">
								등급<br>
								<button onclick="location.href='userList.do?sortType=roleA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=roleD'" class="arrowBtn">▼</button>
								</th>
								<th width="8%">
								소셜여부<br>
								<button onclick="location.href='userList.do?sortType=socialA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=socialD'" class="arrowBtn">▼</button>
								</th>
								<th width="8%">
								승인여부<br>
								<button onclick="location.href='userList.do?sortType=joinA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=joinD'" class="arrowBtn">▼</button>
								</th>
								<th>
								가입일<br>
								<button onclick="location.href='userList.do?sortType=jdateA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=jdateD'" class="arrowBtn">▼</button>
								</th>
								<th width="8%">
								탈퇴여부<br>
								<button onclick="location.href='userList.do?sortType=delA'" class="arrowBtn">▲</button>
								<button onclick="location.href='userList.do?sortType=delD'" class="arrowBtn">▼</button>
								</th>
								<th width="8%">회원 밴</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${empty user}">
							<tr><td>해당하는 유저가 없습니다</td></tr>
						</c:when>
						<c:otherwise>
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
								<td>
								<c:if test="${u.delyn != 'A'}">
								<button onclick="banFn('${u.nickname}','${u.midx}')" style="background:none; border:none;"><img src='<%=request.getContextPath() %>/image/button/ban.png' style='width:20px;'></button>
								</c:if>
								</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
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
					
					</div><!-- /.clist -->
					
					<!-- 주소, 나이 차트 -->
					<c:if test="${(search.searchValue == null || search.searchValue == '') && search.sortType != 'dely' && search.sortType != 'deln' && search.sortType != 'dela' && search.sortType != 'normal' && search.sortType != 'business' && search.sortType != 'official'}">
					<div style="margin-top:50px;">
						<canvas id="myChart"></canvas><br><br><br>
						<canvas id="myChart2"></canvas>
					</div>
					</c:if>
					
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div>
		<!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
<script>
	$(function(){
		//sort 버튼
		var sortBtn = "${search.sortType}";
		if(sortBtn != ""){
			$("#"+sortBtn+"Btn").css("background","none");
			$("#"+sortBtn+"Btn").css("color","#DE8889");
			$("#"+sortBtn+"Btn").css("border","2px solid #DE8889");
		}
		
		
		Chart.defaults.scales.linear.min = 0;
		//지역 별 차트
		var addrL = [];
		var addrD = [];
		<c:forEach var="a" items="${addrData}">
		addrL.push('${a.addr}');
		addrD.push('${a.midx}');
		</c:forEach>
		
		var ctx = document.getElementById("myChart").getContext("2d");
		var chart = new Chart(ctx, {
			type:"line",
			data:{
				labels:addrL,
				datasets:[{
					label:"지역별 유저 수",
					backgroundColor:"#54ACA8",
					borderColor:"#54ACA8",
					data:addrD,
					options:{
						responsive:true,
						plugins:{
							legend:false
						}
					}
				}]
			}
		});//지역별 차트
		
		//나이 별 차트
		var ageL = [];
		var ageD = [];
		<c:forEach var="g" items="${ageData}">
		ageL.push('${g.jumin}');
		ageD.push('${g.midx}');
		</c:forEach>
		
		var ctx2 = document.getElementById("myChart2").getContext("2d");
		var chart2 = new Chart(ctx2, {
			type:"line",
			data:{
				labels:ageL,
				datasets:[{
					label:"나이별 유저 수",
					backgroundColor:"#54ACA8",
					borderColor:"#54ACA8",
					data:ageD,
					options:{
						responsive:true,
						plugins:{
							legend:false
						}
					}
				}]
			}
		});//나이별 차트
	});

	function banFn(nickname, midx){
		$("#midx").val(midx);
		var str = "정말 "+nickname+" 회원을 밴 하시겠습니까? 밴 사유를 입력해주세요";
		modalFn(str, "밴", "회원 밴", "취소", "inputModal");
	}
	
	function inputModal(){
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
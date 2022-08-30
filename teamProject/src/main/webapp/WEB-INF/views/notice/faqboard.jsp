<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>HOWF고객지원</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap5 최신 CSS & JS (Popper.js 포함됨) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Slick Slider -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- Bootstrap5 AwsomeFont -->
<script src="https://kit.fontawesome.com/a54851838a.js" crossorigin="anonymous"></script>
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav3 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav3.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardTabList --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/boardTabbyList.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/parallax.js"></script>

<!-- FAQ 스크립트 -->
<script type="text/javascript">
	// faq 내용 펼치기 이벤트
	$(function(callback) {
	$(".faq > dd").hide();
	  $(".faq > dt").css("cursor","pointer").click(function(event) {
		  
	  	$(event.currentTarget).next().slideToggle(100, function() {
	    	var $dd = $(this);
	    	var $dl = $dd.prev();
	    	
	    	if ($dd.css("display") == "none") {
	      		$dl.find("span").html("▼");
	    	
	      	} else {
	      		$dl.find("span").html("▲");
	      }
	    });
	  });
	});
	</script>
	<script type="text/javascript">
	//이동?
			
	
	//input 만들기
	function wmodify(index){
		var title = $("#ti"+index).text();
		var content = $("#co"+index).text();
		var c = "cancel("+index+",'"+title+"','"+content+"')";
		$("dt").off('click');
		var mdf="";
		
		mdf += "제목 : ";
		mdf += "<input type='text' id='title' value='"+title+"'>";
		mdf += "<br>";
		$("#title"+index).html(mdf);
		
		mdf = "";
		mdf += "내용 : ";
		mdf += "<textarea id='content'>";
		mdf += content;
		mdf += "</textarea>";
		mdf += "<button type='button' onclick='fmodify("+index+")'>";
		mdf += "수정";
		mdf += "</button>";
		mdf += '<button type="button" onclick="'+c+'">';
		mdf += "취소";
		mdf += "</button>";
		
		$("#content"+index).html(mdf);
		
	}
	//취소
	function cancel(index, title, content){
		var mdf = "";
		
		mdf += "<label id='ti"+index+"'>"+title+"</label>";
		mdf += "<span style='display: block; float: none;'>▼</span>";
		
		$("#title"+index).html(mdf);
		
		mdf = "<label id='co"+index+"'>"+content+"</label>";
		mdf += '<br>';
		
		<c:if test="${login!=null && login.role=='admin'}">
		mdf += '<div class="btnarea">';
		mdf += '<button onclick="del('+index+')">';
		mdf += '<img src="<%=request.getContextPath()%>/image/button/delete.png">';
		mdf += '</button>';
		mdf += '<button id="modify" class="modify"  onclick="wmodify('+index+')">';
		mdf += '<img src="<%=request.getContextPath()%>/image/button/edit.png">';
		mdf += '</button>';
		mdf += '</div>';
		</c:if>
		
		$('#content'+index).html(mdf);
		
		//클릭 이벤트
		$(".faq > dt").css("cursor","pointer").click(function(event) {
			  
		  	$(event.currentTarget).next().slideToggle(100, function() {
		    	var $dd = $(this);
		    	var $dl = $dd.prev();
		    	
		    	if ($dd.css("display") == "none") {
		      	$dl.find("span").html("▼");
		    	
		      } else {
		      	$dl.find("span").html("▲");
		      }
		    });
		  });
	}
	
	//삭제
	function del(fbidx){
		$("#fbidx").val(fbidx);
		modalFn("정말 삭제하시겠습니까?","삭제","FAQ","취소","delFn");
	}
	function delFn(){
		modalClose();
		var fbidx = $("#fbidx").val();
		$.ajax({
			url:"delfaq.do",
			type:"GET",
			data:"fbidx="+fbidx,
			success:function(data){
				if(data != 0){
					modalFn("삭제되었습니다");
					setTimeout(function(){
					modalClose();
					location.href="faqboard.do";
					return;
					},1500);
				}else {
					modalFn("삭제 실패");
					setTimeout(function(){
					modalClose();
					return;
					},1500);
				}
			}
			
		});
	}
	//쓰기 후 그려주기
	function fmodify(index){
		modify(index);
		
		var mdf = "";
		var title = $("#title").val();
		var content = $("#content").val();
		
		mdf += "<label id='ti"+index+"'>"+title+"</label>";
		mdf += "<span style='display: block; float: none;'>▼</span>";
		
		$("#title"+index).html(mdf);
		
		mdf = "<label id='co"+index+"' style='word-break: break-all;'>"+content+"</label>";
		mdf += '<br>';
		<c:if test="${login!=null && login.role=='admin'}">
		mdf += '<div class="btnarea">';
		mdf += '<button onclick="del('+index+')">';
		mdf += '<img src="<%=request.getContextPath()%>/image/button/delete.png">';
		mdf += '</button>';
		mdf += '<button id="modify" class="modify"  onclick="wmodify('+index+')">';
		mdf += '<img src="<%=request.getContextPath()%>/image/button/edit.png">';
		mdf += '</button>';
		mdf += '</div>';
		</c:if>
		$('#content'+index).html(mdf);
		
		//클릭 이벤트
		$(".faq > dt").css("cursor","pointer").click(function(event) {
			  
		  	$(event.currentTarget).next().slideToggle(100, function() {
		    	var $dd = $(this);
		    	var $dl = $dd.prev();
		    	
		    	if ($dd.css("display") == "none") {
		      		$dl.find("span").html("▼");
		    	}
		    	else {
		      		$dl.find("span").html("▲");
		      	}
		    });
		  });
	}
// faq DB
function modify(index){
	var title = $("#title").val();
	var content = $("#content").val();
	
	$.ajax({
		url: "faqmodify.do",
		type : 'POST',
		data : "fbidx="+index+"&title="+title+"&content="+content,
		success: function(result){
			if(result==1){
				modalFn("수정되었습니다");
				setTimeout(function(){
					modalClose();
					return;
				},1000);
			}
			else {
				modalFn(result + ", 에러!");
				setTimeout(function(){
					modalClose();
					return;				
				},1000);
			}	
		}
	});
};
	</script>
	<!-- / FAQ 스크립트 -->

</head>


<body>

	<div id="wrap" class="boardlist faq faqlist">
		
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Herotop -->
		<div class="parallax-window" data-parallax="scroll" data-image-src="<%= request.getContextPath() %>/image/picture/support.jpg"></div>
				<nav class="cstopNav">
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a  class="nav-link active" href="<%= request.getContextPath() %>/notice/faqboard.do"><img src="<%= request.getContextPath() %>/image/button/tabby1.png"></a>
						<a  class="nav-link" href="<%= request.getContextPath() %>/CSboard/CS_list.do"><img src="<%= request.getContextPath() %>/image/button/tabby2.png"></a>
						<a  class="nav-link" href="<%= request.getContextPath() %>/notice/notice.do"><img src="<%= request.getContextPath() %>/image/button/tabby3.png"></a>
					</div>
				</nav>
		<!-- Herotop -->

		<!-- Side -->
		
		<div class="right-container">
			<c:if test="${login!=null && login.role=='admin'}">
				<div class="docctrl onlypc">
					<a href="<%=request.getContextPath()%>/notice/faqwrite.do"><img src="<%=request.getContextPath()%>/image/button/add.png"></a>
				</div>
			</c:if>
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>

		<!-- #container -->
		<div id="container" class="hbg-whitegray">

			<!-- Tab 내용 컨텐츠 박스 -->
			<div class="tab-content" id="nav-tabContent">

				<!-- 탭1 내용 -->
				<div class="tab-pane fade active show" id="nav-faq" role="tabpanel" aria-labelledby="nav-faq-tab">
					<div class="contents pagehead hbg-whitegray">
						<div class="container" id="featured-2">

							<!--  타이틀과 검색영억 -->
							<div class="pageinfo">
								<!-- 제목 영역 -->
								<div class="title onlypc">
									<a href="<%=request.getContextPath()%>/notice/faqboard.do"><h1>FAQ</h1></a>
								</div>

								<!-- 검색영역 : PC버전 -->
								<div class="row rightbox onlypc-inline">
									<!-- 검색창 -->
									<form name="frm2" action="<%=request.getContextPath()%>/notice/faqboard.do" method="post">
										<div class="search">
											<select name="searchType">
												<option value="title" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'title'}">selected</c:if>>제목</option>
												<option value="content" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'content'}">selected</c:if>>내용</option>
											</select>
											<input type="text" name="searchValue" placeholder="검색어를 입력해 주세요"<c:if test="${!empty searchVO.searchValue}">value="${searchVO.searchValue}"</c:if>>
											<input type="submit" value="검색">
										</div>
									</form>
								</div><!-- .rightbox onlypc-inline-->
								<!-- / 검색영역 -->
								
								<!-- 타블렛사이즈만 보이는 글쓰기 버튼 -->
								<c:if test="${login!=null && login.role=='admin'}">
									<div class="docctrl onlytablet" style="margin-top: 16px;">
										<a href="<%=request.getContextPath()%>/CSboard/faqwrite.do"><button class="w-100 bluebtn">
												<i class="fa-solid fa-plus"></i> &nbsp;글쓰기
											</button></a>
									</div>
								</c:if>
								<!-- / 타블렛사이즈만 보이는 글쓰기 버튼 -->
								
								<!-- 검색영역 : tablet사이즈 이하 버전 -->
								<div class="row rightbox onlytablet">
									<!-- 검색창 -->
									<form name="frm2" action="<%=request.getContextPath()%>/notice/faqboard.do" method="post">
										<div class="search">
											<select name="searchType">
												<option value="title" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'title'}">selected</c:if>>제목</option>
												<option value="content" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'content'}">selected</c:if>>내용</option>
											</select> 
											<input type="text" name="searchValue"  placeholder="검색어를 입력해 주세요" <c:if test="${!empty searchVO.searchValue}">value="${searchVO.searchValue}"</c:if>> 
											<input type="submit" value="검색">
										</div>
									</form>
								</div><!-- .rightbox onlytablet-->
								<!-- 검색영역 : tablet사이즈 이하 버전 -->

							</div><!-- .pageinfo -->
							<!-- / 타이틀과 검색영억 -->

							<!-- 리스트 박스 -->   <!-- 리스트 카드 hover effect 종류 참고 : https://codepen.io/vavik96/pen/MYdBKz -->
							<div class="clist">
							
								<!-- 리스트영역 -->
								<div class="row grid">
									<!-- faq 반복영역 -->
									<c:forEach items="${list}" var="vo">
									<div class="listcard" id="faqboard">
										<input type="hidden" id="fbidx" name="fbidx">
										<dl class="faq hbshadow3">
											
												<!-- 타이틀 -->
												<dt class="listtitle hfc-bold" id="title${vo.fbidx}">
													<label id="ti${vo.fbidx}">${vo.title}</label><span style="display: block; float: none;">▼</span>
												</dt>
												<!-- 내용펼치기 -->
												<dd class="listcontent hfc-medium" id="content${vo.fbidx}">
												<label id="co${vo.fbidx}" style='word-break: break-all;'>${fn:replace(vo.content, newLineChar, "<br/>")}</label>


												<c:if test="${login!=null && login.role=='admin'}">
													<br>
													<div class="btnarea">
														<button onclick="del('${vo.fbidx}')">
															<img src="<%=request.getContextPath()%>/image/button/delete.png">
														</button>
														<button id="modify" class="modify"  onclick="wmodify(${vo.fbidx})">
															<img src="<%=request.getContextPath()%>/image/button/edit.png">
														</button>
													</div>
												</c:if>

											</dd>
											
										</dl>
									</div>
									</c:forEach>
									<!-- / faq 반복영역 -->
									
								</div><!--/.row-->
								<!-- /리스트영역 -->

								<!-- 페이징 -->
								<div class="row pagenation">
									<div class="col d-flex justify-content-center">
										<c:if test="${pageMaker.prev == true}">
											<a class="hfc-gray hfc-bold" href="faqboard.do?page=${pageMaker.startPage-1}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}">◀</a>
										</c:if>
										<c:set var="index" value="1"/>
										<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"  var="idx" step="1">
											<c:choose>
												<c:when test="${searchVO.page == index}">
													<a class="hfc-white hfc-bold hbg-pink mx-1" href="faqboard.do?page=${idx}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue} ">${idx}</a>
												</c:when>
												<c:otherwise>
													<a class="hfc-gray hfc-bold mx-1" href="faqboard.do?page=${idx}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue} ">${idx}</a>
												</c:otherwise>
											</c:choose>
											<c:set var="index" value="${index+1}"/>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<a class="hfc-gray hfc-bold" href="faqboard.do?page=${pageMaker.endPage+1}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}">▶</a>
										</c:if>
									</div>
								</div>
								<!-- /페이징 -->

							</div><!-- /.clist -->
							<!-- / 리스트 박스 --> 

						</div><!-- /.container -->
					</div><!-- /.contents -->

				</div>
				<!-- / 탭1 내용 -->
				

			</div>
			<!-- / Tab 내용 컨텐츠 박스 -->





			<!-- banner --><%@include file="../banner.jsp"%>

		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
		
	</div><!-- /#wrap -->

<script>
$('.parallax-window').parallax({imageSrc: '<%= request.getContextPath() %>/image/picture/support.jpg'});
</script>

</body>
</html>
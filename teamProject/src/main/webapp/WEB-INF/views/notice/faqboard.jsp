<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page session="true" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>Insert title here</title>

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
<!-- CSS3 - 관련CSS를 여기에 연결해주세 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/관련.css" />

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
	
	
	//input 만들기
	function wmodify(index){
		$("dt").off('click');
		var mdf="";
		
		mdf += "제목쓰";
		mdf += "<input type='text' id='title'>";
		mdf += "<br>";

		$("#title"+index).html(mdf);
		
		mdf = "";
		mdf += "내용쓰";
		mdf += "<textarea id='content'>";
		mdf += "</textarea>";
		mdf += "<button type='button' onclick='fmodify("+index+")'>";
		mdf += "수정";
		mdf += "</button>";
		mdf += "<button type='button' onclick='cancel()'>";
		mdf += "취소쓰";
		mdf += "</button>";
		
		$("#content"+index).html(mdf);
		
	}
	//삭제
	function cancel(fbidx){
		$("#fbidx").val(fbidx);
		modalFn("정말 삭제하시겠습니까?","삭제하기","삭제","취소","cancelFn");
	}
	function cancelFn(){
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
					},1500);

				}else {
					modalFn("삭제 실패");
					setTimeout(function(){
					modalClose();
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
		
		mdf += "<span>▼</span>";
		mdf += title;
		
		$("#title"+index).html(mdf);
		
		mdf = "";
		mdf += content;
		mdf += '<br>';
		mdf += '<button type="button" id="modify" onclick="wmodify('+index+')">';
		mdf += '수정';
		mdf += '</button>'
		mdf += '<button onclick="cancel()">';
		mdf += '삭제';
		mdf += '</button>';
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

// faq DB
function modify(index){
	var title = $("#title").val();
	var content = $("#content").val();
	if (title.val() == ""){
		modalFn("제목을 입력해 주세요");
		setTimeout(function(){
		modalClose();
		},1000);
		//alert("제목을 입력하세요");
		title.focus();
		return ;			
	}else if (content.val() == ""){
		modalFn("내용을 입력해 주세요");
		setTimeout(function(){
		modalClose();
		},1000);
		//alert("내용을 입력하세요");
		content.focus();
		return ;
	}else (){}
	$.ajax({
		url: "faqmodify.do",
		type : 'POST',
		data : "fbidx="+index+"&title="+title+"&content="+content,
		success: function(result){
			if(result==1){
				modalFn("수정되었습니다");
				setTimeout(function(){
				modalClose();
				},1000);
			}
			else {
				modalFn(result + ", 에러!");
				setTimeout(function(){
				modalClose();
				},1000);
				//alert(result+", 에러!");
			}
			
		}
	});
};



	</script>
	
	<!-- 모달창 -->
<script type="text/javascript">

</script>

</head>
<body>
	<div id="wrap">
		<!-- Header --><%@include file="../Header.jsp"%>
		<!-- Nav --><%@include file="../Nav.jsp"%>
		
		<!-- Side -->
		<div class="right-container">
			<a href="#"><img src="<%= request.getContextPath() %>/image/button/top.png" class="gotop"></a>
		</div>
		
		<!-- container -->
		<div id="container" class="hbg-lightgray">

			<!-- content01 -->
			<div class="contents content01">
				<div class="container">
<!-- 본문 -->
<!-- 검색 -->
	<form method="get" action="faqboard.do">
			<select name="searchType">
				<option value="title" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'title'}">selected</c:if>>제목</option>
				<option value="contentWriter" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'contentWriter'}">selected</c:if>>내용+작성자</option>
			</select>
		<input type="text" name="searchValue" <c:if test="${!empty searchVO.searchValue}">value="${searchVO.searchValue}"</c:if>>
		<input type="submit" value="검색">
	</form>



<!-- faq 리스트 -->
<!-- <form id="form" action="delfaq.do" name="delfaq" method="get" > -->
<div class="container">
	<div id="faqboard">
		<input type="hidden" id="fbidx" name="fbidx">
	<!-- faq 영역 -->
	<dl class="faq" style="border:8px groove black; background-color:skyblue;">
 	
		<c:forEach items="${list}" var="vo">
			<!-- 타이틀 -->
			<dt style="font-size:3em" id="title${vo.fbidx}"><span>▼</span>${vo.title}</dt>
 			<!-- 내용펼치기 -->
			<dd style="margin-left:20px; border:8px groove black; background-color:lightpink; font-size:1.5em" id="content${vo.fbidx}">
  			${fn:replace(vo.content, newLineChar, "<br/>")}
  		
  		<c:if test="${login != null}">
  	
  		<br>
		<button type="button" id="modify" class="modify" onclick="wmodify(${vo.fbidx})" >테스트수정</button>
		<button onclick="cancel('${vo.fbidx}')">삭제쓰</button>
  		</c:if>
  			</dd>
		</c:forEach>
	</dl>
	</div>
</div>
<button class="bluebtn" type="button" onclick="location.href='faqwrite.do'">FAQ작성 </button>

<!--  검색 및 페이징 -->
<div>
		<c:if test="${pageMaker.prev == true} ">
			<a href="faqboard.do?page=${pageMaker.startPage-1}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}">이전</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" step="1">
    		<a href="faqboard.do?page=${idx}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue} ">${idx} </a>
    	</c:forEach>
    	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    		<a href="faqboard.do?page=${pageMaker.endPage+1}&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}">다음</a>
    	</c:if> 

</div>

<br><br>
		</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	</div><!-- /#wrap -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- jquery -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- css -->
<link href="<%=request.getContextPath()%>/css/howf.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/modal.css?ver0.1" rel="stylesheet">
<!-- kakao -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
	h1{
		font-size:1.5em;
		font-weight:bold; 
	}
	@media ( max-width : 980px) {
	#ind{
		display:none;
	}
}
</style>
<script>
var heartDup = false;

if(${heart!=null && heart==1}){
	var heartDup = true;
}
else {
	var heartDup = false;
}

</script>
</head>
<body>
<main>
	<!-- 글 제목 목록 -->
	<div id="ind" style="border:1px solid red;position:fixed;width:200px;right:0;top:200px;"></div>
	<div class="container">
		<div class="row">
			<div class="col">
				<a href="howfList.do">&lt;목록으로 돌아가기</a>
			</div>
		</div><!-- row end -->
		
		<!-- 썸네일 이미지 -->
		<div class="row">
			<div class="col d-flex justify-content-center">
				<c:if test="${howf.filename != null}">
					<img src="<%=request.getContextPath() %>/howf/displayFile.do?fileName=${howf.filename}" style="max-height:500px;width:100%;">
				</c:if>
			</div>
		</div>
		
		<!-- 카테고리, 작성일, 하트 -->
		<div class="row">
			<div class="col-lg-6 d-flex justify-content-start">
				<c:if test="${howf.cate=='숙박추천'}">
					<span style="background: #54ACA8; border-radius: 5px; color: white;">${howf.cate}</span>
				</c:if>
				<c:if test="${howf.cate=='여행지추천'}">
					<span style="background: #85A548; border-radius: 5px; color: white;">${howf.cate}</span>
				</c:if>
				<c:if test="${howf.cate=='맛집추천'}">
					<span style="background: #DE8889; border-radius: 5px; color: white;">${howf.cate}</span>
				</c:if>
				<span class="ms-1">${howf.wdate}</span>
			</div>
			<div class="col-lg-6 d-flex justify-content-end">
				<c:choose>
					<c:when test="${login != null}">
						<c:if test="${heart!=null && heart==1}">
							<img src="<%=request.getContextPath()%>/image/redheart.png" width="30" height="30" style="cursor:pointer;" id="heartBtn">
						</c:if>
						<c:if test="${heart!=null && heart==0}">
							<img src="<%=request.getContextPath()%>/image/heart.png" width="30" height="30" style="cursor:pointer;" id="heartBtn">
						</c:if>
					</c:when>
					<c:otherwise>
						<img src="<%=request.getContextPath()%>/image/redheart.png" width="30" height="30">
					</c:otherwise>
				</c:choose>
				<span class="ms-1" id="heartNum">${howf.heart}</span>
			</div>
		</div>
		
		<!-- 글 제목 -->
		<div class="row">
			<div class="col">
				${howf.title}
			</div>
		</div>
		
		<!-- 태그 -->
		<div class="row">
			<div class="col" id="tagArea">
				
			</div>
		</div>
		<hr class="my-2">
		
		<!-- 글 내용 -->
		<div class="row">
			<div class="col" id="howfContent">
				${howf.content}
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-6 d-flex justify-content-start">
				<c:if test="${login.role=='admin'}">
				<button onclick="delOk()">삭제</button>
				<button onclick="location.href='howfModify.do?hbidx=${howf.hbidx}'">수정</button>
				<button onclick="location.href='howfWrite.do'">글쓰기</button>
			</c:if>
			</div>
			<div class="col-lg-6 d-flex justify-content-end">
				<button onclick="shareSNS('facebook')">
					<img src="<%=request.getContextPath()%>/image/facebook.png" width="30" height="30" style="border-radius:5px;">
				</button>
				<button onclick="shareSNS('twitter')">
					<img src="<%=request.getContextPath()%>/image/twitter.png" width="30" height="30" style="border-radius:5px;">
				</button>
				<button onclick="shareSNS('kakao')" id="kakaoBtn">
					<img src="<%=request.getContextPath()%>/image/kakao.png" width="30" height="30" style="border-radius:5px;">
				</button>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<a href="howfList.do">&lt;목록으로 돌아가기</a>
			</div>
		</div><!-- row end -->
	</div><!-- container end -->
</main>

<!-- 글 삭제 모달 -->
<div id="modalDiv">
	<div id="popupDiv">
		<h1>게시글  삭제</h1>
		<p>정말로 게시글을 삭제하시겠습니까?</p>
		<p>삭제된 게시글은 복구가 되지 않습니다.</p>
		<button type="button" onclick="delFn('ok')">삭제하기</button>
		<button type="button" onclick="delFn('cancel')">취소</button>
	</div>
</div>

<script>
	$(function(){
		//태그 파싱
		var json = '${howf.tag}';
		var jsonParse = JSON.parse(json);
		var tags = "";
		$.each(jsonParse,function(idx){
			tags = tags+jsonParse[idx]["value"]+" ";
		})
		$("#tagArea").text(tags);
		
		//찜 버튼 이벤트
		$("#heartBtn").click(function(){
			var bidx = "${howf.hbidx}";
			
			if(heartDup == true){
				$.ajax({
					url:"heartDelete.do",
					type:"post",
					data:"type=howf&bidx="+bidx,
					success:function(data){
						if(data==1){
							heartDup = false;
							$("#heartBtn").attr("src","<%=request.getContextPath()%>/image/heart.png");
							var n = $("#heartNum").text();
							var heartNum = Number(n);
							$("#heartNum").text(heartNum-1);
							alert("찜 목록에서 제거되었습니다");
						}
					}
				});
			}
			else if(heartDup == false){
				$.ajax({
					url:"heartInsert.do",
					type:"post",
					data:"type=howf&bidx="+bidx,
					success:function(data){
						if(data==1){
							heartDup = true;
							$("#heartBtn").attr("src","<%=request.getContextPath()%>/image/redheart.png");
							var n = $("#heartNum").text();
							var heartNum = Number(n);
							$("#heartNum").text(heartNum+1);
							alert("찜 목록에 추가되었습니다");
						}
						else {
							alert("찜 목록 추가 오류입니다");
						}
					}
				});
			}
		});
		
		//h1 태그 가진 텍스트로 제목 만들기
		var titleIndex = [];
		var num = 0;
		if($("#howfContent h1").length == 0) $("#ind").css("display","none");
		else {
			$("#howfContent h1").each(function(i,e){
				var offset = $(this).offset();
				titleIndex[i] = offset.top;
				$("#ind").append("<p id='index"+num+"' style='cursor:pointer'>"+$(this).text()+"</p><br>");
				$("#index"+num).on("click",function(){
					$('html, body').animate({scrollTop : offset.top}, 200);
				});
				num++;
			});
			
			$(window).scroll(function(){
				var height = $(document).scrollTop();
				
				for(var i=0;i<titleIndex.length;i++){
					if(titleIndex[i]-10 <= height){
						$("#ind p").css("font-size","1em");
						$("#index"+i).css("font-size","1.5em");
					}
				}
			});
		}
		
		//사진 크기 조절
		$("img").each(function(index, item){
			$(item).css("max-width","100%");
			$(item).css("max-height",500);
		});
		
	});
	
	//글 삭제
	function delOk(){
		//모달창 띄우기
		$("#modalDiv").show();
	}
	
	function delFn(e){
		if(e == 'ok'){
			var hbidx = "${howf.hbidx}";
			$.ajax({
				url:"howfDelete.do",
				data:"hbidx="+hbidx,
				type:"post",
				success:function(data){
					if(data == 1){
						alert("글이 삭제되었습니다.");
						location.href="howfList.do";
					}
				}
			});
		}
		else if(e == 'cancel'){
			$("#modalDiv").hide();
		}
	}
	
	function shareSNS(sns){
		var thisUrl = document.URL;
		console.log(thisUrl);
		var snsTitle = "${howf.title}";
		if(sns=='facebook'){
			var url = "http://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(thisUrl);
	        window.open(url, "", "width=486, height=286");
		}
		else if(sns=='twitter'){
			var url = "http://twitter.com/share?url="+encodeURIComponent(thisUrl)+"&text="+encodeURIComponent(snsTitle);
	        window.open(url, "tweetPop", "width=486, height=286,scrollbars=yes");
		}
		else if(sns=='kakao'){
			Kakao.init('35c7c8bf307063859390df8e61188fbf');
			//Kakao.isInitialized();
			
			Kakao.Link.createDefaultButton({
				container:'#kakaoBtn',
				objectType:'feed',
				content:{
					title:'${howf.title}',
					description:'${howf.title}',
					imageUrl:thisUrl,
					link:{
						mobileWebUrl:thisUrl,
						webUrl:thisUrl
					}
				}
			});
		}
	}
</script>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
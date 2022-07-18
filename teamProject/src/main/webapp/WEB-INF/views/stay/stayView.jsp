<%@page import="edu.howf.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="edu.howf.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- 별점 css -->
<style>
.star-rating {
	  display:flex;
	  flex-direction: row-reverse;
	  font-size:1em;
	  justify-content:space-around;
	  padding:0 .2em;
	  text-align:center;
	  width:5em;
	}

	.star-rating input[type=radio] {
	  display:none;
	}

	.star-rating label {
	  color:#ccc;
	  cursor:pointer;
	}

	.star-rating :checked ~ label {
	  color:#f90;
	}

	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  color:#fc0;
	}
</style>
</head>
<body>
	<div class="wrap">
		<div class="container">
		
			<div class="row">
				<div class="col">
					<a href="stayList.do">&lt;목록으로 돌아가기</a>
				</div>
			</div>
		
			<div class="row">
				<div class="col-lg-6">
					<c:if test="${stay.photo != null}">
						<img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${fn:split(stay.photo,',')[0]}" style="max-width:200px" id="mainImage"><br>
						<c:forEach var="item" items="${fn:split(stay.photo,',')}">
							<img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${item}" style="max-width:100px;cursor:pointer;" onclick="photoChange('${item}')">
						</c:forEach>
					</c:if>
				</div>
				<div class="col-lg-6">
					<div class="col-lg-8 d-flex justify-content-start">
						${stay.name}
					</div>
					<div class="col-lg-4 d-flex justify-content-end">
						<img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">
						<span class="ms-1" id="stayStarArea">${stay.star}</span>
						<img src="<%=request.getContextPath()%>/image/redheart.png" width="30" height="30">
						<span class="ms-1">${stay.heart}</span>
					</div>
					<div class="col-lg-6">
						<div class="col-lg-12 d-flex justify-content-start">
							${stay.addr}
						</div>
					</div>
					<div class="col-lg-6" style="border:1px solid black">
						<p>간단정보</p>
						<p>${fn:split(stay.contents,',')[0]}</p>
					</div>
					<div class="col-lg-6" id="tagArea">
					</div>
				</div>
				
			</div>
			
			
			<!-- 객실안내, 숙소정보, 리뷰 탭 -->
			<div class="row">
				<div class="col">
					<button id="roomTabBtn" style="color:green">객실안내/예약</button>
					<button id="stayTabBtn">숙소정보</button>
					<button id="reviewTabBtn">리뷰</button>
				</div>
			</div>
			
			<c:set var="index" value="0" />
			<!-- 객실 안내/예약 -->
			<div class="row" id="roomTab">
				<c:forEach var="v" items="${stay.room}">
		    		<div class="col-sm-12 col-md-12 col-lg-4" >
				    	<div class="card shadow-sm">
							<c:if test="${v.photo != null}">
								<img class="card-img-top" src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${fn:split(v.photo,',')[0]}">
							</c:if>
							<div class="card-body">
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<span>${v.name}</span>
									</div>
									<small class="text-muted">
										<span>남은 객실 ${v.cnt}개</span>
									</small>
								</div>
								<div class="d-flex justify-content-start">
									<p>${v.price}</p>
								</div>
								<div class="d-flex justify-content-start">
									<button onclick="roomInfoFn('${index}')">객실 이용 안내</button>
								</div>
								<div class="d-flex justify-content-start">
									<button>예약하기</button>
								</div>
							</div><!-- card-body end -->
						</div>
					</div>
					
					<div class="col" style="display:none" id="roomInfoModal${index}">
						<div><button onclick="modalClose('${index}')">x</button></div>
			    		<p>객실 이용 안내</p>
			    		<hr>
			    		<p>기본 정보</p>
			    		<p>적정 인원 ${v.people}인</p>
			    		<p>객실+욕실/${v.square}평</p>
			    		<p>침대</p>
			    		<p>
			    		<c:if test="${v.sbed != 0}">
			    		<span>싱글베드 : ${v.sbed}개 </span>
			    		</c:if>
			    		<c:if test="${v.dbed != 0}">
			    		<span>더블베드 : ${v.dbed}개 </span>
			    		</c:if>
			    		<c:if test="${v.qbed != 0}">
			    		<span>퀸베드 : ${v.qbed}개 </span>
			    		</c:if>
			    		<c:if test="${v.kbed != 0}">
			    		<span>킹베드 : ${v.kbed}개 </span>
			    		</c:if>
			    		</p>
			    		<hr>
			    		<p>편의시설</p>
			    		<p>${v.tags}</p>
			    	</div>
			    	<c:set var="index"  value="${index+1}"/>
		    	</c:forEach>
			</div>
			
			
			<!-- 숙소정보 -->
			<div class="row" id="stayTab" style="display:none">
				<div class="col">
					<div>
						<p>주변정보</p>
						<!-- 아래 내용 꼭 div에 넣기. 안그럼 줄바꿈 안됨 -->
						<div>${fn:split(stay.contents,',')[1]}</div>
					</div>
					<div>
						<p>공지사항</p>
						<div>${fn:split(stay.contents,',')[2]}</div>
					</div>
					<div>
						<p>기본 정보</p>
						<div>${fn:split(stay.contents,',')[3]}</div>
					</div>
					<div>
						<p>현장 결제</p>
						<div>${fn:split(stay.contents,',')[4]}</div>
					</div>
					<div>
						<p>확인사항 및 기타</p>
						<div>${fn:split(stay.contents,',')[5]}</div>
					</div>
					<div>
						지도
					</div>
					<div>
						<p>편의시설 및 서비스</p>
						<c:forEach var="s" items="${fn:split(stay.services,',')}">
						<span style="border:1px solid black">${s}</span> 
						</c:forEach>
					</div>
				</div>
			</div>
			
			<!-- 리뷰 -->
			<div class="row" id="reviewTab" style="display:none">
				<div class="col">
					<p>리뷰</p>
					<div>
						<!-- 리뷰쓰기 창 -->
						<div style="border:1px solid black">
							<p>이 숙소 리뷰</p>
							<form id="reviewFrm" enctype="multipart/form-data">
								<textarea rows="3" cols="20" placeholder="댓글" name="content" id="reviewContent"></textarea>
								<div class="star-rating">
									<input type="radio" id="5-stars" name="star" value="5" checked/>
									<label for="5-stars" class="star">&#9733;</label>
									<input type="radio" id="4-stars" name="star" value="4" />
									<label for="4-stars" class="star">&#9733;</label>
									<input type="radio" id="3-stars" name="star" value="3"/>
									<label for="3-stars" class="star">&#9733;</label>
									<input type="radio" id="2-stars" name="star" value="2" />
									<label for="2-stars" class="star">&#9733;</label>
									<input type="radio" id="1-star" name="star" value="1" />
									<label for="1-star" class="star">&#9733;</label>
								</div>
								<input type="file" id="file" name="file">
								<input type="hidden" name="bidx" value="${stay.sidx}">
								<button type="button" id="reviewWriteBtn">리뷰 작성</button>
							</form>
						</div>
						
						<br>
						
						
						<!-- page 정보 -->
						<input type="hidden" id="page" value="${vo.page}">
						<!-- 리뷰 리스트 -->
						<div id="reviewList">
							<c:forEach var="i" items="${review}">
							<div style="border:1px solid black">
								<p>${i.nickname}</p>
								<p>
								<img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">
								${i.star}
								</p>
								<c:if test="${i.photo != null}">
								<p><img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName=${i.photo}" style="max-width:100px"></p>
								</c:if>
								<p>${i.content}</p>
							</div>
							</c:forEach>
						</div>
						
						
						<!-- 리뷰 페이징 -->
						<div id="reviewPaging">
							<c:if test="${pm.prev == true}">
								<a href="javascript:reviewPaging(${pm.startPage-1})">◀</a>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
								<a href="javascript:reviewPaging(${i})" class="mx-1">${i}</a>
							</c:forEach>
							<c:if test="${pm.next == true}">
								<a href="javascript:reviewPaging(${pm.endPage+1})">▶</a>
							</c:if>
						</div>
						
						
					</div>
				</div><!-- /리뷰 col -->
			</div><!-- /리뷰 row -->
			
			
			<!-- 삭제, 수정, 글쓰기 버튼 -->
			<div class="row">
				<div class="col">
					<c:if test="${login != null && (login.midx == stay.midx || login.role == 'admin')}">
					<button id="stayDeleteBtn">삭제</button>
					<button onclick="location.href='stayModfiy.do?sidx=${stay.sidx}'">수정</button>
					<button onclick="location.href='stayWrite.do'">글쓰기</button>
					</c:if>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col">
					<a href="stayList.do">&lt;목록으로 돌아가기</a>
				</div>
			</div>
			
		</div><!-- /container -->
	</div><!-- /wrap -->

<script>
	$(function(){
		//태그 파싱
		var json = '${stay.tag}';
		var jsonParse = JSON.parse(json);
		var tags = "";
		$.each(jsonParse,function(idx){
			tags = tags+jsonParse[idx]["value"]+" ";
		})
		$("#tagArea").text(tags);
		
		
		//tab 버튼 이벤트
		$("#roomTabBtn").on("click", function(){
			$("#roomTab").show();
			$("#stayTab").hide();
			$("#reviewTab").hide();
			
			$("#roomTabBtn").css("color","green");
			$("#stayTabBtn").css("color","black");
			$("#reviewTabBtn").css("color","black");
		});
		$("#stayTabBtn").on("click",function(){
			$("#roomTab").hide();
			$("#stayTab").show();
			$("#reviewTab").hide();
			
			$("#roomTabBtn").css("color","black");
			$("#stayTabBtn").css("color","green");
			$("#reviewTabBtn").css("color","black");
		});
		$("#reviewTabBtn").on("click",function(){
			$("#roomTab").hide();
			$("#stayTab").hide();
			$("#reviewTab").show();
			
			$("#roomTabBtn").css("color","black");
			$("#stayTabBtn").css("color","black");
			$("#reviewTabBtn").css("color","green");
		});
		
		
		//리뷰쓰기
		$("#reviewWriteBtn").on("click",function(){
			var login = '<%= (UserVO)session.getAttribute("login") %>';
			if(login == "null"){
				alert("로그인이 필요합니다");
				return;
			}
			else {
				//유효성 검사
				if($("#reviewContent").val()==""){
					alert("리뷰 내용을 작성해 주세요");
					return;
				}
				
				//리뷰 작성 ajax
				var formData = new FormData($("#reviewFrm")[0]);
				$.ajax({
					url:"reviewWrite.do",
					data:formData,
					type:"post",
					cache:false,
					contentType:false,
					processData:false,
					success:function(data){
						if(data==1){
							alert("글이 작성되었습니다");
							
							//리뷰 리스트 불러오기
							$.ajax({
								url:"reviewSelect.do",
								data:"bidx=${stay.sidx}&page=1",
								type:"post",
								success:function(list){
									//그려주기
									var html = '';
									for(var i=0;i<list.length;i++){
										html = html + '<div style="border:1px solid black">'
											+ '<p>'+list[i].nickname+'</p>'
											+ '<p><img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">'
											+ list[i].star+'</p>';
											
										if(list[i].photo != null){
											html = html+'<p><img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName='+list[i].photo+'" style="max-width:100px"></p>';
										}
											
										html = html + '<p>'+list[i].content+'</p>'
											+ '</div>';
										
										$("#reviewList").html(html);
									}
									
									//리뷰 페이징
									$.ajax({
										url:"reviewPaging.do",
										data:"bidx=${stay.sidx}",
										type:"post",
										success:function(paging){
											//페이징 만들기
											var p = '';
											
											if(paging.prev == true){
												p = p + '<a href="javascript:reviewPaging('+(paging.startPage-1)+')">◀</a>';
											}
											
											for(var i=paging.startPage;i<=paging.endPage;i++){
												p = p + '<a href="javascript:reviewPaging('+i+')" class="mx-1">'+i+'</a>';
											}
											
											if(paging.next == true){
												p = p + '<a href="javascript:reviewPaging('+(paging.endPage+1)+')">▶</a>';
											}
											
											$("#reviewPaging").html(p);
											
											//별점 변경
											$.ajax({
												url:"stayStar.do",
												data:"bidx=${stay.sidx}",
												type:"post",
												success:function(star){
													$("#stayStarArea").html(star.toFixed(1));
												}
											});
											
										}
									});//페이징 ajax
									
								}
							});//리스트 ajax
							
						}
					}
				});//리뷰쓰기 ajax
				
			}
		});//리뷰쓰기 function
		
		
		//숙박 정보 삭제
		$("#stayDeleteBtn").on("click",function(){
			var check = confirm("정말로 숙박정보를 삭제하시겠습니가?");
			
			if(check == false) return;
			else if(check == true){
				var sidx = "${stay.sidx}";
				$.ajax({
					url:"stayDelete.do",
					data:"sidx="+sidx,
					type:"post",
					success:function(data){
						if(data == 1){
							alert("글이 삭제되었습니다");
							location.href="stayList.do";
						}
					}
				});
			}
		});//숙박 정보 삭제
		
	});
	
	//객실이용 안내 보이기
	function roomInfoFn(index){
		$("#roomInfoModal"+index).show();
	}
	//객실 이용 안내 닫기
	function modalClose(index){
		$("#roomInfoModal"+index).hide();
	}
	
	//리뷰 페이지 이동
	function reviewPaging(index){
		$.ajax({
			url:"reviewSelect.do",
			data:"bidx=${stay.sidx}&page="+index,
			type:"post",
			success:function(list){
				$("#page").val(index);
				
				//그려주기
				var html = '';
				for(var i=0;i<list.length;i++){
					html = html + '<div style="border:1px solid black">'
						+ '<p>'+list[i].nickname+'</p>'
						+ '<p><img src="<%=request.getContextPath()%>/image/star.png" width="30" height="30">'
						+ list[i].star+'</p>';
						
					if(list[i].photo != null){
						html = html+'<p><img src="<%=request.getContextPath() %>/stay/displayFile.do?fileName='+list[i].photo+'" style="max-width:100px"></p>';
					}
						
					html = html + '<p>'+list[i].content+'</p>'
						+ '</div>';
					
					$("#reviewList").html(html);
				}
			}
		});
	}
	
	//사진 누르면 큰 사진 바꾸기
	function photoChange(photo){
		$("#mainImage").attr("src","<%=request.getContextPath() %>/stay/displayFile.do?fileName="+photo);
	}
	
</script>



<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
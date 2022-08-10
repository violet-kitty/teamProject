<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>지역이벤트</title>

<!-- jQuery --><script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap5 최신 CSS & JS (Popper.js 포함됨) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Slick Slider -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- Bootstrap5 AwsomeFont -->
<script src="https://kit.fontawesome.com/a54851838a.js" crossorigin="anonymous"></script>
<!-- summernote -->
<script src="<%= request.getContextPath() %>/js/summernote-ko-KR.js"></script>
<script src="<%= request.getContextPath() %>/js/summernote-lite.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/summernote-lite.css">
<!-- tagify -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header2 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header2.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - banner --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/banner.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Board공용세팅 --> <link  rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<!-- CSS3 - BoardWrite공용세팅 --> <link rel="stylesheet" href="<%=request.getContextPath()%>/css/boardWrite.css">

</head>

<body>
	<div id="wrap" class="boardWrite event eventWrite">
	
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
					<a class=" onlypc" href="eventList.do">
						<div class="backto">
							<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
						</div>
					</a>

					<!-- 폼 시작 -->
					
					<form method="post" enctype="multipart/form-data" id="frm">
						<!-- 파일 첨부, 이미지 미리보기 -->
						<div class="row imgThumbView">
							<div class="col">
								<div id="imageAttach">
								    <img class="attachimg1" src="<%=request.getContextPath()%>/image/null/attach.png">
									<img class="attachimg2" src="<%=request.getContextPath()%>/image/null/mattach.png">
								</div>
								<input type="file" name="file" id="file">
								<div id="imageArea">
									<img id="image">
								</div>
							</div>
						</div><!-- row end -->
						
						<!-- 이벤트 주최기간 -->
						<div class="row  h-input">
							<div class="col-lg-2">
								<p>이벤트 주최 기간</p>
							</div>
							<div class="col-lg-10 d-flex">
								<input type="date" class="form-control me-3" id="startday" name="startday" placeholder="시작 날짜">
								<p>~</p>
								<input type="date" class="form-control ms-3" id="endday" name="endday" placeholder="종료 날짜">
							</div>
						</div><!-- /row -->
						
						<!-- 카테고리 선택, 제목 입력 -->
						<div class="row h-input ">
							<div class="col-lg-2">
								<select class="form-control form-select2" name="state" id="state" onchange="visible(this)">
									<option selected>도 선택</option>
									<option value="서울특별시">서울특별시</option>
									<option value="인천광역시">인천광역시</option>
									<option value="경기도">경기도</option>
									<option value="강원도">강원도</option>
									<option value="충청북도">충청북도</option>
									<option value="충청남도">충청남도</option>
									<option value="세종시">세종시</option>
									<option value="대전광역시">대전광역시</option>
									<option value="전라북도">전라북도</option>
									<option value="전라남도">전라남도</option>
									<option value="광주광역시">광주광역시</option>
									<option value="경상북도">경상북도</option>
									<option value="대구광역시">대구광역시</option>
									<option value="경상남도">경상남도</option>
									<option value="울산광역시">울산광역시</option>
									<option value="부산광역시">부산광역시</option>
									<option value="제주도">제주도</option>
								</select>
							</div>
							<div class="col-lg-2">
								<select class="form-control form-select3" name="city" id="city">
									<option selected>시 선택</option>
								</select>
							</div>
							<div class="col-lg-8">
								<input class="form-control textinput2" type="text" name="title" id="title" placeholder="제목을 작성해주세요">
							</div>
						</div><!-- row end -->
						
						
						
						<!-- 태그 입력 -->
						<div class="row h-input">
							<div class="col custom">
								<p>태그를 나열해주세요. &#13;&#10;&#35;과 &#44;를 이용해 태그를 작성할 수 있습니다</p>
								<input class="form-control tagcon" name="tag" id="tag" size="40">
							</div>
						</div><!-- row end -->
						
				
						
						<!-- 에디터 -->
						<div class="row h-input">
							<div class="col">
								<textarea id="summernote" name="content"></textarea>
							</div>
						</div><!-- row end -->
						
					<!-- /.clist -->
					</form>
					<hr class="lastline">
				
					
					<!-- 목록으로 돌아가기, 글 작성 버튼 -->
						<div class="row buttonarea">
							<div class="col-lg-6">
								<a class=" onlypc" href="eventList.do">
									<div class="backto lastbackto">
										<span class="line tLine"></span> <span class="line mLine"></span> <span class="label"><span class="arrow">◀</span> 돌아가기</span> <span class="line bLine"></span>
									</div>
								</a>
							</div>
							<div class="col-lg-6 okbutton">
								<button type="button" class="bluebtn" onclick="writeFn()">글 작성 완료</button>
							</div>
						</div><!-- row end -->
					<!-- 리스트 카드 -->
					
					
		
					
				</div><!-- /.container -->
			</div><!-- /.contents -->
			<!-- /pagehead -->
			
			<!-- banner --><%@include file="../banner.jsp"%>
			
		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="../Footer.jsp"%>
	
	</div><!-- /#wrap -->
<script>
	//에디터
	$(function(){
		$("#summernote").summernote({
			height:300,
			minHeight:null,
			maxHeight:null,
			focus:true,
			lang:"ko-KR",
			placeholder:"최대 2000자까지 쓸 수 있습니다.&#13;&#10;제목1로 지정한 텍스트는 제목 목록에 표시됩니다.",
			toolbar: [
				['style',['style']],
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			styleTags: ['h1']
		});
		
		//tagify
		var input = document.querySelector("#tag");
		new Tagify(input);
		
		//파일 첨부(썸네일)
		$("#imageAttach").click(function(){
			$("#file").click();
		});
		
		$("#image").click(function(){
			$("#file").click();
		});
		
		//썸네일 이미지 미리보기
		$("#file").on("change",upload);
		
		function upload(e){
			console.log("file name : ",e.value);
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;//이미지 확장자만 받음
			
			filesArr.forEach(function(f){
				if(!f.type.match(reg)){
					modalFn("이미지 파일만 등록 가능합니다.");
					setTimeout(function(){
						modalClose();
					},1000);
					//alert("이미지 파일만 등록 가능합니다");
					return;
				}
				
				sel_file = f;
				
				var reader = new FileReader();
				$("#imageAttach").css("display","none");
				$("#imageArea").css("display","block");
				reader.onload = function(e){
					$("#image").attr("src",e.target.result);//이미지 변경
				}
				reader.readAsDataURL(f);
			});
		}
		
		//종료일이 시작일보다 빠르지 않게
		$("#startday").on("change",function(){
			var startday = $("#startday").val();
			$("#endday").attr("min",startday);
		});
		//시작일이 종료일보다 나중이 되지 않게
		$("#endday").on("change",function(){
			var endday = $("#endday").val();
			$("#startday").attr("max",endday);
		});
		
	});
	
	//select 박스 수정
	function visible(select){
		var s1 = ["서울특별시"];
		var s2 = ["인천광역시"];
		var s3 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","연천군","양평군","가평군"];
		var s4 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","철원군","화천군","양구군","고성군","인제군","양양군","홍천군","횡성군","평창군","정선군","영월군"];
		var s5 = ["제천시","청주시","충주시","진천군","음성군","단양군","증평군","괴산군","청원군","보은군","옥천군","영동군"];
		var s6 = ["계룡시","공주시","논산시","당진시","보령시","서산시","아산시","천안시","태안군","예산군","홍성군","청양군","서천군","부여군","금산군"];
		var s7 = ["세종시"];
		var s8 = ["대전광역시"];
		var s9 = ["군산시","김제시","남원시","익산시","전주시","정읍시","완주군","진안군","무주군","부안군","장수군","고창군","순창군","임실군"];
		var s10 = ["광양시","나주시","목포시","순천시","여수시","영광군","장성군","담양군","곡성군","구례군","함평군","화순군","신안군","무안군","영암군","보성군","진도군","해남군","완도군","장흥군","고흥군","강진군"];
		var s11 = ["광주광역시"];
		var s12 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","봉화군","울진군","예천군","영양군","영덕군","청송군","의성군","군위군","칠곡군","성주군","고령군","청도군","청송군"];
		var s13 = ["대구광역시"];
		var s14 = ["거제시","김해시","밀양시","사천시","양산시","진주시","창원시","통영시","거창군","함양군","합천군","창녕군","산청군","의령군","하동군","함안군","고성군","남해군"];
		var s15 = ["울산광역시"];
		var s16 = ["부산광역시"];
		var s17 = ["제주도","서귀포시"];
		var target = document.getElementById("city");
		var s;
		
		switch(select.value){
		case '서울특별시':
			s = s1;
			break;
		case '인천광역시':
			s = s2;
			break;
		case '경기도':
			s = s3;
			break;
		case '강원도':
			s = s4;
			break;
		case '충청북도':
			s = s5;
			break;
		case '충청남도':
			s = s6;
			break;
		case '세종시':
			s = s7;
			break;
		case '대전광역시':
			s = s8;
			break;
		case '전라북도':
			s = s9;
			break;
		case '전라남도':
			s = s10;
			break;
		case '광주광역시':
			s = s11;
			break;
		case '경상북도':
			s = s12;
			break;
		case '대구광역시':
			s = s13;
			break;
		case '경상남도':
			s = s14;
			break;
		case '울산광역시':
			s = s15;
			break;
		case '부산광역시':
			s = s16;
			break;
		case '제주도':
			s = s17;
			break;
		}
		target.options.length = 0;
		
		for(x in s){
			var option = document.createElement("option");
			option.value = s[x];
			option.innerHTML = s[x];
			target.appendChild(option);
		}
	}
	
	function writeFn(){
		var title = $("#title");
		var content = $("#summernote");
		var tag = $("#tag");
		var file = $("#file");
		var startday = $("#startday");
		var endday = $("#endday");
		var state = $("#state");
		var city = $("#city");
		
		if(title.val()==""){
			modalFn("제목을 입력해주세요");
			setTimeout(function(){
				modalClose();
			},1000);
			//alert("제목을 입력해 주세요");
			title.focus();
			return;
		}
		else if(startday.val()==""){
			modalFn("시작 날짜를 입력해 주세요");
			setTimeout(function(){
				modalClose();
			},1000);
			//alert("시작 날짜를 입력해 주세요");
			return;
		}
		else if(endday.val()==""){
			modalFn("종료 날짜를 입력해 주세요");
			setTimeout(function(){
				modalClose();
			},1000);
			//alert("종료 날짜를 입력해 주세요");
			return;
		}
		else if(state.val()==""){
			modalFn("도를 선택해 주세요");
			setTimeout(function(){
				modalClose();
			},1000);
			//alert("도를 선택해 주세요");
			state.focus();
			return;
		}
		else if(city.val()==""){
			modalFn("시를 선택해 주세요");
			setTimeout(function(){
				modalClose();
			},1000);
			//alert("시를 선택해 주세요");
			city.focus();
			return;
		}
		else if(tag.val()==""){
			modalFn("태그를 입력해 주세요");
			setTimeout(function(){
				modalClose();
			},1000);
			//alert("태그를 입력해 주세요");
			tag.focus();
			return;
		}
		else if(file.val()==""){
			modalFn("썸네일을 등록해 주세요");
			setTimeout(function(){
				modalClose();
			},1000);
			//alert("썸네일을 등록해 주세요");
			return;
		}
		else if(content.val()==""){
			modalFn("내용을 입력해 주세요");
			setTimeout(function(){
				modalClose();
			},1000);
			//alert("내용을 입력해 주세요");
			content.focus();
			return;
		}
		else {
			$("#frm").submit();
		}
	}
</script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
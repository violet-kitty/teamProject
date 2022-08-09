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

<!-- 이미지 자르기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.js"></script>

<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>

<style>
	/* 프로필 이미지 */
	img {
		width:100%;
	}
 	.cropper-crop-box, .cropper-view-box {
	    border-radius: 50%;
	}
	
	.cropper-view-box {
	    box-shadow: 0 0 0 1px #39f;
	    outline: 0;
	}
	#roundImg{
		border-radius: 50%;
	}
</style>
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
					
					<!-- 페이지 제목 -->
					<div class="title">
						<h1>프로필 이미지 수정</h1>
					</div>
					
					<!-- 정보 확인 -->
					<div class="row">
						<div class="col">
							
							<!-- 프로필 이미지 -->
							<div>
								<input type="file" name="file" id="file">
								
								<div>
									<!-- 프로필 사진 -->
									<c:choose>
									
									<c:when test="${profile.img == null}">
										<div id="profileAlt" style="border-radius:50%;width:200px;height:200px;">
											<img src="<%=request.getContextPath()%>/image/null/null_thumbnail.png" style="border-radius:50%;width:200px;height:200px;">
										</div>
										<img src="" id="profileImg" style="display:none">
									</c:when>
									
									<c:otherwise>
										<img src="<%= request.getContextPath() %>/mypage/displayFile.do?fileName=${profile.img}" id="profileImg">
									</c:otherwise>
									</c:choose>
								</div>
								
								<!-- 잘린 사진 미리보기 -->
								<div id="roundImg" class="roundImg"></div>
								
							</div>
						</div>
					</div>
					
					
					<!-- 수정 버튼 -->
					<div class="row">
						<div class="col">
							<button onclick="profileModify()">이미지 수정</button>
							<button>취소</button>
						</div>
					</div>
					
				
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->


		</div><!-- / #container -->
		
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
	
<script>
	var cropper;
	
	$(function(){
		//이미지 미리보기
		$("#file").on("change",upload);
		
		function upload(e){
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
				$("#profileAlt").css("display","none");
				$("#profileImg").css("display","block");
				reader.onload = function(e){
					$("#profileImg").attr("src",e.target.result);//이미지 변경
				}
				reader.readAsDataURL(f);
			});
			
			setTimeout(function(){
				//프로필 이미지
				var img = document.getElementById('profileImg');
				
				//preview css
				var imgWidth = $("#profileImg").width();
				var imgHeight = $("#profileImg").height();
				
				$("#roundImg").css({
					overflow:'hidden',
					height:imgHeight,
				});
				
				cropper = new Cropper(img, {
					aspectRatio: 1/1,
					viewMode:1,
					zoomable:false,
					preview:'.roundImg'
				});
			},100);
		}
	});
	
	//수정 버튼 눌렀을때
	function profileModify(){
		var file = $("#file").val();
		
		if(file == ""){
			modalFn("사진이 등록되지 않았습니다. 사진을 등록해 주세요.");
			setTimeout(function(){
				modalClose();
			},1500);
			return;
		}
		else {
			console.log(cropper.getCroppedCanvas());
			cropper.getCroppedCanvas().toBlob(function (blob) {
				var formData = new FormData();
				
				formData.append('profileImg', blob, 'profile.png');
				
				//이미지 넘기기
				$.ajax('profileImg.do', {
					method:"post",
					data:formData,
					processData:false,
					contentType:false,
					success:function(data){
						if(data == 1){
							modalFn("프로필이 수정되었습니다.");
							setTimeout(function(){
								modalClose();
								location.href="myInfo.do";
							},1000);
						}
					}
				});
			});
		}
	}
	
</script>	
	
</body>
</html>
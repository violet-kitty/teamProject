<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
<!-- 우편 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- tagify -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />


<!-- CSS3 - Theme --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/theme.css" />
<!-- CSS3 - Header --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css" />
<!-- CSS3 - Nav --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Nav.css" />
<!-- CSS3 - Side --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Side.css" />
<!-- CSS3 - Footer --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css" />
<!-- CSS3 - Home --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
<style>
	input::-webkit-inner-spin-button {
	  appearance: none;
	  -moz-appearance: none;
	  -webkit-appearance: none;
	}
</style>
<script>
//객실 관련 변수들
var index = 0;
var tagi = 0;
</script>
</head>
<body>
	<div id="wrap">
		<div id="container">
			<div class="row">
				<div class="col">
					<a href="stayList.do">&lt;목록으로 돌아가기</a>
				</div>
			</div>
			
						
			<form method="post"  enctype="multipart/form-data" id="stayFrm">
				<div class="row">
					<div class="col">
						<input class="form-control" type="text" name="name" id="name" placeholder="숙소 이름">
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-6">
						<input class="form-control" type="text" name="addr" id="addr" placeholder="숙소 주소" readOnly>
						<input type="button" onclick="addrFn()" value="주소 찾기">
					</div>
					<div class="col-lg-6">
						<input class="form-control" type="text" name="detailaddr" id="detailaddr" placeholder="숙소 상세 주소">
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<textarea class="form-control" name="content" id="content" placeholder="간단한 설명을 해주세요"></textarea>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<p>태그를 나열해주세요&#13;&#10;&#35;과 &#44;를 이용해 태그를 작성할 수 있습니다</p>
						<input class="form-control" name="tag" id="tag">
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<input type="file" id="btnAtt" name="btnAtt" multiple="multiple">
					</div>
				</div>
				
				<hr class="my-1">
				
				<!-- 사진 미리보기 -->
				<div class="row" style="min-height:150px;height:auto;">
					<div class="col">
						<div id="att_zone">
							
						</div>
					</div>
				</div>
				
				<hr class="my-1">
				
				<div class="row">
					<div class="col">
						<button  type="button" onclick="tabToggleFn('room')" id="roomTabBtn" style="color:green">객실</button>
						<button type="button" onclick="tabToggleFn('stay')" id="stayTabBtn">숙소정보</button>
					</div>
				</div>
				
				<div class="row" id="roomInfoBtn">
					<div class="col">
						<button type="button" id="roomAdd">객실 추가</button>
						<button type="button" id="roomRemove">객실 제거</button>
					</div>
				</div>
				
				<div id="roomArea">
					
				</div>
				
			
				<!-- 숙소정보 -->
				<div class="row" style="display:none" id="stayInfoTab">
					<div class="col">
						<div>
							<p>주변정보</p>
							<textarea id="con1" name="content" class="form-control"></textarea>
						</div>
						<div>
							<p>기본정보</p>
							<textarea id="con2" name="content" class="form-control"></textarea>
						</div>
						<div>
							<p>공지사항</p>
							<textarea id="con3" name="content" class="form-control"></textarea>
						</div>
						<div>
							<p>취소 및 환불규정</p>
							<textarea id="con4" name="content" class="form-control"></textarea>
						</div>
						<div>
							<p>확인사항 및 기타</p>
							<textarea id="con5" name="content" class="form-control"></textarea>
						</div>
						<hr>
						<div>
							<p>편의시설 및 서비스</p>
							<div>
								<div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="편의점">
						        	<label class="form-check-label" for="tag">편의점</label>
						        </div>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="커피숍">
						        	<label class="form-check-label" for="tag">커피숍</label>
						        </div>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="주차장">
						        	<label class="form-check-label" for="tag">주차장</label>
						        </div>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="골프장">
						        	<label class="form-check-label" for="tag">골프장</label>
						        </div>
						        <br>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="수영장">
						        	<label class="form-check-label" for="tag">수영장</label>
						        </div>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="족구장">
						        	<label class="form-check-label" for="tag">족구장</label>
						        </div>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="농구장">
						        	<label class="form-check-label" for="tag">농구장</label>
						        </div>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="실내낚시터">
						        	<label class="form-check-label" for="tag">실내낚시터</label>
						        </div>
						        <br>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="산책로">
						        	<label class="form-check-label" for="tag">산책로</label>
						        </div>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="익스트림체험장">
						        	<label class="form-check-label" for="tag">익스트림체험장</label>
						        </div>
						         <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="세차장">
						        	<label class="form-check-label" for="tag">세차장</label>
						        </div>
						        <div class="form-check form-check-inline">
						        	<input class="form-check-input" type="checkbox" name="service" id="tag" value="키드존">
						        	<label class="form-check-label" for="tag">키드존</label>
						        </div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div>
							<button type="button" onclick="stayWriteFn()">등록</button>
						</div>
					</div>
				</div>
				
			</form>
			
			
			<hr class="my-2">
			
			
			<div class="row">
				<div class="col">
					<a href="stayList.do">&lt;목록으로 돌아가기</a>
				</div>
			</div>
			
		</div><!-- /#container -->
	</div><!-- /#wrap -->
	
	<script>
	//이미지 미리보기
	( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
			  imageView = function imageView(att_zone, btn){

			    var attZone = document.getElementById(att_zone);
			    var btnAtt = document.getElementById(btn)
			    var sel_files = [];
			    
			    // 이미지와 체크 박스를 감싸고 있는 div 속성
			    var div_style = 'display:inline-block;position:relative;'
			                  + 'width:150px;height:120px;margin:5px;border:1px solid black;z-index:1';
			    // 미리보기 이미지 속성
			    var img_style = 'width:100%;height:100%;z-index:none';
			    // 이미지안에 표시되는 삭제 버튼의 속성
			    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
			                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
			  
			    btnAtt.onchange = function(e){
			    $("#att_zone").empty();
			      var files = e.target.files;
			      var fileArr = Array.prototype.slice.call(files)
			      for(f of fileArr){
			        imageLoader(f);
			      }
			    }
			    
			    /*첨부된 이미지들을 배열에 넣고 미리보기 */
			    imageLoader = function(file){
			      sel_files.push(file);
			      var reader = new FileReader();
			      reader.onload = function(ee){
			        let img = document.createElement('img')
			        img.setAttribute('style', img_style)
			        img.src = ee.target.result;
			        attZone.appendChild(makeDiv(img, file));
			      }
			      
			      reader.readAsDataURL(file);
			    }
			    
			    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
			    makeDiv = function(img, file){
			      var div = document.createElement('div')
			      div.setAttribute('style', div_style)
			      
			      var btn = document.createElement('input')
			      btn.setAttribute('type', 'button')
			      btn.setAttribute('value', 'x')
			      btn.setAttribute('delFile', file.name);
			      btn.setAttribute('style', chk_style);
			      btn.onclick = function(ev){
			        var ele = ev.srcElement;
			        var delFile = ele.getAttribute('delFile');
			        for(var i=0 ;i<sel_files.length; i++){
			          if(delFile== sel_files[i].name){
			            sel_files.splice(i, 1);      
			          }
			        }
			        
			        dt = new DataTransfer();
			        for(f in sel_files) {
			          var file = sel_files[f];
			          dt.items.add(file);
			        }
			        btnAtt.files = dt.files;
			        var p = ele.parentNode;
			        attZone.removeChild(p)
			      }
			      div.appendChild(img)
			      div.appendChild(btn)
			      return div
			    }
			  }
			)('att_zone', 'btnAtt')//이미지 미리보기
			
		$(function(){
			//객실 추가
			$("#roomAdd").click(function(){
				var html = '<div class="room" id="room'+index+'">'
				+ '<div class="row g-4 py-5 row-cols-1 row-cols-lg-3">'
				+ '<div class="feature col">'
				+ '<input type="text" id="name'+index+'" name="room['+index+'].name" placeholder="객실명"><br>'
				+ '<span>총 객실 평수</span>'
				+ '<button type="button" id="squareMinus'+index+'">-</button>'
				+ '<input type="number" name="room['+index+'].square" id="square'+index+'" min="1" max="99" value="1">'
				+ '<button type="button" id="squarePlus'+index+'">+</button><br>'
				+ '<span>싱글베드</span>'
				+ '<button type="button" id="sbedMinus'+index+'">-</button>'
				+ '<input type="number" name="room['+index+'].sbed" id="sbed'+index+'" min="0" max="99" value="0">'
				+ '<button type="button" id="sbedPlus'+index+'">+</button><br>'
				+ '<span>더블베드</span>'
				+ '<button type="button" id="dbedMinus'+index+'">-</button>'
				+ '<input type="number" name="room['+index+'].dbed" id="dbed'+index+'" min="0" max="99" value="0">'
				+ '<button type="button" id="dbedPlus'+index+'">+</button><br>'
				+ '<span>퀸베드</span>'
				+ '<button type="button" id="qbedMinus'+index+'">-</button>'
				+ '<input type="number" name="room['+index+'].qbed" id="qbed'+index+'" min="0" max="99" value="0">'
				+ '<button type="button" id="qbedPlus'+index+'">+</button><br>'
				+ '<span>킹베드</span>'
				+ '<button type="button" id="kbedMinus'+index+'">-</button>'
				+ '<input type="number" name="room['+index+'].kbed" id="kbed'+index+'" min="0" max="99" value="0">'
				+ '<button type="button" id="kbedPlus'+index+'">+</button><br>'
				+ '</div>'
				
				
				+ '<div class="feature col">'
				+ '<span>같은 형식 객실 수</span>'
				+ '<button type="button" id="cntMinus'+index+'">-</button>'
				+ '<input type="number" name="room['+index+'].cnt" id="cnt'+index+'" min="1" max="99" value="1">'
				+ '<button type="button" id="cntPlus'+index+'">+</button><br>'
				+ '<span>적정 인원 수</span>'
				+ '<button type="button" id="peopleMinus'+index+'">-</button>'
				+ '<input type="number" name="room['+index+'].people" id="people'+index+'" min="1" max="99" value="1">'
				+ '<button type="button" id="peoplePlus'+index+'">+</button><br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+tagi+'" value="원룸">'
				+ '<label class="form-check-label" for="tag'+tagi+'">원룸</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+1)+'" value="분리형원룸">'
				+ '<label class="form-check-label" for="tag'+(tagi+1)+'">분리형원룸</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+2)+'" value="투룸">'
				+ '<label class="form-check-label" for="tag'+(tagi+2)+'">투룸</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+3)+'" value="쓰리룸">'
				+ '<label class="form-check-label" for="tag'+(tagi+3)+'">쓰리룸</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+4)+'" value="포룸">'
				+ '<label class="form-check-label" for="tag'+(tagi+4)+'">포룸</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+5)+'" value="방5개이상">'
				+ '<label class="form-check-label" for="tag'+(tagi+5)+'">방5개이상</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+6)+'" value="주방/식당">'
				+ '<label class="form-check-label" for="tag'+(tagi+6)+'">주방/식당</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+7)+'" value="욕실">'
				+ '<label class="form-check-label" for="tag'+(tagi+7)+'">욕실</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+8)+'" value="욕조">'
				+ '<label class="form-check-label" for="tag'+(tagi+8)+'">욕조</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+9)+'" value="욕실용품">'
				+ '<label class="form-check-label" for="tag'+(tagi+9)+'">욕실용품</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+10)+'" value="드라이기">'
				+ '<label class="form-check-label" for="tag'+(tagi+10)+'">드라이기</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+11)+'" value="에어컨">'
				+ '<label class="form-check-label" for="tag'+(tagi+11)+'">에어컨</label>'
				+ '</div>'
				+ '</div>'
				
				
				+ '<div class="feature col">'
				+ '<span>가격</span>'
				+ '<input type="number" name="room['+index+'].price" id="price'+index+'"><br>'
				+ '<input type="file" id="roomFile'+index+'" name="roomFile"><br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+12)+'" value="전자렌지">'
				+ '<label class="form-check-label" for="tag'+(tagi+12)+'">전자렌지</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+13)+'" value="밥솥">'
				+ '<label class="form-check-label" for="tag'+(tagi+13)+'">밥솥</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+14)+'" value="세탁기">'
				+ '<label class="form-check-label" for="tag'+(tagi+14)+'">세탁기</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+15)+'" value="건조기">'
				+ '<label class="form-check-label" for="tag'+(tagi+15)+'">건조기</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+16)+'" value="반려동물가능">'
				+ '<label class="form-check-label" for="tag'+(tagi+16)+'">반려동물가능</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+17)+'" value="주차장">'
				+ '<label class="form-check-label" for="tag'+(tagi+17)+'">주차장</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+18)+'" value="와이파이">'
				+ '<label class="form-check-label" for="tag'+(tagi+18)+'">와이파이</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+19)+'" value="무료주차장">'
				+ '<label class="form-check-label" for="tag'+(tagi+19)+'">무료주차장</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+20)+'" value="BBQ">'
				+ '<label class="form-check-label" for="tag'+(tagi+20)+'">BBQ</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+21)+'" value="라운지">'
				+ '<label class="form-check-label" for="tag'+(tagi+21)+'">라운지</label>'
				+ '</div>'
				+ '<br>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+22)+'" value="엘레베이터">'
				+ '<label class="form-check-label" for="tag'+(tagi+22)+'">엘레베이터</label>'
				+ '</div>'
				+ '<div class="form-check form-check-inline">'
				+ '<input class="form-check-input" type="checkbox" name="room['+index+'].tag" id="tag'+(tagi+23)+'" value="수영장">'
				+ '<label class="form-check-label" for="tag'+(tagi+23)+'">수영장</label>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
				+ '</div>';
				
				$("#roomArea").append(html);
				
				//바꿔주기
				tagi = tagi+24;
				index++;
				
				var ind = index;
				
				//-,+ 버튼에 이벤트 주기
				$(document).on("click","#squareMinus"+(ind-1), function(){
					if($("#square"+(ind-1)).val()==1){
						$("#square"+(ind-1)).val("1");
					}
					else {
						$("#square"+(ind-1)).val(Number($("#square"+(ind-1)).val())-1);
					}
				});
				$(document).on("click","#squarePlus"+(ind-1), function(){
					$("#square"+(ind-1)).val(Number($("#square"+(ind-1)).val())+1);
				});
				
				$(document).on("click","#sbedMinus"+(ind-1), function(){
					if($("#sbed"+(ind-1)).val()==0){
						$("#sbed"+(ind-1)).val("0");
					}
					else {
						$("#sbed"+(ind-1)).val(Number($("#sbed"+(ind-1)).val())-1);
					}
				});
				$(document).on("click","#sbedPlus"+(ind-1), function(){
					$("#sbed"+(ind-1)).val(Number($("#sbed"+(ind-1)).val())+1);
				});
				
				$(document).on("click","#dbedMinus"+(ind-1), function(){
					if($("#dbed"+(ind-1)).val()==0){
						$("#dbed"+(ind-1)).val("0");
					}
					else {
						$("#dbed"+(ind-1)).val(Number($("#dbed"+(ind-1)).val())-1);
					}
				});
				$(document).on("click","#dbedPlus"+(ind-1), function(){
					$("#dbed"+(ind-1)).val(Number($("#dbed"+(ind-1)).val())+1);
				});
				
				$(document).on("click","#qbedMinus"+(ind-1), function(){
					if($("#qbed"+(ind-1)).val()==0){
						$("#qbed"+(ind-1)).val("0");
					}
					else {
						$("#qbed"+(ind-1)).val(Number($("#qbed"+(ind-1)).val())-1);
					}
				});
				$(document).on("click","#qbedPlus"+(ind-1), function(){
					$("#qbed"+(ind-1)).val(Number($("#qbed"+(ind-1)).val())+1);
				});
				
				$(document).on("click","#kbedMinus"+(ind-1), function(){
					if($("#kbed"+(ind-1)).val()==0){
						$("#kbed"+(ind-1)).val("0");
					}
					else {
						$("#kbed"+(ind-1)).val(Number($("#kbed"+(ind-1)).val())-1);
					}
				});
				$(document).on("click","#kbedPlus"+(ind-1), function(){
					$("#kbed"+(ind-1)).val(Number($("#kbed"+(ind-1)).val())+1);
				});
				
				$(document).on("click","#cntMinus"+(ind-1), function(){
					if($("#cnt"+(ind-1)).val()==1){
						$("#cnt"+(ind-1)).val("1");
					}
					else {
						$("#cnt"+(ind-1)).val(Number($("#cnt"+(ind-1)).val())-1);
					}
				});
				$(document).on("click","#cntPlus"+(ind-1), function(){
					$("#cnt"+(ind-1)).val(Number($("#cnt"+(ind-1)).val())+1);
				});
				
				$(document).on("click","#peopleMinus"+(ind-1), function(){
					if($("#people"+(ind-1)).val()==1){
						$("#people"+(ind-1)).val("1");
					}
					else {
						$("#people"+(ind-1)).val(Number($("#people"+(ind-1)).val())-1);
					}
				});
				$(document).on("click","#peoplePlus"+(ind-1), function(){
					$("#people"+(ind-1)).val(Number($("#people"+(ind-1)).val())+1);
				});
			});//객실 추가
			
			//객실 제거
			$("#roomRemove").click(function(){
				//인덱스 조정
				if(index != 0){
					index = index - 1;
					tagi = tagi - 24;
				}
				
				//room+index div 없애기
				$("#room"+index).remove();
			});//객실 제거
			
			
			//tagify
			var input = document.querySelector("#tag");
			new Tagify(input);
			
			//textarea 특수문자 제한
			$("textarea").keyup(function(){
				var value = $(this).val();
				var arr_char = new Array();
				
				arr_char.push("'");
				arr_char.push("\"");
				arr_char.push("<");
				arr_char.push(">");
				arr_char.push(",");
				
				for(var i=0 ; i<arr_char.length ; i++)
				{
					if(value.indexOf(arr_char[i]) != -1)
					{
						modalFn("< > , ' \" 특수문자는 사용하실 수 없습니다.");
						setTimeout(function(){
							modalClose();
						},1000);
						//window.alert("< > , ' \" 특수문자는 사용하실 수 없습니다.");
						value = value.substr(0, value.indexOf(arr_char[i]));
						$(this).val(value);
					}
				}
			});//특수문자 제한
			
			
		});
		
		
		//숙박 등록
		function stayWriteFn(){
			//유효성 체크
			//숙박시설
			var name = $("#name");
			var addr = $("#addr");
			var detailaddr = $("#detailaddr");
			var tag = $("#tag");
			var photo = $("#btnAtt");
			
			if(name.val()==""){
				modalFn("시설 이름을 입력해 주세요");
				setTimeout(function(){
					modalClose();
				},1000);
				//alert("시설 이름을 입력해 주세요");
				name.focus();
				return;
			}
			else if(addr.val()==""){
				modalFn("주소를 입력해 주세요");
				setTimeout(function(){
					modalClose();
				},1000);
				//alert("주소를 입력해 주세요");
				addr.focus();
				return;
			}
			else if(detailaddr.val()==""){
				modalFn("상세주소를 입력해 주세요");
				setTimeout(function(){
					modalClose();
				},1000);
				//alert("상세주소를 입력해 주세요");
				detailaddr.focus();
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
			else if(photo.val()==""){
				modalFn("숙소 사진을 등록해 주세요");
				setTimeout(function(){
					modalClose();
				},1000);
				//alert("숙소 사진을 등록해 주세요");
				return;
			}
			else {
				var con = false;
				//content 유효성 검사
				//간단 설명, 주변정보, 기본정보, 공지사항, 환불규정, 확인사항
				$("textarea[name=content]").each(function(index, item){
					var content = $(item);
					if(content.val()==""){
						modalFn("내용을 입력해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("내용을 입력해 주세요");
						
						//숙소정보 탭에 있는 content라면 탭 변경
						if(index>0) tabToggleFn('stay');
						
						content.focus();
						con = true;
						return false;
					}//if val==""
				});//content 유효성 검사
				if(con == true) return;
				
				
				//객실 등록 여부 확인
				if(index == 0){
					modalFn("객실이 적어도 하나는 등록되어야 합니다.");
					setTimeout(function(){
						modalClose();
					},1000);
					//alert("객실이 적어도 하나는 등록되어야 합니다");
					tabToggleFn('room');
					return;
				}
				
				//객실
				tabToggleFn('room');
				
				for(var i=0;i<index;i++){
					var rname = $("#name"+i);
					var rsquare = $("#square"+i);
					var sbed = $("#sbed"+i);
					var dbed = $("#dbed"+i);
					var qbed = $("#qbed"+i);
					var kbed = $("#kbed"+i);
					var rcnt = $("#cnt"+i);
					var rpeople = $("#people"+i);
					var rprice = $("#price"+i);
					var roomFile = $("#roomFile"+i);
					
					if(rname.val()==""){
						modalFn("객실 이름을 등록해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("객실 이름을 등록해 주세요");
						rname.focus();
						return;
					}
					else if(rsquare.val()==""){
						modalFn("객실 평수를 입력해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("객실 평수를 입력해 주세요");
						rsquare.focus();
						return;
					}
					else if(Number(rsquare.val())<1){
						modalFn("객실 평수는 0이나 음수가 될 수 없습니다.");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("객실 평수는 0이나 음수가 될 수 없습니다");
						rsquare.focus();
						return;
					}
					else if(sbed.val()==""){
						modalFn("싱글베드 수를 입력해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("싱글베드 수를 입력해 주세요");
						sbed.focus();
						return;
					}
					else if(dbed.val()==""){
						modalFn("더블베드 수를 입력해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("더블베드 수를 입력해 주세요");
						dbed.focus();
						return;
					}
					else if(qbed.val()==""){
						modalFn("퀸베드 수를 입력해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("퀸베드 수를 입력해 주세요");
						qbed.focus();
						return;
					}
					else if(kbed.val()==""){
						modalFn("킹베드 수를 입력해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("킹베드 수를 입력해 주세요");
						kbed.focus();
						return;
					}
					else if(Number(sbed.val())<0 || Number(dbed.val())<0 || Number(qbed.val())<0 || Number(kbed.val())<0){
						modalFn("침대 수는 음수가 될 수 없습니다.");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("침대 수는 음수가 될 수 없습니다");
						sbed.focus();
						return;
					}
					else if(rcnt.val()==""){
						modalFn("같은 형식의 객실 수를 입력해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("같은 형식의 객실 수를 입력해 주세요");
						rcnt.focus();
						return;
					}
					else if(Number(rcnt.val())<1){
						modalFn("객실 수는 0이나 음수가 될 수 없습니다.");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("객실 수는 0이나 음수가 될 수 없습니다");
						rcnt.focus();
						return;
					}
					else if(rpeople.val()==""){
						modalFn("적정 인원 수를 입력해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("적정 인원 수를 입력해 주세요");
						rpeople.focus();
						return;
					}
					else if(Number(rpeople.val())<1){
						modalFn("인원 수는 0이나 음수가 될 수 없습니다.");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("인원 수는 0이나 음수가 될 수 없습니다");
						rpeople.focus();
						return;
					}
					else if(rprice.val()==""){
						modalFn("가격을 입력해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("가격을 입력해 주세요");
						rprice.focus();
						return;
					}
					else if(Number(rprice.val())<0){
						modalFn("가격은 음수가 될 수 없습니다.");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("가격은 음수가 될 수 없습니다");
						rprice.focus();
						return;
					}
					else if(roomFile.val()==""){
						modalFn("객실 사진을 등록해 주세요");
						setTimeout(function(){
							modalClose();
						},1000);
						//alert("객실 사진을 등록해 주세요");
						return;
					}
				}
			}//content, 객실 유효성 검사
			
			//전부다 통과하면 submit
			$("#stayFrm").submit();
			
		}//숙박 등록
	
		//주소 입력 api
		function addrFn() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("addr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailaddr").focus();
	            }
	        }).open();
	    }
		
		//탭 눌렀을때 화면 변화
		function tabToggleFn(type){
			if(type == 'room'){
				$("#roomTabBtn").css("color","green");
				$("#stayTabBtn").css("color","black");
				$("#roomInfoBtn").show();
				$("#roomArea").show();
				$("#stayInfoTab").hide();
			}
			else if(type == 'stay'){
				$("#roomTabBtn").css("color","black");
				$("#stayTabBtn").css("color","green");
				$("#roomInfoBtn").hide();
				$("#roomArea").hide();
				$("#stayInfoTab").show();
			}
			
		}
	</script>
	
</body>
</html>
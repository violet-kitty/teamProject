<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>	<!-- true에 되어있어야 EL을 이용해서 세션에 접근이 가능함 -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%= request.getContextPath() %>/image/logo/pin.png" type="image/x-icon">
<title>1:1 고객문의 글 상세페이지</title>
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
<!-- CSS3 - 관련CSS를 여기에 연결해주세요 --> <link rel="stylesheet" href="<%= request.getContextPath() %>/css/csBoard/CS_list.css" />
<!-- 모달 js --><script type="text/javascript" src="<%= request.getContextPath() %>/js/modal.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- 모달예제 
		<button onclick="modalex()">모달예제</button>
		<script>
		function modalex(){
		
			/* modalex("모달이 완료되었습니다");
		      setTimeout(function(){
		         modalClose();
		      },3000); */
		      modalFn("모달이 완료되었습니다." ,"닫기","알림창");
			
		}
		</script>
		-->
		
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
					<div class="row">
						<div class="col">
							<a href="<%=request.getContextPath()%>/home.do" class="a_logo">
								<img src="<%=request.getContextPath()%>/image/logo/logo.png">
							</a>
							<div class="div_header">
								<h3>1:1 문의 게시글</h3>
							</div>
							<br><br>
							<c:if test="${login != null }">
								<div class="div_userInfo"><span class="span_userInfo">${login.nickname}</span> 로그인 중 (등급 : <span class="span_userInfo">${login.role}</span>)</div>
								<div class="div_logout"><a href="<%=request.getContextPath()%>/user/logout.do" class="a_logout">로그아웃</a></div>
							</c:if>
							<br>
							<hr>	
							<br>
							<br>
							<br>
							<div class="div1">	
								<table class="tb1">
									<tbody>
										<tr>
											<td class="tb_category">글번호</td>
											<td>${cv.csbidx}</td>
											<td class="tb_category">문의유형</td>
											<td>${cv.divsn}</td>
											<td class="tb_category">작성자</td>
											<td>${cv.nickname}</td>					
											<td class="tb_category">작성일</td>
											<td>${cv.wdate}</td>
											<td class="tb_category">조회수</td>
											<td>${cv.cnt}</td>					
										</tr>
										<tr>
											<td class="tb_category" style="border-top: 2px solid black;">제목</td>
											<td class="tb_title" colspan="9">${cv.title}</td>
										</tr>
										<tr>
											<td class="tb_category tb_content">내용</td>
											<td colspan="9" class="tb_content tb_content_fill">${cv.content}</td>				
										</tr>
									<c:if test="${cv.filename != null}">
										<tr>
											<td class="tb_category td_file">이미지 첨부 파일</td>
											<td colspan="9" class="tb_filename td_file"><a href="displayFile.do?fileName=${cv.filename}&down=1"><img id="img" src="displayFile.do?fileName=${cv.filename}"></a></td>
										</tr>
									</c:if>
									</tbody>
								</table>
								<div class="div2">
									<c:if test="${login.role == 'admin' && cvr == null}">
										<input id="reply_btn" type="button" value="답변" class="btn1" onclick="location.href='CS_replyWrite.do?csbidx=${cv.csbidx}'">
									</c:if>
										<input type="button" value="목록" onclick="location.href='CS_list.do'" class="btn2">
									<c:if test="${login.midx == cv.midx || login.role == 'admin'}">				
										<input type="button" value="수정" onclick="location.href='cs_listModify.do?csbidx=${cv.csbidx}'" class="btn2">
										<input type="button" id="delete" value="삭제" class="btn2">
									</c:if>
								</div>
							</div>
							<br><br>
							<c:if test="${cvr != null}">
								<div class="replies">
									<table class="tb2">
										<tbody>
											<tr>
												<td class="reply_category reply_category_title" colspan="6">답변 내용</td>
											</tr>				
											<tr>
												<td class="reply_category">작성자 </td>
												<td>${cvr.nickname}</td>
												<td class="reply_category">제목</td>
												<td>${cvr.title}</td>
												<td class="reply_category">작성일</td>
												<td>${cvr.wdate}</td>
											</tr>
											<tr>
												<td class="reply_category" style="border-top: 2px solid #27c6be; border-bottom: 2px solid #27c6be;">내용</td>
												<td class="reply_content" colspan="5">${cvr.content}</td>
											</tr>
											<c:if test="${login.midx == cvr.midx || login.role == 'admin'}">
												<tr>
													<td class="btn_td" colspan="6">
														<div class="div_btn">					
															<input type="button" value="삭제" class="btn3" id="reply_delete">
															<input type="button" value="수정" class="btn3" onclick="location.href='CS_replyModify.do?csbidx=${cvr.csbidx}'">
														</div>
													</td>									
												</tr>	
											</c:if>		
										</tbody>
									</table>
								</div>
							</c:if>							
						</div>
					</div>
				</div><!-- /.container -->
			</div>
			<!-- / .content01 -->
		</div><!-- / #container -->
		<!-- Footer --><%@include file="/WEB-INF/views/Footer.jsp"%>
	</div><!-- /#wrap -->
<script>
	$(function(){	
		
		$("#delete").click(function(){
			if(!confirm("삭제하시면 복구할 수 없습니다. \n\n정말로 삭제하시겠습니까?")){				
				return false;
			}
			else{
				 location.href = "CS_delete.do?origincsbidx=${cv.origincsbidx}";
			}			
		});
		
		$("#reply_delete").click(function(){
			if(!confirm("정말로 삭제하시겠습니까?")){
				return false;				
			}
			else{
				location.href = "CS_replyDelete.do?csbidx=${cvr.csbidx}&origincsbidx=${cvr.origincsbidx}";								 
			}			
		});
		
	});
</script>
</body>
</html>
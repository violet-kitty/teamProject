<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- banner -->
<div id="carouselExampleDark" class="banner carousel carousel-dark slide" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target=#carouselExampleDark data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<
	<div class="carousel-inner" id="news">
		<div id="ca0" class="carousel-item active" data-bs-interval="3000">
			<div id="img0" class="imgset" style="background-image: url(<%=request.getContextPath()%>/image/picture/picture3.jpg);"></div>
			<a id="ha0">
				<div class="carousel-caption d-md-block">
					<div class="captionset">
						<h5 id="h0" class="hfc-white hfc-bold"></h5>
						<p id="p0" class="hfc-semibold hfc-green"></p>
					</div>
				</div>
			</a>
		</div>
		<div id="ca1" class="carousel-item" data-bs-interval="3000">
			<div id="img1" class="imgset" style="background-image: url(<%=request.getContextPath()%>/image/picture/picture3.jpg);"></div>
			<a id="ha1">
				<div class="carousel-caption d-md-block">
					<div class="captionset">
						<h5 id="h1" class="hfc-white hfc-bold"></h5>
						<p id="p1" class="hfc-semibold hfc-green"></p>
					</div>
				</div>
			</a>
		</div>
		<div id="ca2" class="carousel-item" data-bs-interval="3000">
			<div id="img2" class="imgset" style="background-image: url(<%=request.getContextPath()%>/image/picture/picture3.jpg);"></div>
			<a id="ha2">
				<div class="carousel-caption d-md-block">
					<div class="captionset">
						<h5 id="h2" class="hfc-white hfc-bold"></h5>
						<p id="p2" class="hfc-semibold hfc-green"></p>
					</div>
				</div>
			</a>
		</div>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
	</button>
</div>
<!-- /banner -->

<script>
	$(function(){
		$.ajax({
			url:"<%= request.getContextPath() %>/event/eventHero.do",
			success:function(eventHero){
				var ehi = 0;
				for(var eh of eventHero){
					$("#img"+ehi).css({"background":"url(<%=request.getContextPath() %>/event/displayFile.do?fileName="+eh.filename+")"});
					$("#h"+ehi).text(eh.title);
					$("#p"+ehi).text(eh.startday+" ~ "+eh.endday);
					$("#ha"+ehi).attr("href", "<%=request.getContextPath()%>/event/eventView.do?ebidx="+eh.ebidx) ;
					
					ehi +=1;
				}
			}
		});
	});
</script>

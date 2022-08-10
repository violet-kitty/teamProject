<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!--Search -->
<!-- 검색창 -->
<form name="frm2" action="howfList.do" method="post">
<div class="search">
	<select name="searchType">
		<option value="total" selected>전체</option>
		<option value="title">제목 검색</option>
		<option value="tag">태그 검색</option>
		<option value="writer">작성자 검색</option>
		
	</select> 
	<input type="text" name="searchValue" value="${search.searchValue}" placeholder="방방곡곡 주최하는 이벤트에 참여하고 다양한 추억을 쌓아요!">
	<input type="submit" value="검색">
</div>
</form>
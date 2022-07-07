<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="noticewrite.do" method="post" enctype="multipart/form-data">
<table>
 <tr>
  <td>

   <table>
    <tr>
     <td>공지사항</td>
    </tr>
   </table>

   <table>
   
    <tr>
    	<td>제목</td>
    	<td><input name="title" size="50" maxlength="100"></td>
    </tr>
    <tr>
    	<td>내용</td>
    	<td><textarea name="content" cols="50" rows="13"></textarea></td>
    </tr>
    
   </table>
   
		<input type="file" name="fileupload" />
   <table>
    <tr>
     <td><button>저장</button></td>
     <td><a href="notice.do">취소</a></td>
    </tr>
   </table>

  </td>
 </tr>
</table>
</form>
</body>
</html>
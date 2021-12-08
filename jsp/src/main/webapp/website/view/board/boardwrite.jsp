<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%@include file = "../header.jsp" %>
		<div class = "container">
			<form action="../../controller/boardwritecontroller.jsp" method="post" enctype="multipart/form-data">
			<!-- form 전송 데이터 기본타입 : text (stirng) : application/x-www-form-urlencoded -->
				제목:<input type ="text" name="title">
				내용:<textarea rows="10" cols="20" name="contents"></textarea>
				첨부파일: <input type="file" name="file"><br>
				첨부파일2: <input type="file" name="file2"><br>
				<input type ="submit" value="등 록"> 
			
			</form>
		
		</div>

</body>
</html>
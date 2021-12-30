<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp" %>
	<div class="container">
		<div class ="row">
		<div class ="form-control">
			<label for="title">Title:</label>
				<input type="text" class="form-control" placeholder="title" id="title" name="title">
			</div>
				<label for="content">Content : </label>
				<textarea class="form-control" rows="5" id="summernote" name="content"></textarea>
		</div>
		
	</div>
		
		
		
	
	
</body>
</html>
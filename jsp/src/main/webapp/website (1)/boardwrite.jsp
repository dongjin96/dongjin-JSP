<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@include file="header.jsp" %>

	<div class="container">
		<div class="row">
			<div class="offset-1 col-md-10 offset-1">
				<input type="text" placeholder="제목" class="form-control my-1">
				<textarea rows="20" placeholder="내용" name="contents" class="form-control my-1"></textarea> 
				<div class="offset-11 my-1">
					<button class="btn btn-success">등록</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<%@include file="footer.jsp"%>

</body>
</html>
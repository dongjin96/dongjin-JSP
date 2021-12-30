<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<title>Insert title here</title>
</head>
<body>

	<%@include file="header.jsp" %>
	
	<div class="container">
		<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" data-interval="2000">
		 <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="img/메인1.png" >
		    </div>
		    <div class="carousel-item">
		      <img src="img/메인2.jpg">
		    </div>
		    <div class="carousel-item">
		      <img src="img/메인3.jpg" >
		    </div>
		  </div>
		</div>
	</div>
	
	<%@include file="footer.jsp" %>

</body>
</html>
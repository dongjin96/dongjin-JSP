
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹사이트</title>
</head>
<body>
	<%@include file ="header.jsp" %>
	<!-- 캐러셀 start -->
	<div id="carouselcontent" class="carousel slide" data-ride="carousel" data-interval="2000">
		<ol class="carousel-indicators">
			<li data-target="#carouselcontent" data-slide-to="0" class="active"></li>
			<li data-target="#carouselcontent" data-slide-to="1"></li>
			<li data-target="#carouselcontent" data-slide-to="2"></li>
			<li data-target="#carouselcontent" data-slide-to="3"></li>
			<li data-target="#carouselcontent" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class ="carousel-item active"><img  src=""></div>
			<div class ="carousel-item active"><img  src=""></div>
			<div class ="carousel-item active"><img  src=""></div>
			
		</div>
		<!-- 케러셀 이미지 이동 버튼 -->
		<a class="carousel-control-prev" href="#carouselcontent" data-slide="prov">
			<span class="carousel-control-prev-icon"></span>
		</a>
		<a class="carousel-control-next" href="#carouselcontent" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<!-- 케러셀 end -->
		<!-- 제품 목록 -->
	<div class="container">
		<div class="row">
			<%
				ArrayList<Product> products = ProductDao.getProductDao().getproductlist(null,null);
				for( Product product : products ){
			%>
			<div class="col-md-4">
				<div class="card" >
					<a href="product/productview.jsp?p_num=<%=product.getP_num()%>">
						<img class="card-img-top pimg" src="../upload/<%=product.getP_img()%>">
					</a> 
					<div class="card-body">
						<p class="card-text"> <h4><%=product.getP_name()%></h4>
						<hr>
						<p class="item">
							<%=product.getP_contents()%> <br><br>
							<span class="price"> <%=product.getP_price() %> 원 </span> <br>
							<span class="badge badge-pill badge-danger"> <%=product.getactive()%> </span>
						</p>
					</div>
				</div>
			</div>
			<% } %>
		</div>
	</div>
	
	
	<!-- 제품 목록 end -->
	<%@include file = "footer.jsp" %>

</body>
</html>
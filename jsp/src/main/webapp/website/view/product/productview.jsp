<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//제품 상페이지 ==게시물 보기
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		Product product = ProductDao.getProductDao().getproduct(p_num);
	%>
	<%@include file = "../header.jsp" %>
	
	<div class="container"><!-- 박스권 -->
		<div class="row"><!-- 가로배치 -->
			<div class="col-md-6" >
				<img alt="" src="../../upload<%=product.getP_img()%>" style="max-width=100%;">
			</div>
			
			<div class="col-md-6">
			<input type="hidden" class="p_num" name="p_num" value="<%=p_num%>" id="p_num">
			<p><%=product.getP_manufacturer() %></p>
			<h4><%=product.getP_name() %></h4>
				
				<div class="row">
					<div class="col-md-3">구매 혜택</div>
					<div class="col-md-9">포인트1%제공</div>
				</div><br>
			
				<div class="row">
					<div class="col-md-3">배송 정보</div>
					<div class="col-md-9">영업일 기준 1~3일(휴일제외)</div>
				</div>
			<hr>
				<div class="row">
					<div class="col-md-3">가격</div>
					<div class="col-md-9"><%=product.getprice() %> 원</div>
				</div><br>
				<hr>
					<div class="row">
						<div class="col-md-3"> 제품 사이즈 </div>
						<div class="col-md-9"> 
							<select id="p_size" name="p_size" class="form-control">
							<option value="0">옵션 선택</option>
							<option value="L">L</option>
							<option value="M">M</option>
							<option value="S">S</option>
					</select>
			</div>
		</div>
		<hr>
				<div class="row">
					<div class="col-md-3">수량</div>
					<div class="col-md-9 row no-gutters"> <!-- no-gutters 여백이나 마진을 없앤다 -->
					  
								<button class="btn btn-outline-secondary" 
								onclick="pchange('p' , <%=product.getP_stock() %> , <%=product.getP_price() %>)" > + </button>
								
								<div class="col-md-2">
									<input class="form-control"
									 type="text" id="pcount" value="1" name="p_count" onchange="pchange('s' , <%=product.getP_stock()%>  , <%=product.getP_price() %>  )">
								</div>
								
								<button class="btn btn-outline-secondary" 
								onclick="pchange('m' , <%=product.getP_stock()%>  , <%=product.getP_price() %> )"> - </button>
					</div>
				</div>
				<hr>
				
			   <div class="row">
					<div class="col-md-3">총상품 금액</div>
					<div class="col-md-9 text-right">
						<span id="total"><%=product.getP_price() %></span> 원
					
					</div>
				</div>
				<hr>
				<div>
					<button class="form-control bg-success text-white" style="font-size:1.5rem">구매하기</button>
				</div>
				<div class="row my-3"> <!-- my : 마진[바깥여백] y[세로] -->
					<div class="col-md-6">
						<button class="form-control" onclick="cartadd()">장바구니</button>
					</div>
					<div class="col-md-6">
						<%
						int m_num=0;
						if(login !=null)m_num  =login.getM_num();
						if(ProductDao.getProductDao().plikecheck(p_num, m_num)){%>
						
							<button class="form-control" id="btnplike"
							onclick="plike( <%=p_num%> , <%=m_num%> )">찜하기♥
							</button>
						<%}else{ %> <!-- 좋아요가존재하지않으면 -->
					
						
							<button class="form-control" id="btnplike"
							onclick="plike( <%=p_num%> , <%=m_num%> )">찜하기♡
							</button>
						<%} %>
					</div>
			</div>
			</div>
	</div>
	<br><br>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<ul class="navbar-nav col-md-12 text-center">
			<li class="nav-item col-md-3"><a href="#detail" class="nav-link pview"> 상품상세</a></li>
			<li class="nav-item col-md-3"><a href="#guide" class="nav-link pview"> 상품가이드</a></li>
			<li class="nav-item col-md-3"><a href="#review" class="nav-link pview"> 상품리뷰</a></li>
			<li class="nav-item col-md-3"><a href="#qna" class="nav-link pview"> 상품문의</a></li>
		</ul>
	
	</nav>
	<div id="detail">
		상세위치<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div id="guide">
		상품가이드위치<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div id="review">
		상품리뷰위치<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div id="qna">
		상품문의<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
</div><!-- container end -->
</body>
</html>
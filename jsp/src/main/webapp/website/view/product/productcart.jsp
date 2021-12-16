<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="dto.Login"%>
<%@page import="dto.Cart"%>
<%@page import="java.util.ArrayList"%>
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
	<%
	 // 세션 자료형은/클래스는 object 이므로 형변환을 시켜야한다
	String sname="cart"+login.getM_id();
	ArrayList<Cart> carts = (ArrayList<Cart>)session.getAttribute(sname);
	int totalprice=0; //총금액
	//java 천단위 쉼표 클래스
	DecimalFormat decimalFormat = new DecimalFormat("###,###");

	%>
	<div class="container">
	
	
		<h3 style="board-button: solid 1px #eeeee;">장바구니</h3>
		<table class="table">
			<tr>
				<th> 이미지 </th> <th> 상품 정보 </th> <th> 수량 </th> <th> 가격 </th> <th> 비고 </th>
			</tr>
			<%	if( carts == null ){ %>
				<tr>
				<td colspan="5" class="text-center"> 장바구니에 상품이 없습니다. </td>
				</tr>
			<%
			}else{
			    int i=0;// 반복 인덱스 변수
				for( Cart cart : carts){ 
				Product product = ProductDao.getProductDao().getproduct(cart.getP_num()); // 제품번호에 해당 하는 제품정보
				System.out.print( cart.getP_size());
				totalprice += cart.getP_count()*product.getP_price(); //카트내 제품 누적 합계[제품수량*제품가격]
			%>
			
			<tr>
				<td width="10%" class="align-middle"><img src="../../upload/<%=product.getP_img()%>" style="max-width: 100%;"></td>
				<td width="30%"> 
					<div class="px-1">
						( <%=product.getP_manufacturer() %> ) <%=product.getP_name() %>
					</div> 
					<hr>
					<div class="px-1" style="font-size: 12px;">
						옵션 :<%=cart.getP_size()%>
					</div>
				</td>
				<td class="row no-gutters">
					<div class="col-md-9 row no-gutters"> <!-- no-gutters 여백이나 마진을 없앤다 -->
						
						<button class="btn btn-outline-secondary" 
						onclick="pchange2(<%=i %>,'p' , <%=product.getP_stock() %> , <%=product.getP_price() %>)" > + </button>
						
						<div class="col-md-2">
							<input class="form-control"
							type="text" id="pcount<%=i %>" value=<%=cart.getP_count() %> name="p_count"
						 onchange="pchange2(<%=i %>,'s' , <%=product.getP_stock()%>  , <%=product.getP_price() %>  )">
						</div>
						
						<button class="btn btn-outline-secondary" 
						onclick="pchange2(<%=i %>,'m' , <%=product.getP_stock()%>  , <%=product.getP_price() %> )"> - </button>
					</div>
				</td>
				<td width="15%" class="align-middle" id="total<%=i %>"> <%=product.getP_price()*cart.getP_count() %> 원</td><!-- 이부분이 가격을 수량만큼 늘려주는 곳이에요!! -->
				<td width="5%"><button class="form-control" 
						onclick="cartdelete('in' , '<%=cart.getP_num()%>' , '<%=cart.getP_size()%>'   )"> X </button></td>
			</tr>
			
			<% i++; } } %>
		</table>
		<div class="col-md-3">
			<button onclick="cartdelete('all' , '0' , '0')" class="form-control">모두 삭제</button>	
		</div>
		<div class="text-center totalbox">
			<p>총 상품 가격 <span class="carttotal"><%= decimalFormat.format(totalprice) %></span> + 총배송비<span class="carttotal">3000</span>= 총 주문 금액:<span class="carttotal"><%=totalprice+3000 %></span></p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 offset-3">
			<a href="productpayment.jsp"><button class="form-control bg-success test-white p-3">주문하기</button></a>
		</div>
		<div class="col-md-3">
			<button class="form-control bg-info test-white p-3">쇼핑하기</button>
		</div>
	</div>
	
	
</body>
</html>
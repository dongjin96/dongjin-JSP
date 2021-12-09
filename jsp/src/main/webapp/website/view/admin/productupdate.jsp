<%@page import="java.util.ArrayList"%>
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

	<%@ include file = "../header.jsp" %>
		
	
	<div class = "container">
		<form action="../../controller/productdeletecontroller.jsp" method="post" enctype="multipart/form-data" >
		<%	//Product product = ProductDao.getProductDao().getproductlist(key, keyword);
		 ArrayList<Product> products = ProductDao.getProductDao().getproductlist(null,null);
		%>
		
			 <div class="page-header">
                <div class="container my-5">
                <h3>제품 정보 수정 </h3>
               
         
            <div class="col-sm-6 col-md-offset-3">
                <form role="form">
                    <div class="form-group">
                    <%for(Product product : products) {%>
                    
                        <label for="inputName">제품명</label>
                        <input type="text" class="form-control" id="p_name" value=<%=product.getP_name()%> placeholder="수정할제품을 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="Inputprice">제품 가격</label>
                        <input type="text" class="form-control" id="p_price"value=<%=product.getP_price()%> placeholder="수정할제품 가격을입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="Inputcategory">제품 카테고리</label>
                         <input type="text" class="form-control" id="P_category"value=<%=product.getP_category()%> placeholder="수정할제품 상태수정해주세요">
                        <select class="active" name="p_category">
                        <option value="준비중">준비중</option>
                         <option value="판매중">판매중</option>
                          <option value="품절">품절</option>                       
                        </select>
                    </div>
                     <div class="form-group">
                        <label for="Inputmanufacturer">제품 제조사</label>
                        <input type="text" class="form-control" id="Inputmanufacturer" placeholder="수정할제품 제조사를입력해주세요">
                    </div>
                     <div class="form-group">
                        <label for="size">제품 사이즈</label>
                        <input type="text" class="form-control" id="Inputsize" placeholder="수정할제품 사이즈를입력해주세요">
                    </div>
                     <div class="form-group">
                        <label for="stock">제품 재고</label>
                        <input type="text" class="form-control" id="Inputstock" placeholder="수정할제품 재고를입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="img">제품 이미지</label>
                        <input type="text" class="form-control" id="Inputimg" placeholder="수정할 제품 이미지를선택해주세요">
                    </div>
                    <div class="form-group">
                        <label for="contents">제품 설명</label>
                        <input type="text" class="form-control" id="contents" placeholder="수정할 제품 설명 내용을 입력해주세요">
                    </div>
                   
                  
                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary">
                            수정하기<i class="fa fa-check spaceLeft"></i>
                        </button>
                         <%} %>
                      </form>
                    </div>
                
            </div>
 		</div>
 		</form>
 	   </div>	
	
	












</body>
</html>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <%
    
    
    	
    	int p_num = Integer.parseInt(request.getParameter("p_num"));
    	// db처리
    	boolean result = ProductDao.getProductDao().productdelete(p_num);
    
    	if(result){
    		out.print("<script>alert('제품 삭제 되었습니다.');</script>");
    		out.println("<script>location.href='../view/admin/dashboard.jsp';</script>");
    	}else{
    		out.print("<script>alert('제품 삭제 실패되었습니다.');</script>");
    		out.println("<script>location.href='../view/admin/productwrite.jsp';</script>");
    	}
    %>
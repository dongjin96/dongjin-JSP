<%@page import="dao.ProductDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	String folderpath = "C:/Users/ez201209/git/dongjin-JSP/jsp/src/main/webapp/website/upload";
	MultipartRequest multipartRequest = new MultipartRequest( 
			request , folderpath , 1024*1024*100 ,"UTF-8",new DefaultFileRenamePolicy() );
	
	// 객체화
	Product product = new Product( 
			multipartRequest.getParameter("p_name") , 
			Integer.parseInt(multipartRequest.getParameter("p_price")) ,
			multipartRequest.getParameter("p_category") ,
			multipartRequest.getParameter("p_manufacturer") ,
			Integer.parseInt(multipartRequest.getParameter("p_active")),
			multipartRequest.getParameter("p_size"),
			Integer.parseInt(multipartRequest.getParameter("p_stock")),
			multipartRequest.getParameter("p_img"),
			multipartRequest.getParameter("p_contents") );
	// DB 처리 
	boolean result = ProductDao.getProductDao().productwrite(product);
	if(result){
		out.print("<script>alert('제품 등록 되었습니다.');</script>");
		out.println("<script>location.href='../view/admin/dashboard.jsp';</script>");
	}else{
		out.print("<script>alert('제품 등록 실패되었습니다.');</script>");
		out.println("<script>location.href='../view/admin/productwrite.jsp';</script>");
	}
	
%>
</body>
</html>
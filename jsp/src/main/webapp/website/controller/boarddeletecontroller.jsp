<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    		
    int b_num = Integer.parseInt(request.getParameter("b_num"));
	//db처리
	boolean result = BoardDao.getBoardDao().boarddelete(b_num);
	
	if(result){
		response.sendRedirect("../view/board/boardlist.jsp");
		out.println("<script>alert('삭제되었습니다');</script>");
	}else{
		response.sendRedirect("../view/board/boardview.jsp?b_num="+b_num);
	}
    
    
    %>
    
   
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	


	int r_num = Integer.parseInt(request.getParameter("r_num"));
	//db처리
	boolean result = BoardDao.getBoardDao().replydelete(r_num);
	
	if(result){
		response.sendRedirect("../view/board/boardlist.jsp");
		out.println("<script>alert('삭제되었습니다');</script>");
	}else{
		response.sendRedirect("../view/board/boardview.jsp?b_num="+r_num);
	}






%>
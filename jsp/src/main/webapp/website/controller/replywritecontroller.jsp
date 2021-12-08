<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Reply"%>
<%@page import="dto.Login"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		request.setCharacterEncoding("UTF-8");
	     String contents = request.getParameter("replycontents");
		 Login login= (Login)session.getAttribute("login");
		 int m_num=login.getM_num();
		 int b_num=Integer.parseInt(request.getParameter("b_num"));
	   //  contents = contents.replaceAll("<","%lt;").replace(">","&gt;").replace("\n","<br>" );
	    
	    
	     // 객체화
	     Reply reply = new Reply(contents,m_num,b_num);
	     // DB 처리
	  boolean result = BoardDao.getBoardDao().replywrite(reply);
	   if(result){
		   out.print("<script>alert('댓글 등록 되었습니다.');</script>");
			out.print("<script>location.href='../view/board/boardview.jsp?b_num="+b_num+"';</script>");
	   }else{
		   out.print("<script>alert('엣쿵 실패.');</script>");
	   }
	%>
	

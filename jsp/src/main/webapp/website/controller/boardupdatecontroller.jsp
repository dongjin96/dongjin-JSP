<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="dao.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Board"%>
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
	String folderpath = request.getSession().getServletContext().getRealPath("website/upload");
	MultipartRequest multi = new MultipartRequest( request ,  folderpath , 1024*1024*10 ,"UTF-8" , new DefaultFileRenamePolicy() );
	request.setCharacterEncoding("utf-8");	// 요청시[request] 한글 인코딩
	String title = multi.getParameter("title");
	String contents = multi.getParameter("contents");
	contents = contents.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
	title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?","");
	
	String file = multi.getFilesystemName("file");
     String file2 = multi.getFilesystemName("file2");
	if( file == null ){	// 새로운 첨부가 없을경우 기존 첨부를 DB 저장
		file = multi.getFilesystemName("oldfile");
	}
	int b_num = Integer.parseInt(multi.getParameter("b_num") ); 
	Board board = new Board(b_num , title , contents , file, file2 ); // 객체화
	boolean result =  BoardDao.getBoardDao().boardupdate( board ); 	// DB처리
	if( result ){
		out.print("<script>alert('수정 되었습니다.');</script>");
		out.println("<script>location.href='../view/board/boardview.jsp?b_num="+b_num+"';</script>");
	}else{	
	}
%>
</body>
</html>
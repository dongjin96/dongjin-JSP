<%@page import="dao.BoardDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Board"%>
<%@page import="dto.Login"%>
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
      // MultipartRequest 객체명 = new  new MultipartRequest();
      // 1.요청방식[request]
      // 2.업로드 파일 경로
      // 3.용량(바이트) 
      // 4.인코딩타입 - "UTF-8"
      // 5.보안      DefaultFileRenamePolicy() 파일명 동일할경우 자동으로 식별가능하게 함
      // 서버로 파일 업로드
       //서버 실제 경로
     	String folderpath= request.getSession().getServletContext().getRealPath("website/upload");
    
     // System.out.print(folderpath);
      MultipartRequest multi = new MultipartRequest(request,folderpath,1024*1024*10, "utf-8", new DefaultFileRenamePolicy()); 
      ////////////////////////////////////////////////////////////////////파일을이동ㄷ시키는역할
      // 요청   [일반 form]
      /* request.setCharacterEncoding("UTF-8");
      String title = request.getParameter("title");
      String contents = request.getParameter("contents");
      String file = request.getParameter("file"); */
      //요청
      String title = multi.getParameter("title");
      String contents = multi.getParameter("contents");
      //br-->을 /n 으로 바꾸어야한다 프론트<>태그 제거 해야한다
      //contents = contents.replace("\r\n", "<br>");///////////////////////////////
       // 프론트 <>태그 제거(입력상자사용시)
      contents = contents.replaceAll("<","%lt;").replace(">","&gt;").replace("\n","<br>" );
      title=title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?","");
      
      String file = multi.getFilesystemName("file");   // getFilesystemName : 파일명 가져오기
      String file2 = multi.getFilesystemName("file2");
      ////////////////////////////////////////////////파일을 디비에 저장
      // 작성자 아이디
      Login login = (Login)session.getAttribute("login");
      int m_num = login.getM_num();
      // 객체화
      Board board = new Board(title,contents,m_num, file , file2);
      // DB 처리
     BoardDao.getBoardDao().boardwrite(board);
      response.sendRedirect("../view/board/boardlist.jsp");
      
   
      
   %>

</body>
</html>

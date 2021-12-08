<%@page import="dto.Login"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
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
		request.setCharacterEncoding("UTF-8");	// 한글 인코딩
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		boolean result =  MemberDao.getmemberDao().login( id , password);
		
		//DB처리
		
		// DB 결과 
		if( result ){ // 로그인 성공시
			// 세션 부여 [ 내장객체 : 기본값(30분) ]
					int m_num = MemberDao.getmemberDao().getmembernum(id);
					Login login = new Login(m_num,id);
					session.setAttribute("login", login);
			response.sendRedirect("../view/main.jsp");
		} 
		else{ // 로그인 실패시
			response.sendRedirect("../view/member/login.jsp?result=fail");
		}
	%>

</body>
</html>
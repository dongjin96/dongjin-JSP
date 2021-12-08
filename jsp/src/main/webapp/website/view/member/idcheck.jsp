
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	// jsp[ 태그는 통신 결과로 가지 않는다]

	String userid = request.getParameter("userid");
	System.out.print(userid);
	//db 아이디 체크
	
	boolean result = MemberDao.getmemberDao().idcheck(userid);
	
	
	if(result){out.print("1");} // html 에 작성하기
	else{out.print("0");}
		
	
	//jsp 태그는 통신 결과로 반환x
	//html 결
	
	
%>



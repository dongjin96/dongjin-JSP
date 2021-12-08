<%@page import="dto.Login"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	// 로그인된 아이디[ 세션 ]
	Login Login = (Login)session.getAttribute("login");		
	String id = Login.getM_id();
	// ajax로부터 요청한 변수	
	String newname = request.getParameter("newname");
	String newaddress = request.getParameter("address1")+","+ request.getParameter("address2")+","+
			request.getParameter("address3")+","+request.getParameter("address4");
	
	// name db처리

	if( newname != null  ){
		boolean nameresult = MemberDao.getmemberDao().update(newname, id);
		if(nameresult){
			out.print("1");
		}else{
			out.print("0");
		}
	}
	
	//주소수정
	if (newaddress !=null){
		boolean addressresult = MemberDao.getmemberDao().addressupdate(newaddress, id);
		if(addressresult){
			out.print("1");
		}else{
			out.print("0");
		}
	}
	

%>

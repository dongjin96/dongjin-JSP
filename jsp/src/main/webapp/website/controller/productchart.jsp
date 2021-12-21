<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.PorderDao"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <%
    JSONObject jsonObject = new JSONObject();
/*     	
    //JSONOBJECT<---> MAP
    	//JSONOBJECT>PUT(키: 값) : 엔트리 추가
    jsonObject.put("id", "qweqwe");
    jsonObject.put("password", "qweqwe"); */
    
    jsonObject = PorderDao.getPorderDao().getorderdatecount();
    
    %>
    <%= jsonObject%>
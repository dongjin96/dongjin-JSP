<%@page import="dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		// 장바구니 세션이름[이름 : cart+아이디값 : cart리스트]
	Login login = (Login)session.getAttribute("login");// 세션의 자료형/ 클래스는 object
	String sname= "cart"+login.getM_id();
	
	ArrayList<Cart> carts = (ArrayList<Cart>)session.getAttribute(sname);
	
	String type = request.getParameter("type");
	int p_num =Integer.parseInt(request.getParameter("p_num"));
	String p_size= request.getParameter("p_size");
	int i = Integer.parseInt(request.getParameter("i"));
	int p_count = Integer.parseInt(request.getParameter("p_count"));
	
	if(type.equals("all")){ // 모두삭제 버튼을 눌렀을떄
		session.setAttribute(sname, null);// 카트세션을 null 초기화  
	}
	if(type.equals("in")){// 개별 살제 버튼 눌렀을떄
		//카트세션 호출
		for(Cart cart: carts){ //동일한 제품번호와 사이즈 찾기
		    if(cart.getP_num()== p_num && cart.getP_size().equals(p_size)){
			carts.remove(cart); // 카트에서 해당 제품 삭제 
			session.setAttribute(sname, carts);
			break; // 반복문 종류
		    }
		}
	}else if(type.equals("m")){
	    carts.get(i).setP_count(p_count);
	    session.setAttribute(sname, carts);
	}else if(type.equals("p")){
	    carts.get(i).setP_count(p_count);
	    session.setAttribute(sname, carts);
	}
	
	


%>
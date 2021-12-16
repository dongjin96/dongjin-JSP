<%@page import="dto.Login"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//선택한 제품의 제품번호,옵션,수량 
	int p_num= Integer.parseInt(request.getParameter("p_num"));
	String p_size=request.getParameter("p_size");
	System.out.print( p_size );
	int p_count= Integer.parseInt (request.getParameter("p_count"));
	
	//객체화
	Cart cart = new Cart(p_num,p_size,p_count);
	//장바구니 세션이름[이름 : cart+아이디 값: cart리스트]
	Login login=(Login)session.getAttribute("login"); // 세션 자료형은/클래스는 object 이므로 형변환을 시켜야한다
	String sname="cart"+login.getM_id();
		//기존 카트가 있을경우 없을경우
		ArrayList<Cart> carts = (ArrayList<Cart>)session.getAttribute(sname);
		if(carts==null){//기존 카트가 없다
		    carts= new ArrayList<>(); // 카트리스트에 메모리할당
		    carts.add(cart); // 카트리스트에 제품추가
		    //세션에 저장
		    session.setAttribute(sname, carts); // 5카트 세션 생성
		    
		}else{ // 6. 카트 세션이 있을경우
		    // 만약에 기존 카트에 동일한 제품이 있을경우
		    boolean pcheck = true;
		    for(Cart temp:carts){
			if(temp.getP_num()==p_num && temp.getP_size().equals(p_size)){
			    //기존 제품에 수량을 추가
			    temp.setP_count(temp.getP_count()+p_count);
			    pcheck=false;
			}
		    }
		    carts.add(cart); // 7. 카트리스트에 제품추가
		    session.setAttribute(sname, carts); // 8.세션 다시할당
		}
	//리스트
	
	//세션에 저장 [이름 : cart+아이디 값:cart 리스트]
	
	//session.setAttribute(sname, carts);
	//response.sendRedirect("../view/productcart.jsp");
%>

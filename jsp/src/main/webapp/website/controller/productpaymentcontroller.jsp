<%@page import="dao.PorderDao"%>
<%@page import="dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Login"%>
<%@page import="dto.Porder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//ajax 이용한 매개변수 요청
	String order_name = request.getParameter("order_name");
	String order_phone =request.getParameter("order_phone");
	String order_address =request.getParameter("order_address");
	int order_pay =Integer.parseInt(request.getParameter("order_pay"));
	String order_payment =request.getParameter("order_payment");
	int delivery_pay =Integer.parseInt(request.getParameter("delivery_pay"));
	String order_contents =request.getParameter("order_request");

	Login login =(Login)session.getAttribute("login");//로그인세션 호출
	//1.객체화 하기
	Porder porder = new Porder(login.getM_num(),order_name,order_phone,order_address,
		order_pay,order_payment,delivery_pay,order_contents);
	
	//카트 세션
	String sname="cart"+login.getM_id();//장바구니 세션 이름 [이름 :cart+아이디 값:cart리스트]
	ArrayList<Cart>carts=(ArrayList<Cart>)session.getAttribute(sname);
	//DB 저장
	boolean result = PorderDao.getPorderDao().orderwrite(porder, carts);
	if(result){
	    out.print("1"); session.setAttribute(sname, null); //장바구니 초기화
	}else out.print("0");
	    
	
	
//순서[db 등록을한다-> 2. 주문 상품수만큼 주문상세 등록]
//1.주문등록
		//1. 회원번호 : m_num 세션
		//2. 수령자 order_name
		//3. 수령자연락쳐 : order_phone
		//4.수령자 주소 : order_address
		//5.주문총금액 : order_pay\
		//6.결제수단 : order_payment
		//7.배송비 : delivery_pay
		
	//2. 주문상세[먼저 주문 등록이 된다는 가정]: 반복문
		// 오더번호 : order_num
		// 상품번호 : P_num 카트세션
		// 구매수량 :  P_count 카트 세션
		// 배송상태 : delivery_state :임의 값[1]
	//3. 재고 감소 [제품업데이트]
	//4. 카트 세션 초기화 
	
%>
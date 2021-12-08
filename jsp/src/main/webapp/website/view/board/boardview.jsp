
<%@page import="dto.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%@include file = "../header.jsp" %>
		<%
		
			int b_num= Integer.parseInt(request.getParameter("b_num"));// 전페이지에서 클릭한 게시물번호
			String boardviews =  loginid +":"+b_num;
				if(session.getAttribute(boardviews) ==null){ //현재 로그인 id 게시물의 세션명이 존재하지않으면
				//조회수증가
				BoardDao.getBoardDao().boardcount(b_num);
				String boardview= loginid+":"+b_num;//1. 현재 로그인id+게시물 번호: => 세션 이름 사용예정
				session.setAttribute(boardview,true);
				session.setMaxInactiveInterval(60*60*24); // 세션 유효시간 : 초당 [하루]
		
				}
			
			//해당 게시물번호의 게시물 가져오기
			Board board = BoardDao.getBoardDao().getBoard(b_num);
			//////////////페이징
		//페이지 처리
		String key = request.getParameter("key");
		String keyword = request.getParameter("keyword");
		String pagenum = request.getParameter("pagenum");//클릭한 페이지번호
			
		
		 
		
		if(pagenum==null){//클릭한 페이지 번호가 없으면[게시판 첫화면]
				pagenum="1";
			}
			int lastrow = BoardDao.getBoardDao().replycount(b_num);
			int listsize=10; // 페이지당 화면에 표시될게시물수
			int lastpage=0;			// 마지막페이지
			if(listsize==0){		//만약에 총게시물 페이지당 게시물 나머지가없으면
				lastpage=lastrow/listsize;	// 총게시물 페이지당 게시물
			}else{
				lastpage=lastrow/listsize+1;	// 총게시물 페이지당 게시물
			}
			int currentpage =Integer.parseInt(pagenum); // 5. 현재페이지번호
			int startrow=(currentpage-1)*listsize; //6. 현재페이지의 시작번호
			// 1페이지 ->0*10->0//2페이지 ->1*10->10
			//int endrow =currentpage*listsize;//7.현재페이지의 마지막번호
				
			ArrayList<Board> boards 
			= BoardDao.getBoardDao().boardlist(startrow, listsize, key, keyword);
			
			
		%>
		<!-- 게시물 상세 페이지 -->
		<div class = "container">
		<br><br>
		<div class="row ">
			<div class="m-2">	<a href="boardlist.jsp"><button class="form-control">목록보기</button></a> </div>
			<%if(loginid !=null && loginid.equals(board.getB_writer())){ %>  <!-- 로그인된 아이디와 작성자와 동일한경우에만 -->
				<div class="m-2"> <a href="boardupdate.jsp?b_num=<%=board.getB_num()%>"><button class="form-control">수정하기</button></a> </div>
				<div class="m-2"> <a href="../../controller/boarddeletecontroller.jsp?b_num=<%=board.getB_num()%>"><button class="form-control">삭제하기</button></a> </div>
			<%} %>
		</div>
		<p class ="table text-center table-hover" style="color:orange ;">게시판 상세보기</p>
			<table class="table text-center table-hover">
				<tr>
					<td style="width:20%">작성자 :</td>
					<td><%=board.getB_writer() %></td>
					<td >작성일 :</td>
					<td><%=board.getB_date() %></td> 
					<td >조회수 :</td>
					<td><%=board.getB_view() %></td> 
				</tr>
				<tr >
					<td >제목 :</td><td colspan="5" ><%=board.getB_title() %></td> 
				</tr>
				<tr>
					<td style="height:300px;">내용 :</td> <td colspan="5"><%=board.getB_contents()%></td>
				</tr>
				<tr>
					<td> 1.첨부파일 </td > <td  colspan="5"> <a href="../../controller/filedowncontroller.jsp?file=<%=board.getB_file()%>"><%=board.getB_file() %></a> </td>
				</tr>
				<tr>
					<td> 2.첨부파일 </td> <td  colspan="5"> <a href="../../controller/filedowncontroller.jsp?file=<%=board.getB_file2()%>"><%=board.getB_file2() %></a> </td>
				</tr>
			
				
				</table>
			</div>
			
			<br><br>
	<div class="container">	
		<%if(loginid !=null && loginid.equals(board.getB_writer())) {%>	
			<div class="row" >
				<div class= "align-right">
					
					<a href="#"><button style="color:white;background:green;font-size:1em; border-radius:0.5em;">댓글보기</button></a>			
					<a href="#"><button style="color:white;background:indigo;font-size:1em; border-radius:0.5em;">댓글삭제</button></a>			
				<%} %>
				</div>
			</div>
			
			<table class= "table">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성일</th>				
				</tr>
			<%
			
			ArrayList<Reply> replys = BoardDao.getBoardDao().replylist(b_num);
			for(Reply reply : replys){
			%>
			
				<tr>
					<td><%=reply.getR_num() %></td>
					<td><%=reply.getM_num() %></td>
					<td><%=reply.getR_contents() %></td>
					<td><%=reply.getR_date() %></td>
					<td><a href="../../controller/replydeletecontroller.jsp?r_num=<%=reply.getR_num()%>"><button style="color:white;background:indigo;font-size:1em; border-radius:0.5em;">댓글삭제</button></a></td>			
				</tr>
			
			<%} %>
			</table>
			<form action="../../controller/replywritecontroller.jsp?b_num=<%=board.getB_num()%>" method="post" enctype="application/x-www-form-urlencoded"><!-- enctype="application/x-www-form-urlencoded" 이거 텍스트 쓸떄 무조건 들어가야함 -->
				<div class="row">
					<div class="col-md-2">
						<h6>댓글작성</h6>	
					</div>
					<div class="col-md-8">
						<textarea rows="" cols="" class="form-control" name="replycontents"></textarea>
					</div>
					<div class="col-md-2">
						<input type="submit" value="등록">
					</div>
				</div>
			</form>
			<!-- 페이징 번호 -->
				<div class="row">
					<div class="col-md-4 offset-4 my-3">
						<ul class="pagination">
							<%if(currentpage ==1) {%>
								<%if(keyword == null){ %>
								<li class="pageitem"><a href="boardview.jsp?pagenum =<%=currentpage %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 이전 </a> </li> <!--&key 변수명=< %=key % 값> -->
							<%}else{ %>
								<li class="page-item"><a href="boardview.jsp?pagenum =<%=currentpage%>" class="page-link"> 이전 </a> </li>	
							<%} %>
						<%}else{ %><!-- 일이 되면 영이되니깐 else 이후부터 2부터는 1씩깎는다 라는말 -->
							<li class="pageitem"><a href="boardview.jsp?pagenum =<%=currentpage-1 %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 이전 </a> </li>
						<%} %>
						<!--  게시물의 -->
						<% for( int i = 1 ; i<=lastpage; i++){ %>
								<li class="page-item"><a href="boardlist.jsp?pagenum=<%=i %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> <%=i %> </a> </li>
								<!-- i 클릭했을때 현재 페이지 이동 [ 클릭한 페이지번호 ] -->
							<%} %>
							
								<!-- 마지막페이지에서 다음버튼 눌렀을때 마지막페이지 고정 -->
							<% if( currentpage == lastpage ){ %>
								<li class="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 다음 </a> </li>
							<%}else{ %>									<!-- 현재페이지번호 +1  -->
								<li class="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage+1 %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 다음 </a> </li>	
							<%} %>
						
						</ul>
					</div>
				</div>
		
		
		
		</div>
		
		
		
		
		
	

</body>
</html>
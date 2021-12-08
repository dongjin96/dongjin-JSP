<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.util.ArrayList"%>
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
	//검색이 있을경우
		String key = request.getParameter("key");
		String keyword = request.getParameter("keyword");
	
	//페이지 처리
	String pagenum = request.getParameter("pagenum");	// 4. 클릭한 페이지번호
		if( pagenum == null){ // 클릭한 페이지번호가 없으면 [ 게시판 첫화면 ]
			pagenum = "1";	//	1페이지 설정
		}
	
	int lastrow = BoardDao.getBoardDao().boardcount(key ,  keyword);// 총게시물수
	int listsize= 10; //페이지당 화면에 표시될게시물수

	int lastpage =0;			//3. 마지막 페이지
	if(lastrow %listsize==0){		// 만약에 총게시물 페이지당게시물 나머지가 없으면
		lastpage=lastrow/listsize;	// 총게시물 페이지당 게시물
	}else{
		lastpage=lastrow/listsize+1; // 총게시물 페이지당게시물
		
	}
	
	
	int currentpage = Integer.parseInt(pagenum);//5. 현재페이지번호
	int startrow = (currentpage-1)*listsize;//6.현재페이지의 시작번호
	// 1페이지 ->0*10->0//2페이지 ->1*10->10
	//int endrow =currentpage*listsize;//7.현재페이지의 마지막번호
		
	
	
	ArrayList<Board> boards 
			= BoardDao.getBoardDao().boardlist(startrow, listsize, key, keyword);
	
	
	
	%>
	
	
	
	
	
	
	
		<div class="container">
			<div class="text-center">
				<h3 style ="border-bottom:solid 1px #eeeee;">고객센터</h3> 
				<br>
				<p style="color: orange;"> · 벤츠에 가입하시면 다양한 이벤트를 제공 받을수 있습니다. · </p>
			</div>
			<div class ="text-center">	
				<div class="text-center">
					<div class="row">
						<div class="col-md-5 m-2">
							<h4>자주묻는 질문</h4>
							<table class="table">
									<tr>	<td>Q</td><td>아이디를분실했습니다</td> </tr>
									<tr>	<td>A</td><td>아이디를분실했습니다</td> </tr>
									<tr>	<td>H</td><td>아이디를분실했습니다</td> </tr>
									<tr>	<td>!</td><td>아이디를분실했습니다</td> </tr>
									<tr>	<td>Y</td><td>아이디를분실했습니다</td> </tr>
							</table>
					</div>
						<div class="col-md-6 align-middle">
										<h4>고객문의</h4><br><br>
										<h1 class="text-success">1577-7011</h1><br><h6>365일 24시간 운영</h6>
						</div>
				</div>
			</div>
				<br><br><br><br> 
				
				
				 
				<div class="text-right">
				
				<%
						if(loginid !=null &&loginid.equals("admin")){%>
							
					<%}%>
				<a href="boardwrite.jsp" ><button style="background-color:green;">글쓰기</button></a>
				</div>
				<br><br>
				<p class="table text-center  table-hover" style="color:orange ; font-size: 2rem;">게시판</p>
				
				<%if(keyword !=null){ %>
					<p>총검색수 : <%=lastrow %>></p>
				<%} else{%>
					<p>총 게시물수 : <%=lastrow %></p>
				<%}%>
			
				<p>총 게시물 수 :</p>
				<%=lastrow %>
			
			<table class="table text-center">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>


				<%
						if(boards.size()==0){%>
				<tr>
					<td colspan="5" class="text-center">검색결과가 없습니다.</td>

				</tr>
				<%} %>
				<%
					for(Board board : boards){
					%>
				<tr>
					<td><%=board.getB_num() %></td>
					<td><a href="boardview.jsp?b_num=<%=board.getB_num()%>"><%=board.getB_title() %></a></td>
					<td><%=board.getB_writer() %></td>
					<td><%=board.getB_date() %></td>
					<td><%=board.getB_view() %></td>


				</tr>
				<%}%>



				<tr>
				</tr>
			</table>
			<!-- 페이징 번호 -->
					<div class="row">
						<div class="col-md-4 offset-4 my-3">
						<ul class="pagination">
							
							<% if( currentpage == 1){ %>
								<% if( keyword == null ){ %>
								<li class="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage%>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 이전 </a> </li>
								<%}else{%>
								<li class="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage%>" class="page-link"> 이전 </a> </li>	
								<%} %>
							<%}else{ %>
								<li class="page-item"><a href="boardlist.jsp?pagenum=<%=currentpage-1 %>&key=<%=key %>&keyword=<%=keyword %>" class="page-link"> 이전 </a> </li>
							<%} %>										<!-- 현재페이지번호 -1  -->
							
								<!-- 게시물의 수만큼 페이지 번호 생성 -->
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
			
			<!-- 검색 -->
			<form action="boardlist.jsp?pagenum=<%=currentpage %>" method="get" class="col-md-5 offset-3 input-group my-3" >
				<select class="custom-selsct col-cmd-3" name="key">
					<option value="b_title">제목</option>
					<option value="b_contents">내용</option>
					<option value="b_num">번호</option>
					<option value="b_writer">작성자</option>
				
			</select>
			<input type="text" class="form-control" name="keyword"><!-- keyword 검색대상~! -->
			<input type="submit"class=btn-outline-info value="검색">
		</form>
	</div>
		
			<br><br><br><br><br>
			
			
			
			
		
</body>
</html>
	
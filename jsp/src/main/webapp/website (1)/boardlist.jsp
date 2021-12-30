<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@include file="header.jsp" %>
	
	<div class="container">
		<a href="boardwrite.jsp"> <button class="offset-11 btn btn-success">글쓰기</button> </a>
		<br><br>
		
		<table class="table table-hover">
			<tr>
				<th class="list-table">번호</th>
				<th class="list-table">제목</th>
				<th class="list-table">작성자</th>
				<th class="list-table">작성일</th>
				<th class="list-table">조회수</th>
			</tr>
			<tr>
				<td>1</td>
				<td><a href="boardview.jsp">안녕하세요</a></td>
				<td>작성자 </td>
				<td>2021-12-10</td>
				<td>200</td>
			</tr>
			<tr>
				<td>2</td>
				<td> <a href="boardview.jsp">안녕하세요</a> </td>
				<td>작성자</td>
				<td>2021-12-10</td>
				<td>200</td>
			</tr>
			<tr>
				<td>3</td>
				<td> <a href="boardview.jsp">안녕하세요</a> </td>
				<td>작성자 </td>
				<td>2021-12-10</td>
				<td>200</td>
			</tr>
			<tr>
				<td>4</td>
				<td> <a href="boardview.jsp">안녕하세요</a> </td>
				<td>작성자</td>
				<td>2021-12-10</td>
				<td>200</td>
			</tr>
			<tr>
				<td>5</td>
				<td> <a href="boardview.jsp">안녕하세요</a> </td>
				<td> 작성자 </td>
				<td>2021-12-10</td>
				<td>200</td>
			</tr>
		
		</table>
	
	</div>
	<div class="row">
			<div class="col-md-4 offset-4 my-5">
				<ul class="pagination">
					<li class="page-item"> <a class="page-link"> &laquo; </a></li>
					<li class="page-item"> <a class="page-link">1</a></li>
					<li class="page-item"> <a class="page-link">2</a></li>
					<li class="page-item"> <a class="page-link">3</a></li>
					<li class="page-item"> <a class="page-link">4</a></li>
					<li class="page-item"> <a class="page-link">5</a></li>
					<li class="page-item"> <a class="page-link"> &raquo; </a></li>
				</ul>
			</div>
		</div>
	
	


	<%@include file="footer.jsp"%>

</body>
</html>
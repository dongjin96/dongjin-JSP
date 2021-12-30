<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>쇼핑몰</title> 
	<!-- 부트스트랩 설정 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	<!-- css 호출 -->
	<link rel="stylesheet" href="/이민욱/website/css/main.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css">

</head>
<body>

	<div class="fixed-top bg-white">
		<div class="container">
			<header class="py-3 header">
				<div class="row justify-content-between align-items-center">
					<div class="col-md-4 offset-4 text-center">
						<a href="main.jsp" class="header-logo " style="color: black">쇼핑몰</a>
					</div>
					<div class="col-4 d-flex justify-content-end">
						<ul class="nav header-topmenu">
							<li> <a href="#" class="text-info mx-1">로그인</a></li>
							<li> <a href="#" class="text-info mx-1">회원가입</a> </li>
						</ul>
					</div>
				</div>			
			</header>
			<nav class="navbar navbar-expand-lg navbar-ligth ">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#header-mainmenu">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="header-mainmenu">
					<ul class="navbar-nav col-md-12 justify-content-between">
						<li class="nav-item"> <a href="#" class="nav-link" style="color: black">베스트 상품</a></li>
						<li class="nav-item"> <a href="#" class="nav-link" style="color: black">상의</a></li>
						<li class="nav-item"> <a href="#" class="nav-link" style="color: black">하의</a></li>
						<li class="nav-item"> <a href="#" class="nav-link" style="color: black">아우터</a></li>
						<li class="nav-item"> <a href="#" class="nav-link" style="color: black">악세사리</a></li>
						<li class="nav-item"> <a href="#" class="nav-link" style="color: black">장바구니</a></li>
						<li class="nav-item"> <a href="boardlist.jsp" class="nav-link"  style="color: black">고객센터</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file = "../header.jsp" %> <!-- 헤더 페이지 -->
	  <%
		// 로그인[세션]이 되어 있는경우
		if( loginid != null ){
			out.print("<script>alert('로그인이 되어있습니다.');</script>");
			out.println("<script>location.href='../main.jsp';</script>");
		}

		%>




	
	
	<div class="container"> <!-- 박스권  -->
	<div class="text-center">
		<h3 style="border-bottom: solid 1px #eeeee;"> 회원가입 </h3>
		<p style="color: green;">※ 환영합니다 ※</p>
		
	</div>
	
	
	
      <div class="row"> <!-- 가로 박스 -->
      
         <div class="col-md-6 ">   <!-- 6:6 -->
            <img src="../../img/signuplogo.jpg" width="100%">
         </div>
         <div class="col-md-6">    
         
            <form id="signupform" action="../../controller/signupcontroller.jsp" method="post" onsubmit="return signupcheck()">
               <div class="row">   <!-- 3:8 -->
                  <div class="col-md-3 m-2"> <label>아이디</label> </div>
                  <div class="col-md-8"> <input id="id" onchange="signupcheck();" type="text" name="id" class="form-control" maxlength="15"> </div>
               </div>
                  <div>
                     <span id="idresult"></span>
                  </div>
               <div class="row">   <!-- 3:8 -->
                  <div class="col-md-3 m-2"> <label>비밀번호</label> </div>
                  <div class="col-md-8"> <input id="password" onchange="signupcheck();"  type="password" name="password" class="form-control" maxlength="15"> </div>
               </div>
              
               <div class="row">   <!-- 3:8 -->
                  <div class="col-md-3 m-2"> <label>비밀번호확인</label> </div>
                  <div class="col-md-8"> <input id="passwordconfirm" onchange="signupcheck();" type="password" name="passwordconfirm" class="form-control"> </div>
               </div>
               <div>
                  <span id="pwresult"></span>
               </div>
               <div class="row">   <!-- 3:8 -->
                  <div class="col-md-3 m-2"> <label>이름</label> </div>
                  <div class="col-md-8"> <input id="name" id="name" onchange="signupcheck();"  type="text" name="name" class="form-control" maxlength="15"> </div>
               </div>
               <div>
                  <span id="nameresult"></span>
               </div>
               <div class="row">   <!-- 3:8 -->
                  <div class="col-md-3 m-2"> <label>생년월일</label> </div>
                  <div class="col-md-8"> <input id="birth" onchange="signupcheck();"  type="date" name="birth" class="form-control"> </div>
               </div>
               <div>
							<span id="birthresult"></span>
				</div>
				
              <div class="row">	<!-- 3:8 -->
						<div class="col-md-3 m-2"> <label>성별</label> </div>
						<div class="col-md-8 text-center"> 
							<input type="radio" name="sex" value="man" id="sex1" onchange="signupcheck();" > 남
							<input type="radio" name="sex" value="woman" id="sex2" onchange="signupcheck();" > 여
						</div>
						<div>
							<span id="sexresult"></span>
						</div>
					</div>
               
               <div class="row">   <!-- 3:8 -->
                  <div class="col-md-3 m-2"> <label>연락처</label> </div>
                  <div class="col-md-8">
                     <input type="text" id="phone" onchange="signupcheck();" class="form-control" placeholder="000-0000-0000" >
                  </div>
               </div>
               <div>
                  <span id="phoneresult"></span>
               </div>
               
               <div class="row">   <!-- 3:8 -->
                  <div class="col-md-3 m-2"> <label>주소</label> </div>
                  <div class="col-md-8"> 
                     <div class="row">
                        <div class="col-md-6"> <input type="text" id="sample4_postcode" name="adress1" placeholder="우편번호" class="form-control"> </div>
                        <div class="col-md-6"> <input type="button"  onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="form-control"><br> </div>
                     </div>
                     <div class="row">
                        <div class="col-md-6"> <input type="text" id="sample4_roadAddress" name="adress2" placeholder="도로명주소" class="form-control"> </div>
                        <div class="col-md-6"> <input type="text" id="sample4_jibunAddress" name="adress3" placeholder="지번주소" class="form-control"> </div>
                     </div>
                     <input type="text" id="sample4_detailAddress" name="adress4" placeholder="상세주소" class="form-control">
                  </div>
               </div>
               <div>
                  <input type="submit" value="가입 하기" class="form-control p-3 m-3">
               </div>
            </form>
         </div>
      </div>
   </div>
	

</body>
</html>
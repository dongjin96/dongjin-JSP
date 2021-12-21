/* 다음주소 api */
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
/* 다음주소 api end */

/* 회원탈퇴 [ ajax : jquery  ] */ 

	// $( function(){ 실행문 });	: 함수 
	$( function(){ 
		// 버튼을 클릭했을때 이벤트 걸기 
		$("#delete").click( function(){ 
		
			// ajax : 비동기식 통신 [ 페이지전환없이 통신 ]
				//$.ajax({ 속성명:값 , 속성명:값 , 속성명:값  });
			$.ajax({
				url : "../../controller/memberdeletecontroller.jsp" ,
				/* url : 통신 경로 */
				data : {password:document.getElementById("deleteform").password.value} ,
				/* data : { 변수명 : 값 } */ 
				success : function( result  ){
				
					if( result == 1 ){
						alert('회원탈퇴 되었습니다');
						location.href='../../controller/logoutcontroller.jsp';
					}else{
						document.getElementById("deleteresult").innerHTML = "회원정보가 다릅니다.";
					}
				
				}
			});
		} ); // 버튼 클릭했을때 함수 끝
	 }); // 전체 함수 끝 

	

/* 회원탈퇴 end*/

/*비동기식으로 사용한이유는 응답할 필요가없기떄문이다
   1.signup 에있는 signup.jsp의 46번쨰줄 <input id=#id 를 가져온다 그조건은 
   2.<input id=#id =#id가 바뀌었을떄 .change 되었을떄 함수를함(조건을 발휘한다)
   3. 104번 쨰줄 data:는 유저의 아이디 문서 를 가져온다 아이디속성 ("signupform").id 값을(DB에 비교할값을 보내는것)
   4. idcheck.jsp에 서 userid 를 불러와서 디비에서 아이디 중복체크를한다 그래서 결과값을  1또는 0으로 답하는데
   5. 그결과답에따라서 사용중인 아이디라고 답하면된다 근데 112번은보면 document.getElementById("idresult").innerHTML말이있는데
   6.이거는 signup.jsp페이지에   49번쨰줄 <span id="idresult"></span> 이자리에 들어가게된다.


 */
/* 아이디 중복체크 [ ajax ] */
	$( function(){  
		// $("id명").이벤트명( 함수명(){ 실행코드; } );
		$("#id").change( function() { 
			// 비동기식 : $.ajax({ 속성명 : "값" , 속성명 : "값" , 속석명 : "값" });
			$.ajax({ 
				url : "idcheck.jsp" ,	
				/* url : 통신할 경로 페이지 */ 
				data :{userid:document.getElementById("signupform").id.value} , 	
				/* 이동할 데이터 */
				success : function( result ){ 
				/* 통신이 성공했을때*/
					if( result == 1 ){ 	// js 변수는 자료형 없다
						document.getElementById("idresult").innerHTML = "사용중인 아이디";
					}else{
						
					}
				}
			});
		});
	});
/* 아이디 중복체크 end */
/*이름 수정start*/
function namechange(){	
	document.getElementById("tdname").innerHTML="<input type='text' id='name' class='form-control'><button id = 'namechangebtn' class='form-control'>확인</button>"
	$(function(){
		$("#namechangebtn").click( function(){ 
			$.ajax({
				url : "../../controller/memberupdatecontroller.jsp",
				data : {newname:document.getElementById("name").value}, //이거는  폼에 감싸져있지않은거니깐 아이디가 필요없는것
				success : function(result){
					if(result==1){
					 alert("수정되었습니다");
					}else{
						alert("수정실패");
					}
				}
			});
		});
	});
}

/*이름 수정 end*/
/*주소 수정 start*/
function addresschange(){
	document.getElementById("taddress").style.display= "";                    // none을 초기값으로 돌려 놓겠다 라는말~!
		
}
$(function(){
	$("#addressupdate").click(function(){
		$.ajax({
			url:"../../controller/memberupdatecontroller.jsp",
			data : {address1:document.getElementById("sample4_postcode").value,
					address2:document.getElementById("sample4_roadAddress").value,
					address3:document.getElementById("sample4_jibunAddress").value,
					address4:document.getElementById("sample4_detailAddress").value},
			success : function(result){
				if(result==1){
					alert("주소가수정되었습니다");
				}else{
					alert("주소수정실패");
				}
			}
			
		});
	});
	
});
	





/*주소 수정 end*/

/* 회원가입 유효성검사 */
  
	function signupcheck(){
	
		// 1. 폼 가져오기 [ 폼에 id 존재 ]	//	document.getElementById("signupform")
		// 2. 폼내 아이디 입력 input 가져오기
		var id = document.getElementById("signupform").id.value;
		var password = document.getElementById("signupform").password.value;
		var passwordconfirm = document.getElementById("signupform").passwordconfirm.value;
		var name = document.getElementById("signupform").name.value;
		var birth = document.getElementById("signupform").birth.value;
		var phone = document.getElementById("signupform").phone.value;
		var sex1 = document.getElementById("signupform").sex1.checked;	// checked 유무 가져오기 
		var sex2 = document.getElementById("signupform").sex2.checked;

		// 3. 유효성검사 [ 정규표현식 : 텍스트 패턴 검사 ] 
		var idj = /^[a-z0-9]{5,15}$/;		// 아이디 정규표현식	[ 소문자 숫자 5~15]
		var pwj = /^[A-Za-z0-9]{5,15}$/;	// 비밀번호 정규표현식[ 대,소문자 숫자 5~15]
		var phonej = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; // 연락처
		var namej = /^[A-Za-z0-9가-힣]{1,15}$/;	// 이름 정규표현식
		
		// 아이디 
		if( !idj.test( id ) ){ // 패턴이 다를경우
			
			document.getElementById("idresult").innerHTML="아이디는 소문자와 숫자 조합 5~15 사이만 가능 합니다";
			document.getElementById("idresult").style.color = "red";
			return false;// form submit 불가
			
		}else{
			document.getElementById("idresult").innerHTML="사용가능한 아이디 입니다."
			document.getElementById("idresult").style.color = "green";
		}
		
		// 패스워드 [ 두 패스워드 동일한지 검사 ]
		
		if( !pwj.test(password) || !pwj.test(passwordconfirm) ){
			document.getElementById("pwresult").innerHTML="대소문자 조합 5~15 사이만 가능합니다."; return false;
		}else if( password != passwordconfirm){
			document.getElementById("pwresult").innerHTML="패스워드가 동일하지 않습니다.";	return false;
		}else{
			document.getElementById("pwresult").innerHTML="사용가능한 패스워드 입니다.";
		}
		// 이름
		if( !namej.test(name) ){
			document.getElementById("nameresult").innerHTML="이름을 입력해주세요.[특수문자는 제외]"; return false;
		}else{
			document.getElementById("nameresult").innerHTML="";
		}
		//생년월일
		if( birth == ""){
			document.getElementById("birthresult").innerHTML="생년월일 선택해주세요"; return false;
		}else{
			document.getElementById("birthresult").innerHTML="";
		}
		// 성별
		if( !sex1 && !sex2 ){  // 둘다 false 이면 // 둘다 체크를 안했으면
			document.getElementById("sexresult").innerHTML="성별을 선택해주세요"; return false;
		}else{
			document.getElementById("sexresult").innerHTML="";
		}
		// 전화번호 
		if( !phonej.test( phone ) ){
			document.getElementById("phoneresult").innerHTML="전화번호 형식으로 입력해주세요."; return false;
		}else{
			document.getElementById("phoneresult").innerHTML="";
		}
	}

/* 회원가입 유효성검사 end */
/* 제품 상태 변경*/
	//function 함수
	function activeupdate(p_num){
		if(confirm("상태변경하시겠습니까?")==true){
			
			
			
			$(function(){ 
				alert(p_num);
				$.ajax({
					url:"../../controller/productactivcontroller.jsp",
					data :{p_num:p_num},
					success : function(result){
						
						if(result==1){

							 //js자료형이없다 
							// 현재 페이지를 초기화 현재 페이지 refresh
							location.reload();  // jequrty 메소드
						}else{
							alert("변경실패[관리자에게 문의]")
						}
					}
						
					
				});
			});
			
		}
	}

/* 제품 상태 변경끝*/
/*제품 수량 변경 */

function pchange(type,stock,price){// function 함수선정
	
	
	var pcount= document.getElementById("pcount").value*1;
					// 현재수량 가져오기//문자열-> 숫자열: 문자열*1
	
	if(type=='m'){// 마이너스 버튼을 눌렀을떄
		pcount-=1;	// 현재수량 -1
		if(pcount<1){ // 만약에 1보다 작아지면
			alert("수량은 1개 이상만 가능 합니다"); //메시지
			pcount=1;
		}
	}else if(type=='p'){ // 만약에 플러스 버튼을 눌렀으면
		pcount += 1;	// 현재 수량에 +1
		if(pcount>stock){	// 만약에 1보다 커지면
			alert("죄송합니다 재고가 부족합니다")	//메시지
			pcount=stock;
		}
	}else{// 만약에 직접 수량을 변경 입력했을떄
		if(pcount>stock){ // 만약에 1보다 작아지면
			alert("죄송합니다재고 부족"); //메시지
			pcount=stock;
			
		}
		if(pcount<1){
			alert("수량은 1개 이상만 가능 합니다."); pcount = 1;
		}
		
	}
	
	// 현재 수량을 현재수량 입력상자에 대입
	document.getElementById("pcount").value=pcount;
	
									//.value 속성태그[입력상자 input]
	var totalprice = pcount * price; // 총가격 = 제품수량 * 제품가격 
	document.getElementById("total").innerHTML = totalprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
									//.innerHTML 속성태그[div]
									//.총가격.tostring():문자열 변환
									//.replace(기존문자,새로운 문자);
									// 정규식 표현식: /\B(?=(\d{3})+(?!\d))/g
									//(앞=문자존재),(뒤="문자열 3글자")
									//1./: 시작
									//2.\b:시작 끝[예 : 1234일경우 1,4]
									//3.\d{3}: 숫자 길이 문자길이[예 :{3}: 123글자]
									//4. !\d : 뒤에 숫자 없을경우
									//5. /g : 전역검색


}

/*제품 수량 변경끝 */
/* 찜하기*/
function plike(p_num,m_num){
	alert("dsdsddd");
	if(m_num==0){alert("로그인후 찜하기 사용 가능합니다");return;}
		$.ajax({
			url: "../../controller/productlikecontroller.jsp",
			data:{p_num : p_num , m_num : m_num},
			success: function(result){
				if(result==1){
					
					document.getElementById("btnplike").innerHTML="찜하기♡";
				}else if(result==2){
					document.getElementById("btnplike").innerHTML="찜하기♥";
				}
			alert(result);
			}
		});
	
	//비동기식 통신에서 
	
}

/*찜하기 끝 */
/* 장바구니 */
 	function cartadd(){

	//id 속성을 이용
	//var p_num2 =$("#p_num").val(); 				alert("id속성:" +p_num2);
	//2. name 속성 이용
	//var p_num3=$("input[name=p_num]").val(); 	alert(" name속성:" +p_num3);
	//3. class속성 이용
	//var p_num4=$("inout[name=p_num]").val(); 	alert("class속성:" +p_num4);
	//자바스크립트[js]를 이용한 값 가져오기
	//1. id속성 이용
	var p_num=document.getElementById("p_num").value; // alert(" s  id속성:" +p_num);
	//. class 속성이용 // class 중복 허용 하기 떄문에 배열이용
	//var p_num5 = document.getElementByIdClassName("p_num")[0].value; alert(" s  class속성:" +p_num);
	//3. name 속성 이용 // name 속성 중복 허용 하기 떄문에 배열 이용
	//var p_num6 = document.getElementByName("p_num")[0].value; alert(" s  Name속성:" +p_num);
	var p_size = document.getElementById("p_size").value;  // alert(" s  id속성:" +p_size);
		
		if(p_size == 0){ // 만약에 옵션을 선택 안했으면
		
			alert("옵션 선택을 해주세요");return;
		
		}
	var p_count = document.getElementById("pcount").value; //alert(" s  id속성:" +p_count);
	//컨트롤러 페이지 이동[1.하이퍼링크2.ajax]
		//location.href="../../controller/productcartcontroller.jsp?p_num="+p_num+"&p_size="+p_size+"&p_count=?";
		$.ajax({//페이지 전환이 없음[해당페이지와 통신 갔다가 오는게 아님]
			url:"../../controller/productcartcontroller.jsp",
			data : {p_num : p_num,p_size:p_size,p_count:p_count},
			success : function(result){
				if(confirm("장바구니에 담았습니다[장비구니로 이동할까요?]")==true){
					location.href="../product/productcart.jsp";
				}
			}
			
			
		});
}
/*장바구니 끝 */
/*장바구니 삭제 */

function cartdelete(type , p_num , p_size){
	//JS<-->jsp 클래스 호환x
	$.ajax({//페이지 전환이 없음[해당페이지와 통신 갔다가 오는게 아님]
			url:"../../controller/productcartdeletecontroller.jsp",
			data : {type:type,p_num:p_num,p_size:p_size,i:-1},
			success : function(result){
			location.reload();//현재페이지 새로고침
				
				
			}
			
			
		});
}



/*장바구니 삭제끝 */
/*장바구니 수량 변경 */
function pchange2( i , type , stock , price ){
	var p_count = document.getElementById("pcount"+i).value*1;
	
	if( type=='m'){		p_count -= 1;	
		if( p_count<1){	
			alert("수량은 1개 이상만 가능 합니다."); p_count = 1;
		}
	}else if( type =="p" ){	p_count += 1;	
		if( p_count > stock ){
			alert("죄송합니다. 재고가 부족합니다.");	p_count = stock;
		}
	}else{	
		if( p_count > stock ){
			alert("죄송합니다. 재고가 부족합니다.");	p_count = stock;
		}
		if( p_count<1){	// 만약에 1보다 작아지면
			alert("수량은 1개 이상만 가능 합니다."); p_count = 1;
		}
	}
	document.getElementById("pcount"+i).value = p_count; 
	var totalprice = p_count * price; // 총가격 = 제품수량 * 제품가격 
	document.getElementById("total"+i).innerHTML = totalprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 	// . innerHTML 속성 태그 [ div ]

	$.ajax({
			url :  "../../controller/productcartdeletecontroller.jsp" ,
			data : { type : type , p_num : -1 , p_size : -1 , i : i,p_count:p_count } ,
			success : function( result ){
				location.reload(); 
			}
	});
	
}



/*장바구니 수량 변경 end */
/* 결제 방식 선택 */

function paymentselect(payselect){
	document.getElementById("payselect").innerHTML=payselect;
}


/* 결제 방식 선택끝 */

/* 결제 API 아임포트 */
function payment(){
	if(document.getElementById("payselect").innerHTML==""){
		alert("결재방식을선택해주세요")
		return;
	}
	 var IMP = window.IMP; // 생략 가능
	IMP.init("imp62668435"); //본인 관리자 식별 코드
	 IMP.request_pay({ // 결제 요청변수
	      pg: "html5_inicis", //pg사[ 아임포트 관리자페이지에서 선택한 pg사 ]
	      pay_method: document.getElementById("payselect").innerHTML,//결제방식
	      merchant_uid: "ORD20180131-0000011", //주문번호[별도]
	      name: "나만의 쇼핑몰",// 결제창 나오는 결제 이름
	      amount: document.getElementById("totalpay").innerHTML, // 결제 금액
	      buyer_email: "gildong@gmail.com",
	      buyer_name: $("#name").val(),
	      buyer_tel: $("#phone").val(),
	      buyer_addr: $("#sample4_roadAddress").val()+","+$("#sample4_jibunAddress").val()+","+$("#sample4_detailAddress").val(),
	      buyer_postcode:$("#sample4_postcode").val()//우편번호
	  }, function (rsp) { // callback
	      if (rsp.success) {// 결재 성공했을떄 -> 주문 완료 페이지로 이동
          } else {
	
             // 결재 실패 했을떄
					// 테스트 : 결제성공
			$.ajax({
				url :"../../controller/productpaymentcontroller.jsp",
				data:{
					order_name :$("#name").val(),
					order_phone :$("#phone").val(),
					order_address :$("#sample4_roadAddress").val()+","+$("#sample4_jibunAddress").val()+","+$("#sample4_detailAddress").val(),
					order_pay : document.getElementById("totalpay").innerHTML,
					order_payment : document.getElementById("payselect").innerHTML ,
					delivery_pay : 3000,
					order_request : document.getElementById("prequest").value
					
				},
				success:function(result){//결재 성공과 db처리 성공시 결제 주문 완료 페이지 이동
					if(result==1){
						location.href="productpaymentsuccess.jsp";
						
					}else{alert("주문db오류 관리자에게 문의")}
					
				}
			})
			
          }
      });
}

/* 결제 API 아임포트 END*/






/*결제창에서 회원가 동일 체크 했을떄 */
	// 체크 유무 검사[jquery]
	//$(document).ready(function(){실행문});// 문서내에서 대기상태 이벤트
	$(document).ready(function(){
		
		//체크유무검사
		$("#checkbox").change(function(){
			
			// 체크박스가 변경 이벤트
			if($("#checkbox").is(":checked")){
				//체크박스가 is 확인하는거 혹은 선택하는거 체크박스가 체크가 되었는지 확인=TRUE
					//is : 해당 태크에 속성찾기 유무를 찾아줌 [":속성명"](체크드가있는지 없는지)
					$("#name").val($("#mname").val());
					$("#phone").val($("#mphone").val());
			
			}else{// 체크 해제시 공백채움
				$("#name").val("");
				$("#phone").val("");
				
			}
		});
	
	$("#checkbox2").change(function(){
		
		if($("#checkbox2").is(":checked")){
			$("#sample4_postcode").val($("#address1").val());
			$("#sample4_roadAddress").val($("#address2").val());
			$("#sample4_jibunAddress").val($("#address3").val());
			$("#sample4_detailAddress").val($("#address4").val());
		}else{
			$("#sample4_postcode").val("");
			$("#sample4_roadAddress").val("");
			$("#sample4_jibunAddress").val("");
			$("#sample4_detailAddress").val("");
			
		}
	});
});	
/*결제창에서 회원과 동일 체크 end */

/* 결제정보시댝*/

	function pointcheck(mpoint){
		
		var point = document.getElementById("point").value*1;
		
		if(mpoint<point){
			alert("포인트가 부족합니다"); return;
		}else{
	 		var usepoint = document.getElementById("usepoint").innerHTML=point;
			var totalprice =  document.getElementById("totalprice").innerHTML*1;
			var totaldeliverypay =  document.getElementById("totaldeliverypay").innerHTML*1;
			var totalpay =  totalprice +  totaldeliverypay - usepoint ;
			
			//document.getElementById("totaldeliverypay").innerHTML*1
			document.getElementById("totalpay").innerHTML=totalpay;
		}
		
	}


/*결제정보 끝 */
	var item =2; // 기본 주문 2개를 제외한 세번쨰 주문 부터
	//$(window):현재창
	$(window).scroll(function(){ 
/*스크롤 : jquery  $(window).scrollTop() : 현재 스크롤의 위치*/
	
	alert("현재 스크롤 위치[보이는 화면]:"+$(window).scrollTop());
	alert("현재 화면의 높이[보이는화면] :"+$(window).height());
	alert("문서 높이[보이지 않는 화면까지 포함] :"+$(document).height());
	// 스크롤에 바닥에 닿았을떄 계산
	if($(window).scrollTOP()==$(document).height()-$(window).height()){
		//(문서전체)현재스크롤위치==문서전체높이- 현재 문서높이
		$.ajax({
			url:"../../controller/orderlistcontroller.jsp",
			data:{ item : item },
			sucess:function(result){
				$("section").append(result);
			}
		});
		item; //스크롤 이벤트가 실행될떄마다 주문 1씩 증가
	
		
	}
	
	});
/*스크롤 끝/
	//js 에서 변수 저장하는 방법
	// 1. var 변수명 =값  : 하나의 값 저장
	//2. var 배열명 =[]  : 여러개 값 저장
	// 3. var json={}  : 여러개 엔트리 (키, 값)저장
	/*json */
	// var : 변수자료형[js 는 자료형 없다]
	//배열 형식[]
 /*var arr =[1,2,3,4]*/
//json 형식[java map]
 /*var test = {'id':'qweqwe','password':'qweqwe'}
		//키: 값-> 한쌍[엔트리]
	var keys = object.keys(test); // object.key(jason 변수명): 모든 키 호출[]
		
	for(var i =0;i<keys.length; i++){ // 키의 개수만큼 반복
	var key=key[i];
		alert("키 : "+key+"값:"+test[key]); // 키의 값출력
		
	}*/
	// Json 형식으로 가져오기
	
	//$.getJSON('경로/파일명', function(jsons인수명)
	$.getJSON('../../controller/productchart.jsp', function(jsonObject){	
		var keyval =[]; // 모든 키를 저장하는 배열
		var valueval=[]; // 모든 값을 저장하는 배열
		var  keys= Object.keys(jsonObject);
		for(var i =0;i<keys.length; i++){ // 키의 개수만큼 반복
		keyval[i]=keys[i];
		valueval[i] = jsonObject[keyval[i]];
		}	
		


/*차트 만들기 */
	//1. 차트를 표시할 위치 선정
	var content = document.getElementById("mychart").getContext("2d");
	//2. 차트 변수 만들기
	//var 차트이름 = new Chart("차트위치",{차트속성1 : 값1 , 차트속성2 : 값2 , 차트속성3 : 값3})
	var myChart = new Chart(content,{
		type: 'pie', // 차트의 형태[bar :막대차트 // line : 선차트 등등]
		data : {	// 차트의 데이터 [가로축, 세로축, 계열값]  //데이터 start
			labels : [1,2,3],  // 가로축	
			datasets:[					//계열 추가[{계열1}],[{계열2}],[{계열3}]
				{// 하나의 범례	=계열
				label: '날짜별제품주문수', //계열 이름	
				data :valueval,	//계열 값
			
					backgroundColor: [//계열색상
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [//계열테두리 색상
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderWidth: 1  //계열 테두리 굵기
			       }]
			    },
			    options: {	//차트 옵션
			        scales: {
			            y: { //y 세로축
			                beginAtZero: true // 기본값 :0부터 시작
			            }
			        }
			    }
			});

	});
	/*json end */
/*차트 만들기 끝 */















 
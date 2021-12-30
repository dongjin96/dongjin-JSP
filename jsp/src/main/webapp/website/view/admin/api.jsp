
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class ="container">
	<table class="table">
	
	
	
	
	
	<% //api 가져오기[json 형식]
		//스트림을통해서 외부 데이터를 자바로 가져와버림
		//1. 요청 URL만들기
		URL url = new URL("https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=300&serviceKey=wFQ1cupvTTpTrSsp4B9npy0vOgC6fMq7nKkKc8tOGjpCyRwdrYJ98hk55ipsLP6kX6lQj9zdcpN2gUd0WjmeBw%3D%3D");
		//2. 스트림 버퍼를 통한 URL내 HTML 읽어오기
		BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
			//BufferReader : 외부[이클립스외] 입출력
				//InputStreadReader(스트림, 인코딩 타입): 입출력 스트림
				//url.openStream() : 바이트 단위로 url 내용 읽기
		//3. 읽어온 내용 문자열 담기
		String result = bf.readLine(); // .read() 는 하나하나 읽어오기 .readLine();은 모든줄다읽어온다
		//3. 읽어온 내용을 json 으로 파싱[변경] 하기 	
		JSONParser jsonParser = new JSONParser();
			//jsonparser json데이터 넣어서 파싱
		JSONObject jsonObject =(JSONObject)jsonParser.parse(result);
		//1. JSONparser json 데이터 넣어서 파싱 //2. jsonobject 형 변환
			//1.JSONparser json데이터 넣어서 파싱
		JSONArray jsonArray = (JSONArray)jsonObject.get("data");
		// "data"란는 키 요청해서 배열담기
		for(int i =0; i<jsonArray.size(); i++){
		    JSONObject content = (JSONObject)jsonArray.get(i);
				//반복문 통한 리스트내 i번쨰 호출
			System.out.println(content);
		    %>
		    	<tr>
		    		<td><%=content.get("facilityName") %></td> <!-- json명.get("키") -->
		    		<td><%=content.get("address") %></td>
		    		<td><%=content.get("phoneNumber") %></td>
		    		<td>위도<%=content.get("lat") %>경도<%=content.get("lng") %></td>
		    		<td><button onclick="map(<%=i%>,<%=content.get("lat")%>,<%=content.get("lng") %>)" >지도보기</button>
		    		</td>
		    		
		    	</tr>	
		    		<tr>		<!-- 지도를 표시할 div 입니다 -->
						<td colspan="5"><div id="map<%=i %>" style="width:100%;height:350px; display: none;"></div></td>
		    		</tr>
		
		<%} %>    
	</table>
	
	</div>	
</body>
</html>
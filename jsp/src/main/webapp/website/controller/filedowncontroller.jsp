<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.print.DocFlavor.INPUT_STREAM"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.coyote.http11.filters.BufferedInputFilter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	//파일 이름 요청
	request.setCharacterEncoding("utf-8");
	String filename = request.getParameter("file");
	//서버내 업로드폴더에서 파일찾기
	String folderpath = request.getSession().getServletContext().getRealPath("website/upload"+filename);
						// request.getSession().getServletContext().getRealPath:  서버내경로찾기
	//해당 파일을 객체화
	
	File file = new File( folderpath );
	
	//다운 로드 형식변경 (크롬 하단 익스플로우는 위ㅣ로)
	response.setHeader("Content-Disposition", "attachment;filename="+filename+";");// 파일내 바이트 길이 메소드
	//내보내기[스트림(바이트)]
			//1. 배열선언
			
	if(file.isFile()){ //  file.isfile() 파일이 있는지 없는 지 유무확인
		//입력스트림
		BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(file));
		byte[] bytes = new byte[(int)file.length()]; //file.legnth 파일내 바이트 길이 메소드
		inputStream.read(bytes);
		//출력스트림	
		BufferedOutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
		outputStream.write(bytes );
		//
		
	
		inputStream.close();  // 입력 스트림 닫기
		outputStream.close();	// 출력스트림 닫기  용량크면 오류날수도있음
	}
%>
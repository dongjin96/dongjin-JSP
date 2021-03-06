package dto;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;


import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;





//@ : 어노테이션 [ 메타데이터 ] : 미리 만들어진 정보(코드,메모리) 를 제공 받음
@ServerEndpoint("/chatting2/{roomnum}") // 1.서버소켓[종작첨] ( 경로생성 )
public class Chatting {
	private Integer roomnum = 0;
	// * 접속된 세션(회원)을 저장하는 리스트 [ Arraylist vs Vector(동기화) ]
	
	private static Map<Session, Integer> clients = new Hashtable<Session,Integer>();	
	
	// 2. 클라이언트가 서버로부터 접속 요청
	@OnOpen // 소켓 접속하는 어노테이션 
	public void onOpen( Session session , @PathParam("roomnum")int roomnum ) {
		this.roomnum=roomnum;//전달 받은 인수를 방번호 변수에 저장
		clients.put(session,this.roomnum);	// 리스트에 추가 
		
		/*
		 * System.out.println(session.getId());//세션번호확인
		 * System.out.println("현재접속한 세션들"+clients);현재 접속한 세션들
		 */
	}
	// 3. 클라이언트가 서버로부터 접속 해지
	@OnClose // 소켓 닫는 어노테이션 
	public void onClose( Session session ) {
		clients.remove(session); // 방 번호가 제거가되어서 방나가기 가되어버림
	}
	
	// 4.서버가 클라이언트로부터 메시지 받는 메소드 
	@OnMessage	// 메시지를 받는 어노테이션 
	public void onMessage( String msg , Session session ) throws IOException {
	    				//메시지, 보낸사람 [세션]
	    
	    for( Session key : clients.keySet()) {//모든 키 가져오기
		if(clients.get(key)==Integer.parseInt(msg.split(",")[0])) {//해당 키에 값 == 방번호
			// 모든 리스트에 저장된[ 접속된 ] 메시지 보내기 
			if( !key.equals(session) ) { // 본인을 제외한
				// 본인을 제외한 모든 사람에게 
				key.getBasicRemote().sendText(msg);
			}
		}
	}
    /*
     * 오류 발새이 자동 소켓 닫기
     * //4. 서버가 클라이언트로부터 오류 받는 메소드
     * 
     * @OnMessage //클라이언트 오류 어노테이션 public void onError(Session session) {
     * 
     * }
     */
}
}

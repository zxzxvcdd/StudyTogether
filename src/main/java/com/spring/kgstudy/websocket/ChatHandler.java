package com.spring.kgstudy.websocket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChatHandler extends TextWebSocketHandler{

	Map<String,WebSocketSession> sessions = new HashMap<String,WebSocketSession>();

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println(session.getId()+" 연결");
	
		String sessionId = session.getId();
		sessions.put(sessionId,session);
	
		
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		
		
		System.out.println(session.getId()+" 연결 종료");
		sessions.remove(session.getId());
		
		
		
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(session.getId()+"가 메시지 전송"+message.getPayload());
		
		for(WebSocketSession s : sessions.values()) {
			
			s.sendMessage(message);
			
			System.out.println(session.getId()+"로 메시지 발송: "+ message.getPayload());
			
			
		}
		
	
	}
	
	
	

	
	
	
	
	
}

package com.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class tetrisSoketHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterConnectionEstablished :" + session);
		
		if(sessions.size() <2) {			
			sessions.add(session);
			System.out.println("추가 세션 id:"+ session.getId() + " 현재 접속 세션수:" + sessions.size() + "명");
			if(sessions.size() ==2) {
				for (WebSocketSession sess : sessions) {		
					sess.sendMessage(new TextMessage("connect"));
				}
			}
		}else {
			session.sendMessage(new TextMessage("over"));
		}
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		// 메세지 받았고
		
		for (WebSocketSession sess : sessions) {
		
			if( sess.getId() != session.getId()) {				
				sess.sendMessage(new TextMessage(message.getPayload()));
			}
		}
		
		
	
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterConnectionClosed :" + session);
		
		sessions.remove(session);
		for (WebSocketSession sess : sessions) {
			
			if( sess.getId() != session.getId()) {				
				sess.sendMessage(new TextMessage("out"));
			}
		}
		System.out.println("퇴장 세션 id:"+ session.getId() + " 현재 접속 세션수:" + sessions.size() + "명");
		
	}

	
	
	
	
}

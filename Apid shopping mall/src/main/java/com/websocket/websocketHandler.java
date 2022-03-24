package com.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.dto.MemberDTO;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;

public class websocketHandler extends TextWebSocketHandler{

	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	
	// 연결후.. 
	@Override
	public void afterConnectionEstablished(WebSocketSession session ) throws Exception {
		// TODO Auto-generated method stub
		
//		HttpServletResponse response = null;
//		response.setHeader("Set-Cookie", "Test1=TestCookieValue1; Secure;SameSite=None");
//		response.addHeader("Set-Cookie", "Test2=TestCookieValue2; Secure;SameSite=None");
//		response.addHeader("Set-Cookie", "Test3=TestCookieValue3; Secure;SameSite=None");
		
		System.out.println("afterConnectionEstablished :" + session);

//		String sendId = getId(session);
//		System.out.println(sendId);
//		userSessions.put(sendId, session);
		
		sessions.add(session);
		System.out.println("추가 세션 id:"+ session.getId() + " 현재 접속 세션수:" + sessions.size() + "명");
		
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
	
		// 메세지 받았고
		System.out.println("handleTextMessage :"  + message);
		
		try {
			//json 으로 받는법 . 그리고 json을 map 으로변환하기.. 
			String msg = message.getPayload();
			
			System.out.println("msg: " + msg);
			
			ObjectMapper mapper = new ObjectMapper();
			
			JSONPObject json = new JSONPObject("JSON.parse", msg);
			String jsonStr = mapper.writeValueAsString(json);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map = mapper.readValue(msg, new TypeReference<Map<String,String>>() {
			});
			
			// 멥이로 
			System.out.println(map);
			System.out.println(map.get("name"));
		}catch (JsonMappingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}catch (JsonGenerationException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
				  
		
		// 한명한테 메세지 보내는법. 
		//session.sendMessage(new TextMessage("너한테만 보낸다."));
		 

		//메세지 전체에게..  전달하는법
		for (WebSocketSession sess : sessions) {
			System.out.println(sess);
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
		
		//메세지 전달하는법
		
		// 전체에게 전달하는 법
		
		
		// 특정인에게만 메세지 전달하는 법 <- WebSocketSession 과 httpSession의 호환성을 이용해서 특정인에게 메세지 전달가능

		
		
		
	}

	private String getId(WebSocketSession session) {
		// TODO Auto-generated method stub
		Map<String, Object> httpSession = session.getAttributes(); // 웹소켓 session -> httpSession으로 전달
		
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		
		HttpSession hsession = request.getSession();  
		// 	
		  MemberDTO login_member = (MemberDTO )hsession.getAttribute("login_member");
		  if( login_member == null) { 
			  return session.getId(); 
		  }else { 
			  return login_member.getMid(); 
			}
	
	}

	//연결 종료시 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterConnectionClosed :" + session);
		
		sessions.remove(session);
		System.out.println("퇴장 세션 id:"+ session.getId() + " 현재 접속 세션수:" + sessions.size() + "명");
		
		
	}

	
	
}

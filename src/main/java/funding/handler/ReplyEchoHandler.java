package funding.handler;

import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler {

//	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
//
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception { //웹소켓이 연결되었을 때 코드를 처리하는 메서드
//		System.out.println("afterConnectionEstablished" + session);
//		sessions.add(session);
//	}
//
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception { //웹소켓 서버로 메세지를 전송했을 때 호출되는 메서드
//		System.out.println("handleTextMessage" + session + " : " + message);
//		String senderId = session.getId();
//		for (WebSocketSession sess : sessions) {
//			// sess.sendMessage(new TextMessage(senderId + " : " + message.getPayload()));
//			sess.sendMessage(new TextMessage(message.getPayload()));
//		}
//	}
//
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { //클라이언트와 연결이 끊어진 경우 호출될 메서드
//		System.out.println("handleTextMessage" + session + " : " + status);
//		sessions.remove(session);
//	}
}

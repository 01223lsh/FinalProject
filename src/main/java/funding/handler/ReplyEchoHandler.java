package funding.handler;

import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler {

//	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
//
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		System.out.println("afterConnectionEstablished" + session);
//		sessions.add(session);
//	}
//
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		System.out.println("handleTextMessage" + session + " : " + message);
//		String senderId = session.getId();
//		for (WebSocketSession sess : sessions) {
//			// sess.sendMessage(new TextMessage(senderId + " : " + message.getPayload()));
//			sess.sendMessage(new TextMessage(message.getPayload()));
//		}
//	}
//
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		System.out.println("handleTextMessage" + session + " : " + status);
//		sessions.remove(session);
//	}
}

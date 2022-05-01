package funding.handler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import funding.controller.RoomController;

@Component
public class ChatHandler extends TextWebSocketHandler {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);

	private static List<WebSocketSession> list = new ArrayList<>();

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String payload = message.getPayload();
		logger.info("payload : " + payload);

		for (WebSocketSession sess : list) {
			sess.sendMessage(message);
		}
	}

	/* Client가 접속 시 호출되는 메서드 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		list.add(session);

		logger.info(session + " 클라이언트 접속");
	}

	/* Client가 접속 해제 시 호출되는 메서드 */

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		logger.info(session + " 클라이언트 접속 해제");
		list.remove(session);
	}
}

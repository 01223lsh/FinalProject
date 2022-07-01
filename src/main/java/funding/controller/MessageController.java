package funding.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.web.bind.annotation.RestController;

import funding.dto.ChatMessage;

@RestController
public class MessageController {

	private static Logger log = LoggerFactory.getLogger(MessageController.class);

	@Autowired
	private SimpMessageSendingOperations sendingOperations;

	// setApplicationDestinationPrefixes() 설정에 따라
	// 실질적인 경로는 "/app/chat/message" 가 된다.
	// 해당 경로로 보내는 메시지 처리
	@MessageMapping("/chat/message")
	public void enter(ChatMessage message) {
		// 메시지 타입이 ENTER 인 경우 환영 메시지 출력
		System.out.println("컨트롤러 도착 테스트");
		System.out.println("메시지 객체 확인: " + message);

		log.info("test : {}", message);
		// "/topic/chat/room/{roomId}" 를 구독하고 있는 클라이언트에게 메시지 전달
		sendingOperations.convertAndSend("/topic/chat/room/" + message.getChatroomId(), message);
		log.info("구독 클라이언트에게 메시지 전달");
	}

}
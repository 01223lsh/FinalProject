package funding.controller;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.web.bind.annotation.RestController;

import funding.dto.ChatMessage;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MessageController {

	@Autowired
	private SimpMessageSendingOperations sendingOperations;

//    private SimpMessagingTemplate messagingTemplate;

	// setApplicationDestinationPrefixes() 설정에 따라
	// 실질적인 경로는 "/app/chat/message" 가 된다.
	// 해당 경로로 보내는 메시지 처리
	@MessageMapping("/chat/message")
	public void enter(ChatMessage message, @Payload String payload, Message m, MessageHeaders messageHeaders,
			MessageHeaderAccessor messageHeaderAccessor
			// , @Header String header
			, @Headers Map<String, String> headerMap
			// , @DestinationVariable String destination
			, Principal principal) {
		// 메시지 타입이 ENTER 인 경우 환영 메시지 출력
		System.out.println("컨트롤러 도착 테스트");
		System.out.println("메시지 객체 확인: " + message);
//		if (ChatMessage.MessageType.ENTER.equals(message.getType())) {
//			message.setMessage(message.getSender() + "님이 입장하였습니다.");
//		}
//		if (ChatMessage.MessageType.EXIT.equals(message.getType())) {
//			message.setMessage(message.getSender() + "님이 퇴장하셨습니다.");
//		}
//		log.info("test : {}", message);
		// "/topic/chat/room/{roomId}" 를 구독하고 있는 클라이언트에게 메시지 전달
		sendingOperations.convertAndSend("/topic/chat/room/" + message.getChatroomId(), message);
//		log.info("구독 클라이언트에게 메시지 전달");

		// 파라미터 학습용
//        log.info("Message: {}", m);
//        log.info("MessageHeaders: {}", messageHeaders);
//        log.info("MessageHeadersAccessor: {}", messageHeaderAccessor);
//        //log.info("Header: {}", header);
//        log.info("HeaderMap: {}", headerMap);
//        log.info("페이로드: {}", payload);
//        //log.info("Destination: {}", destination);
//        log.info("Principal: {}", principal);
	}

//	@MessageMapping("/message/to-target")
//	// @SendToUser(destinations = "/queue/data")
//	public void target(ChatMessage message, SimpMessageHeaderAccessor accessor) {
//		// convertAndSendToUser(String user, String destination, Object payload)
//		// destination 은 UserDestinationMessageHandler 를 통해서 "/user/{username}/endpoint"
//		// 의 형태로 변환된다.
//		// -> /user/test11/topic/data
////        sendingOperations.convertAndSendToUser(message.getTargetUser(), "/queue/data", message);
//
//		sendingOperations.convertAndSend("/queue/user-" + message.getTargetUser(), message);
//
////        log.info("message: {}",message);
////        log.info("simpHeader: {]", accessor);
//
////        String sessionId = accessor.getSessionAttributes().get("HTTP.SESSION.ID").toString();
////        System.out.println(sessionId);
////        //accessor.setSessionId(sessionId);
////        System.out.println("simpHeader: " + accessor);
////        return message;
//	}

}
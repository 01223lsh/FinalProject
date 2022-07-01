package funding.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import lombok.RequiredArgsConstructor;

@EnableWebSocketMessageBroker // websocket 서버를 사용한다는 설정
@RequiredArgsConstructor // 의존성 주입의 편의성을 위해 사용
@Configuration // 스프링 설정 클래스를 선언
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer {

	private static Logger log = LoggerFactory.getLogger(StompWebSocketConfig.class);

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// 웹소켓 지원하지 않는 브라우저 SockJS 사용
		registry.addEndpoint("/ws/chat") // 클라이언트에서 websocket에 접속하기위한 endpoint를 등록
				// WebSocket 세션에서 HTTPSession 값을 사용할 수 있도록 해주는 인터셉터
				.addInterceptors(new HttpSessionHandshakeInterceptor())
				.setAllowedOriginPatterns("http://localhost:8081").withSockJS(); // setAllowedOrigins("*")에서 *라는 와일드 카드를
																					// 사용하면 보안상의 문제로 전체를 허용하는 것보다 직접 하나씩
																					// 지정해주어야 한다고 한다.
		log.info("웹소켓 엔드포인트 설정");
	}

	// STOMP 메시지 브로커 설정
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// 메시지 주고 받을 경로 설정, 스프링 내장 브로커 사용
		// "/queue", "/topic" 이 prefix 로 붙은 경우 메시지 브로커가 해당 경로를 가로챈다.
		// 가로챈 메시지를 채팅방을 구독하고 있는 클라이언트에게 전달
		// "/queue" 는 주로 1:1 메시징, "/topic" 은 주로 1:N 메시징에 사용
		registry.enableSimpleBroker("/queue", "/topic");// 메시지 브로커가 /queue, /topic 접두사가 붙은 클라이언트로 메시지를 전달할 수 있도록 설정
		log.info("스프링 내장 브로커 사용");
		// 메시지를 보낼 때 관련 경로를 설정
		// 클라이언트가 메시지를 보낼 떄 "/app"이 붙어 있으면 @MessageMapping 메소드 보내진다.
		registry.setApplicationDestinationPrefixes("/app"); // app로 접근하는 메시지만 핸들러로 라우팅
		log.info("/app prefix 적용");

	}
}

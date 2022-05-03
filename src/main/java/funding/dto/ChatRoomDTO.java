package funding.dto;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomDTO {

	private String chatRoomId; // 룸아이디
	private String roomName; // 룸 이름
	private Set<WebSocketSession> sessions = new HashSet<>(); // WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션

	public static ChatRoomDTO create(String roomname) {
		ChatRoomDTO room = new ChatRoomDTO();

		room.chatRoomId = UUID.randomUUID().toString();
		room.roomName = roomname;
		return room;
	}

}

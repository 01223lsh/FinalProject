package funding.dto;

import java.sql.Date;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomDTO {

	private String chatroomId; // 룸아이디
	private String receiverId; // 받는사람
	private String senderId; // 보낸 사람
	private String chatContent; // 메세지내용
	private Date sendTime; // 메세지 전송시간
	private int read; // 읽음여부

	public static ChatRoomDTO create(String name) {
		ChatRoomDTO room = new ChatRoomDTO();

		room.chatroomId = UUID.randomUUID().toString();
		room.receiverId = name;
		return room;
	}
}

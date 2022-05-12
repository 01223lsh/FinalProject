package funding.dto;

import java.util.UUID;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatRoom {

	private String chatroomId; // 채팅방 번호
	private String memberNo; // 메세지 받는 유저 번호
	private String chatroomName; // 프로젝트 제목

	public static ChatRoom create(String name) {
		ChatRoom room = new ChatRoom();
		room.chatroomId = UUID.randomUUID().toString();
		room.chatroomName = name;
		return room;
	}
}

//	private String chatRoomId; // 룸아이디
//	private String senderEmail; // 보낸사람 이메일
//	private String senderName; // 보낸사람 이름
//	private String receiverEmail; // 받는사람 이메일
//	private String receiverName; // 받는사람 이름
//	private int unReadCount; // 안 읽은 메세지 수

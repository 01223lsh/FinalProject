package funding.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessageDTO {

	private String chatRoomId; // 룸아이디
	private String receiverId; // 받는사람
	private String senderId; // 보낸 사람
	private String chatContent; // 메세지내용
	private Date sendTime; // 메세지 전송시간
	private int read; // 읽음여부

	public void setMessage(String string) {

	}

}

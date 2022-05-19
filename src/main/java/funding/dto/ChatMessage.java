package funding.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Getter
//@Setter
//@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ChatMessage {

	public enum MessageType {
		ENTER, TALK, EXIT
	}

	private MessageType type;
	// 채팅방 ID
	private String chatroomId;
	// 보내는 사람
	private String sender;
	// 내용
	private String message;
	// 대상 유저
	private String targetUser;
	@Override
	public String toString() {
		return "ChatMessage [type=" + type + ", chatroomId=" + chatroomId + ", sender=" + sender + ", message="
				+ message + ", targetUser=" + targetUser + "]";
	}
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
	public String getChatroomId() {
		return chatroomId;
	}
	public void setChatroomId(String chatroomId) {
		this.chatroomId = chatroomId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTargetUser() {
		return targetUser;
	}
	public void setTargetUser(String targetUser) {
		this.targetUser = targetUser;
	}
	
	

}

//	private String chatRoomId; // 채팅방 번호
//	private String messageId; // 메세지 번호
//	private String message; // 메세지 내용
//	private String name; // 보낸사람 이름
//	private String email; // 보낸사람 이메일
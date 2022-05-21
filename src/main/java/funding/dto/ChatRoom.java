package funding.dto;

public class ChatRoom {

	private int chatroomId; // 채팅방 번호
	private int projectNo; // 프로젝트 넘버

	@Override
	public String toString() {
		return "ChatRoom [chatroomId=" + chatroomId + ", projectNo=" + projectNo + "]";
	}

	public int getChatroomId() {
		return chatroomId;
	}

	public void setChatroomId(int chatroomId) {
		this.chatroomId = chatroomId;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

//	private String chatroomName; // 프로젝트 제목

//	public static ChatRoom create(String name) {
//		ChatRoom room = new ChatRoom();
//		room.chatroomId = UUID.randomUUID().toString();
//		room.chatroomName = name;
//		return room;
//	}
}

//	private String chatRoomId; // 룸아이디
//	private String senderEmail; // 보낸사람 이메일
//	private String senderName; // 보낸사람 이름
//	private String receiverEmail; // 받는사람 이메일
//	private String receiverName; // 받는사람 이름
//	private int unReadCount; // 안 읽은 메세지 수

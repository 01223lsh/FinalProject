package funding.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import funding.dao.face.ChatDao;
import funding.dto.ChatRoom;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ChatRoomRepository { // 채팅방을 생성하고 정보를 조회함

	@Autowired
	private ChatDao chatDao;

	// 채팅방 생성
	@Override
	public ChatRoom createChatRoom(String name) {
		ChatRoom chatRoom = ChatRoom.create(name);
		chatDao.insertChatRoom(chatRoom);
		// chatDao.put(chatRoom.getchatroomId(), chatRoom);
		log.info("생성된 채팅방: {}", chatRoom);
		return chatRoom;
	}

	// 채팅방 하나 불러오기
	@Override
	public ChatRoom findRoomById(String roomId) {
		log.info("조회된 채팅방: {}", chatDao.selectChatRoomByroomId(roomId));
		return chatDao.selectChatRoomByroomId(roomId);
	}

//	public ChatRoom createChatRoom(ChatRoom chatRoom) {
//
//		return chatDao.insertChatRoom(chatRoom);
//
//		ChatRoom chatroom = ChatRoom.create(name);
//		chatDao.put(chatroom.getChatroomId(), chatroom);
//		return chatroom;
//	}
//
//	public ChatRoom findRoomById(String chatroomId) {
//		return chatDao.selectChatRoomByroomId(chatroomId);
//	}

}
//	public int getChatRoom(ChatRoom chatRoom) {
//
//		return chatDao.selectChatRoom(chatRoom);
//	}
//
//	public int insertchatMessage(ChatMessage chatMessage) {
//		return chatDao.insertChatMessage(chatMessage);
//	}

//	public List<ChatRoom> findAllRooms(ChatRoom chatRoom) {
//		// 채팅방 생성 순서 최근 순으로 반환
//		List<ChatRoom> result = chatDao.selectChatRoomList(chatRoom);
//		Collections.reverse(result);
//		return result;
//	}
//
//	public List<ChatMessage> chatmessageList(String chatRoomId) {
//		return chatDao.selectChatmessageByroomId(chatRoomId);
//	}

package funding.repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import funding.dao.face.ChatDao;
import funding.dto.ChatRoom;
import funding.dto.Project;

@Repository
//@Slf4j
public class ChatRoomRepository { // 채팅방을 생성하고 정보를 조회함

	private static Logger log = LoggerFactory.getLogger(ChatRoomRepository.class);

	@Autowired
	private ChatDao chatDao;

	// 채팅방 생성
	public ChatRoom createChatRoom(int projectNo) {
		// ChatRoom chatRoom = ChatRoom.create(name); //네임이 필요가 없으니깐
		// chatDao.put(chatRoom.getchatroomId(), chatRoom);
		// log.info("생성된 채팅방: {}", chatRoom);
		return chatDao.insertChatRoom(projectNo);
	}

	// 채팅방 하나 불러오기
	public ChatRoom findRoomById(int projectNo) {
		log.info("조회된 채팅방: {}", chatDao.selectChatRoomByroomId(projectNo));
		return chatDao.selectChatRoomByroomId(projectNo);
	}

	// 특정 프로젝트 불러오기
	public Project getProject(Project project) {

		return chatDao.selectProject(project);
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

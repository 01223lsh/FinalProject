package funding.dao.face;

import org.springframework.stereotype.Repository;

import funding.dto.ChatRoom;
import funding.dto.Project;

@Repository
public interface ChatDao {

	// 새로운 채팅방 생성
	public ChatRoom insertChatRoom(int projectNo);

	// roomId를 이용하여 채팅방 찾기
	public ChatRoom selectChatRoomByroomId(int projectNo);

	// 특정 프로젝트 찾기
	public Project selectProject(Project project);

}

//	// DB에 채팅방이 있는지 조회
//	public int selectChatRoom(ChatRoom chatRoom);

//	// 채팅방 목록 조회
//	public List<ChatRoom> selectChatRoomList(ChatRoom chatRoom);

//	// 프로젝트 제목 불러오기
//	public Project selectProjectTitle(Project project);
// roomId를 이용하여 채팅 내용 목록 조회

/*
 * // 채팅 메세지 DB 저장 public int insertChatMessage(ChatMessage chatMessage);
 */
//	public List<ChatMessage> selectChatmessageByroomId(String chatroomId);

//	// 안읽은 메세지 총 수
//	public int selectTotalCntUnRead(ChatMessage chatMessage);
//
//	// 읽음여부 처리 1-안읽음 0-읽음
//	public int updateCount(ChatMessage chatMessage);
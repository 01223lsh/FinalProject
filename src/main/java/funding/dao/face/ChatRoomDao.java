package funding.dao.face;

import java.util.List;

import funding.dto.ChatRoomDTO;

public interface ChatRoomDao {

	// 모든 채팅방 목록 조회( 채팅방 생성 최근 순으로 반환)
	public List<ChatRoomDTO> selectList();

	// id를 이용한 채팅방 조회
	public ChatRoomDTO selectRoomById(String id);

	// 새로운 채팅방 생성
	public ChatRoomDTO insertChatRoom(String name);

}

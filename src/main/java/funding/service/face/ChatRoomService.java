package funding.service.face;

import java.util.List;

import funding.dto.ChatRoomDTO;

public interface ChatRoomService {

	// 모든 채팅방 목록 조회( 채팅방 생성 최근 순으로 반환)
	public List<ChatRoomDTO> findAllRooms();

	// id를 이용한 채팅방 조회
	public ChatRoomDTO findRoomById(String id);

	// 새로운 채팅방 생성
	public ChatRoomDTO createChatRoomDTO(String name);

}

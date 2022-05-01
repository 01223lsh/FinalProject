package funding.repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import funding.dto.ChatRoomDTO;

@Repository
public class ChatRoomRepository {

	private Map<String, ChatRoomDTO> chatRoomDTOMap;

	@PostConstruct
	private void init() {
		chatRoomDTOMap = new LinkedHashMap<>();
	}

	public List<ChatRoomDTO> findAllRooms() {
		// 채팅방 생성 순서 최근 순으로 반환
		List<ChatRoomDTO> result = new ArrayList<>(chatRoomDTOMap.values());
		Collections.reverse(result);

		return result;
	}

	public ChatRoomDTO findRoomById(String id) {
		return chatRoomDTOMap.get(id);
	}

	public ChatRoomDTO createChatRoomDTO(String name) {
		ChatRoomDTO room = ChatRoomDTO.create(name);
		chatRoomDTOMap.put(room.getChatroomId(), room);

		return room;
	}
}

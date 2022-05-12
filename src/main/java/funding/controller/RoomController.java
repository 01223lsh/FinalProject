package funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import funding.dto.ChatRoom;
import funding.repository.ChatRoomRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
public class RoomController {

	@Autowired
	private ChatRoomRepository repository;

	// 채팅방 생성
	@PostMapping("/room")
	@ResponseBody
	public ChatRoom createRoom(@RequestParam String memberno) {
		log.info("[/chat/room][POST]");
		log.info("요청파라미터: {}", memberno);
		return repository.createChatRoom(memberno);
	}

	// 채팅방 입장 화면
	@GetMapping("/room/enter/{roomId}")
	public String roomDetail(Model model, @PathVariable String roomId) {
		log.info("[/chat/room/enter/{}][GET]", roomId);
		model.addAttribute("roomId", roomId);
		return "chat/roomdetail";
	}

	// 특정 채팅방 조회
	@GetMapping("/room/{roomId}")
	@ResponseBody
	public ChatRoom roomInfo(@PathVariable String chatroomId) {
		log.info("[/chat/room/{}][GET]", chatroomId);
		return repository.findRoomById(chatroomId);
	}
}
//// 채팅 리스트 화면
//@GetMapping("/room")
//public String rooms() {
//	log.info("[/chat/room][GET]");
//	return "chat/room";
//}
//
//// 모든 채팅방 목록 반환
//@GetMapping("/rooms")
//@ResponseBody
//public List<ChatRoom> room() {
//	log.info("[/chat/rooms][GET]");
//	return repository.findAllRoom();
//}
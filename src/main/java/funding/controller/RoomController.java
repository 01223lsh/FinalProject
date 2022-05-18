package funding.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ChatRoom createRoom(int memberno) {
//		log.info("[/chat/room][POST]");
//		log.info("요청파라미터: {}", memberno);
		return repository.createChatRoom(memberno);
	}

	// 채팅방 입장 화면
	@GetMapping("/room/enter/{memberNo}")
	public String roomDetail(Model model, @PathVariable String memberNo, HttpSession session) {
		// log.info("[/chat/room/enter/{}][GET]", memberNo);
		ChatRoom room = repository.findRoomById(Integer.parseInt(memberNo));
		System.out.println("결과값 테스트: " + room);
		String sessionId = session.getId();
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("room", room);
		model.addAttribute("sessionId", sessionId);
		return "chat/chattingroom";
	}

	// 특정 채팅방 조회
	@GetMapping("/room/{memberNo}")
	@ResponseBody
	public ChatRoom roomInfo(@PathVariable int memberNo) {
//		log.info("[/chat/room/{}][GET]", memberNo);
		return repository.findRoomById(memberNo);
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
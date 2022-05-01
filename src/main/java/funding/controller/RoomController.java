package funding.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import funding.repository.ChatRoomRepository;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/chat")
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);

	private final ChatRoomRepository repository;

	// 채팅방 목록 조회
	@GetMapping(value = "/rooms")
	public ModelAndView rooms() {

		logger.info("# All Chat Rooms");
		ModelAndView mv = new ModelAndView("chat/rooms");

		mv.addObject("list", repository.findAllRooms());

		return mv;
	}

	// 채팅방 개설
	@PostMapping(value = "/room")
	public String create(@RequestParam String name, RedirectAttributes rttr) {

		logger.info("# Create Chat Room , name: " + name);
		rttr.addFlashAttribute("roomName", repository.createChatRoomDTO(name));
		return "redirect:/chat/rooms";
	}

	// 채팅방 조회
	@GetMapping("/room")
	public void getRoom(String roomId, Model model) {

		logger.info("# get Chat Room, roomID : " + roomId);

		model.addAttribute("room", repository.findRoomById(roomId));
	}
}
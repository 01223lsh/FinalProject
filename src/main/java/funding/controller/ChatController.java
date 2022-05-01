package funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

	@GetMapping("/chat")
	public void chat(Model model) {

		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		model.addAttribute("userid", member.getUsername());
	}
}
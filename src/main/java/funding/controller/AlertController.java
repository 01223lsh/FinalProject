package funding.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public class AlertController {
	
	  
	public void alertList(HttpSession session
						, Model model
//						,HttpServletRequest req
						,HttpServletResponse resp) {
		// 전달된 파라미터를 UTF-8로 인코딩
//		req.setCharacterEncoding("UTF-8");

		// HTML이 UTF-8형식이라는 것을 브라우저에 알림
//		resp.setContentType("text/html;charset=UTF-8");

		// 전달된 파라미터를 새로운 변수에 저장
//		String fromID = req.getParameter("fromID");
		int memberNo = (Integer)session.getAttribute("memberNo");
		
//		String listType = req.getParameter("listType");

		// 각 변수에 값이 null이거나 공백일때 공백 출력
		if (memberNo == 0) {
			resp.getWriter().write("");
		} else {
			try {
				System.out.println("채팅 내용 불러오기[POST]");
				resp.getWriter().write(alertService.getAlert(memberNo));
			} catch (Exception e) {
				resp.getWriter().write("");
			}
		}
	}
}

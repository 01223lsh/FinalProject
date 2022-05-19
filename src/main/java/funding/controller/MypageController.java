package funding.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import funding.dto.JoinFunding;
import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Payment;
import funding.dto.Project;
import funding.service.face.MypageService;
import funding.util.PagingFundingList;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Autowired
	MypageService mypageService;

	// 실험용 테스트 로그인
	// ----------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/mypage/login", method = RequestMethod.GET)
	public void login() {
		logger.info("/mypage/login [GET]");
	}

	@RequestMapping(value = "/mypage/login", method = RequestMethod.POST)
	public String loginProc(Member member, HttpSession session) {
		logger.info("/member/loginProc : {}", member);

		// 로그인 인증

		boolean loginResult = mypageService.login(member);

		if (loginResult) {

			// 로그인 성공
			logger.info("로그인 성공");

			session.setAttribute("loginResult", loginResult);
			session.setAttribute("id", member.getId());

			Member memberinfo = mypageService.getMemberinfo(member);

//			session.setAttribute(name, value);

//			session.setAttribute("nick", mypageService.getNick(member));
//			session.setAttribute("memberNo", mypageService.getMemberNo(member));
//			session.setAttribute("grade", mypageService.getGrade(member));

			session.setAttribute("nick", memberinfo.getNick());
			session.setAttribute("memberNo", memberinfo.getMemberNo());
			session.setAttribute("grade", memberinfo.getGrade());
//			session.setAttribute("", memberinfo.get);

			logger.info("세션에 저장한 member : {}", session.getAttribute("memberNo"));
			System.out.println("세션 확인 : " + session.getAttribute("id"));
			System.out.println("세션 확인 : " + session.getAttribute("nick"));
			System.out.println("세션 확인 : " + session.getAttribute("memberNo"));
			System.out.println("세션 확인 : " + session.getAttribute("grade"));

			return "redirect:/mypage/main";

		} else {
			// 로그인 실패
			logger.info("로그인 실패");

			session.invalidate();
			return "redirect:/mypage/login";
		}
	}

	@RequestMapping("/mypage/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/mypage/main";
	}
	// ----------------------------------------------------------------------------------------------------------------------

	// 전체 메인
	@GetMapping("/mypage/main")
	public void main() {
	}

	// 마이페이지 메인
	@GetMapping("/mypage/mypagemain")
	public String mypageMain(HttpSession session, Model model, Member member) {

		// 여기서 소셜 구분을 해야할듯
		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);

		// 등급 사용하기

		int memberNo = (Integer) session.getAttribute("memberNo");
		/* int memberNo = (integer) session.getAttribute("memberNo"); */

		int chk = mypageService.chkSocialId(member);

//		//네이버 소셜 확인..
//		int soNChk = mypageService.naverchk(member);
//		
//		//카카오 소셜 확인..
//		int soKChk = mypageService.kakaochk(member);

		// 세션에 저장한 닉값 jsp로 보내기
		String nick = (String) session.getAttribute("nick");
		model.addAttribute("nick", nick);

		// 세션에 chk 저장하자(0: 소셜 / 1 : 일반회원)
		session.setAttribute("socialchk", chk);

		boolean result = (Boolean) session.getAttribute("login");
		logger.info("result : {}", result);

		if (result) {

			// 일반유저 - 참여중인 펀딩 개수(펀딩진행중-3)
			int joinCnt = mypageService.getTotalCnt(memberNo);
			logger.info("갯수 확인하자 : {}", joinCnt);
			model.addAttribute("joinCnt", joinCnt);

			// 일반유저 - 참여중인 펀딩 개수(펀딩종료-4)
			int joinendCnt = mypageService.getTotalendCnt(memberNo);
			logger.info("joinendCnt갯수 확인하자22 : {}", joinendCnt);
			model.addAttribute("joinendCnt", joinendCnt);

			// 일반유저 - 문의사항 갯수
			int qnaCnt = mypageService.getQnaCnt(memberNo);
			logger.info("qna갯수 확인하자 : {}", qnaCnt);
			model.addAttribute("qnaCnt", qnaCnt);

			// 사업자 - 작성중인 프로젝트(0)
			int makefund0 = mypageService.getMakefund0(memberNo);
			logger.info("makingFund갯수 확인하자 : {}", makefund0);
			model.addAttribute("makefund0", makefund0);

			// 사업자 - 승인대기중 프로젝트(1)
			int makefund1 = mypageService.getMakefund1(memberNo);
			logger.info("makingFund갯수 확인하자 : {}", makefund1);
			model.addAttribute("makefund1", makefund1);

			// 사업자 - 승인거절 프로젝트(2)
			int makefund2 = mypageService.getMakefund2(memberNo);
			logger.info("makingFund갯수 확인하자 : {}", makefund2);
			model.addAttribute("makefund2", makefund2);

			// 사업자 - 진행중 프로젝트(3)
			int makefund3 = mypageService.getMakefund3(memberNo);
			logger.info("makingFund갯수 확인하자 : {}", makefund3);
			model.addAttribute("makefund3", makefund3);

			// 사업자 - 종료된 프로젝트(4)
			int makefund4 = mypageService.getMakefund4(memberNo);
			logger.info("makingFund갯수 확인하자 : {}", makefund4);
			model.addAttribute("makefund4", makefund4);

			// 사업자 - 종료된 프로젝트(5)
			int makefund5 = mypageService.getMakefund5(memberNo);
			logger.info("makingFund갯수 확인하자 : {}", makefund5);
			model.addAttribute("makefund5", makefund5);

			// qna리스트 최신 5개 가져오기
			List<HashMap<String, Object>> qnalist = mypageService.getqnalist(memberNo);
			logger.info("리워드해시맵의 정보다 : {}", qnalist);
			model.addAttribute("qnalist", qnalist);

			return "/mypage/mypagemain";

		} else {
			return "redirect:/mypage/login";
		}

	}

	// 개인정보수정 비밀번호 체크
	@GetMapping("/mypage/mypagepwchk")
	public String mypagepw(HttpSession session, Member member) {

		// 여기서 소셜 구분을 해야할듯
		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);

		int chk = mypageService.chkSocialId(member);

		// 세션에 chk 저장하자(0: 소셜 / 1 : 일반회원)
		session.setAttribute("socialchk", chk);

		if ((Boolean) session.getAttribute("login")) {

			return "/mypage/mypagepwchk";
		} else {
			return "redirect:/mypage/login";
		}

	}

	// 개인정보수정 비밀번호 체크
	@PostMapping("/mypage/mypagepwchk")
	public String mypagepwProc(HttpSession session, Member member) {

		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);

		int grade = (Integer) session.getAttribute("grade");
		int pwchk = mypageService.mypwchk(member);

		logger.info("pwchk의 결과는? : {}", pwchk);

//		if(pwchk>0 && grade == 0) {
//			return "redirect:/mypage/infoview";
//		} else if (pwchk >0 && grade ==2){
//			return "redirect:/mypage/infoview";
//		} else if (pwchk >0 && grade ==1) {
//			return "redirect:/mypage/sellerinfo";
//		} else {
//			return "redirect:/mypage/mypagepwchk";
//		}

		return "redirect:/mypage/infoview";

	}

	// 판매정보수정 비밀번호 체크
	@GetMapping("/mypage/mypagepwchkseller")
	public String mypaagepwsekker(HttpSession session, Member member) {

		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);

		int grade = (Integer) session.getAttribute("grade");
		int pwchk = mypageService.mypwchk(member);

		logger.info("pwchk의 결과는? : {}", pwchk);

		if ((Boolean) session.getAttribute("login")) {

			return "/mypage/mypagepwchkseller";
		} else {
			return "redirect:/mypage/login";
		}

	}

	// 판매정보수정 비밀번호 체크
	@PostMapping("/mypage/mypagepwchkseller")
	public String mypagepwsellerProc(HttpSession session, Member member) {

		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);

		int grade = (Integer) session.getAttribute("grade");
		int pwchk = mypageService.mypwchk(member);

		logger.info("pwchk의 결과는? : {}", pwchk);

		if (pwchk > 0 && grade == 1) {
			return "redirect:/mypage/sellerinfo";
		} else {
			return "redirect:/mypage/mypagepwchkseller";
		}

	}

	// 개인정보 view
	@GetMapping("/mypage/infoview")
	public void infoview(HttpSession session, Model model) {

		logger.info("/member/infoview [GET]");

		String loginid = (String) session.getAttribute("id");
		logger.info("mypage[loginid] = {}", loginid);

		// 로그인 된 사용자 정보 조회
		Member info = mypageService.info(loginid);
		logger.info("mypage [info] : {}", info);

		model.addAttribute("info", info);
	}

	// 개인정보 수정 view
	@GetMapping("/mypage/infoupdate")
	public void infoupdate(HttpSession session, Model model) {

		String loginid = (String) session.getAttribute("id");
		logger.info("mypage[loginid] = {}", loginid);

		// 로그인 된 사용자 정보 조회
		Member info = mypageService.info(loginid);
		logger.info("mypage [info] : {}", info);

		model.addAttribute("info", info);

	}

	// 개인정보 수정 view
	@PostMapping("/mypage/infoupdate")
	public String infoupdateProc(Member member) {

		logger.info("들어온 값 확인 : {}", member);

		mypageService.infoUpdate(member);

		return "redirect:/mypage/infoview";
	}

	// 판매정보 view
	@GetMapping("/mypage/sellerinfo")
	public void sellerinfo(HttpSession session, Model model) {

		int loginNo = (Integer) session.getAttribute("memberNo");
		logger.info("mypage[memberNo] = {}", loginNo);

		MemberSeller sellerinfo = mypageService.sellerinfo(loginNo);
		logger.info("mypage [sellerinfo] : {}", sellerinfo);

		model.addAttribute("sellerinfo", sellerinfo);
	}

	// 판매정보 수정 view
	@GetMapping("/mypage/sellerinfoupdate")
	public void sellerinfoupdate(HttpSession session, Model model) {

		int loginNo = (Integer) session.getAttribute("memberNo");
		logger.info("mypage[memberNo] = {}", loginNo);

		MemberSeller sellerinfo = mypageService.sellerinfo(loginNo);
		logger.info("mypage [sellerinfo] : {}", sellerinfo);

		model.addAttribute("sellerinfo", sellerinfo);
	}

	// 판매정보 수정 view
	@PostMapping("/mypage/sellerinfoupdate")
	public String sellerinfoupdateProc(MemberSeller memberSeller) {

		logger.info("들어온 값 확인 : {}", memberSeller);

		mypageService.sellerinfoUpdate(memberSeller);

		return "redirect:/mypage/sellerinfo";
	}

	// 개인정보 수정 - 닉네임 중복체크
	@ResponseBody
	@GetMapping("/mypage/nickChk")
	public int nickChk(@RequestParam("nick") String nick) {

		int result = mypageService.nickChk(nick);

		return result;
	}

	// 참여중인 펀딩 list
	@GetMapping("/mypage/joinfunlist")
	public void joinfundlist(HttpSession session, Model model, PagingFundingList pagingParam) {

		logger.info("/mypage/joinfunlist [GET] : {}", pagingParam);

		int memberNo = (Integer) session.getAttribute("memberNo");
		logger.info("mypage[joinfunlist-memberNo] = {}", memberNo);

		// 페이징 계산
		PagingFundingList paging = mypageService.getjoinPaging(pagingParam, memberNo);
		logger.info("페이징내용물: {}", pagingParam);

		paging.setMemberNo(memberNo);

		// 로그인된 일반회원(회원번호 사용) 펀딩 리스트
		List<JoinFunding> list = mypageService.joinlist(paging);
		for (JoinFunding j : list) {
			logger.info("foreach : {}", j);
		}

		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

		logger.info("어디한번볼까 : {}", list);

	}

	// 참여중인 펀딩 view
	@GetMapping("/mypage/joinfunview")
	public void joinfundview(HttpSession session, Model model, JoinFunding joinFunding, Payment payment) {

		logger.info("/mypage/joinfunview [GET]");

		int memberNo = (Integer) session.getAttribute("memberNo");
		logger.info("mypage[joinfunview-memberNo] = {}", memberNo);

		joinFunding.setMemberNo(memberNo);
		logger.info("참여정보 어디 보자 : {}", joinFunding);

		List<HashMap<String, Object>> view = mypageService.joinfundview(joinFunding);

		logger.info("해시맵의 정보다 : {}", view);

		// 해시맵의 정보를 뜯어오자
		int projectNo = Integer.parseInt(view.get(0).get("PROJECT_NO").toString());
		logger.info("나와라좀 : {} ", projectNo);

		String seller = mypageService.getseller(projectNo);

		int orderNo = Integer.parseInt(view.get(0).get("ORDER_NO").toString());
		logger.info("나와라좀 : {} ", orderNo);

		Payment paymentinfo = mypageService.getPaymentInfo(orderNo);
		logger.info("나와라좀_paymentinfo : {} ", paymentinfo);

		model.addAttribute("view", view);
		model.addAttribute("seller", seller);
		model.addAttribute("paymentinfo", paymentinfo);
	}

	// 제작한 펀딩 list
	@GetMapping("/mypage/makefunlist")
	public void makefundlist(HttpSession session, Model model, PagingFundingList pagingParam) {

		logger.info("/mypage/joinfunlist [GET] : {}", pagingParam);

		int memberNo = (Integer) session.getAttribute("memberNo");
		logger.info("mypage[makefunlist-memberNo] = {}", memberNo);

		// 페이징 계산
		PagingFundingList paging = mypageService.getmakePaging(pagingParam, memberNo);
		logger.info("페이징내용물: {}", pagingParam);

		paging.setMemberNo(memberNo);
		logger.info("페이징내용물22: {}", paging);

		// 로그인된 일반회원(회원번호 사용) 펀딩 리스트
		List<JoinFunding> list = mypageService.makelist(paging);
		for (JoinFunding j : list) {
			logger.info("foreach : {}", j);
		}

		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

		logger.info("어디한번볼까 : {}", list);

	}

	// 제작한 펀딩 view
	@GetMapping("/mypage/makefunview")
	public void makefundview(HttpSession session, Model model, Project project) {

		logger.info("/mypage/makefunview [GET]");

		int loginNo = (Integer) session.getAttribute("memberNo");
		logger.info("mypage[memberNo] = {}", loginNo);

		logger.info("자 프로젝트 확인이다 : {}", project);

		Project view = mypageService.makefundview(project);
		logger.info("제작한 펀드의 정보다 : {}", view);

		String category = mypageService.getcategory(view);
		logger.info("카테고리 이름 : {}", category);

		// 리워드 정보 가져와야하는데 얘도 hashmap각
		List<HashMap<String, Object>> reward = mypageService.makefundreward(view);
		logger.info("리워드해시맵의 정보다 : {}", reward);

		// 판매자 정보 보여주기식으로 보여주자
		MemberSeller seller = mypageService.sellerinfo(loginNo);

		model.addAttribute("view", view);
		model.addAttribute("category", category);
		model.addAttribute("reward", reward);
		model.addAttribute("seller", seller);
	}

}

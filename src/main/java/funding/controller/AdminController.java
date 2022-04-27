package funding.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import funding.dto.Member;
import funding.service.face.AdminService;
import funding.util.Paging;


@Controller
public class AdminController {
	@Autowired AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/admin/admin")
	public void admin() {}
	
	@RequestMapping(value="/admin/member")
	public void member(Member member,Model model,Paging paging,String category,String content) {
		int i=4;
		
		List<Member> list = new ArrayList<>();
		if(member.getGrade()!=4) {
			i=member.getGrade();
		}
		
		paging = adminService.getPaging(paging,i,category,content);
		if(content!=null &&!"".equals(content)) {
			
			list = adminService.MemberSearch(category,content,paging);
			model.addAttribute("con",content);
			model.addAttribute("cat",category);
			
		}else if(member.getGrade()>3) {
			
			list = adminService.selectMemberAll(paging);
		}else {
			list = adminService.selectByGrade(member,paging);
			
			
		}
		
		
		int cnt =list.size();
		model.addAttribute("membergrade",member.getGrade());
		model.addAttribute("total",paging.getTotalCount());
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		model.addAttribute("cnt",cnt);
	}
	
	

	
	@RequestMapping(value="/admin/memberInfo", method=RequestMethod.GET)
	public void memberInfo(Member member,Model model) {
		
		member = adminService.selectBymemberNo(member);	
		
		
		model.addAttribute("member",member);
		
	}
	@RequestMapping(value="/layout/paging")
	public String memberpaging(Paging paging,String str,int grade,Model model,String content,String category){
		
		model.addAttribute("gradep",grade);
		if(str.equals("member")) {
//			if(content!=null && !"".equals(content)) {
//				return "redirect:/admin/member?curPage="+paging.getCurPage()
//				+"&grade="+grade+"&category="+content;
//			}else {
				logger.info("테스트이다 {} ",grade);
				return "redirect:/admin/member?curPage="+paging.getCurPage()+
						"&grade="+grade+"&category="+category+"&content"+content;
//			}
//			}else {
//				return "redirect:/admin/member?curPage="+paging.getCurPage();
//			}
			
			
		}else if(str.equals("project")) {
			return "redirect:/admin/project?curPage="+paging.getCurPage();
		}else if(str.equals("qna")) {
			return "redirect:/admin/qna?curPage="+paging.getCurPage();
		}else if(str.equals("notice")) {
			return "redirect:/admin/notice?curPage="+paging.getCurPage();
		}else {
			return "redirect:/admin/order?curPage="+paging.getCurPage();
		}
		
	}
	@RequestMapping(value="/admin/memberInfo",method = RequestMethod.POST)
	public void memberUpdate(Member member) {
		logger.info("{}",member);
		adminService.gradeUpdate(member);
	}
	
	
	
	
}

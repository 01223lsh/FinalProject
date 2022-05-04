package funding.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import funding.dto.Member;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.service.face.AdminService;
import funding.util.Paging;


@Controller
public class AdminController {
	@Autowired AdminService adminService;
	@Autowired private ServletContext context;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/admin/admin")
	public void admin() {}
	
	@RequestMapping(value="/admin/member")
	public void member(Member member,Model model
			,Paging paging,String disabled
			,String category
			,String content) {
		int i=4;
		
		if(disabled!=null&&!disabled.equals("")) {
			adminService.DisabledAllDelete(3);
		}
		List<Member> list;
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
	@RequestMapping(value="/admin/project")
	public void project(Model model,Paging paging,Project project,String projectStep) {
		int i=5;
		if(project.getProjectStep() < i) {
			i=project.getProjectStep();
		}
		paging = adminService.getprojectPaging(paging,i);
		List<Project> list = adminService.projectList(paging,i);
		
		
		int cnt = list.size();
		model.addAttribute("step",i);
		model.addAttribute("list",list);
		model.addAttribute("cnt",cnt);
		model.addAttribute("paging",paging);
		model.addAttribute("project",list);
	}
	@RequestMapping(value="/admin/memberInfo", method=RequestMethod.GET)
	public void memberInfo(Member member,Model model) {
		member = adminService.selectBymemberNo(member);	
		model.addAttribute("member",member);
	}
	@RequestMapping(value="/layout/memberpaging")
	public String memberpaging(Paging paging
			,String str
			,int grade
			,Model model
			,String content
			,String category){
//		model.addAttribute("gradep",grade);
		if(content!=null && !"".equals(content) && str.equals("member")) {
			return "redirect:/admin/member?curPage="+paging.getCurPage()
			+"&grade="+grade+"&category="+category+"&content="+content;
		}else {	
			return "redirect:/admin/member?curPage="+paging.getCurPage()+
					"&grade="+grade;
		}		
	}
	@RequestMapping(value="/layout/projectpaging")
	public String projectpaging(
			Paging paging
			,int projectStep
			,Model model){
		return "redirect:/admin/project?curPage="+paging.getCurPage()+"&projectStep="+projectStep;
		
	}
	@RequestMapping(value="/layout/paging", method = RequestMethod.GET)
	public String memberpaging(Paging paging,String str,Model model){	
		 if(str.equals("qna")) {
			return "redirect:/admin/qna?curPage="+paging.getCurPage();
		}else if(str.equals("notice")) {
			logger.info("notice");
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
	@RequestMapping(value="/admin/notice")
	public void notice(Notice notice,Paging paging,Model model) {
		paging = adminService.getnoticePaging(paging);
		List<Notice> list= adminService.noticeAll(paging);
		int cnt = list.size();
		model.addAttribute("list",list);
		model.addAttribute("cnt",cnt);
		model.addAttribute("paging",paging);
		
	}
	@RequestMapping(value="/admin/noticeView")
	public void noticeView(Notice notice,Model model,NoticeFile noticeFile) {
		notice = adminService.selectByNotice(notice);
		List<NoticeFile> listfile = adminService.selectBtNoticeFile(notice);
//		noticeFile= adminService.selectByNoticeFile(noticeFile);
		model.addAttribute("upload",context.getRealPath("upload"));
		model.addAttribute("listfile",listfile);
		model.addAttribute("notice",notice);
	}
	@RequestMapping(value="/admin/noticeWrite",method = RequestMethod.GET)
	public void noticeWrite() {	}
	
	@RequestMapping(value="/admin/noticeWrite",method = RequestMethod.POST)
	public void noticeWriteResult(Notice notice,MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> filelist; 
		if(mtfRequest.getFile("file").getSize()>0) {
			logger.info("ddddddddd{}",mtfRequest.getFile("file").getSize());
			filelist =mtfRequest.getFiles("file");
		}else {
			filelist=new ArrayList<MultipartFile>();
		}
		adminService.noticeWrite(notice,filelist);
	}
	@RequestMapping(value="/download")
	public String download(Notice notice, Model model) {
		notice = adminService.getFile(notice);
		model.addAttribute("downFile", notice);
		
		return "down";
	}
	@RequestMapping(value="/admin/noticeUpdate", method=RequestMethod.GET)
	public void noticeUpdate(Notice notice
			, Model model
			,  @ModelAttribute(value="NoticeFile") NoticeFile noticefile) {
		logger.info("{}",noticefile);
		
		notice = adminService.selectByNotice(notice);
		List<NoticeFile> noticeFile = adminService.selectByNoticeFile(notice);
		model.addAttribute("noticeFile",noticeFile);
		model.addAttribute("notice",notice);
	}
	@RequestMapping(value="/admin/noticeUpdate", method=RequestMethod.POST)
	public void noticeUpdateresult(Notice notice, MultipartHttpServletRequest mtfRequest
			,@RequestParam("fileNolist") List<Integer> fileNolist) {
		logger.info("{}",fileNolist);
		List<MultipartFile> filelist; 
		if(mtfRequest.getFile("file").getSize()>0) {
			logger.info("ddddddddd{}",mtfRequest.getFile("file").getSize());
			filelist =mtfRequest.getFiles("file");
		}else {
			filelist=new ArrayList<MultipartFile>();
		}
		adminService.noticeUpdate(notice,filelist,fileNolist);	
	}
	@RequestMapping(value="/admin/noticeDelete")
	public String noticeDelete(Notice notice) {
		adminService.noticeDelete(notice);
		return null;
	}
	
	
	
	
}

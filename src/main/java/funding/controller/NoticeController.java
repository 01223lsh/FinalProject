package funding.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.service.face.NoticeService;
import funding.util.Paging;

public class NoticeController {
	
	@Autowired NoticeService noticeService;
	@Autowired private ServletContext context;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value="/notice/list")
	public void notice(Notice notice,Paging paging,Model model) {
		paging = noticeService.getnoticePaging(paging);
		List<Notice> list= noticeService.noticeAll(paging);
		int cnt = list.size();
		model.addAttribute("list",list);
		model.addAttribute("cnt",cnt);
		model.addAttribute("paging",paging);
		
	}
	
	@RequestMapping(value="/notice/view")
	public void noticeView(Notice notice,Model model,NoticeFile noticeFile) {
		notice = noticeService.selectByNotice(notice);
		List<NoticeFile> listfile = noticeService.selectBtNoticeFile(notice);
		model.addAttribute("upload",context.getRealPath("upload"));
		model.addAttribute("listfile",listfile);
		model.addAttribute("notice",notice);
	}
	
//	@RequestMapping(value="/admin/noticeWrite",method = RequestMethod.POST)
//	public void noticeWriteResult(Notice notice,MultipartHttpServletRequest mtfRequest) {
//		List<MultipartFile> filelist; 
//		if(mtfRequest.getFile("file").getSize()>0) {
//			logger.info("ddddddddd{}",mtfRequest.getFile("file").getSize());
//			filelist =mtfRequest.getFiles("file");
//		}else {
//			filelist=new ArrayList<MultipartFile>();
//		}
//		noticeService.noticeWrite(notice,filelist);
//	}
//	@RequestMapping(value="/download")
//	public String download(Notice notice, Model model) {
//		notice = noticeService.getFile(notice);
//		model.addAttribute("downFile", notice);
//		
//		return "down";
//	}
//	
//	@RequestMapping(value="/admin/noticeUpdate", method=RequestMethod.POST)
//	public void noticeUpdateresult(Notice notice, MultipartHttpServletRequest mtfRequest
//			,@RequestParam("fileNolist") List<Integer> fileNolist) {
//		logger.info("{}",fileNolist);
//		List<MultipartFile> filelist; 
//		if(mtfRequest.getFile("file").getSize()>0) {
//			logger.info("ddddddddd{}",mtfRequest.getFile("file").getSize());
//			filelist =mtfRequest.getFiles("file");
//		}else {
//			filelist=new ArrayList<MultipartFile>();
//		}
//		noticeService.noticeUpdate(notice,filelist,fileNolist);	
//	}
//	
}

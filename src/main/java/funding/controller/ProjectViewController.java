package funding.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import funding.dto.Project;
import funding.service.face.ProjectViewService;

@Controller
public class ProjectViewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectViewController.class);
	
	@Autowired
	private ProjectViewService projectViewService;

	@RequestMapping(value = "/project/view")
	public String projectView(Project project, Model model) {
		logger.info("/projectView/view");
		
		project = projectViewService.getProject(project);
		
		model.addAttribute("project", project);
		
		//남은 일 계산
		int d = 0;
        
        Date date1= project.getCloseDate();
        Date date2 = new Date(System.currentTimeMillis());
         
        long calDateDays = 0;
        Date FirstDate = date1;
        Date SecondDate = date2;
           
        long calDate = SecondDate.getTime()-FirstDate.getTime(); 
           
        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환 
        // 24*60*60*1000을 나눠주면 일수 나옴
        calDateDays = calDate / ( 24*60*60*1000); 
   
        calDateDays = Math.abs(calDateDays);
           
        d = (int)calDateDays;
        
        model.addAttribute("d", d);
		
        return null;
        
	}
	
}

package funding.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MainInterceptor implements HandlerInterceptor{

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("grade")==null) {
			
		} 
		else if (((Integer) session.getAttribute("grade"))==2) {
			System.out.println(session.getAttribute("grade")+"sssssssss");
			
			response.sendRedirect("/admin/main");
		}
	
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	
}

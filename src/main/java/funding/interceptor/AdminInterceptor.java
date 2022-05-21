package funding.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.namedparam.ParsedSql;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor  implements HandlerInterceptor {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info(" + + + 인터셉터 시작 + + +");
		//세션 객체
		HttpSession session = request.getSession();
		
		if( session.getAttribute("id") == null ) {
			logger.info(" >> 접속 불가 : 비 로그인 상태");
			
			//메인페이지로 리다이렉트
			response.sendRedirect("/member/main");
			
			//컨트롤러 접근 금지
			return false;
			
		} else {
			logger.info(" >> 로그인 상태");
			logger.info("testttest{}",session.getAttribute("grade"));
			int test =((Integer) session.getAttribute("grade")); 
			if( test!=2)  {
				logger.info(" >> 접속 불가 : 관리자가 아님");

				response.sendRedirect("/member/main");
				
				//컨트롤러 접근 금지
				return false;
				
			}
			
			
		}
		
		
		logger.info(" >> 정상 접속 : 관리자");			
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info(" + + + 인터셉터 끝 + + +");
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}



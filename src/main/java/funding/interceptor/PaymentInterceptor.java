package funding.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class PaymentInterceptor implements HandlerInterceptor {
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
		logger.info(" : : : PaymentInterceptor START ! : : : ");
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("memberNo") == null) {
			logger.info("결제 불가 : 비로그인 상태 입니다!!!");
			
			response.sendRedirect("/member/login");
			
			return false;
		} else {
			logger.info(" >> 로그인 상태 ");
			
			if ((int) session.getAttribute("grade") != 0) {
				logger.info(" >> 일반 회원이 아니다 grade 0 아닌 상태");
				
				response.sendRedirect("/member/main");
			}
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info(" : : : PaymentInterceptor END ! : : : ");
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />



<script type="text/javascript">
var data = {
		"bank_code_std": "F123456789U4BC34239Z",
		"bank_code_std": "088",
		"account_num": "1234567890123456",
		"account_holder_info_type": "1",
		"account_holder_info": "880101",
		"tran_dtime": "20220428"
};




$(document).ready(function() {
	$("#test").click(function() {
		console.log("#test click")

		$.ajax({
		  url: "https://testapi.openbanking.or.kr/oauth/2.0/token",  
		  type: "POST",
		  code = "CCIfKJIPxUjXzTuMhPK0cOvc7HaVGu" ,
		  client_id = "h_yeun12@naver.com" ,
		  client_secret = "ff0fa3b9-4b1d-4dcb-8df4-3b07281c6cc6",
		  redirect_uri = "http://localhost:8088/member/test",
		  grant_type = authorization_code
		})
		
			})
		});


</script>

<!-- requestAuth -->
<form method="get" action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" target="_blank">
  <input type="hidden" name="response_type" value="code"/>
  <input type="hidden" name="client_id" value="7fd10e13-3356-413a-8f6f-d326ce74d34a"/>
  <input type="hidden" name="redirect_uri" value="http://localhost:8088/member/test"/>
  <input type="hidden" name="scope" value="login inquiry transfer"/>
  <input type="hidden" name="state" value="b80BLsfigm9OokPTjy03elbJqRHOfGSY"/>
  <input type="hidden" name="auth_type" value="0"/>
  <input type="submit" value="requestAuth"/>
</form>


<button id="test">토큰발급</button>




<c:import url="/WEB-INF/views/layout/footer.jsp" />

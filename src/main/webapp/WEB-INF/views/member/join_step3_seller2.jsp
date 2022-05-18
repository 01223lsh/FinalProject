<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />




<script type="text/javascript">
$(document).ready(function() {
	$("#usernick").blur(function() {
		console.log("#nick blur")
		
		var nick = $("#usernick").val();
		if(nick == "" || nick.length < 3){
			$(".successNickChk").text("닉네임은 3자 이상 8자 이하로 설정해주세요");
				$(".successNickChk").css("color", "red");
				$("#nickDoubleChk").val("false");
		} else {
			
			$.ajax({
				type: "post",		
				url: '${pageContext.request.contextPath}/member/nickCheck?nick='+ nick,	
				cache : false,
				success: function(data){	
					if(data == 0) {
						$(".successNickChk").text("사용가능한 이름입니다")
						$("#nickDoubleChk").val("true");
					} else {
						$(".successNickChk").text("사용중인 이름입니다")
						$("#nickDoubleChk").val("false");
					}
				}
				, error: function(){ 
					console.log("AJAX실패")
				
			}
		})
			}
		
		
	})
});


</script>





<h1> 판매자회원가입 </h1>

<form action="/member/seller_join" method="POST">

<label>아이디<input type="text" name="id" autofocus></label><br>
<label>비밀번호<input type="password" name="pw"></label><br>
<label>이름<input type="text" name="name"></label><br>
<label>이메일<input type="text" name="email"></label><br>
<label>핸드폰번호<input type="text" name="phone"></label><br><br>
<label>사업자번호<input type="text" name="seller_number"></label><br><br>
<label>은행명<input type="text" name="bank"></label>
<label>계좌번호<input type="text" name="account_number"></label><br><br>

<tr>
	<th>
		<label for="nick">아이디</label>
	</th>
	<td>
		<input id ="userid" type="text" name="id" placeholder="아이디를 설정해주세요." maxlength="10" title="10자까지 입력" required >
		<br><small><span class="point successIdChk">아이디는 3자 이상 10자 이하로 설정해주시기 바랍니다</span></small> 
		<input type="hidden" id="idDoubleChk"/>
	</td>

	<br>

	<th>
		<label for="nick">닉네임</label>
	</th>
	<td>
		<input id ="usernick" type="text" name="nick" placeholder="닉네임을 설정해주세요." maxlength="8" title="8자까지 입력" required >
		<br><small><span class="point successNickChk">닉네임은 3자 이상 8자 이하로 설정해주시기 바랍니다</span></small> 
		<input type="hidden" id="nickDoubleChk"/>
	</td>
</tr>	


	


	


<hr>

<button>회원가입</button>

</form>



<c:import url="/WEB-INF/views/layout/footer.jsp" />
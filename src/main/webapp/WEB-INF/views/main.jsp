<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<!-- 네이버로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 


<script type="text/javascript">
$(document).ready(function(){
	
	
	//==================== 탈퇴 ====================
	$("#delete").click(function() {
		
		var pw = prompt('비밀번호를 입력해주세요', '비밀번호 입력');
		
		$.ajax({
			 url: '${pageContext.request.contextPath}/member/withdrawPw?pw='+ pw, 
			 type: "POST",
			 dataType: "JSON",
			 success: function(data){
				 console.log("data1 : ", data)
				 
				 if(data == true ){
			 		console.log("비밀번호 맞음")
	
					var deleteYN = confirm("탈퇴하시겠습니까?");
					if(deleteYN == true){
						location.href = '${pageContext.request.contextPath}/member/quit';
						
					} else
						alert("취소하였습니다.");
					
			 	} else {
			 		console.log("비밀번호 틀림")
			 		alert("패스워드가 틀렸습니다.")
			 		return;
		 		}
		 	 } //success end
			 , error: function(){
				 console.log("AJAX실패")
			 } //error end
		}) //ajax end
		
	}); //#delete end 
	
	//============================ 네이버 로그인 ============================
// 	$(document).ready(function() {
    	
//         var name = ${result}.response.name;
//         var email = ${result}.response.email;
//         $("#name").html("환영합니다. "+name+"님");
//         $("#email").html(email);
//      });
	
	
	
}); //ready end
			

</script>

<div class="container">

<h1>메인 화면</h1>
<hr>

<div>

<c:choose>
<c:when test="${empty login }">
	<a href="/member/join_step1">회원가입</a> | <a href="/member/login">로그인</a>
</c:when>
<c:when test="${login eq true }">
	반갑습니다. ${id }의 ${nick }님, 
	등급: ${grade } 
	회원 번호 : ${memberNo }
	<hr>


	<a href="/member/logout">로그아웃</a>
<!-- 	<input type="button" id="delete" value="탈퇴"> -->
	<button type="button" id="delete">탈퇴</button>

</c:when>
</c:choose>

</div>

	<!-- 카카오 -->
	반갑습니다. ${nick }님, <br> 
	등급: ${grade } <br>
	토큰: ${access_token } <br>
	회원번호: ${memberNo } <br>
  
  <a href="/member/kakaologout">카카오로그아웃</a>
  <a href="/member/kakaounlink">카카오연결끊기</a>
  
  
  <!-- 네이버 -->
    <h2 style="text-align: center" id="name" ></h2>
    <h4 style="text-align: center" id="email"></h4>
    <a href="/member/logout">로그아웃</a>
    <a href="/member/naverunlink">네이버연결끊기</a>
    
  

  

<%-- <center> --%>
<%-- <c:choose> --%>
<%-- <c:when test="${sessionId != null}"> --%>
<!-- <h2> 네이버 아이디 로그인 성공하셨습니다!! </h2> -->
<%-- <h3>'${sessionId}' 님 환영합니다! </h3> --%>
<!-- <h3><a href="/member/logout">로그아웃</a></h3> -->



<%-- </c:when> --%>
<%-- <c:otherwise> --%>


<%-- </c:otherwise> --%>
<%-- </c:choose> --%>
<%-- </center> --%>





</div>

</div><!-- .container end -->





<c:import url="/WEB-INF/views/layout/footer.jsp" />

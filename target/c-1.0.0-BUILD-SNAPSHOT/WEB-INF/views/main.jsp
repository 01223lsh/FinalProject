<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


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
	<hr>
	
	--세션확인--<br>
	login : ${login }<br>	
	mamberNo: ${memberNo } <br>
	name: ${name} <br>
	email: ${email } <br>
	phone: ${phone } <br>
	네이버로그인: ${naverlogin } <br>
	카카오로그인: ${kakaologin } <br>
	등록일: ${regdate } <br>
	닉네임: ${nick2 }

	<hr>

	<a href="/member/logout">로그아웃</a>

</c:when>
</c:choose>

</div>

	<!-- 카카오 -->
	반갑습니다. ${nick }님, 
	등급: ${grade } 
		토큰: ${access_token } 
  
  <a href="/member/kakaologout">카카오로그아웃</a>
  <a href="/member/kakaounlink">카카오연결끊기</a>
  

  

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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />



<div id="main" style="text-align: center;" >

<h1>메인페이지</h1>
<hr>

<c:if test="${ empty loginResult}">
<!-- <a href="/member/join"><button>회원가입</button></a> -->
<a href="/mypage/login"><button>로그인</button></a><br><br>
<a href="/mypage/mypagemain"><button>마이페이지</button></a>
</c:if>

<c:if test="${loginResult == true}">

<h4>${nick }님, 안녕하세요! 반갑습니다!</h4><br><br>
<a href="/mypage/logout"><button>로그아웃</button></a>
<a href="/mypage/mypagemain"><button>마이페이지</button></a>
</c:if>

<a href="/qna/list"><button>고객센터</button></a><br><br>



</div><!-- main -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
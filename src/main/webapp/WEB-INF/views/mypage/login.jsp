<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container">

<h1>로그인 페이지</h1>
<hr>

<div id="loginform" >

<form action="/mypage/login" method="post" class="form-horizontal">


<div class="form-group">
	<label for="id" class="col-sm-4 control-label">아이디</label>
	<div class="col-sm-5">
	<input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력하세요">
	</div>
</div>

<div class="form-group">
	<label for="pw" class="col-sm-4 control-label">비밀번호</label>
	<div class="col-sm-5">
	<input type="password" id="pw" name="pw"  class="form-control" placeholder="비밀번호를 입력하세요">
	</div>
</div>

<div class="form-group">
	<div class="col-sm-offset-6">
	<button>로그인</button>
	</div>
</div>
</form>

</div><!-- loginform -->

</div><!-- .container end -->


<c:import url="/WEB-INF/views/layout/footer.jsp" />
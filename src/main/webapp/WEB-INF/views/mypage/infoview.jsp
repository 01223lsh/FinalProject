<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />

<style>

input {
	border: none;
	text-align: center;
}

button {

	border-radius: 15px;
	background-color: white;
	color: #2E9AFE; 
	width: 70px;
	height: 30px;
	border: 2px solid #81BEF7;
	font-size: 15px;

}


</style>




<!-- <div class="container"> -->
<div class="right">
<br>
<h1 style="text-align: center;">회원 정보</h1>
<br><br><br>


	<div class="class="row">
		<div style="width: 120px;  background-color: #E0ECF8; border-radius: 10px; text-align: center; margin-left:30%; "  class="col-md-1 col-md-offset-3">
			<label for="id" style="padding-top: 4px;">아이디</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="id" id="id" value="${info.id }"  readonly="readonly">	
		</div>
	</div>
	<br><br><br>
	<div class="class="row">
		<div style="width: 120px; background-color: #E0ECF8; border-radius: 10px; text-align: center; margin-left:30%;" class="col-md-1 col-md-offset-4">
			<label for="name" style="padding-top: 4px;">이름</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="name" id="name" value="${info.name }" readonly="readonly">	
		</div>
	</div>
	<br><br><br>
	<div class="class="row">
		<div style="width: 120px;  background-color: #E0ECF8; border-radius: 10px; text-align: center; margin-left:30%;" class="col-md-1 col-md-offset-4">
			<label for="nick" style="padding-top: 4px;">닉네임</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="nick" id="nick" value="${info.nick }" readonly="readonly">	
		</div>
	</div>

	<br><br><br>
	<div class="class="row">
		<div style="width: 120px;  background-color: #E0ECF8; border-radius: 10px; text-align: center; margin-left:30%;" class="col-md-1 col-md-offset-4">
			<label for="email" style="padding-top: 4px;">이메일</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="email" id="email" value="${info.email }"readonly="readonly">	
		</div>
	</div>
	<br><br><br>
	<div class="class="row">
		<div style="width: 120px;  background-color: #E0ECF8; border-radius: 10px; text-align: center; margin-left:30%;" class="col-md-1 col-md-offset-4">
			<label for="phone" style="padding-top: 4px;">전화번호</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="phone" id="phone" value="${info.phone }"readonly="readonly">	
		</div>
	</div>

<br><br><br><br><br>
<div style="text-align: center; ">
<button onclick="location.href='./infoupdate'" style="margin-right: 15px;">수정</button>
<button onclick="location.href='./memberdelete'">탈퇴</button>
</div>

</div><!-- right -->
</div><!-- .container end -->

<br><br><br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
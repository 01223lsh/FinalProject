<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />

<style>

.border {
	border: 1px solid #DDD;
	border-radius: 15px;
	margin-left : 20%;
	height: 150px;
	width: 60%;
}



</style>


<div class="right">
<div id="main" style="text-align: center;" >

<h1>마이페이지 메인페이지</h1>
<hr>




<span style="font-size: 20px; font-weight: bolder;">${nick }님,</span><br><br>
<span>안녕하세요! 반갑습니다! 여기는 마이페이지 메인입니다</span><br><br><br><br><br>


<div class="border">

	<div id="first" style="height: 150px; width: 33%; float: left;">
		<div style="height: 80px; line-height: 100px; ">
			<strong><span style="font-size: 45px;">숫자</span></strong>
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px;">진행중인 펀드</span>
		</div>
	</div>
	
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div>

	<div id="first" style="height: 150px; width: 33%; float: left;">
		<div style="height: 80px; line-height: 100px; ">
			<strong><span style="font-size: 45px;">숫자</span></strong>
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px;">진행중인 펀드</span>
		</div>
	</div>

	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div>

	<div id="first" style="height: 150px; width: 33%; float: left;">
		<div style="height: 80px; line-height: 100px; ">
			<strong><span style="font-size: 45px;">숫자</span></strong>
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px;">진행중인 펀드</span>
		</div>
	</div>

</div>





</div><!-- main -->
</div><!-- right -->
</div> <!-- container  -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
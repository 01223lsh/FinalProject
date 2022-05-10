<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">

$(document).ready(function() {
	if("${grade}"==1  && "${socialchk}"==1){
		$("#sellerinfo").show();
	};
	
	if("${socialchk}"==0){
		$("#memberinfo").hide();
	};
	
	if("${grade}"==0){
		$("#joinfunding").show();
	};
	
	if("${grade}"==1){
		$("#makefunding").show();
	};
	
	
	
})

</script>

<style type="text/css">

.left {
/* 	border : 1px solid black; */
/* 	background-color: #fff; */
 	background-color: #E0ECF8;
 	height: 100%;
 	width: 15%;
 	float: left;

}

.right {

	background-color: #fff;
	height: 1000px;
	width: 85%;
	margin-left: 15%;
}

h1 {
	margin-top: 0;
}




ul {
  list-style: none;
  padding : 0px;

 /*
  padding: 0px;
  margin: 0px;
  width: 100px;
  background: #FF6347;
  height: 100%;
  overflow: auto;
  position: relative;
  float: left; 
  */
}


.menu {
	text-align: center;
	margin-top: 40%;
	line-height: 50px;
	font-size: 15px;
  text-decoration: none;
}


.m {
  text-decoration: none;

  display: block;
  color: #000;
  font-weight: bold;
}

li a:hover {
	background-color : #E0ECF8;
/*   color: #fff; */
  text-decoration: none;
}

a:vistied { 
	color: black;
	text-decoration: none;
}



</style>


<div class="left">

<div class="menu">
<ul>
	<li><a class="m" href="/mypage/mypagepwchk" id="memberinfo">회원 정보확인/수정</a></li>
	<li><a class="m" href="/mypage/mypagepwchkseller" id="sellerinfo" style="display: none;">판매 정보확인/수정</a></li>
	<li><a class="m" href="#" id="joinfunding" style="display: none;">참여중인 펀딩</a></li>
	<li><a class="m" href="#" id="makefunding" style="display: none;">제작한 펀딩</a></li>
	<li><a class="m" href="#">소셜체크확인용${socialchk }</a></li>
</ul>
</div> <!-- menu -->
</div><!-- left -->
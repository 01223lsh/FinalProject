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
		$("#delete").hide();
	};
	
	if("${socialchk}"==0){
		$("#memberinfo").hide();
		$("#delete").show();
	};
	
	if("${grade}"==0){
		$("#joinfunding").show();
	};
	
	if("${grade}"==1){
		$("#makefunding").show();
	};
	
});//end
	
// $(document).ready(function() {
	
	
	
// 	var kakao = "kakaoUser";
// 	var naver = "naverUser";
	
// 	 $("#delete").click(function(){
		 
// 		 if("${id}==kakao"){
// 			 $(location).attr("href", "https://www.naver.com/")
// 		 }
		 
// 		 if("${id}==kakao"){
// 			 $(location).attr("href", "https://www.google.com/")

// 		 }
	
	
// });
	
	
	
	
	


// $(document).ready(function(){
   
   
//    //==================== 탈퇴 ====================
//    $("#delete").click(function() {
      
//       var pw = prompt('비밀번호를 입력해주세요', '비밀번호 입력');
      
//       $.ajax({
//           url: '${pageContext.request.contextPath}/member/withdrawPw?pw='+ pw, 
//           type: "POST",
//           dataType: "JSON",
//           success: function(data){
//              console.log("data1 : ", data)
             
//              if(data == true ){
//                 console.log("비밀번호 맞음")
   
//                var deleteYN = confirm("탈퇴하시겠습니까? 개인정보는 3개월간 보관됩니다.");
//                if(deleteYN == true){
//                   location.href = '${pageContext.request.contextPath}/member/quit';
                  
//                } else
//                   alert("취소하였습니다.");
               
//              } else {
//                 console.log("비밀번호 틀림")
//                 alert("패스워드가 틀렸습니다.")
//                 return;
//              }
//            } //success end
//           , error: function(){
//              console.log("AJAX실패")
//           } //error end
//       }) //ajax end
      
//    }); //#delete end 
// });




</script>

<style type="text/css">

.left {
/* 	border : 1px solid black; */
/* 	background-color: #538fd9; */
	background-color: #f3f3f6;
/*  background-color: #E0ECF8; */
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
  color: white;

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
	line-height: 70px;
	font-size: 16px;
  text-decoration: none;
}


.m {
  text-decoration: none;

  display: block;
  color: #000;
  font-weight: bold;
}

li a:hover {
/* 	background-color : #538fd9; */
    color: #4391e4;
  text-decoration: none;
}

a:vistied { 
	color: #fff;
	text-decoration: none;
}







</style>


<div class="left">

<div class="menu">
<ul>
	<li><a class="m" href="/mypage/mypagemain" id="mypagemain">MY PAGE</a></li>
	<li><a class="m" href="/mypage/mypagepwchk" id="memberinfo">회원 정보 확인/수정</a></li>
	<li><a class="m" href="/mypage/mypagepwchkseller" id="sellerinfo" style="display: none;">판매 정보 확인/수정</a></li>
<!-- 	<li><a class="m" href="/mypage/joinfunlist" id="joinfunding" style="display: none;">참여중인 펀딩</a></li> -->
	<li><a class="m" href="/mypage/joinfunlist" id="joinfunding" style="display: none;">참여중인 펀딩</a></li>
	<li><a class="m" href="/mypage/makefunlist" id="makefunding" style="display: none;">내가 제작한 펀딩</a></li>
	<li><a class="m" href="#">소셜체크확인용${socialchk }</a></li>
	<li><a class="m"  id="delete" style="display: none; margin-top: 50px; ">회원탈퇴</a></li>
	
	
</ul>
</div> <!-- menu -->
</div><!-- left -->
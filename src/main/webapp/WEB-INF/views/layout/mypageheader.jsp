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
		
		
		
	 	var kakao = "kakaoUser";
	 	var naver = "naverUser";
	 	 $("#delete").click(function(){
		 
		 if("${id}"==kakao){
// 			 $(location).attr("href", "https://www.naver.com/");
			 $(location).attr("href", "/member/kakaounlink");
			 console.log(${id} == kakao);
		 };
		 
		 if("${id}"==naver){
// 			 $(location).attr("href", "https://www.google.com/");
			 $(location).attr("href", "/member/naverunlink");

		 };
	 	 }); 
		
	};
	
	if("${grade}"==0){
		$("#joinfunding").show();
	};
	
	if("${grade}"==1){
		$("#makefunding").show();
	};
	
	

	
// 	var id = ${id};
// 	var kakao = "kakaoUser";
// 	var naver = "naverUser";
	
// 	 $("#delete").click(function(){
		 
// 		 if(${id}==kakao){
// 			 $(location).attr("href", "https://www.naver.com/");
// 			 console.log(${id} == kakao);
// 		 };
		 
// 		 if(${id}==naver){
// 			 $(location).attr("href", "https://www.google.com/");

// 		 };
	
	
	
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
	
	
// })
	
	
	
	
	


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
/* 	background-color: #f3f3f6; */
 	height: 1500px;
 	width: 15%;
 	float: left;
 	font-family: 'IBM Plex Sans KR', sans-serif;
	margin-left: 15%;
}

.right {

	background-color: #fff;
/* 	height: 1000px; */
	height: 100%;
	width: 60%;
	margin-left: 30%;
	margin-right: 10%;

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
	line-height: 80px;
	font-size: 17px;
  text-decoration: none;
}


.m {
  text-decoration: none;
  display: block;
  color: black;
  font-weight: bold;
}





li a:hover {
/* 	background-color : #538fd9; */
     color: #39AEA9;
     font-weight : bolder;
/*   text-decoration: none; */

	transition: 0.35s;
/* 	text-shadow: 0 -1px 0 white, 0 1px 0 #E5EFC1, 0 2px 0 #E5EFC1, 0 3px 0 #E5EFC1, 0 5px 0 #E5EFC1, 0 5px 0 #E5EFC1; */


}

 a:vistied {  
 	color: #000; 
 	text-decoration: none; 
 } 


html, body {
	height: 100%;

}


/* a.active-color { color: red; } */
</style>


<div class="left">

<div class="menu">
<ul>
	<li><a class="m" href="/mypage/mypagemain" id="mypagemain" >MY PAGE</a></li>
	<li><a class="m" href="/mypage/mypagepwchk" id="memberinfo" >회원 정보 확인/수정</a></li>
	<li><a class="m" href="/mypage/mypagepwchkseller" id="sellerinfo" style="display: none; ">판매 정보 확인/수정</a></li>
<!-- 	<li><a class="m" href="/mypage/joinfunlist" id="joinfunding" style="display: none;">참여중인 펀딩</a></li> -->
	<li><a class="m" href="/mypage/joinfunlist" id="joinfunding" style="display: none;">참여중인 펀딩</a></li>
	<li><a class="m" href="/mypage/makefunlist" id="makefunding" style="display: none; ">내가 제작한 펀딩</a></li>
	<li><a class="m" href="#" style="color: #000;"">소셜체크확인용${socialchk }</a></li>
	
	<c:if test="${id.equals('kakaoUser')}">
	<li><a class="m"  class="delete" id="deleteK" href="/member/kakaounlink"; style="display: none; margin-top: 50px; ">회원탈퇴</a></li>
	</c:if>
	<c:if test="${id.equals('naverUser')}">
	<li><a class="m"  class="delete" id="deleteN" href="/member/naverunlink"; style="display: none; margin-top: 50px; ">회원탈퇴</a></li>
	</c:if>
		<li><a class="m"  id="delete" style="display: none; margin-top: 50px;">회원탈퇴</a></li>
</ul>
</div> <!-- menu -->
</div><!-- left -->
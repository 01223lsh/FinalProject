<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />


<script type="text/javascript">

// function NickChk() {
	
// 	var Pchk = ^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$
	
// 	if(! Pchk.test("pw")){
// 		alert("비밀번호는 8자 이상, 20자 이하이어야 하며, 숫자/대문자/특수문자를 모두 포함해야 합니다.")
// 		return false
// 	}
// }






$(document).ready(function() {
	
// 	$("#update").click(function() {
// 		$("form").submit();
// 	});
	var duplCheck= false;
	$("#dupBtn").click(function() {
		$.ajax({
			
			type : "get"
			, url : "/mypage/nickChk"
			, data : { nick : $("#nick").val()}
			, dataType : "json"
			, success : function(result) {
				console.log("AJAX 성공")
				console.log(result)
				
				if(result==1){
					console.log("중복")
					$("#dupMsg").css("color","red").html("중복된 닉네임입니다")
					duplCheck = false;
					
				}else if (result == 0){
					console.log("중복아님")
					$("#dupMsg").css("color", "blue").html("사용가능한 닉네임입니다")
					duplCheck = true;
				}
			}
			,error : function() {
				console.log("AJAX 실패")
			}
			
		});
	});
	
// var pwchk = false;
// function PWChk() {	
// 	var Pchk = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$";
	
// 	if(false === Pchk.test(pw.value)){
// 		alert("비밀번호는 8자 이상, 20자 이하이어야 하며, 숫자/대문자/특수문자를 모두 포함해야 합니다.")
// 		return false;
// 	} 
// }
	
	 $("#update").click(function(){
      
		if($("#name").val().length==0){
	        alert("이름을 입력해주세요.");
	        $("#name").focus();
	        return false;
	      }
		
		if($("#nick").val().length==0){
	        alert("닉네임을 입력해주세요.");
	        $("#nick").focus();
	        return false;
	      }
      
		if($("#pw").val().length==0){
	        alert("비밀번호를 입력해주세요.");
	        $("#pw").focus();
	        return false;
	      }
		

		if($("#pwChk").val().length==0){
	        alert("비밀번호를 확인해주세요.");
	        $("#pwChk").focus();
	        return false;
	      }

		
	      if($("#pw").val() != $("#pwChk").val()){
	          alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
	          $("#pw").focus();
	          return false; 
	      }
      
		if($("#email").val().length==0){
	        alert("이메일을 입력해주세요.");
	        $("#email").focus();
	        return false;
	      }

		if($("#phone").val().length==0){
	        alert("전화번호를 입력해주세요.");
	        $("#phone").focus();
	        return false;
	      }
		
		
		
// 		var Pchk = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$";
		
// 		if(false === Pchk.test(pw.value)){
// 			alert("비밀번호는 8자 이상, 20자 이하이어야 하며, 숫자/대문자/특수문자를 모두 포함해야 합니다.")
// 			return false;
// 		} 
// 		else {
// 			return true;
// 		}
		
		
		
// 		if(! /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$.test(pw)){
// 			alert("비밀번호는 8자 이상, 20자 이하이어야 하며, 숫자/대문자/특수문자를 모두 포함해야 합니다.")
// 			return false;
// 		} 
// 		else {
// 			return true;
// 		}
		
		
		
	    if( !duplCheck ) {
	    	alert("닉네임 중복확인을 해주세요");
	           return false;
	        }
	
// 	    if( !pwchk) {
	    	
// 	    }
	    
	    
		$("form").submit();
      
	});

});


</script>



<style>

.lab {
	background-color: #E0ECF8;

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

#dupBtn {

	border-radius: 15px;
	background-color: white;
	color: #2E9AFE; 
	width: 90px;
	height: 30px;
	border: 3px solid #81BEF7;
	font-size: 15px;

}


input {
	border-radius : 5px;
	border: 2px solid #CEE3F6;
	box-shadow: none;
	text-align: center;
}

</style>



<div class="right">
<!-- <div class="container"> -->
<br><br>
<h1 style="text-align: center;">회원 정보 수정</h1>
<br><br><br>

<div id="infoform">

<form action="/mypage/infoupdate" method="post" class="form-horizontal">
	
	<input type="hidden" name="memberNo" id="memberNo" value="${info.memberNo }" >
	
	<div class="row" style="margin-right: 18%; height : 500px;">
	<div>
		<div style="width: 120px;  background-color: #E0ECF8; border-radius: 10px; text-align: center;" class="col-md-1 col-md-offset-4">
			<label for="id" style="padding-top: 4px;">아이디</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="id" id="id" value="${info.id }"  readonly="readonly">	
		</div>
	</div>
	<br><br><br>
	
<!-- 	<div class="row"> -->
	<div>
		<div style="width: 120px; background-color: #E0ECF8; border-radius: 10px; text-align: center;" class="col-md-1 col-md-offset-4">
			<label for="name" style="padding-top: 4px;">이름</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="name" id="name" value="${info.name }" >	
		</div>
	</div>
	<br><br><br>
<!-- 	<div class="row"> -->

	<div>
		<div style="width: 120px;  background-color: #E0ECF8; border-radius: 10px; text-align: center;" class="col-md-1 col-md-offset-4">
			<label for="nick" style="padding-top: 4px;">닉네임</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="nick" id="nick" value="${info.nick }" >
			
<!-- 			<br>	 -->
		</div>
<!-- 				<span id="dupMsg" style="position: relative" class="col-md-10"></span> -->
				<span id="dupMsg" style="margin-left: 100px;"></span>
		<div>
			<button type="button" id="dupBtn" name="dupBtn" class="col-md-offset-11" style="display: block; ">중복확인</button>		
		</div>
	</div>
	
	
<!-- 	<div class="row"> -->
	<div>
		<div style="width: 120px;  background-color: #E0ECF8; border-radius: 10px; text-align: center;" class="col-md-1 col-md-offset-4">
			<label for="pw" style="padding-top: 4px;">비밀번호</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="pw" id="pw" >	
		</div>
	</div>
	<br><br><br>
<!-- 	<div class="row"> -->

	<div>
		<div style="width: 120px; background-color: #E0ECF8; border-radius: 10px; text-align: center;" class="col-md-1 col-md-offset-4">
			<label for="pwChk" style="padding-top: 4px;">비밀번호 확인</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="pwChk" id="pwChk" >	
		</div>
	</div>
	<br><br><br>
	
<!-- 	<div class="row"> -->
	<div>
		<div style="width: 120px;  background-color: #E0ECF8; border-radius: 10px; text-align: center;" class="col-md-1 col-md-offset-4">
			<label for="email" style="padding-top: 4px;">이메일</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="email" name="email" id="email" value="${info.email }">	
		</div>
	</div>
	
	<br><br><br>
<!-- 	<div class="row"> -->

	<div>
		<div style="width: 120px;  background-color: #E0ECF8; border-radius: 10px; text-align: center;" class="col-md-1 col-md-offset-4">
			<label for="phone" style="padding-top: 4px;">전화번호</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="phone" id="phone" value="${info.phone }">	
		</div>
	</div>
	
	</div><!--row  -->
	


</form>



<!-- <br><br><br><br><br> -->
<div style="text-align: center;">
<button type="button" onclick="location.href='./infoview'" style="margin-right: 15px;">취소</button>
<button id="update" onclick="location.href='./infoupdate'" style="margin-right: 15px;">수정</button>
<button type="button" onclick="location.href='./memberdelete'">탈퇴</button>
</div>

</div><!-- infoform -->
</div><!-- right -->
</div><!-- .container end -->

<br><br><br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
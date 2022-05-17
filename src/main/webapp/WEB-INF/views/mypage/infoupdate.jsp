<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />


<script type="text/javascript">







$(document).ready(function() {

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

		


		var Namechk = /^[가-힣a-z]{2,10}$/; 
		if(Namechk.test(name.value)==false){
			alert("이름은 2~10자의 한글, 영어로만 입력 가능합니다.");
			return false;
		} 
		
		
		var Nickchk = /^[가-힣a-z0-9]{3,8}$/; 
		if(Nickchk.test(nick.value)==false){
			alert("닉네임은 3~8자의 한글, 영어, 숫자로만 입력 가능합니다.");
			return false;
		} 
		
		
		var Phonechk = /^\d{3}-\d{3,4}-\d{4}$/;
		if(Phonechk.test(phone.value)==false){
			alert("핸드폰 번호를 잘못 입력 했습니다. 형식을 확인해주세요.");
			return false;
		} 
		
		var Echk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(Echk.test(email.value)==false){
			alert("이메일을 잘못 입력 했습니다. 형식을 확인해주세요.");
			return false;
		} 
		
		var Pchk = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
		if(Pchk.test(pw.value)==false){
			alert("비밀번호는 8자 이상, 20자 이하이어야 하며, 숫자/영어/특수문자를 모두 포함해야 합니다.");
			return false;
		} 
		
		
	    if( !duplCheck ) {
	    	alert("닉네임 중복확인을 해주세요");
	           return false;
	        }
	
	    alert("수정이 완료되었습니다.");
	    
		$("form").submit();
		
		
      
	});

});


</script>



<style>

.lab {
	background-color: #538fd9;

}

button {

	border-radius: 7px;
	background-color: #035397;
	color: white; 
	width: 53px;
	height: 27px;
	border: 0px solid #81BEF7; 
	font-size: 15px;
	font-weight: bold;

}

#dupBtn {

	border-radius: 7px;
    background-color: #035397;
    color: #fff;
    width: 69px;
    height: 27px;
    border: 0px solid #81BEF7;
    font-size: 14px;
    font-weight: bold;

}


input {
	border-radius : 5px;
	border: 2px solid #DDD;
	box-shadow: none;
	text-align: center;
}

.title {
	margin-left: 30%;
	width: 120px;  
	background-color: #fff; 
	border-radius: 5px; 
	text-align: center; 
	display: inline-block;
}

.ans {
	width: 250px; 
	display: inline-block;
	margin-left: 50px;
	
}


.all {

/* 	border: 1px solid #035397; */
/* 	border-radius: 15px; */

}




</style>



<div class="right">
<!-- <div class="container"> -->
<br><br>
<div class="all">
<h1 style="text-align: center;">회원 정보 수정</h1>
<br><br><br>

<div id="infoform">

<form action="/mypage/infoupdate" method="post" >
	
	<input type="hidden" name="memberNo" id="memberNo" value="${info.memberNo }" >
	
	<div class="box"  style="height : 500px; " >
	<div style="margin-bottom: 30px;">
		<div class="title" >
			<label for="id" style="padding-top: 4px; color: #2E4C6D">아이디</label>
		</div>
		<div class = "ans">
			<input type="text" name="id" id="id" value="${info.id }"  readonly="readonly">	
		</div>
	</div>
	
	<div style="margin-bottom: 30px;">
		<div class="title" >			
			<label for="name" style="padding-top: 4px; color: #2E4C6D ">이름</label>
		</div>
		<div class = "ans">
			<input type="text" name="name" id="name" value="${info.name }" >	
		</div>
	</div>


	<div style="margin-bottom: 15px;">
		<div class="title" >	
			<label for="nick" style="padding-top: 4px; color: #2E4C6D">닉네임</label>
		</div>
		<div class = "ans">
			<input type="text" name="nick" id="nick" value="${info.nick }" >
		</div>
		<div style="display: inline-block;">
			<button type="button" id="dupBtn" name="dupBtn">중복확인</button>		
		</div>
		<div style="display: inline-block; margin-left: 50%;">
				<span id="dupMsg" ></span>
		</div>
	</div>
	
	
	<div style="margin-bottom: 30px;">
		<div class="title" >	
			<label for="pw" style="padding-top: 4px; color: #2E4C6D">비밀번호</label>
		</div>
		<div class = "ans">
			<input type="text" name="pw" id="pw" >	
		</div>
	</div>

	<div style="margin-bottom: 30px;">
		<div class="title" >	
			<label for="pwChk" style="padding-top: 4px; color: #2E4C6D">비밀번호 확인</label>
		</div>
		<div class = "ans">
			<input type="text" name="pwChk" id="pwChk" >	
		</div>
	</div>
	
	<div style="margin-bottom: 30px;">
		<div class="title" >	
			<label for="email" style="padding-top: 4px; color: #2E4C6D">이메일</label>
		</div>
		<div class = "ans">
			<input type="email" name="email" id="email" value="${info.email }">	
		</div>
	</div>
	

	<div style="margin-bottom: 30px;">
		<div class="title" >	
			<label for="phone" style="padding-top: 4px; color: #2E4C6D">전화번호</label>
		</div>
		<div class = "ans">
			<input type="text" name="phone" id="phone" value="${info.phone }">	
		</div>
	</div>
	
	</div><!--box  -->
	


</form>




<div style="text-align: center;">
<button type="button" onclick="location.href='./infoview'" style="margin-right: 15px;">취소</button>
<button id="update" onclick="location.href='./infoupdate'" style="margin-right: 15px;">수정</button>
<!-- <button type="button" onclick="location.href='./memberdelete'">탈퇴</button> -->
</div>

</div><!-- infoform -->
</div><!-- .all -->
</div><!-- right -->
</div><!-- .container end -->

<br><br><br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
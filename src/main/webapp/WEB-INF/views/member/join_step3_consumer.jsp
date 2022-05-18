<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">

#joinForm{width: 460px;margin: 0 auto;}


div.top-text {
	margin: 0px 0px 50px;
	color : #2775C4;
	height: 74.4;
    text-align: center;
    font-size: 30px;
}

.step-list {
	list-style-type: none;
}

.step-list li strong {
/* 	color: white; */
	font-weight: 300;
}

.step-list li.on strong {
 	background: #2775C4;
    margin: 0px;
    padding: 17px 118px;
    color: white;
    font-size: 16px;
}

.step-list li.off strong {
 	background: #bfc4ca;
    margin: 0px;
    padding: 17px 118px;
    color: white;
    font-size: 16px;
}


.step-list li {
	float: left;
	width: 33%;
	text-align: center;
	line-height: 50px;
}

/* 정보입력 div */
.memberinfo {
	margin: 24px;
    padding: 54px;
	text-align: center; 
}

/* 아이디 중복확인 css */ 
#info_id {
	position: relative;
}
#idChkbtn {
  position: absolute;
  width: 73px;
  height: 29px;
  top: 0;
  bottom: 0;
  right: 5px;
  margin: auto 0;
  border-radius: 3px;
}

/* 닉네임 중복확인 css */ 
#info_nick {
	position: relative;
}
#nickChkbtn {
  position: absolute;
  width: 73px;
  height: 29px;
  top: 0;
  bottom: 0;
  right: 5px;
  margin: auto 0;
  border-radius: 3px;
}

/* 이메일 인증번호 전송 css */ 
#emailform {
	position: relative;
}
#emailChk {
  position: absolute;
  width: 88px;
  height: 29px;
  top: 0;
  bottom: 0;
  right: 5px;
  margin: auto 0;
  border-radius: 3px;
}

.form-group input2{
	width: 100px;
}

.form-horizontal {
text-align: center;
    margin: 0px 0 0 72px;
}

.col-sm-6 {
	text-align: -webkit-left;
}

.form-group input{
	height: 42px;
}


 .join-wrap {
	margin: 20px;
}
 

</style>


<script type="text/javascript">

$(document).ready(function() {	
	
	//뒤로가기
	$("#cancel").click(function() {
	history.go(-1)
	})
	
	//이메일 인증 
	var code = ""; 
	$("#emailChk").click(function(){ 
		console.log("emailChk 클릭됨");
		
		var email = $("#email").val(); 
		$.ajax({ 
		type:"GET",
		url:"mailCheck?email=" + email,
		cache : false,
		success:function(data){ 
			if(data == "error"){ 
				alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요."); 
					$("#email").attr("autofocus",true); 
					$(".successEmailChk").text("유효한 이메일 주소를 입력해주세요."); 
					$(".successEmailChk").css("color","red"); 
			}else{ 
				//인증번호가 올바르게 발송되었을 시, disabled 폼 false로 변경
				alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오."); 
					$("#email2").attr("disabled",false); 
					$("#emailChk2").css("display","inline-block"); 
					$(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오."); 
					$(".successEmailChk").css("color","green"); 
					code = data; 
					} 
				} 
			})
		}) //#emailChk end
		
		
	//이메일 인증번호 대조 
	$("#emailChk2").click(function(){ 
		console.log("emailChk2 클릭")
		
		if($("#email2").val() == code){ 
			$(".successEmailChk").text("인증번호가 일치합니다."); 
			$(".successEmailChk").css("color","green"); 
			$("#emailDoubleChk").val("true"); 
			$("#email2").attr("disabled",true); 
			//$("#email").attr("disabled",true); 
		}else{ 
			$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
			$(".successEmailChk").css("color","red"); 
			$("#emailDoubleChk").val("false"); 
			$("#email2").attr("autofocus",true); 
			} 
	}) //#emailChk2 end
	
	
	//아이디 중복 검사
	$("#idChkbtn").click(function() {
		console.log("#id click")
		
		var id = $("#id").val();
		if(id == "" || id.length < 5){
			$(".successIdChk").text("아이디는 영어 소문자와 숫자로만 가능하며, 5자 이상 12자 이하로 설정해주시기 바랍니다");
				$(".successIdChk").css("color", "black");
				$("#idDoubleChk").val("false");
		} else {
			
			$.ajax({
				type: "post",		
				url: '${pageContext.request.contextPath}/member/idCheck?id='+ id,	
				cache : false,
				success: function(data){	
					if(data == 0) {
						$(".successIdChk").text("사용가능한 아이디입니다")
						$("#idDoubleChk").val("true");
					} else {
						$(".successIdChk").text("사용중인 아이디입니다")
						$("#idDoubleChk").val("false");
					}
				} // success end
				, error: function(){ 
					console.log("AJAX실패")
				} // error end
			}) //$.ajax end
		}// else end
	}) //아이디 중복검사 end
	
		
	//닉네임 중복 검사
	$("#nickChkbtn").click(function() {
		console.log("#nick click")
		
		var nick = $("#nick").val();
		if(nick == "" || nick.length < 3){
			$(".successNickChk").text("닉네임은 3자 이상 8자 이하로 설정해주시기 바랍니다");
				$(".successNickChk").css("color", "black");
				$("#nickChk").val("false");
		} else {
			
			$.ajax({
				type: "post",		
				url: '${pageContext.request.contextPath}/member/nickCheck?nick='+ nick,	
				cache : false,
				success: function(data){	
					if(data == 0) {
						$(".successNickChk").text("사용가능한 닉네임입니다")
						$("#nickChk").val("true");
					} else {
						$(".successNickChk").text("사용중인 닉네임입니다")
						$("#nickChk").val("false");
					}
				} // success end
				, error: function(){ 
					console.log("AJAX실패")
				} // error end
			}) //$.ajax end
		}// else end
	}) //닉네임 중복검사 end
	
	//비밀번호 확인
	 $('.form-control').blur(function () {
	        var pwd1 = $("#pw").val();
	        var pwd2 = $("#pw2").val();
	  
	        if ( pwd1 != '' && pwd2 == '' ) {
	            null;
	        } else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	                // 비밀번호 일치 이벤트 실행
	                console.log("비밀번호 일치")
	                $(".passwordChk").text("비밀번호가 확인되었습니다.");
	                
	            } else {
	                // 비밀번호 불일치 이벤트 실행
	                console.log("비밀번호 불일치")
					$(".passwordChk").text("비밀번호를 다시 한번 더 확인해주세요");
					$(".passwordChk").css("color", "red");
					$("#pwDoubleChk").val("false");
	            }
	        }
	 })
	
}) //document end	


//유효성 검사
function validate() {
		
	var objId = document.getElementById("id"); //아이디
	var objPw = document.getElementById("pw"); //비밀번호
	var objPw2 = document.getElementById("pw2"); //비밀번호확인
  	var objName = document.getElementById("name"); //이름
  	var objNick = document.getElementById("nick"); //닉네임
  	var objEmail = document.getElementById("email");//이메일
  	var objPhone = document.getElementById("phone");//핸드폰번호
      
	//id 유효성 검사 정규식(소문자,숫자 (첫문자는 소문자만 가능) 허용)
	var id_RegExp = /^[a-z]{1}[a-z0-9_]{5,12}$/; 
	//pw 유효성 검사 정규식(영어,숫자,특수문자 모두 포함)
	var pw_RegExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/; 
 	//이름과 닉네임 유효성 검사 정규식
	var name_RegExp = /^[가-힣a-z]{2,10}$/; 
	var nick_RegExp = /^[가-힣a-z0-9]{3,8}$/; 
	//이메일 유효성검사
	var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	//핸드폰번호 유효성검사
	var h_RegExp = /^\d{3}-\d{3,4}-\d{4}$/;
  
 	// ================ ID 유효성검사 ================ //
  
 	//아이디를 입력하지 않았을 경우
 	if((objId.value) == ''){ 
      alert("ID를 입력하지 않았습니다.");
      objId.focus();
      return false;
 	}
	//아이디 유효성 검사
	//내가 입력한 데이터를 검사하는 check()
	if(!check(id_RegExp,objId,"아이디는 5~12자의 영소문자와 숫자로만 입력 가능합니다.(단, 첫문자는 소문자만 가능)")) {
      return false;
 	}
  
	 // ================ PASSWORD 유효성검사 ===============//
	 // 비밀번호 입력여부 검사
	if((objPw.value) == ''){ 
		alert("Password를 입력하지 않았습니다.");
		objPw.focus();
		return false;
	 }
	 // 비밀번호 확인 입력여부 검사
	if((objPw2.value) == '' ){ 
		alert("'Password 확인'을 입력하지 않았습니다.");
		objPw2.focus();
		return false;
	 }
	 
	 //비밀번호 유효성검사
	 if(!check(pw_RegExp,objPw,"Password는 8~20자의 영문 대소문자, 숫자, 특수문자가 모두 포함하여야만 합니다.")) {
	    return false;
	 }
	//패스워드와 ID가 동일한지 검사
	 if((objPw.value) == (objId.value)){ 
	    alert("Password는 ID와 동일하면 안됩니다.");
	    return false;
	  }
	  
	  if((objPw.value) != (objPw2.value)){ //비밀번호와 비밀번호확인이 동일한지 검사
	      alert("비밀번호가 틀립니다. 다시 확인하여 입력해주세요.");
	      return false;
	  }
	  
	  // ================ 이름 유효성검사 ================ //        
	  if(objName.value ==''){
	      alert("이름을 입력해주세요.");
	      objName.focus();
	      return false;
	  }
	  if(!check(name_RegExp,objName,"이름은 2~10자의 한글, 영어로만 입력 가능합니다.")) {
	      return false;
	  }
	  
	  
	  // ================ 닉네임 유효성검사 ================ //        
	  if(objNick.value ==''){
	      alert("닉네임을 입력해주세요.");
	      objNick.focus();
	      return false;
	  }
	  if(!check(nick_RegExp,objNick,"닉네임은 3~8자의 한글, 영어, 숫자로만 입력 가능합니다.")) {
	      return false;
	  }
	  

	  // ================ 핸드폰번호 유효성검사 ================ //        
	  if(objPhone.value ==''){
	      alert("핸드폰번호를 입력해주세요.");
	      objPhone.focus();
	      return false;
	  }
	  if(!check(h_RegExp,objPhone,"핸드폰 번호를 잘못 입력 했습니다. 형식을 확인해주세요.")) {
	      return false;
	}
	  
	  // ================ email 유효성검사 ================ //
	  if((e_RegExp.value) == ''){ // 이메일 입력여부 검사
	      alert("이메일을 입력해주세요.");
	      return false;
	  }
	  
	  if(!check(e_RegExp,objEmail,"이메일을 잘못 입력 했습니다. 형식을 확인해주세요.")) {
	      return false;
	  }
	  
	  alert("회원가입이 완료되었습니다.");
} //function validate() end

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
} //function check end


</script>



<div class="container">


<div class="join-wrap">
	
	<ol class="step-list">
		<li class="off">
			<strong>STEP1<span>  회원구분</span></strong>
		</li>
		<li class="off">
			<strong>STEP2<span>  약관동의</span></strong>
		</li>
		<li class="on">
			<strong>STEP3<span>  정보입력</span></strong>
		</li>
	</ol>
	
</div>

<div class="memberinfo">

<h3><strong>정보입력</strong></h3>
<hr>

<form action="/member/join_step3_consumer" method="POST" class="form-horizontal" onsubmit="return validate()">




<div class="form-group">
	<label for="userid" class="col-sm-3 control-label">아이디</label>
	<div class="col-sm-6">
		<div id="info_id">
			<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요(5~12자)" maxlength="12"   autofocus>
			<input type="button" id="idChkbtn" class="btn btn-default btn-sm"  value="중복확인" >
		</div>
		<small><span class="point successIdChk"></span></small>
		<input type="hidden" id="idDoubleChk">
	</div>
</div>

<div class="form-group">
	<label for="userpw" class="col-sm-3 control-label">비밀번호</label>
	<div class="col-sm-6">
		<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해주세요(문자, 숫자, 특수문자 포함 8자~20자)" maxlength="20">
		<small><span class="point successPwChk"></span></small> 
		<input type="hidden" id="pwChk"/>
	</div>
</div>

<div class="form-group">
	<label for="userpwChk" class="col-sm-3 control-label">비밀번호 확인</label>
	<div class="col-sm-6">
		<input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호를 한번 더 입력해주세요" maxlength="20">
		<small><span class="point passwordChk"></span></small> 
		<input type="hidden" id="pwDoubleChk"/>
	</div>
</div>


<div class="form-group">
	<label for="id" class="col-sm-3 control-label">이름</label>
	<div class="col-sm-6">
		<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요(2~10자)" maxlength="10">
	</div>
</div>

<div class="form-group">
	<label for="id" class="col-sm-3 control-label">닉네임</label>
	<div class="col-sm-6">
		<div id="info_nick">
			<input type="text" class="form-control" id="nick" name="nick" placeholder="닉네임을 입력해주세요(3~8자)" maxlength="8">
			<input type="button" id="nickChkbtn" class="btn btn-default btn-sm" value="중복확인">
		</div>
		<small><span class="point successNickChk"></span></small> 
		<input type="hidden" id="nickChk"/>
	</div>
</div>

<div class="form-group">
	<label for="id" class="col-sm-3 control-label">핸드폰번호</label>
	<div class="col-sm-6">
		<input type="text" class="form-control" id="phone" name="phone" placeholder="핸드폰번호를 입력해주세요(ex. 010-1234-5678)" maxlength="13">
	</div>
</div>

<div class="form-group">
	<label for="email" class="col-sm-3 control-label">이메일</label>
	<div class="col-sm-6">
		<div id="emailform">
			<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요(ex. funding@naver.com)" maxlength="20" >
			<input type="button" id="emailChk" class="btn doubleChk btn-default btn-sm" value="인증번호 전송">
<!-- 		<button class="btn"><p id="emailChk" class="doubleChk">인증번호 보내기</p></button> -->
		</div>
		<small class="tip"> 아이디 비밀번호 분실시 필요한 정보이므로, 정확하게 기입해 주십시오. </small> 
	</div>
</div>


<div class="form-group">
	<label for="emailChk" class="col-sm-3 control-label">이메일 인증 번호</label>
	<div class="col-sm-6">
		<input type="text" id="email2" name="email2" title="인증번호 입력" disabled /> 
		<input type="button" id="emailChk2" class="btn doubleChk btn-default btn-sm" value="이메일 인증">
<!-- 		<button><span id="emailChk2" class="doubleChk">이메일인증</span> </button> -->
	</div>
		<span class="point successEmailChk"></span>
		<input type="hidden" id="emailDoubleChk"/>
</div>


<div class="form-group2">
	<div>
		<input type="reset" id="cancel" class="btn btn-warning" value="뒤로가기" />
		<input type="submit" id="join" class="btn btn-primary" value="회원가입" />
	</div>
</div>

</form>

</div>

</div> <!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

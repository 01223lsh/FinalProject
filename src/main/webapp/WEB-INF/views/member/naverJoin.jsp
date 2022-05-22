<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

.container { font-family: 'Noto Sans KR', sans-serif;}

/* 닉네임 중복확인 css */ 
#info_nick {
	position: relative;
}
#nickChkbtn {
    position: absolute;
    width: 88px;
    height: 42px;
    top: 0;
    right: 5px;
    bottom: 0;
    margin: auto 0;
    border-radius: 4px;
    font-size: 15px;
    font-weight: bold;
}

body {
	text-align: center;
}

h3 {
margin: 35px 0 0px 0px;
}

.btn-sm {
	background: #E5EFC1;
}

form {
    margin: 30px;
    font-size: 16px;
    text-align: -webkit-center;
    font-weight: bold;
    }

.form-group {
margin : 20px;
}

.form-control{height: 54px;}

.control-label {
	text-align: left;
    margin: 0px 109px 0 0px;
    font-size: 16px;
}

#chkemailform {
margin : 0 276px 0 0px;
}

#email2{height: 39px;} 

#emailDoubleChk{background: red;
}

#infoform{
	padding: 85px 0 0 0;
    font-size: 30px;
}

#cancel{
    outline: 0px;
    border: 0px;
    width: 13%;
    height: 62px;
    font-size: 21px;
    color: white;
    font-weight: bold;
}

#joinbtn {
    background: #39AEA9;
    outline: 0px;
    border: 0px;
    width: 13%;
    height: 62px;
    font-size: 21px;
    color: white;
    font-weight: bold;
}

#joinfont {
    font-size: 44px;
    font-weight: bold;
    margin: 20px;
}

</style>


<script type="text/javascript">

$(document).ready(function() {	
	
	//뒤로가기
	$("#cancel").click(function() {
	history.go(-1)
	})
	
		
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
	

	
}) //document end	


//유효성 검사
function validate() {
  	var objName = document.getElementById("name"); //이름
  	var objNick = document.getElementById("nick"); //닉네임
  	var objPhone = document.getElementById("phone");//핸드폰번호

  	//이름과 닉네임 유효성 검사 정규식
	var name_RegExp = /^[가-힣a-z]{2,10}$/; 
	var nick_RegExp = /^[가-힣a-z0-9]{3,8}$/; 
	//핸드폰번호 유효성검사
	var h_RegExp = /^\d{3}-\d{3,4}-\d{4}$/;
  
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


<div id="container">

<div id="info">
	<div id="joinfont">회원가입</div>
	<div id="comment">홈페이지를 이용하기 위해 필요한 최소한의 정보를 받고있습니다.</div>
</div>



<form action="/member/naverJoin" method="POST" class="form-horizontal" onsubmit="return validate()">

<input type="hidden"  id="email" name="email" value="${email}"/>

<div id="userinfo">

<div class="form-group">
	<label for="id" class="col-sm-3 control-label">이름</label>
	<div class="col-sm-4">
		<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요(2~10자)" maxlength="10">
	</div>
</div>

<div class="form-group">
	<label for="id" class="col-sm-3 control-label">닉네임</label>
	<div class="col-sm-4">
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
	<div class="col-sm-4">
		<input type="text" class="form-control" id="phone" name="phone" placeholder="핸드폰번호를 입력해주세요(ex. 010-1234-5678)" maxlength="13">
	</div>
</div>

</div>

<div class="form-group2">
	<div>
		<input type="reset" id="cancel" class="btn btn-warning" value="로그인으로 이동" />
		<input type="submit" id="joinbtn" class="btn btn-primary" value="회원가입" />
	</div>
</div>


</form>

</div> <!-- container end -->



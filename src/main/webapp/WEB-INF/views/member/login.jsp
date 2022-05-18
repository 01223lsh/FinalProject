<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

/* 네이버 로그인 관련 */
html, div, body,h3{
      margin: 0;
      padding: 0;
      font-size: 15px;
  }
 h3{
      display: inline-block;
      padding: 0.6em;
  }
 /* 네이버 로그인 관련  end*/
 
 #rememberid{
 	text-align: left;
    margin: 0px 0px 0px 25px;
 }
 
 
.separator{
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0,0,0,0.35);
	font-size: 14px;
	margin: 8px 0px;
}
.separator::before{
	content:"";
	flex-grow: 1;
	margin: 0px 16px;
	background: rgba(0,0,0,0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
}
.separator::after{
	content:"";
	flex-grow: 1;
	margin: 0px 16px;
	background: rgba(0,0,0,0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
}

.container{
    text-align: -webkit-center;
    padding: 40px;
}

.col-sm-3 {
	margin: 7px;
}

#id_pw{
	margin: 20px;
}

.form-control {
    display: block;
    width: 100%;
    height: 48px;
    padding: 6px 12px;
    font-size: 16px;


 
 
</style>










<html>
<head>
	<title>Login </title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
	<!-- ============ 네이버 로그인 ============ -->  
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
	

  
  <body>
  
  
  
  
  


  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  
  <script type="text/javascript">
  
  //============================  카카오로그인 ============================
	  
  function kakaoLogin() {

    $.ajax({
        url: '/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']);
      }
  }) //function end
  
  
  //============================ 아이디저장하기(쿠키이용) ============================
  
   $(function() {
           fnInit();
     });
     
     function frm_check(){
         saveid();
     }
 
    function fnInit(){
        var cookieid = getCookie("saveid");
//         console.log(cookieid);
        if(cookieid !=""){
            $("input:checkbox[id='saveId']").prop("checked", true);
            $('#id').val(cookieid);
            
        }
        
    }    
 
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + 0);
        if(todayDate > expiredays){
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
        }else if(todayDate < expiredays){
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }
        
        
        console.log(document.cookie);
    }
 
    function getCookie(Name) {
        var search = Name + "=";
        console.log("search : " + search);
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            console.log("offset : " + offset);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                // set index of beginning of value
                end = document.cookie.indexOf(";", offset);
                console.log("end : " + end);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1)
                    end = document.cookie.length;
                console.log("end위치  : " + end);
                
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
 
    function saveid() {
        var expdate = new Date();
        if ($("#saveId").is(":checked")){
            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#id").val(), expdate);
            }else{
           expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#id").val(), expdate);
             
        }
    }
    
    //알림창 설정
	$(document).ready(function(){
	    $("#saveId").change(function(){
	        if($("#saveId").is(":checked")){
	            alert("이 PC에 로그인 정보를 저장하시겠습니까?\n공공장소에서는 개인정보가 유출될 수 있으니 주의 바랍니다.");
	        }
	    });
	});
    
	    
	//로그인 버튼 입력했을 때, 빈칸 있을 시 알림 요청
    
    
    
  </script>
  

  

  
  
  
<div class="container">


<h2 id="login" >로그인</h2>

<form action="/member/loginform" method="post" style="width:470px;" class="form-horizontal" onsubmit="return submit()">

<div id="id_pw">

<div class="form-group">
	<span class="col-sm-3"> 아이디 </span>

	<div class="col-sm-8">
		<input type="text" class="form-control" id="id" name="id" maxlength="12" placeholder="아이디를 입력해주세요" autofocus>
	</div>
</div>

<div class="form-group">
	<span class="col-sm-3"> 비밀번호 </span>

	<div class="col-sm-8">
		<input type="password" class="form-control" id="pw" name="pw" maxlength="20" placeholder="비밀번호를 입력해주세요">
	</div>
</div>

<div id="rememberid">
    <input type="checkbox" class="save_id" name="checkId" id="saveId" >
    <label for="saveId">아이디 저장</label>
</div>

</div> <!--"id_pw" end  -->


<button id="loginBtn" type="submit" class="btn btn-primary btn-lg btn-block" >로그인</button> 

<br><br>
<div id="find_join"  style="color: black">
<a href="/member/findID">아이디 찾기&nbsp&nbsp&nbsp</a> | 
<a href="/member/findPW">&nbsp&nbsp&nbsp비밀번호 찾기&nbsp&nbsp&nbsp</a> |
<a href="/member/join_step1">&nbsp&nbsp&nbsp회원가입</a>
</div>


<div class="separator">
또는
</div>

</form>







  




  

 
<!-- ============ 네이버 로그인 ============ -->  
<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
<div id="sns_login" style="text-align: center;">
<span id="naverlogin"><a href="${url}"><img height="54px" width="217px"
src="../resources/icon/naver_logo.png"/></a></span>
<span id="kakaologin" onclick="kakaoLogin();"><a href="javascript:void(0)"><img height="54px" width="217px"
src="../resources/icon/kakao_logo.png"/></a></span>
</div>

<!--   <ul> -->
<!--       <li onclick="kakaoLogin();"> -->
<!--         <a href="javascript:void(0)"> -->
<!--             <span>카카오 로그인</span> -->
<!--         </a> -->
<!--       </li> -->
<!--   </ul> -->



</div> <!-- container end -->


</body>
</html>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.container { 
	text-align: center;
	text-align: -webkit-center;

}
</style>


<html>
<head>
	<title>Login </title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
</head>
  <body>
  <ul>
      <li onclick="kakaoLogin();">
        <a href="javascript:void(0)">
            <span>카카오 로그인</span>
        </a>
      </li>
  </ul>

  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  
  <script>
  
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
        console.log(cookieid);
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
 
  
  
  </script>
  

  

  
  
  
<div class="container">

<h2>로그인</h2>

<form action="/member/login" method="post" style="width:470px;" class="form-horizontal" onsubmit="return frm_check();">


<div class="form-group">
	<label for="id" class="col-sm-3 control-label">아이디</label>
	<div class="col-sm-8">
		<input type="text" class="form-control" id="id" name="id" maxlength="30" autofocus>
	</div>
</div>

<div class="form-group">
	<label for="id" class="col-sm-3 control-label">비밀번호</label>
	<div class="col-sm-8">
		<input type="password" class="form-control" id="pw" name="pw" maxlength="30" >
	</div>
</div>



<div class="logSave">
    <input type="checkbox" class="save_id" name="checkId" id="saveId" >
    <label for="saveId">아이디 저장</label>
</div>

<div>
<a href="/member/findID">아이디 찾기</a> | <a href="/member/findPW">비밀번호 찾기</a>
</div>  


<button>로그인</button> 
</form>

<a href="/member/join_step1"><button>회원가입</button></a>
  

  </div>
  
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
$(document).on('click','#findId',function(){
	var name = $('#name').val();
	var email = $('#email').val();

 	var postData = {'email' : email, 'name' : name};
 	
	$.ajax({
        url:'/member/findID',
        type:'POST',
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",
        
        success:function(data){
        	var idLists = data.id;
//         	var idLength = idLists.length
//         	var idfind = idLists.substring(1, idLength-1)

		console.log (idLists);
		
		if (idLists == 'kakaoUser'){
			$("#idList").append("<h1>"+"회원님의 정보는 카카오 계정으로 확인됩니다.\n카카오 로그인을 통해 진행해주세요.</h1>")
			$("#idList").css("color","darkblue"); 
			$("#idList").css("margin","10px"); 
			$("#idList").css("font-weight","bold"); 
			
		} else if (idLists == 'naverUser') {
			$("#idList").append("<h1>"+"회원님의 정보는 네이버 계정으로 확인됩니다.\n네이버 로그인을 통해 진행해주세요.</h1>")
			$("#idList").css("color","darkblue"); 
			$("#idList").css("margin","10px"); 
			$("#idList").css("font-weight","bold"); 
			
		} else if (idLists == 'null' ){
			$("#idList").append("<h4>"+"등록되지 않은 정보입니다. 정보를 다시 입력해주시길 바랍니다.</h4>")
			$("#idList").css("color","darkblue"); 
			$("#idList").css("margin","10px"); 
			$("#idList").css("font-weight","bold"); 
			
		}
		
		else {
		
       	 	$("#idList").append("<h4>회원님의 정보로 등록된 아이디는 '" + idLists + "' 입니다</h4>")
			$("#idList").css("font-weight","bold"); 
		}

        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

        	alert('등록되지 않은 정보입니다. 정보를 다시 입력해주시길 바랍니다.' );
        }
    });
});
	
</script>


<style type="text/css">
#container{
	text-align: center;
	margin: 30px;
	font-family: 'Noto Sans KR', sans-serif;
}

input.form-group-lg {
    height: 68px;
    width: 414px;
    margin: 8px;
    font-size: 18px;
}

#idfont {
    font-size: 39px;
    font-weight: bold;
    margin: 22px;
}

#findId {
	background: #39AEA9;
    outline: 0px;
    border: 0px;
    width: 195px;
    height: 65px;
    color: white;
    font-size: 25px;
    border-radius: 7px;
    margin: 10px;
}

#location {
	background : #A2D5AB;
    outline: 0px;
    border: 0px;
    width: 195px;
    height: 65px;
    color: white;
    font-size: 25px;
    border-radius: 7px;
    margin: 10px;
}

h4{
    font-size: 28px;
    margin: 37px;
}


</style>



<div id="container">

<div id="idfont">아이디 찾기</div>

<form action="/member/findid" method="POST" class="form-horizontal">

<!-- <form onsubmit="return validate()"> -->
<!-- 	회원유형 : <input type="button" id="member" value="일반회원"> | <input type="button" id="seller" value="판매자"><br>  -->
	<input type="text" id="name"  class="form-group form-group-lg" placeholder="이름을 입력해주세요(2~10자)" maxlength="10" required autofocus><br>
	<input type="text" id="email"  class="form-group form-group-lg" placeholder="이메일을 입력해주세요(ex. funding@naver.com)" maxlength="20" required>
</form>

<input type="button" id="location" onclick="location.href='/member/login'" value="로그인이동">
<input type="button"  id="findId" value="아이디 찾기">

<br>
<div id="idList"></div>


</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />
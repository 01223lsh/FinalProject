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
			
		} else if (idLists == 'naverUser') {
			$("#idList").append("<h1>"+"회원님의 정보는 네이버 계정으로 확인됩니다.\n네이버 로그인을 통해 진행해주세요.</h1>")
		
		} else {
		
       	 	$("#idList").append("<h1>"+"회원님의 정보로 등록된 아이디는 : " + idLists + " 입니다.</h1>")
		}

        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

        	alert('등록되지 않은 정보입니다. 정보를 다시 입력해주시길 바랍니다.' );
        }
    });
});
	
</script>



<h1>아이디 찾기</h1>

<div>

클라우드펀딩 가입 시 입력하신 이메일을 입력해주세요.

<form>

	회원유형 : <input type="button" id="member" value="일반회원"> | <input type="button" id="seller" value="판매자"><br> 
	<input type="text" id="name" placeholder="이름을 입력해주세요" required autofocus><br>
	<input type="text" id="email" placeholder="이메일을 입력해주세요" required>

</form>
<input type="button" id="findId" value="아이디 찾기">
<span id="idList"></span>

<a href="/member/login"><button>로그인 이동</button></a>



</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/member/findPW",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>

<style type="text/css">
#container{
	text-align: center;
	margin: 30px;
}

input {
    height: 53px;
    width: 344px;
    margin: 9px;
}

#pwfont {
    font-size: 39px;
    font-weight: bold;
    margin: 22px;
}

.btn-primary {
    height: 43px;
    width: 172px;
}
.btn-warning {
    height: 43px;
    width: 172px;
}


</style>



<div id="container">

<div id="pwfont">비밀번호 찾기</div>

<form class="form-horizontal">
		<input class="w3-input" type="text" id="id" class="form-group form-group-lg"  name="id" placeholder="아이디를 입력해주세요" required autofocus><br>
		<input class="w3-input" type="text" id="email" class="form-group form-group-lg"  name="email" placeholder="이메일을 입력해주세요(ex. funding@naver.com)" maxlength="20" required>
</form>

	<p class="w3-center">
		<button type="button" id="findBtn" class="btn btn-primary">임시 비밀번호 발급</button>
		<button type="button" onclick="history.go(-1);" class="btn btn-warning">로그인</button>
	</p>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
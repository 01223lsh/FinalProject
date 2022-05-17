<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />

<script type="text/javascript">

// $(document).ready(function(){
	   
// 	   //==================== 탈퇴 ====================
// 	   $("#delete").click(function() {
	      
// 	      var pw = prompt('비밀번호를 입력해주세요', '비밀번호 입력');
	      
// 	      $.ajax({
// 	          url: '${pageContext.request.contextPath}/member/withdrawPw?pw='+ pw, 
// 	          type: "POST",
// 	          dataType: "JSON",
// 	          success: function(data){
// 	             console.log("data1 : ", data)
	             
// 	             if(data == true ){
// 	                console.log("비밀번호 맞음")
	   
// 	               var deleteYN = confirm("탈퇴하시겠습니까? 개인정보는 3개월간 보관됩니다.");
// 	               if(deleteYN == true){
// 	                  location.href = '${pageContext.request.contextPath}/member/quit';
	                  
// 	               } else
// 	                  alert("취소하였습니다.");
	               
// 	             } else {
// 	                console.log("비밀번호 틀림")
// 	                alert("패스워드가 틀렸습니다.")
// 	                return;
// 	             }
// 	           } //success end
// 	          , error: function(){
// 	             console.log("AJAX실패")
// 	          } //error end
// 	      }) //ajax end
	      
// 	   }); //#delete end 

// });
</script>







<style>

input {
	border: none;
	text-align: center;
}

button {

	border-radius: 5px;
	background-color: #538fd9;
	color: #fff; 
	width: 70px;
	height: 30px;
	border: 2px solid #538fd9;
	font-size: 15px;
	font-weight: bold;

}


</style>




<!-- <div class="container"> -->
<div class="right">
<br>
<h1 style="text-align:center;">회원 정보</h1>
<br><br><br>


	<div class="class="row">
		<div style="width: 120px;  background-color: #fff; border-radius: 5px; text-align: center; margin-left:30%; color: #538fd9;"  class="col-md-1 col-md-offset-3">
			<label for="id" style="padding-top: 4px;">아이디</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="id" id="id" value="${info.id }"  readonly="readonly">	
		</div>
	</div>
	<br><br><br>
	<div class="class="row">
		<div style="width: 120px; background-color: #fff; border-radius: 5px; text-align: center; margin-left:30%; color: #538fd9;" class="col-md-1 col-md-offset-4">
			<label for="name" style="padding-top: 4px;">이름</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="name" id="name" value="${info.name }" readonly="readonly">	
		</div>
	</div>
	<br><br><br>
	<div class="class="row">
		<div style="width: 120px;  background-color: #fff; border-radius: 5px; text-align: center; margin-left:30%; color: #538fd9;" class="col-md-1 col-md-offset-4">
			<label for="nick" style="padding-top: 4px;">닉네임</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="nick" id="nick" value="${info.nick }" readonly="readonly">	
		</div>
	</div>

	<br><br><br>
	<div class="class="row">
		<div style="width: 120px;  background-color: #fff; border-radius: 5px; text-align: center; margin-left:30%; color: #538fd9;" class="col-md-1 col-md-offset-4">
			<label for="email" style="padding-top: 4px;">이메일</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="email" id="email" value="${info.email }"readonly="readonly">	
		</div>
	</div>
	<br><br><br>
	<div class="class="row">
		<div style="width: 120px;  background-color: #fff; border-radius: 5px; text-align: center; margin-left:30%; color: #538fd9;" class="col-md-1 col-md-offset-4">
			<label for="phone" style="padding-top: 4px;">전화번호</label>
		</div>
		<div class="col-md-1 col-md-offset-1" style="width: 250px;">
			<input type="text" name="phone" id="phone" value="${info.phone }"readonly="readonly">	
		</div>
	</div>

<br><br><br><br><br>
<div style="text-align: center; ">
<button onclick="location.href='./infoupdate'" style="margin-right: 15px;">수정</button>
<button id="delete">탈퇴</button>
</div>

</div><!-- right -->
</div><!-- .container end -->

<br><br><br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
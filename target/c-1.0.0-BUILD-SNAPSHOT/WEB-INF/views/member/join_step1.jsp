<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />



<style type="text/css">
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

.step1 {
	margin: 24px;
    padding: 54px;
	text-align: center; 
}

.form-group {
	text-align: center;
 }
 

</style>

<script type="text/javascript">
$(document).ready(function(){
	
	
	//--------사업자 인증-----------
	$("#certify").click(function() {
// 		window.alert("메세지창 열림");

		var input = prompt('사업자번호를 입력해주세요', '사업자 번호 입력');
// 		alert(input);
// 		document.write(input);

		var data = {
// 				"b_no": ["8518700622"] 
			    "b_no": [input] 
		   };
		   
		$.ajax({
		  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=BQTBKoZ%2BPyo%2BKblU%2FvyBqrZGloHKViIkdq2j46P2kIyPDwhHt77dSjDlR7ct3%2FcjNjgOPce9b1aqnViDg734Jw%3D%3D",  
		  type: "POST",
		  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
		  dataType: "JSON",
		  contentType: "application/json",
		  accept: "application/json",
		  success: function(result) {
		      console.log("사업자번호 확인 완료")
		       console.log(result.status_code); //OK

			  console.log(result);
		      console.log(result["data"][0]["tax_type"]); 
		      //=> 국세청에 등록되지 않은 사업자등록번호입니다. 일 때 실패
		      
		      if(result["data"][0]["tax_type"] == '국세청에 등록되지 않은 사업자등록번호입니다.'){
		    	  console.log("사업자 번호 아님")
		    	  alert('국세청에 등록되지 않은 사업자등록번호입니다.\n다시 한번 확인해주세요.');
		    	  
		      } else {
		    	  console.log("사업자 번호 맞음")
		    	  window.location.href = 'http://localhost:8088/member/join_step2_seller';
		      }
		  },
		  error: function(result) {
		      console.log("사업자번호 확인 실패")
		      console.log(result.responseText); //responseText의 에러메세지 확인
		  }
		})
	}) //#certify end
	
	
	
}) //document end



</script>




<div class="container">

<div class="join-wrap"></div>
	<div class="top-text">
		<span><strong>크라우드펀딩</strong>에 오신 것을 환영합니다.</span>
	</div>
	
	<ol class="step-list">
		<li class="on">
			<strong>STEP1<span>  회원구분</span></strong>
		</li>
		<li class="off">
			<strong>STEP2<span>  약관동의</span></strong>
		</li>
		<li class="off">
			<strong>STEP3<span>  정보입력</span></strong>
		</li>
	</ol>


<div class="step1">

<h3><strong>회원구분</strong></h3>
<hr>


<a href="/member/join_step2_consumer"><button>일반 회원가입</button></a>
<!-- <a href="/member/join_step2_seller"> -->
<button id="certify">판매자 회원가입</button>


</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
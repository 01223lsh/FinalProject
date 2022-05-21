<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />


<script type="text/javascript">

$(document).ready(function() {
	$("#update").click(function() {
		
		
		if($("#bankName").val().length==0){
	        alert("은행명을 입력해주세요.");
	        $("#bankName").focus();
	        return false;
	      }
		
		var bnchk = /^[가-힣]{4,5}$/;
		if(bnchk.test(bankName.value)==false){
			alert("은행명을 잘못 입력 했습니다.");
			return false;
		} 
		
		
		if($("#accountNumber").val().length==0){
	        alert("계좌번호를 입력해주세요.");
	        $("#accountNumber").focus();
	        return false;
	      }
		
		var accchk = /^[0-9]{10,30}$/;
		if(accchk.test(accountNumber.value)==false){
			alert("계좌번호를 잘못 입력 했습니다.");
			return false;
		} 
		
		if($("#accountName").val().length==0){
	        alert("예금주를 입력해주세요.");
	        $("#accountName").focus();
	        return false;
	      }
		
		var acnchk =/^[0-9가-힣a-zA-Z]{2,10}$/;
		if(acnchk.test(accountName.value)==false){
			alert("예금주를 잘못 입력 했습니다.");
			return false;
		} 
		
		 alert("수정이 완료되었습니다.");
		$("form").submit();
	})
})



</script>


<style>

.right {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

input {
	border-radius : 5px;
	border: 1px solid #DDD;
	box-shadow: none;
	text-align: center;
}

textarea {
	border-radius : 5px;
	border: 1px solid #DDD;

}

.BTN {

	border-radius: 7px;
	background-color: #39AEA9;
	color: white; 
	width: 170px;
	height: 50px;
	border: 0px solid #81BEF7; 
	font-size: 15px;
	font-weight: bold;

}

.data{
/* 	font-size: 15px; */
/* 	margin-right: 25%; */
/* 	margin-left: 15%; */
}

.front {
/* 	display: inline; */
	margin-right: 17px;
	text-align: center;
/* 	margin-left: 30%; */
	
	background-color: #fff; 
	border-radius: 10px;
	padding: 8px 5px 8px 5px;
/* 	color: #2E4C6D; */
}


.alldata {
    border: 5px solid #39AEA9;
    border-radius: 33px;
    width: 65%;
    margin: 0 auto;
    padding-bottom: 33px;
    padding-top: 16px;
    margin-top: 68px;
}

.hr-sect {
	display: flex;
	flex-basis: 50%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 12px;
	margin: 0 auto;
	width: 70%
	
}
.hr-sect::before,
.hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
	margin-left: 8%;
	margin-right: 8%;
}

.BTN:hover {
	background-color: #557B83;
	transition: background-color 0.3s;
}

a:visited {
	color: #000;
}
</style>


<!-- <div class="container"> -->
<div class="right">
<div class="alldata" >
<br>
<h1 style="text-align: center;">판매 정보 수정</h1>
<br><br><br>

<!-- <div style="margin: 0 auto; margin-bottom: 250px;"> -->
<form action="/mypage/sellerinfoupdate" method="post">

<input type="hidden" id="memberNo" name="memberNo" value="${memberNo }">

	<div class="sellerinfo" style="text-align: center;">
<!-- 	<div class="sellerinfo" style="margin: 0 auto; width: 50%;"> -->
		<div>
			<div class="front" style="margin-bottom: 20px;  font-weight: bold; width: 100px; color: #000; display: inline-block; text-align: center; margin-left: 5%;">
				<label for="bankName">은행명</label>
			</div>
			<div style="display: inline-block; margin-left: 7%; width: 250px;" class="data">
				<input type="text" id="bankName" name="bankName" value="${sellerinfo.bankName }">
			</div>
			<br><br><br>
		
			<div class="front" style="margin-bottom: 20px; font-weight: bold; width: 100px; color : #000; display: inline-block; text-align: center; margin-left: 5%;">
				<label for="accountNumber" >계좌번호</label>
			</div>
			<div style="display: inline-block; margin-left: 7%; width: 250px;" class="data">
				<input type="text" id="accountNumber" name="accountNumber" value="${ sellerinfo.accountNumber}"}>
			</div>
			<br><br><br>
			
			<div class="front" style="margin-bottom: 20px; font-weight: bold; width: 100px; color : #000; display: inline-block; text-align: center; margin-left: 5%;">
				<label for="accountName" >예금주</label>
			</div>
			<div style="display: inline-block; margin-left: 7%; width: 250px;" class="data">
				<input type="text" id="accountName" name="accountName" value="${ sellerinfo.accountName}">
			</div>
			
			<br><br>
			<div class="hr-sect">창작자 소개글</div>
			
			
			<br>
			
			<div style="margin: 0 auto; text-align: center;">
				<div class="front111" style="margin-bottom: 20px;  font-weight: bold; width: 150px; color : #000; display: inline-block; margin: 0 auto;">
					<label for="sellerInfo" style="font-size: 17px;" >현재 창작자 소개글</label>
				</div><br><br>
				<div style="display:block;  padding-left: 20px; text-align:center;  " class="data2" >
<%-- 					<input type="text" id="sellerInfo" name="sellerInfo" value="${ sellerinfo.sellerInfo}"> --%>
					<textarea rows="5" cols="20" id="sellerInfo" name="sellerInfo"  style="width:300px; height: 150px;">${ sellerinfo.sellerInfo}</textarea>
			</div>	<br>
			</div>
		</div>

	</div>

</form>
<!-- </div> -->






<div style="text-align: center; ">
<button onclick="location.href='./sellerinfoupdate'" style="margin-right: 15px; margin-top: 30px;" id="update" class="BTN">수정</button>
<button onclick="history.back(-1);" class="BTN">취소</button>
</div>
</div><!-- alldata -->
</div><!-- right -->
</div><!-- .container end -->

<br><br><br><br><br><br><br><br><br><br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
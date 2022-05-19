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

button {

	border-radius: 5px;
	background-color: #2E4C6D;
	color: #fff; 
	width: 54px;
	height: 29px;
	border: 0px solid #538fd9;
	font-size: 15px;
	font-weight: bold;

}

.data{
	font-size: 15px;
	margin-right: 25%;
	margin-left: 15%;
}

.front {
	display: inline;
	margin-right: 17px;
	text-align: center;
	margin-left: 20%;
	
	background-color: #fff; 
	border-radius: 10px;
	padding: 8px 5px 8px 5px;
	color: #2E4C6D;
}

</style>


<!-- <div class="container"> -->
<div class="right">
<br>
<h1 style="text-align: center;">판매 정보</h1>
<br><br><br>

<div style="margin: 0 auto; margin-bottom: 300px;">
<form action="/mypage/sellerinfoupdate" method="post">

<input type="hidden" id="memberNo" name="memberNo" value="${memberNo }">

	<div class="sellerinfo" >
<!-- 	<div class="sellerinfo" style="margin: 0 auto; width: 50%;"> -->
		<div>
			<div class="front">
				<label for="bankName" style="margin-bottom: 20px; font-size: 15px; font-weight: bold; width: 100px;">은행명</label>
			</div>
			<div style="display: inline;" class="data">
				<input type="text" id="bankName" name="bankName" value="${sellerinfo.bankName }">
			</div>
			<br><br><br>
		
			<div class="front">
				<label for="accountNumber" style="margin-bottom: 20px; font-size: 15px; font-weight: bold; width: 100px;" >계좌번호</label>
			</div>
			<div style="display: inline;" class="data">
				<input type="text" id="accountNumber" name="accountNumber" value="${ sellerinfo.accountNumber}"}>
			</div>
			<br><br><br>
			
			<div class="front">
				<label for="accountName" style="margin-bottom: 20px; font-size: 15px; font-weight: bold; width: 100px; ">예금주</label>
			</div>
			<div style="display: inline;" class="data">
				<input type="text" id="accountName" name="accountName" value="${ sellerinfo.accountName}">
			</div>
			<br><br><br>
			
			<div>
				<div class="front" style="display: inline-block; float: left; background : none; padding: 8px 0px 8px 0px;">
					<label for="sellerInfo" style="margin-bottom: 20px; font-size: 15px; font-weight: bold; width: 115px; background-color: #fff; padding: 4px 2px; border-radius: 10px; color: #2E4C6D; ">판매자 소개</label>
				</div>
				<div style="display:inline-block; width: 300px; float: left; font-size: 15px; margin-left: 15%;" class="data2" >
<%-- 					<input type="text" id="sellerInfo" name="sellerInfo" value="${ sellerinfo.sellerInfo}"> --%>
					<textarea rows="10" cols="20" id="sellerInfo" name="sellerInfo"  style="width:300px; height: 300px;">${ sellerinfo.sellerInfo}</textarea>
				</div>
				<br><br><br>
			</div>
		</div>

	</div>

</form>
</div>






<br><br><br>
<div style="text-align: center; ">
<button onclick="location.href='./sellerinfoupdate'" style="margin-right: 15px;" id="update">수정</button>
<!-- <button onclick="location.href='./memberdelete'">탈퇴</button> -->
</div>

</div><!-- right -->
</div><!-- .container end -->

<br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
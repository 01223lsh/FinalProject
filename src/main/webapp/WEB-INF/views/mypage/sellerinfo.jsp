<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />

<style>

input {
	border: none;
	text-align: center;
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
/* 	font-size: 18px; */
	margin-right: 25%;
	margin-left: 15%;
}

.front {
	display: inline;
	margin-right: 17px;
	text-align: center;
	margin-left: 27%;
	
	background-color: #fff; 
	border-radius: 10px;
	padding: 8px 5px 8px 5px;
}

</style>


<!-- <div class="container"> -->
<div class="right">
<br>
<h1 style="text-align: center;">판매 정보</h1>
<br><br><br>

<div style="margin: 0 auto;">
	<div class="sellerinfo" >
<!-- 	<div class="sellerinfo" style="margin: 0 auto; width: 50%;"> -->
		<div>
			<div class="front">
				<label for="bankName" style="margin-bottom: 20px;  font-weight: bold; width: 100px; color: #2E4C6D">은행명</label>
			</div>
			<div style="display: inline;" class="data">
				${sellerinfo.bankName }
			</div>
			<br><br><br>
		
			<div class="front">
				<label for="accountNumber" style="margin-bottom: 20px; font-weight: bold; width: 100px; color : #2E4C6D" >계좌번호</label>
			</div>
			<div style="display: inline;" class="data">
				${ sellerinfo.accountNumber}
			</div>
			<br><br><br>
			
			<div class="front">
				<label for="accountName" style="margin-bottom: 20px;  font-weight: bold; width: 100px; color : #2E4C6D ">예금주</label>
			</div>
			<div style="display: inline;" class="data">
				${ sellerinfo.accountName}
			</div>
			<br><br><br>
			
			<div>
				<div class="front" style="display: inline-block; float: left; background : none; padding: 8px 0px 8px 0px;;">
					<label for="sellerInfo" style="margin-bottom: 20px; font-weight: bold; width: 115px; background-color: #fff; padding: 4px 2px; border-radius: 10px; color : #2E4C6D">판매자 소개</label>
				</div>
				<div style="display:inline-block; width: 300px; float: left; margin-left: 15%;" class="data2" >
					${ sellerinfo.sellerInfo}
				</div>
				<br><br><br>
			</div>
		</div>

	</div>

</div>







<br><br><br><br><br>
<div style="text-align: center; ">
<button onclick="location.href='./sellerinfoupdate'" style="margin-right: 15px;">수정</button>
<!-- <button onclick="location.href='./memberdelete'">탈퇴</button> -->
</div>

</div><!-- right -->
</div><!-- .container end -->

<br><br><br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
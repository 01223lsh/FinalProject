<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />

<style>

.right {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

input {
	border: none;
	text-align: center;
}

.BTN {

	border-radius: 5px;
	background-color: #39AEA9;
	color: #fff; 
	width: 170px;
	height: 50px;
 	border: 0px solid #538fd9;
	font-size: 15px;
	font-weight: bold;

}

.data{
/* 	font-size: 18px; */
/* 	margin-right: 25%; */
/* 	margin-left: 12%; */
}

.front {
/* 	display: inline-block; */
	margin-right: 17px;
	text-align: center;
/*  	margin-left: 34%;  */
	
	background-color: #fff; 
	border-radius: 10px;
	padding: 8px 5px 8px 5px;
}


#updateBtn:hover {
	background-color: #557B83;
	transition: background-color 0.3s;
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

a:visited {
	color: #000;
}

</style>


<!-- <div class="container"> -->
<div class="right">

<div class="alldata" >
<br>
<h1 style="text-align: center;">판매 정보</h1>
<br><br><br>

<div >
	<div class="sellerinfo" style="text-align: center;" >
<!-- 	<div class="sellerinfo" style="margin: 0 auto; width: 50%;"> -->
		<div>
			<div >
			<div class="front" style="margin-bottom: 20px;  font-weight: bold; width: 100px; color: #000; display: inline-block; text-align: center; margin-left: 5%;">
				<label for="bankName" >은행명</label>
			</div>
			<div style="display: inline-block; margin-left: 7%; width: 250px;" class="data">
				${sellerinfo.bankName }
			</div>
			</div>
			<br>
			
			<div>
			<div class="front" style="margin-bottom: 20px; font-weight: bold; width: 100px; color : #000; display: inline-block; text-align: center; margin-left: 5%;">
				<label for="accountNumber" >계좌번호</label>
			</div>
			<div style="display: inline-block; margin-left: 7%; width: 250px;" class="data">
				${ sellerinfo.accountNumber}
			</div>
			</div>
			<br>
			
			<div>
			<div class="front" style="margin-bottom: 20px; font-weight: bold; width: 100px; color : #000; display: inline-block; text-align: center; margin-left: 5%;">
				<label for="accountName" >예금주</label>
			</div>
			<div style="display: inline-block; margin-left: 7%; width: 250px;" class="data">
				${ sellerinfo.accountName}
			</div>
			</div>
			<br>
			
			
			
			<div class="hr-sect">창작자 소개글</div>
			
				<br><br>
				<div>
<!-- 				<hr style="width: 20%; margin: 0 auto; margin-bottom: 20px; color: #A2D5AB; height: 3px; display: inline-block; "> -->
				<div class="front11" style="margin-bottom: 20px;  font-weight: bold; width: 150px; color : #000; display: inline-block; text-align: center;">
					<label for="sellerInfo" style="font-size: 17px;" >현재 창작자 소개글</label>
				</div>
				
				
				
				
<!-- 				<hr style="width: 20%; margin: 0 auto; margin-bottom: 20px; color: #A2D5AB; height: 3px; display: inline-block; line-height: 70px; " > -->
<!-- 				<div style="display: inline-block; margin-left: 7%; width: 250px;" class="data"></div> -->
				<br>
				<div style="display:inline-block; width: 300px; padding-left: 20px; text-align:center;  " class="data2" >
					${ sellerinfo.sellerInfo}
				</div>
				</div>
				
		</div>

	</div>

</div>







<br><br>
<div style="text-align: center; ">
<button onclick="location.href='./sellerinfoupdate'" style="margin-right: 15px;" id="updateBtn" class="BTN">수정</button>
<button onclick="history.back(-1);" class="BTN">취소</button>
<!-- <button onclick="location.href='./memberdelete'">탈퇴</button> -->
</div>
</div><!-- .alldata -->
</div><!-- right -->
</div><!-- .container end -->

<br><br><br><br><br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
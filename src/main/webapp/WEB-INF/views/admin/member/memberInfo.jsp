<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){
	$("#memberupdate").click(function(){
		var gradeupdate=$("#membergradeupdate").val();
		console.log(gradeupdate);
		if(confirm("정말 수정을 하시겠습니까?")){
			$.ajax({
				type : "post"
				,url : "/admin/member/memberInfo"
				,data : "grade="+gradeupdate+"&memberNo="+${member.memberNo}
				,dataType : "html"
				,success : function(){
					console.log("성공");
					memberManagement();
					
				}
				,error : function(){
					console.log("실패")	
				}
			})	
		}
		
	})
})

</script>
<style type="text/css">
button,
button::after {
  -webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
  -o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
  
  text-align: center;
  background: #84978f;
  border: 3px solid #fff;
  border-radius: 5px;
  color: #fff;
  display: block;
  font-size: 0.9em;
  font-weight: bold;
	margin: 1em auto;
   padding: 0.5em 2em;
  position: relative;
  text-transform: uppercase;
}
button::before,
button::after {
  background: #fff;
  content: '';
  position: absolute;
  z-index: -1;
}

button:hover {
	background-color:#527578;;
  
}
.memberbtn::after {
  height: 0;
  left: 0;
  top: 0;
  width: 100%;
}

.memberbtn:hover:after {
  height: 100%;
}

</style>
</head>
<body>
<br>
<br>
<br>
<h1 style="text-align: center; margin-bottom:50px; font-size: 40px;">회원정보</h1>

<div style="width: 700px; margin:0px auto; margin-bottom : 30px; border: 1px solid #ddd; border-radius: 10px;">
<table class="table table-striped table-hover table-condensed">
<tr>
	<td>회원 번호</td>
	<td>${member.memberNo}</td>
</tr>
<tr>
	<td>아이디</td>
	<td>${member.id}</td>
</tr>
<tr>
	<td>이 름</td>
	<td>${member.name}</td>
</tr>
<tr>
	<td>닉네임</td>
	<td>${member.nick}</td>
</tr>
<tr>
	<td>이메일</td>
	<td>${member.email}</td>
</tr>
<tr>
	<td>전화번호</td>
	<td>${member.phone}</td>
</tr>
<tr>
	<td>회원등급</td>
	
	<td>
	<select id="membergradeupdate">
		<c:choose>
			<c:when test="${member.grade eq 0 }">
				<option value="0" <c:if test="${member.grade eq '0'}">selected</c:if>>일반유저</option>
				<option value="2" <c:if test="${member.grade eq '2'}">selected</c:if>>관리자</option>
			</c:when>
			<c:when test="${member.grade eq 1 }">
				<option value="0" <c:if test="${member.grade eq '0'}">selected</c:if>>일반유저</option>
				<option value="1" <c:if test="${member.grade eq '1'}">selected</c:if>>사업자</option>			
			</c:when>
			<c:when test="${member.grade eq 2 }">
				<option value="0" <c:if test="${member.grade eq '0'}">selected</c:if>>일반유저</option>
				<option value="2" <c:if test="${member.grade eq '2'}">selected</c:if>>관리자</option>
			</c:when>
			<c:when test="${member.grade eq 3 }">
				<c:if test="${!empty memberSeller.bankName}">
				<option value="0" <c:if test="${member.grade eq '1'}">selected</c:if>>사업자</option>
				</c:if>
				<c:if test="${empty memberSeller.bankName}">
				<option value="0" <c:if test="${member.grade eq '0'}">selected</c:if>>일반유저</option>
				</c:if>
				<option value="3" <c:if test="${member.grade eq '3'}">selected</c:if>>비활성화</option>
			</c:when>		
		</c:choose>
	</select>
	</td>
</tr>
</table>
<c:if test="${member.grade eq 1 || !empty memberSeller.bankName }">
<h3>사업자 정보</h3>
<hr>
<table class="table table-striped table-hover table-condensed">
<tr>
	<td>은행 명</td> <td>${memberSeller.bankName}</td>
</tr>
<tr>
	<td>계좌 번호</td> <td>${memberSeller.accountNumber}</td>
</tr>
<tr>
	<td>예금주 명</td> <td>${memberSeller.accountName}</td>
</tr>
<tr>
	<td>창작자 소개</td> <td>${memberSeller.sellerInfo}</td>
</tr>
</table>
</c:if>
</div>
<div style="margin:0 auto;display: flex; width: 300px;">
<button id="memberupdate" class="memberbtn">수정</button> <button class="memberbtn" onclick="memberManagement()">취소</button>
</div>

</body>
</html>
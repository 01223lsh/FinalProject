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
				,url : "/admin/memberInfo"
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
</head>
<body>

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
				<option value="0" <c:if test="${member.grade eq '0'}">selected</c:if>>일반유저</option>
				<option value="3" <c:if test="${member.grade eq '3'}">selected</c:if>>비활성화</option>
			</c:when>		
		</c:choose>
	</select>
	
	</td>
</tr>
</table>

<button id="memberupdate">수정</button> <button onclick="memberManagement()">취소</button>


</body>
</html>
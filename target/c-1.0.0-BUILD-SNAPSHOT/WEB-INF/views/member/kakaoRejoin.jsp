<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao ReJoin</title>


<!-- <link rel="stylesheet" type="text/css" href="/css/userRegister.css?version=21042510" /> -->
</head>

<body>
<!-- <form name="userRegisterForm" id="userRegisterForm" method="POST"> -->
<form action="/member/kakaoRejoin" method="POST" class="form-horizontal">
	<input type="hidden"  id="email" name="email" value="${email}"/>

<table>
<thead>
	<tr>
		<th colspan="3">신규 가입 추가 정보 설정 </th>
	</tr>
</thead>

<tbody>
			
	<tr>
		<td class="text">이름</td>
		<td>
			<input id="name" name="name">
<!-- 			<input type="hidden" id="nickname" name="nickname"> -->
		</td>
	</tr>
	
	<tr>
		<td class="text">닉네임</td>
		<td>
			<input id="nick" name="nick">
<!-- 			<input type="hidden" id="nickname" name="nickname"> -->
		</td>
<!-- 		<td><button id="dupliButton" type="button" onclick="checkNickname()">중복체크</button></td> -->
	</tr>
	
	<tr>
		<td class="text">전화번호</td>
		<td>
			<input id="phone" name="phone">
<!-- 			<input type="hidden" id="nickname" name="nickname"> -->
		</td>
	</tr>
	
	<tr>
		<td></td>
<!-- 		<td><input type="button" id="regiButton" onclick="register()" value="회원가입" /></td> -->
		
		<td></td>
	</tr>
		</tbody>
	</table>
	
	<button>회원가입</button>
</form>





</body>
</html>
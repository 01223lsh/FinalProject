<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>

<p style="padding: 0 0 23px; line-height: 1.29; letter-spacing: -.6px; color:#0d0f12; font-size: 28px; font-weight: 300; ">
현재 이 프로젝트에<br>
<strong style="font-weight: 400;">
	${contributors }명
</strong>의 참여가 이루어졌습니다.
</p>

</div>


<c:forEach var="coList" items="${coList }">
<div style="padding-bottom: 20px; padding-top: 20px; border-bottom: 1px solid #e6eaed;">
<p style="line-height: 1.65; font-size: 17px;">
<strong style="color: #0d0f12; font-weight: 500; line-height: 1.65; font-size: 17px;">${coList.member.nick }</strong>님이 <strong style="color: #0d0f12; font-weight: 500; line-height: 1.65; font-size: 17px;">${coList.paymentTotal }</strong> 원으로 참여하셨습니다.</p>

</div></c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			let ui_id=$("input[name='ui_id']").val();
			let ui_email=$("input[name='ui_email']").val();
			$.ajax({
				url:"/project/finduserpwd",
				dataType:'json',
				data:{"ui_id":ui_id,"ui_email":ui_email},
				success:function(data){
					if(data==true){
						alert("임시 비밀번호가 발급되었습니다.메일함을 확인해 주세요");
						console.log(data);
					}else{
						alert("아이디 또는 이메일을 정확하게 입력해 주세요");
						console.log(data);
				}
		   	}
		});
	});
});
</script>
</head>
<body>
<form action="${cp}/finduserpwd" method="post">
	<h2>임시 비밀번호 발급</h2>
	이름<br>
	<input type="text" name="ui_id"><br>
	이메일<br>
	<input type="email" name="ui_email"><br>
	<input type="button" value="임시비밀번호 발급" id="btn"><br> 
	<a href="${cp }/loginuser">로그인</a> | <a href="${cp }/insertuser">회원가입</a>  
</form>
</body>
</html>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
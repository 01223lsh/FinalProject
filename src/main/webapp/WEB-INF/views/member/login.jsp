<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../layout/header.jsp" %>

<script type="text/javascript">

$(document).ready(function() {
	$("input").eq(0).focus();
	
	$("input").eq(1).keydown(function( e ) {
		if( e.keyCode == 13 ) {
			$(this).parents("form").submit();
		}
	});

	$("#loginBtn").click(function() {
		$(this).parents("form").submit();
	})
})
</script>

<style type="text/css">
.loginform {
	width: 600px;
	margin: 0 auto;
}
</style>

	<div class="container">
		<form action="/member/login" method="post" class="form-horizontal">
			<table class="table table-bordered table-hober" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"><h4>로그인</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>ID</h5></td>
						<td><input class="form-control" type="text" name="id" maxlength="20" placeholder="아이디를 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>PW</h5></td>
						<td><input class="form-control" type="password" name="pw" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<td style="text-align: Left:" colspan="2"><button class="btn btn-outline-dark" id="loginBtn">로그인</button></td>
					</tr>
				</tbody>
			</table>
		</form>
		<table class="table table-bordered table-hober" style="text-align: center; border:1px solid #dddddd">
			<tr>
				<td style="text-align: Left:" colspan="2">
					<button class="btn btn-outline-dark" id="findPW" onclick="location.href='/findpass'">비밀번호 찾기</button>
					<button class="btn btn-outline-dark" type="button" onclick="location.href='<%=request.getContextPath() %>/main'">메인 화면으로</button>
				</td>
			</tr>
		</table>
		
	</div>

	<!-- 서버로부터 메세지를 받게되면 모달 팝업창 출력 -->
	<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
		
		// 세션값이 존재한다면 각 메세지 타입과 내용 출력 - 회원가입 성공 메세지
		if(messageContent != null) { 
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content <% if(messageType.equals("오류메세지")) out.println("panel-warning"); else out.println("panel-success"); %> ">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%= messageType %>
						</h4>
					</div>
					<div class="modal-body">
						<%= messageContent %>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>	
			</div>
		</div>
	</div>
	
	<!-- 로그인시 실행 -->
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>

</body>
</html>
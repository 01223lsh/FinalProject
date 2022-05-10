<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%
		String userID = null;
		if(session.getAttribute("loginID") != null) {
			userID = (String) session.getAttribute("loginID");
		}
		if(userID == null) {
			session.setAttribute("messageType", "오류메세지");
			session.setAttribute("messageContent", "현재 로그인이 되어 있지 않습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
	%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>운동할래?</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		//안읽은 메세지
		function getUnread() {
			$.ajax({
				type: "POST",
				url: "./chatUnread",
				data: {
					userID: encodeURIComponent('<%= userID %>'), 
				},
				success: function(result) {
					if(result >= 1) {
						showUnread(result);
					} else {
						showUnread('');
					}
				}
			
			});
		}
		function getInfiniteUnread() {
			setInterval(function() {
				getUnread();
			}, 4000);
		}
		function showUnread(result) {
			$('#unread').html(result);
		}
		// chatBox를 통해 마지막에 저장된 메세지 값 불러와서 
		//	파싱한 데이터 추출후 add박스로 원하는 데이터 값넘김
		function chatBoxFunction() {
			var userID = '<%= userID %>'
			$.ajax({
				type: "POST",
				url: "./chatBox",
				data: {
					userID: encodeURIComponent(userID), 
				},
				success: function(data) {
					if(data == "") return;
					$('#boxTable').html('');
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for(var i = 0; i < result.length; i++) {
						if(result[i][0].value == userID) {
							result[i][0].value = result[i][1].value;
						} else {
							result[i][1].value = result[i][0].value;
						}
						addBox(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value);
					}
				}
			
			});
		}
		// 화면에 최근에 온 메세지를 각각 보여주는 함수
		function addBox(lastID, toID, chatContent, chatTime, unread) {
			$('#boxTable').append('<tr onclick="location.href=\'chat.jsp?toID=' + encodeURIComponent(toID) + '\'">' +
					'<td style="width: 150px;"><h5>' + lastID + ' ' +
					'<span class="label label-info">' + unread + '</span>' + '</h5>' +  '</td>' +
					'<td>' +
					'<h5>' + chatContent + '</h5>' +
					'<div class="pull-right">' + chatTime + '</div>' +
					'</td>' +
					'</tr>');
		}
		// 3초마다 채팅방 불러오기
		function getInfiniteBox() {
			setInterval(function() {
				chatBoxFunction();
			}, 3000);
		}
		
	</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
<!-- 				<a class="navbar-brand" href="index.jsp">로고</a> -->
				<a href="index.jsp"><img style="width: 80px; height: 45px; margin-left:5px; margin-right:5px; object-fit:cover;" src="../../../images/LogoC.png" alt=""></a>

		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li><a href="find.jsp">친구찾기</a></li>
				<li class="active"><a href="/chatBox">메세지함<span id="unread" class="label label-info"></span></a></li>
			</ul>

			
		</div>
	</nav>
	<div class="container">
		<table class="table" style="margin: 0 auto;">
			,<thead>
				<tr>
					<th><h4>주고받은 메시지 목록</h4></th>
				</tr>
			</thead>
			<div style="overflow-y: auto; width: 100%; max-height: 450px;">
				<table class="table table-bordered table-hover" style="text-align: center; bprder: 1px solid #dddddd; margin: 0 auto;">
					<tbody id="boxTable">
					</tbody>
				</table>
			</div>
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
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	
	<%
		if(userID != null) {
	%>
		<script type="text/javascript">
			//페이지 로드되면 바로 각 함수 실행 
			$(document).ready(function() {
				getUnread();
				getInfiniteUnread();
				chatBoxFunction();
				getInfiniteBox();
			});
		</script>
	<% 
		}
	%>
</body>
</html>
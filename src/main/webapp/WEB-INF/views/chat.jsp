<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
		String userID = null;
		if(session.getAttribute("loginID") != null) {
			userID = (String) session.getAttribute("loginID");
		}
		String toID = null;
		if (request.getParameter("toID") != null) {
			toID = (String) request.getParameter("toID");
		}
		if(userID == null) {
			session.setAttribute("messageType", "오류메세지");
			session.setAttribute("messageContent", "현재 로그인이 되어 있지 않습니다.");
			response.sendRedirect("index.jsp");
			return;
		}

		if(toID == null) {
			session.setAttribute("messageType", "오류메세지");
			session.setAttribute("messageContent", "대화상대가 지정되어 있지 않습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 부트스트랩 반응형 웹 작용을 위함-->
	<link rel="stylesheet" href="css/bootstrap.css"> <!-- 부트스트랩 적용 -->
	<link rel="stylesheet" href="css/custom.css"> <!-- css파일 적용 -->
	<title>운동어때?</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function autoClosingAlert(selector, delay) {
			var alert = $(selector).alert();
			alert.show();
			window.setTimeout(function() { alert.hide() }, delay);
		}
		/* 채팅 보내기 함수 */
		function submitFunction() {
			var fromID = '<%= userID %>';
			var toID = '<%= toID %>';
			var chatContent = $('#chatContent').val().trim();
			$.ajax({
					type: "POST",
					url: "./chatSubmitServlet",
					data: {
						fromID: encodeURIComponent(fromID),
						toID: encodeURIComponent(toID),
						chatContent: encodeURIComponent(chatContent),
					},
					success: function(result) {
						if(result == 1) {
							autoClosingAlert('#successMessage', 2000);
						} else if (result == 0) {
							autoClosingAlert('#dangerMessage', 2000);
						} else {
							autoClosingAlert('#warningMessage', 2000)
						}
					}
			});
			$('#chatContent').val('');	
		}
		/* 채팅리스트 불러오기 함수 */
		var lastID = 0;
		function chatListFunction(type) {
			var fromID = '<%= userID %>';
			var toID = '<%= toID %>';
			$.ajax({
					type: "POST",
					url: "./ChatListServlet",
					data: {
						fromID: encodeURIComponent(fromID),
						toID: encodeURIComponent(toID),
						listType: type
					},
					success: function(data) {
						if(data == "") return;
						var parsed = JSON.parse(data);
						var result = parsed.result;
						for(var i = 0; i < result.length; i++) {
							addChat(result[i][0].value, result[i][2].value, result[i][3].value);
						}
						lastID = Number(parsed.last);
					}
			});
		}
		
		function addChat(chatName, chatContent, chatTime) {
			var fromID = '<%= userID %>';
			var chkMe = "";
			if(chatName==fromID){
				chkMe = " (나)";
			} 
			$('#chatList').append('<div class="row">' +
					'<div class="col-lg-12">' +
					'<div class="media">' +
					'<a class="pull-left" href="#">' +
					'<img class="media-object img-circle" style="width: 50px; height: 50px;" src="images/icon.png" alt="">' +
					'</a>' +
					'<div class="media-body">' +
					'<h4 class="media-heading">' +
					chatName + chkMe +
					'<span calss="small pull-right" style="float: right;">' +
					chatTime +
					'</span>' +
					'<h4>' +
					'<p>' +
					chatContent +
					'</p>' +
					'</div>' +
					'</div>' +
					'</div>' +
					'</div>' +
					'<hr>');			
			$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
		}
// 		3초간격으로 메세지를 가져옴
		function getInfiniteChat() {
			setInterval(function() {
				chatListFunction(lastID);
			}, 10000);
		}

		$(function() {
			$("#chatContent").keydown(function(e){if(e.keyCode == 13) submitFunction(); });
			getUnread();
			chatListFunction('0');
			getInfiniteChat();
			getInfiniteUnread();
		});
		
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
				<a href="index.jsp"><img style="width: 80px; height: 45px; margin-left:5px; margin-right:5px; object-fit:cover;" src="images/LogoC.png" alt=""></a>

		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li><a href="find.jsp">친구찾기</a></li>
				<li><a href="/chatBox">메세지함<span id="unread" class="label label-info"></span></a></li>
			</ul>

		</div>
	</nav>
	<!-- 실시간 입력창 -->
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green"></i>실시간 채팅방</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
						</div>
						<div class="portlet-footer">
							<div class="row" style="height: 90px;">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메세지를 입력하세요" maxlength="100"></textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
									<div class="clearfix"></div>
								</div> 
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-success" id="successMessage" style="display: none;">
		<strong>메세지 전송에 성공했습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage" style="display: none;">
		<strong>내용을 입력해주세요.</strong>
	</div>
	<div class="alert alert-warning" id="warningMessage" style="display: none;">
		<strong>데이터베이스 오류가 발생했습니다.</strong>
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
</body>
</html>
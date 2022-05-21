<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->

<!-- <script type="text/javascript"> -->


// // 알림버튼 클릭시 알림창 띄우기
// function alertClick() {
// 	'display', 'block'
// }
// // x버튼 클릭시 알림 안보여주기
// function alertClick() {
// 	'display', 'none'
// }

// // 알림 불러와서 저장 배열에 저장
// var lastID = 0;
// function chatListFunction(type) {
// 	var fromID = '관리자';
// 	var toID = '${sessionScope.Id}';
// 	$.ajax({
// 			type: "POST",
// 			url: "/alert/list",
// 			data: {
// 				fromID: fromID,
// 				toID: toID,
// 			},
// 			success: function(data) {
// 				if(data == "") return;
// 				var parsed = JSON.parse(data);
// 				var result = parsed.result;
// 				for(var i = 0; i < result.length; i++) {
// 					addChat(result[i][0].value, result[i][2].value, result[i][3].value);
// 				}
// 				lastID = Number(parsed.last);
// 			}
// 	});
// }


// function addChat(chatName, chatContent, chatTime) {
// 	var fromID = ${sessionScope.Id};
// 	var chkMe = "";
// 	if(chatName==fromID){
// 		chkMe = " (나)";
// 	} 
// 	$('#chatList').append('<div class="row">' +
// 			'<div class="col-lg-12">' +
// 			'<div class="media">' +
// 			'<a class="pull-left" href="#">' +
// 			'<img class="media-object img-circle" style="width: 50px; height: 50px;" src="images/icon.png" alt="">' +
// 			'</a>' +
// 			'<div class="media-body">' +
// 			'<h4 class="media-heading">' +
// 			chatName + chkMe +
// 			'<span calss="small pull-right" style="float: right;">' +
// 			chatTime +
// 			'</span>' +
// 			'<h4>' +
// 			'<p>' +
// 			chatContent +
// 			'</p>' +
// 			'</div>' +
// 			'</div>' +
// 			'</div>' +
// 			'</div>' +
// 			'<hr>');			
// 	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
// }

// //	10초간격으로 메세지를 가져옴
// function getInfiniteChat() {
// 	setInterval(function() {
// 		chatListFunction(lastID);
// 	}, 100000);
// }

// $(function() {
// 	$("#chatContent").keydown(function(e){if(e.keyCode == 13) submitFunction(); });
// 	getUnread();
// 	chatListFunction('0');
// 	getInfiniteChat();
// 	getInfiniteUnread();
// });

// function getUnread() {
// 	$.ajax({
// 		type: "POST",
// 		url: "./chatUnread",
// 		data: {
<%-- 			userID: encodeURIComponent('<%= userID %>'),  --%>
// 		},
// 		success: function(result) {
// 			if(result >= 1) {
// 				showUnread(result);
// 			} else {
// 				showUnread('');
// 			}
// 		}
	
// 	});
// }
// function getInfiniteUnread() {
// 	setInterval(function() {
// 		getUnread();
// 	}, 4000);
// }
// function showUnread(result) {
// 	$('#unread').html(result);
// }



</script>

</head>
<body>

</body>
</html>
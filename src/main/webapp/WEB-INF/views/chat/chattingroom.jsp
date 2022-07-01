<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cloud Funding</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script type="text/javascript">

const myName = '${sessionId}'


	//메세지 입력창에 keydown 이벤트 발생시 처리
	$(document).ready(function () {
		$("div.input-div textarea").on('keydown', function(e){ 
	        if(e.keyCode == 13 && !e.shiftKey) {
	            e.preventDefault(); //이벤트 작동을 막음
	            const message = $(this).val();
				//	console.log("전송되는 메시지 테스트: ", message)
	            // 메시지 전송
	            sendMessage(message);
	            // 입력창 clear
	            clearTextarea();
	        }
	    });
	})
	// websocket & stomp initialize
	var sock = new SockJS("/ws/chat");
	var ws = Stomp.over(sock);
	var reconnect = 0;

	// 보내는 메시지
	function sendMessage(message) {
	    //const message = $("#chat-message").val();
	    // sender 세션 아이디값으로 임시로 정해놓음
	      ws.send("/app/chat/message", {}, JSON.stringify({type:'TALK', chatroomId: '${room.chatroomId}', sender: '${sessionScope.nick}', message: message})); //자바스크립트 값을 JSON문자열로 변환
//	     recvMessage(message);  
	   

	}

	// 받는 메시지
	function recvMessage(recv) {
		console.log(recv)
	  //  console.log("test문자 :" + recv.message)
	    const result = $("#chat-result");
	    const li = $("<li></li>");
	    var myid = "${sessionScope.Id}";
	    const messageContainer = $("<div></div>");
	    const messageHeaderDiv = $("<div></div>");
	    const messageDiv = $("<div></div>");
	    var myidDiv = $("<div></div>");
	    
	    myidDiv.text(recv.sender);
	    messageDiv.text(recv.message);
	    messageHeaderDiv.append(myidDiv);
	    messageHeaderDiv.addClass("d-flex justify-content-between") //부트스트랩을 이용해 균일한 간격 배치
	    messageDiv.css({"padding": "10px", "border-radius": "0 10px 10px 10px", "margin" : "10px", "background": "#A2D5AB"});
	    messageContainer.append(messageHeaderDiv);
	    messageContainer.append(messageDiv);
	    messageContainer.css({"width": "200px", "align-self": "flex-start"})
	    li.addClass(" d-flex flex-column");
	    if (recv.sender == '${sessionScope.nick}') { //send 메세지 일때 css설정
	        messageDiv.css("background", "#E5EFC1" )
	        messageContainer.css("align-self", "flex-end")
	    }
	    li.append(messageContainer)
	     result.append(li)

	    

	}



	//웹소켓 접속
	function connect() {
	    // pub/sub event
	    ws.connect({}, function(frame) {
	        ws.subscribe("/topic/chat/room/"+'${room.chatroomId}', function(message) {
	            var recv = JSON.parse(message.body); //String 객체를 JSON으로 변환
	            recvMessage(recv); 
	        });
	    }, function(error) { //error 재접속 처리
	        if(reconnect++ <= 5) {
	            setTimeout(function() {
	                console.log("connection reconnect");
	                sock = new SockJS("/ws/chat");
	                ws = Stomp.over(sock);
	                connect();
	            },10*1000);
	        }
	    });
	}

	//채팅방 입장하기
	function exitChatRoom() {
	  //  ws.send("/app/chat/message", {}, JSON.stringify({type:'EXIT', roomId: '${room.chatroomId}', sender: '${loginId}'}));
	    ws.disconnect(); //세션이 끊어졌을때
	    history.back(); //이전 페이지로 돌아가기
	}
	connect(); 


	//채팅 보내고 난 후 비워주기
	function clearTextarea() {
	    $('div.input-div textarea').val('');
	}



	</script>



	<style type="text/css">

	.chat_wrap .header { font-size: 14px; padding: 15px 0; background: #557B83; color: white; text-align: center;  }
	.chat_wrap .chat { padding-bottom: 80px; }
	.chat_wrap .chat ul { width: 100%; list-style: none; padding: 10px;}
	.chat_wrap .chat ul li { width: 100%; }
	.chat_wrap .chat ul li > div { font-size: 13px;  }
	.chat_wrap .input-div { position: fixed; bottom: 0; width: 100%; background-color: #9e9e9e; text-align: center; border-top: 1px solid #888; }
	.chat_wrap .input-div > textarea { width: 100%; height: 80px; border: none; padding: 10px; resize: none;

	}


	</style>


	</head>
	<body>
	<div class="chat_wrap">
	    <div class="header">
	        ${project.projectTitle }
	    </div>
	    <div class="chat">
	        <ul class="chat-scroll">
	     	   <li class="d-flex flex-column" id="chat-result"></li>
	            <!-- 메세지 동적 생성 -->
	        </ul>
	    </div>
	    <div class="input-div">
	        <textarea></textarea> 
	        <!-- 메세지 입력창 -->
	    </div>
	</div>

	</body>
	</html>
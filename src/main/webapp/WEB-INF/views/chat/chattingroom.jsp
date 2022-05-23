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


	/* const Chat = function() { */

	$(document).ready(function () {
		//$(document).on('keydown', 'div.input-div textarea', function(e){
		$("div.input-div textarea").on('keydown', function(e){
	        if(e.keyCode == 13 && !e.shiftKey) {
	            e.preventDefault();
	            const message = $(this).val();
					console.log("전송되는 메시지 테스트: ", message)
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
	// 테스트
	// function subTest() {
//	     ws.subscribe("/queue/user-" + "${loginId}" , function(message) {
//	         var recv = JSON.parse(message.body);
//	         recvMessage(recv);
//	     })
//	    /*  ws.subscribe("/user/${loginId}/queue/data", function(message) {
//	         var recv = JSON.parse(message.body);
//	         recvMessage(recv);
//	     }) */
//	     // ws.subscribe('/user/topic/data', function (message) {
//	     //     $('.' + user).text(JSON.parse(message.body).time);
//	     // })
	// };
	// 테스트
	// function test() {
//	     const message = $("#chat-message").val();
//	     ws.send("/app/message/to-target", {}, JSON.stringify({
//	         type:'TALK'
//	         , roomId: '${room.chatroomId}'
//	         , sender: '${loginId}'
//	         , message: message
//	         , targetUser: "test11"})  // 대상 유저 하드코딩
//	     );
	// }
	// 보내는 메시지
	function sendMessage(message) {
	    //const message = $("#chat-message").val();
	    // sender 세션 아이디값으로 임시로 정해놓음
	      ws.send("/app/chat/message", {}, JSON.stringify({type:'TALK', chatroomId: '${room.chatroomId}', sender: '${sessionScope.nick}', message: message}));
//	     recvMessage(message);  
	   

	}

	// 받는 메시지
	function recvMessage(recv) {
	   // debugger;
		console.log(recv)
	    console.log("test문자 :" + recv.message)
	    const result = $("#chat-result");
	    const li = $("<li></li>");
	    var myid = "${sessionScope.Id}";
	    const messageContainer = $("<div></div>");
	    const messageHeaderDiv = $("<div></div>");
	    const messageDiv = $("<div></div>");
	    var myidDiv = $("<div></div>");
//	     var div = $("<div></div>");
//	     var message = $(".test");
	    
	    myidDiv.text(recv.sender);
	    messageDiv.text(recv.message);
	    messageHeaderDiv.append(myidDiv);
	    messageHeaderDiv.addClass("d-flex justify-content-between")
	    messageDiv.css({"padding": "10px", "border-radius": "0 10px 10px 10px", "margin" : "10px", "background": "#A2D5AB"});
	    messageContainer.append(messageHeaderDiv);
	    messageContainer.append(messageDiv);
	    messageContainer.css({"width": "200px", "align-self": "flex-start"})
	    li.addClass(" d-flex flex-column");
	    if (recv.sender == '${sessionScope.nick}') {
	        messageDiv.css("background", "#E5EFC1" )
	        messageContainer.css("align-self", "flex-end")
	    }
	    li.append(messageContainer)
	    result.append(li)
//	  	const chatBox = document.getElementById("#chat");
//	     // clientHeight(보여지는 영역) = scrollHeight(전체 영역) - scrollTop(숨겨진 영역)
//	     // 숨겨진 영역 높이를 전체 높이 만큼 쭉 밀어서 스크롤 맨 밑에 오도록 설정
//	     chatBox.scrollTop = chatBox.scrollHeight;
	    
	    
	   /*  if(myid != recv.sender) {
//	  		div.css("color", "red")   
	    } */
	    
	 	/* var messageDiv = $("<div></div>");
	    
	 	messageDiv.text(recv.messageDiv);
	 	messageDiv.css({"padding": "10px", "border-radius": "0 10px 10px 10px", "background": "beige"});
	   */
//	     message.append(div)
	    
	    
	    
	     
	    
	    /* const LR = (recv.sender != myName) ? "left" : "right";
	    
	    appendMessageTag("right", recv.sender, recv.message) */
	    
	   // ws.recv("/app/chat/message", {}, JSON.stringify({type:'TALK', roomId: '${room.chatroomId}', sender: '${sessionId}', message: message}));
	   
	    
	    
	   /*  const result = $("#chat-result");
	    const li = $("<li></li>");
	    const messageContainer = $("<div></div>");
	    const messageDiv = $("<div></div>");
	    const messageHeaderDiv = $("<div></div>");
	    const senderDiv = $("<div></div>");
	    senderDiv.text(recv.sender);
	    messageDiv.text(recv.message);
	    messageHeaderDiv.append(senderDiv);
	    messageHeaderDiv.addClass("d-flex justify-content-between")
	    messageDiv.css({"padding": "10px", "border-radius": "0 10px 10px 10px", "background": "beige"});
	    messageContainer.append(messageHeaderDiv);
	    messageContainer.append(messageDiv);
	    messageContainer.css({"width": "200px", "align-self": "flex-end"})
	    li.addClass("list-group-item list-group-item-action d-flex flex-column");
	    if (recv.sender == '${loginId}') {
	        messageDiv.css("background", "gold")
	        messageContainer.css("align-self", "flex-start")
	    }
	    li.append(messageContainer)
	    result.append(li)
	    // 채팅 스크롤 맨 아래로 포커싱
	    const chatBox = document.getElementById("chat-box");
	    // clientHeight(보여지는 영역) = scrollHeight(전체 영역) - scrollTop(숨겨진 영역)
	    // 숨겨진 영역 높이를 전체 높히 만큼 쭉 밀어서 스크롤 맨 밑에 오도록 설정
	    //chatBox.scrollTop = chatBox.scrollHeight;  */
	}

	// 메시지 생성
	function appendMessageTag(LR_className, senderName, message) {
		const messagetest = $("<li></li>")
		messagetest.text(message)
		$(".message").append(messagetest)
		
		//const chatLi = createMessageTag(LR_className, senderName, message)
		//$('div.chat:not(.format) ul').append(chatLi);
		// 스크롤 하단 고정 코드
	}

	//메세지 태그 생성
	function createMessageTag(LR_className, senderName, message) {
	    // 형식 가져오기
	    let chatLi = $('div.chat.format ul li').clone();

	    // 값 채우기
	    chatLi.addClass(LR_className);
	    chatLi.find('.sender span').text(senderName);
	    chatLi.find('.message span').text(message);

	    return chatLi;
	}


	//웹소켓 접속
	function connect() {
	    // pub/sub event
	    ws.connect({}, function(frame) {
	        ws.subscribe("/topic/chat/room/"+'${room.chatroomId}', function(message) {
	            var recv = JSON.parse(message.body);
	            recvMessage(recv);
	        });
	        /* ws.send("/app/chat/message", {}, JSON.stringify({type:'ENTER', chatroomId: '${room.chatroomId}', sender: '${sessoinScope.nick}'})); */
	    }, function(error) {
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
	    ws.send("/app/chat/message", {}, JSON.stringify({type:'EXIT', roomId: '${room.chatroomId}', sender: '${loginId}'}));
	    ws.disconnect();
	    history.back();
	}
	connect();


	//채팅 보내고 난 후 비워주기
	function clearTextarea() {
	    $('div.input-div textarea').val('');
	}

	/* function returns() {
	    'init'= init;
	};
	$(function(){
	chat.init();
	}); */


	</script>


	<%--  const Chat = (function(){
		
		
		// 임시
		function sendMessage(message) {
		    //const message = $("#chat-message").val();
		    ws.send("/app/chat/message", {}, JSON.stringify({type:'TALK', chatroomId: '${room.chatroomId}', sender: '${loginId}', message: message}));
		    resive(message);
		}
		
		
	    const myName = "쿠키";
	 
	    // init 함수
	    function init() {
	        // enter 키 이벤트
	        $(document).on('keydown', 'div.input-div textarea', function(e){
	            if(e.keyCode == 13 && !e.shiftKey) {
	                e.preventDefault();
	                const message = $(this).val();
	 				console.log("전송되는 메시지 테스트: ", message)
	                // 메시지 전송
	                sendMessage(message);
	                // 입력창 clear
	                clearTextarea();
	            }
	        });
	    }
	 
	    // 메세지 태그 생성
	    function createMessageTag(LR_className, senderName, message) {
	        // 형식 가져오기
	        let chatLi = $('div.chat.format ul li').clone();
	 
	        // 값 채우기
	        chatLi.addClass(LR_className);
	        chatLi.find('.sender span').text(senderName);
	        chatLi.find('.message span').text(message);
	 
	        return chatLi;
	    }
	 
	    // 메세지 태그 append
	    function appendMessageTag(LR_className, senderName, message) {
	        const chatLi = createMessageTag(LR_className, senderName, message);
	 
	        $('div.chat:not(.format) ul').append(chatLi);
	 
	        // 스크롤바 아래 고정
	        //$('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
	        
	        const $element = document.querySelector(".chat-scroll");

	     	$element.scrollTop = $element.scrollHeight;
	    }
	 
	    // 메세지 전송
	   /*  function sendMessage(message) {
	        // 서버에 전송하는 코드로 후에 대체
	        const data = {
	            "senderName"    : "쿠키",
	            "message"        : message
	        };
	 
	        // 통신하는 기능이 없으므로 여기서 receive
	        resive(data);
	    }
	  
	  
	  
	    // 메세지 입력박스 내용 지우기
	    function clearTextarea() {
	        $('div.input-div textarea').val('');
	    }
	 
	    // 메세지 수신
	    function resive(data) {
	        const LR = (data.senderName != myName)? "left" : "right";
	        appendMessageTag("right", data.senderName, data.message);
	    }
	 
	    return {
	        'init': init
	    };
	})();
	 
	$(function(){
	    Chat.init();
	}); */ --%>



	<style type="text/css">


	*{ margin: 0; padding: 0; }


	 
	.chat_wrap .header { font-size: 14px; padding: 15px 0; background: #557B83; color: white; text-align: center;  }
	 
	.chat_wrap .chat { padding-bottom: 80px; }
	.chat_wrap .chat ul { width: 100%; list-style: none; padding: 10px;}
	.chat_wrap .chat ul li { width: 100%; }
	.chat_wrap .chat ul li.left { text-align: left; }
	.chat_wrap .chat ul li.right { text-align: right;}
	 
	.chat_wrap .chat ul li > div { font-size: 13px;  }
	.chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
	.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
	 
	.chat_wrap .input-div { position: fixed; bottom: 0; width: 100%; background-color: #9e9e9e; text-align: center; border-top: 1px solid #888; }
	.chat_wrap .input-div > textarea { width: 100%; height: 80px; border: none; padding: 10px; resize: none;

	}

	.format { display: none; }


	</style>


	</head>
	<body>
	<div class="chat_wrap">
	    <div class="header">
	        ${project.projectTitle }
	    </div>
	<!--     <div class="test"> -->
	    	
	<!--     </div> -->
	    <div class="chat">
	        <ul class="chat-scroll">
	     	   <li class="d-flex flex-column" id="chat-result"></li>
	            <!-- 동적 생성 -->
	        </ul>
	    </div>
	    <div class="input-div">
	        <textarea></textarea>
	    </div>
	 
	    <!-- format -->
	 
	    <div class="chat format">
	        <ul>
	            <li>
	                <div class="sender">
	                    <span></span>
	                </div>
	                <div class="test">
	                    <span></span>
	                </div>
	            </li>
	        </ul>
	    </div>
	</div>

	</body>
	</html>
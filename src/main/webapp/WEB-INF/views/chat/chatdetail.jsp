<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- header --%>
<%@include file="/WEB-INF/views/layout/header.jsp"%>

<style>
    #chat-box {
        max-height: 400px;
        overflow: auto;
    }
</style>

<div class="container">

    <div>
        <h2>${roomId}</h2>
    </div>
    <ul class="list-group" id="chat-box">
        <li class="list-group-item d-flex flex-column" id="chat-result"></li>
    </ul>
    <div class="input-group">
        <div class="input-group-prepend">
            <label class="input-group-text">내용</label>
        </div>
        <input type="text" class="form-control" id="chat-message">
        <div class="input-group-append">
            <button class="btn btn-primary" type="button" onclick="sendMessage();">보내기</button>
            <button class="btn btn-primary" type="button" onclick="test();">테스트</button>
            <button class="btn btn-primary" type="button" onclick="subTest();">구독 테스트</button>
            <button class="btn btn-danger" type="button" onclick="exitChatRoom();">나가기</button>
        </div>
    </div>
    <div></div>

</div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
    $(document).ready(function () {
        $("#chat-message").keydown(function (key) {
            if (key.keyCode == 13) {
                sendMessage();
                $("#chat-message").val("")
            }
        });
    })
    // websocket & stomp initialize
    var sock = new SockJS("/ws/chat");
    var ws = Stomp.over(sock);
    var reconnect = 0;
    // 테스트
    function subTest() {
        ws.subscribe("/queue/user-" + "${loginId}" , function(message) {
            var recv = JSON.parse(message.body);
            recvMessage(recv);
        })
        <%--ws.subscribe("/user/${loginId}/queue/data", function(message) {--%>
        <%--    var recv = JSON.parse(message.body);--%>
        <%--    recvMessage(recv);--%>
        <%--})--%>
        // ws.subscribe('/user/topic/data', function (message) {
        //     $('.' + user).text(JSON.parse(message.body).time);
        // })
    }
    // 테스트
    function test() {
        const message = $("#chat-message").val();
        ws.send("/app/message/to-target", {}, JSON.stringify({
            type:'TALK'
            , roomId: '${roomId}'
            , sender: '${loginId}'
            , message: message
            , targetUser: "test11"})  // 대상 유저 하드코딩
        );
    }
    // 보내는 메시지
    function sendMessage() {
        const message = $("#chat-message").val();
        ws.send("/app/chat/message", {}, JSON.stringify({type:'TALK', roomId: '${roomId}', sender: '${loginId}', message: message}));
    }
    // 받는 메시지
    function recvMessage(recv) {
        console.log(recv)
        const result = $("#chat-result");
        const li = $("<li></li>");
        const messageContainer = $("<div></div>");
        const messageDiv = $("<div></div>");
        const messageHeaderDiv = $("<div></div>");
        const senderDiv = $("<div></div>");
        const dateDiv = $("<div></div>")
        const date = new Date();
        const dateParse = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        dateDiv.text(dateParse);
        senderDiv.text(recv.sender);
        messageDiv.text(recv.message);
        messageHeaderDiv.append(senderDiv);
        messageHeaderDiv.append(dateDiv);
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
        chatBox.scrollTop = chatBox.scrollHeight;
    }
    // 웹소켓 접속
    function connect() {
        // pub/sub event
        ws.connect({}, function(frame) {
            ws.subscribe("/topic/chat/room/"+'${roomId}', function(message) {
                var recv = JSON.parse(message.body);
                recvMessage(recv);
            });
            ws.send("/app/chat/message", {}, JSON.stringify({type:'ENTER', roomId: '${roomId}', sender: '${loginId}'}));
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
    function exitChatRoom() {
        ws.send("/app/chat/message", {}, JSON.stringify({type:'EXIT', roomId: '${roomId}', sender: '${loginId}'}));
        ws.disconnect();
        history.back();
    }
    connect();
</script>

<%-- footer --%>
<%@include file="/WEB-INF/views/layout/footer.jsp"%>
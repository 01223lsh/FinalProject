<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- header --%>
<%@include file="/WEB-INF/views/layout/header.jsp"%>

<script>
    $(document).ready(function () {
        // Enter 눌렀을 떄 채팅방 개설
        $("input[name=name]").keydown(function (key) {
            if (key.keyCode == 13) {
                createRoom();
            }
        });
        // 버튼 눌렀을 때 방 개설
        $("#btn-createRoom").click(function () {
            createRoom();
        });
        $(".room-Name").click(function (e) {
            console.log("확인")
        });
        chatList()
    })
    // 채팅방 개설
    function createRoom() {
        const name = $("input[name=name]").val()
        $.ajax({
            type: "POST"
            , url: "/chat/room"
            , dataType: "JSON"
            , data: {name: name}
            , success: function(res) {
//                 console.log(res)
//                 const li = $("<li></li>");
//                 const a = $("<a></a>")
//                 a.attr("href", "/chat/room/enter/" + res.roomName)
//                 a.text(res.roomName);
//                 li.addClass("list-group-item");
//                 li.addClass("list-group-item-action");
//                 li.addClass("room-name");
//                 li.append(a);
//                 // $("#chat-list").append("<li class=list-group-item list-group-item-action>" + res.roomName + "</li>")
//                 $("#chat-list").append(li);
            }
            , error: function () {
                console.log("ajax 실패")
            }
        })
    }
    // 채팅방 리스트
   /*  function chatList() {
        $.ajax({
            type: "GET"
            , url: "/chat/rooms"
            , dataType: "JSON"
            , data: {}
            , success: function(res) {
                console.log(res)
                for (c in res) {
                    const li = $("<li></li>");
                    const a = $("<a></a>")
                    a.attr("href", "/chat/room/enter/" + res[c].roomName)
                    a.text(res[c].roomName);
                    li.addClass("list-group-item");
                    li.addClass("list-group-item-action");
                    li.addClass("room-name");
                    li.append(a);
                    $("#chat-list").append(li);
                }
                // $("#chat-list").append("<li class=list-group-item list-group-item-action>" + res.roomName + "</li>")
            }
            , error: function () {
                console.log("ajax 실패")
            }
        })
    } */
</script>

<div class="container my-5">

    <%-- 채팅방 개설 --%>
    <div class="row g-3">
        <div class="col-auto">
            <label for="roomName">방제목</label>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control" id="roomName" name="name" placeholder="create chat room">
        </div>
        <div class="col-auto">
            <button type="button" id="btn-createRoom" class="btn btn-primary mb-3">방 만들기</button>
        </div>
    </div>

    <ul id="chat-list" class="list-group"></ul>
</div>

<%-- footer --%>
<%@include file="/WEB-INF/views/layout/footer.jsp"%>
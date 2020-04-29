<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	var wsocket;   
	
	function connect() {
		wsocket = new WebSocket("ws://localhost:8080/chat-ws");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		appendMessage(${comInfo.get('COMMUNITY_ID') } + "번방" + $("#nickname").val() + "입장하셨습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		var community_id=data.split(":")[0];
		console.log(community_id);
		
		if(community_id == ${comInfo.get('COMMUNITY_ID') }) {
			appendMessage(data);
		}
		
	}
	function onClose(evt) {
		appendMessage($("#nickname").val() + "퇴장하셨습니다.");
	}
	
	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		var community_id=${comInfo.get('COMMUNITY_ID') };
		wsocket.send(community_id+":"+nickname+":" + msg);
		$("#message").val("");
		
/* 		var send_msg= {
				community_id=${comInfo.get('COMMUNITY_ID') },
				mem_nickname=$("#nickname").val(),
				msg=$("#message").val(),
				time : moment().format('YYYY[-]MM[-]DD HH:mm'),
				
				
		} */
	}

	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		console.log('chatMessageArea.length:'+$("#chatMessageArea").height());
		console.log('chatArea.length:'+chatAreaHeight);
		$("#chatArea").scrollTop(maxScroll);
	}

	$(document).ready(function() {
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	});
</script>
<style>
#chatArea {
	width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;
}
</style>
</head>
<body>
	이름:<input type="text" id="nickname">
	<input type="button" id="enterBtn" value="입장">
	<input type="button" id="exitBtn" value="나가기">
    
    <h1>대화 영역</h1>
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<style>
	#chatArea {
		width: 100%; height: 200px; overflow-y: auto; padding: 12px;
	}
	input#sendBtn{
	    width: 18%;
	    line-height: 27px;
	    background: #e44d3a;
	    color: white;
	    border: none;
	    float: right;
	    border-radius: 12px;
	    margin-right: 5px;
	}
	
	input#message{
		width: 77%;
	    border-radius: 12px;
	    border: 1px solid lightgray;
	    float: left;
	    margin: 0px 5px 10px;
	    padding: 0 15px;
	}
	
	.chatbox-list {
	    position: fixed;
	    bottom: 25px;
	    right: 0;
	    left : 59.6px;
    }
    
    .conversation-box {
	    position: absolute;
	    bottom: 132%;
	    left: 100%;
	    right : 0%;
	    width: 350px;
	    background-color: #fff;
	    -webkit-box-shadow: 0;
	    -moz-box-shadow: 0;
	    -ms-box-shadow: 0;
	    -o-box-shadow: 0;
	    box-shadow: 0;
	    opacity: 0;
	    visibility: hidden;
	    z-index: 0;
	}
	
	.conversation-box:before{
		display : none;
	}
	
	.chat-mg{
		border: 5px solid #e44d3a;
	    border-radius: 50%;
	}
	
	
	@keyframes slideInLeft {
      from {
        transform: translate3d(-200%, 0, 0);
        visibility: visible;
      }
    
      to {
        transform: translate3d(0, 0, 0);
      }
    }
    
    div.chatbox{
    	animation-name: slideInLeft;
    	animation-duration: 1s;
    	transition-duration: 1s;
    }
    
</style>
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
		//appendMessage(${comInfo.get('COMMUNITY_ID') } + "번방" + $("#nickname").val() + "입장하셨습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		var community_id=data.split(":")[0];
		console.log(community_id);
		console.log(data);
		
		console.log(data.split(":")[1]);
		console.log(data.split(":")[2]);
		
		if(community_id == ${comInfo.get('COMMUNITY_ID') }) {
			appendMessage(data.split(":")[1] + " >> " + data.split(":")[2]);
			
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

</head>
<body onLoad="connect()">
	<input type="hidden" id="nickname" value=${memNick }>
    
    <div id="chatArea">
    	<div id="chatMessageArea"></div>
    </div>
    
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</body>
</html>
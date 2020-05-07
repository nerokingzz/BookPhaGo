<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bookphago</title>
	<!-- <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet"> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e7bf23ab0472efaf8d58b131cc552d"></script>
	<link href="resources/chat/style.css" rel="stylesheet">
<script
	src="https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
</head>

<body>
<button type="button" class="chatLauncher" style="display:none;">
  <div><img id="chatIcon" src = "https://i.imgur.com/c8zoHF0.png"></div>
</button>
</body>
<script src = "resources/chat/js/map.js" ></script>
<script src = "resources/chat/js/member.js" ></script>
<script src = "resources/chat/js/search.js" ></script>
<script src = "resources/chat/js/watsonjs.js" ></script>
<script type="text/javascript">


window.loadWatsonAssistantChat(options).then(function(instance) {
	   /*
   $('#login').on('click',function(){
      $('#status').html('현재 상태 : 회원');
      var user_id = encodeURI($('#newID').val());
      //charCodeAt(0).toString(16)
      console.log("id : " + user_id);
      instance.updateUserID(user_id);
   });

 */
	   var chat_member = "${user_id}";
		  if(chat_member){
			  console.log("chat_member는 ...." + chat_member);
			   if(chat_member != null){
				   var chat_user_id = "${user_id}";
				   instance.updateUserID(chat_user_id);
				   console.log("session에 저장된 회원 아이디 ...." + chat_user_id);
			   }else{
				   console.log("session에 저장된 회원 아이디가 없습니다.");
			   }
		  }
		  
		  

   const button = document.querySelector('.chatLauncher');

   
    button.addEventListener('click', () => {
      instance.openWindow();
    });

   //instance.on({ type: 'window:open', handler: windowOpen });
    
   instance.on({ type: 'pre:receive', handler: preRecieve });
   instance.on({ type: 'receive', handler: receive });
   instance.on({ type: 'send', handler: send });
   instance.on({ type: 'error', handler: error });
   console.log("instance.... " + JSON.stringify(instance));
   
    instance.render().then(() => {
         button.style.display = 'block';
         button.classList.add('open');
       });
});

</script>
</html>

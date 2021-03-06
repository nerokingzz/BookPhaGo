<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bookphago</title>
	<!-- <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet"> -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e7bf23ab0472efaf8d58b131cc552d"></script>
	<link rel="stylesheet" type="text/css" href="resources/chat/css/rent.css">
	<link href="resources/chat/style.css" rel="stylesheet">
<script
	src="https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<script src = "resources/chat/js/rent.js" ></script>
<script src = "resources/chat/js/return.js" ></script>
<script src = "resources/chat/js/extend.js" ></script>
<script src = "resources/chat/js/watsonjs.js" ></script>
<script type="text/javascript">


const options = {
	      integrationID: "92a948a5-7b50-4302-b42a-b5664494afab", // The ID of this integration.
	      region: "kr-seo", // The region your integration is hosted in.
	      showLauncher: false
	   };

window.loadWatsonAssistantChat(options).then(function(instance) {

	//세션에 저장되어있는 유저의 아이디와 유형을 가져온다.
	var chat_member = "${user_id}";
	var userPosition = "${user_position}";
	console.log("user position is..." + userPosition);
	  
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

    var clearCount = 0;
   
    button.addEventListener('click', () => {
      instance.openWindow();
      
    
      var chatHeader =  $('#WAC__header-name');
      chatHeader.css('color','white');
      
      var status = "";
      var status2 = ""
      if(userPosition == 'admin'){
    	  status = "관리자로 로그인하셨습니다."; 
      	  status2 = "<br>도서 대출과 반납이 가능합니다.";
      }else if(userPosition == 'general'){
    	  status = "일반 회원으로 로그인하셨습니다.";
    	  status2 = "<br>상태 확인과 도서 연장이 가능합니다.";
      }else{
    	  status = "비회원으로 로그인하셨습니다.";
    	  status2="<br>기능 이용이 제한됩니다.";
      }

      
      if(!($('#chatTooltip').length > 0)){
    	  chatHeader.append("<div id='chatTooltip' title='"+status+"'>?</div>");
          
          
          var tooltipHtml = [];
          
          tooltipHtml.push("<div class='tooltip'>");
          tooltipHtml.push("    <div class='tooltip-arrow'></div>");
          tooltipHtml.push(""+status+status2);
          //tooltipHtml.push("    <div class='tooltip-head'></div>");
          //tooltipHtml.push("    <div class='tooltip-inner'></div>");
          tooltipHtml.push("</div>");
          
          
          $('#chatTooltip').css({
        	  'float' : 'right',
        	  'color' : "white",
        	  'font-size' : "10pt",
        	  "background-color" : "#8C8C8C",
        	  'border-radius' : "50%", 
        	  'width' : "25px",
    		  'height' : "25px",
    		  "padding" : "0px 7px 0 9px"
          })
          
       
          
          
          $('#chatTooltip').tooltip({
        	  template: tooltipHtml.join("")
          });
      
      }
      
      /*  위젯의 header에 clear 버튼을 달아줌 시작 
      chatHeader.append('<span id="clearButton" >Clear</span>')
      
     
      
      var clearButton = $('#clearButton');
      
      clearButton.css('float','right').css('font-size','14px').css('cursor','pointer');
      
     
      
      clearButton.on('click',function(){

    	
  		var messageHolder = $('.WAC__message').parent();
  		console.log("parents' id is... " + messageHolder.attr('id'));
  		
  		messageHolder.empty();
	
  		
  		const sendObject = {
  				  "input": {
  				    "message_type": "text",
  				    "text": "welcome"
  				  },
  				 
  				  "history": {
  					  "getWelcome" : "true"
  				  },
  				  "skills" : {
  					  "main skill":{
  						  "user_defined":{
  			  				 "check_me": false,
  			  				 "is_login": false,
  			  				 "username": null,
  			  				 "need_menu": true,
  			  				 "borrow_okay": false,
  			  				 "borrow_bookNumber": null
  			  				  
  						  }
  					  }
  				  }
  				};
  		const sendOptions = {
  			"silent": true
  		};
  		
  		try{

  			instance.send(sendObject, sendOptions).then(function(){
  				$('.WAC__message--padding').css('padding-top','16px');
  				console.log("clear count.." + clearCount);
  				
  			//처음으로 clear를 실행하면 웰컴 메시지가 두번 불러와지는 오류가 있으므로 
  			//그 때의 첫 웰컴 메시지를 display:none 처리한다.
  			if(clearCount == 0){
  				$('#WAC__message-0').attr('style','display:none');
  				$('#WAC__message-1').attr('style','display:none');
  				clearCount++;
  				};
  			});
  				
  		}catch(e){
  			console.log("clear error! " + e);
  		}

  	})
  	*/
    });
    
    
 

	
   instance.on({ type: 'pre:receive', handler: preRecieve });
  
   instance.on({ type: 'receive', handler: receive });
   
   instance.once({ type: 'pre:send', handler: function(event){
	   event.data.context.skills['main skill'].user_defined.user_position = userPosition ;
   } });

   

   instance.on({ type: 'pre:send', handler: preSend });
   instance.on({ type: 'error', handler: error });
   
    instance.render().then(() => {
         button.style.display = 'block';
         button.classList.add('open');

       });
});
</script>
<style>


/* tooltip styling. by default the element to be styled is .tooltip  */
#WACWidget{
	z-index: 9999 !important;
}

.tooltip {
    background:#f29661;
    font-size:12px;
    height:auto;
    width:auto;
    padding:3px;
    color:#fff;
    text-align : center;
    z-index : 10000;
}




</style>
</html>

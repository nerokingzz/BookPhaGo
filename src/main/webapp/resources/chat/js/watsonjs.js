
   
const options = {
      integrationID: "92a948a5-7b50-4302-b42a-b5664494afab", // The ID of this integration.
      region: "kr-seo", // The region your integration is hosted in.
      showLauncher: false
   };
   
   
   //메시지 윈도우를 열 때 설정해야하는 부분
   function windowOpen(event){
      console.log('window:open');
   }

   
   
   // 챗봇 메시지를 받기 전 설정해야하는 부분
   function preRecieve(event){
      console.log('pre:receive');

      var user_defined = event.data.context.skills['main skill'].user_defined;
      var search_bookName = JSON.stringify(event.data.context.skills['main skill'].user_defined.search_bookName);


      checkId(event);

      
      
      
      if(search_bookName != undefined && search_bookName != "null" && search_bookName != null){
         console.log("search_bookName : " + search_bookName);
         setTimeout(function(){
            chat_searchBook(event);
         }, 50);
      }
      var chat_userName = user_defined.username;
      var userRequest = user_defined.gita_userRequest;
      
      if(userRequest != null && userRequest != undefined){
         sendMail(chat_userName, userRequest);
      }
      
      

      


   }
   
   
   
   function sendMail(chat_userName, userRequest){
      if(chat_userName == null) chat_userName = "비회원";
      var content = "<div>" +
            "<img src='https://i.imgur.com/jlDhg6k.png' alt ='mail top image'/><br>"+
               "<div style='margin: 3px 0px 9px 16px; width:317px;font-size:12px'>" +
                     "<b>회원명</b>&nbsp;&nbsp;" + chat_userName +"<br>"
                     +"<b>문의 내용</b>&nbsp;&nbsp;"+ userRequest + "<br>" +
                  "</div>"+
            "<img src='https://i.imgur.com/gXAx6Oa.png' alt ='mail bottom image'/>" +
         "</div>";
      $.ajax({
         url: '/sendMail.do',
         async: true,
         data : {"content" : content}, 
         type : 'get',
         success : function(result){
            console.log("mail sending result is......okay!");
         },
         //에러 처리 필요함.
         error : function(result, status){
            console.log("mail sending result is......error");
         }
      })
   }
   

   
   //위젯 열 때 실행될 메소드 1. 회원 아이디가 있는지 체크. 있다면 $isLogin을 true로 바꾸기.
   function checkId(event){
      
      var chat_userId = decodeURIComponent(event.data.context.global.system.user_id);
      if(!chat_userId.includes('IBM')){
         event.data.context.skills['main skill'].user_defined.is_login = true;
         event.data.context.skills['main skill'].user_defined.username = chat_userId;
      }   
   }

   
   
   
   //챗봇 메시지를 받을 때 설정부
   function receive(event){
      console.log('receive');
      console.log(event);
      var user_defined = event.data.context.skills['main skill'].user_defined;
      var chat_userId = user_defined.username;
      var check_me =  user_defined.check_me;
      var is_borrow =  user_defined.is_borrow;
      var borrow_bookNumber = user_defined.borrow_bookNumber;
      
      if(event.data.output.entities.length != 0 && event.data.output.entities[0].entity){
    	  var entity = JSON.stringify(event.data.output.entities[0].entity);
          entity = decodeURIComponent(entity);
      }
     
      
      if(event.data.output.generic.length !=0 && event.data.output.generic[0].description){
         var desc = event.data.output.generic[0].description;
      }
      
      

	  if (entity) {
		  if(entity.includes('지도')){
			setTimeout(addMap, 300);
		  }
	  } else if (desc) {
		if (desc.includes('지도'))
			setTimeout(addMap, 300);
	  }
      
      if(chat_userId != null && check_me == true){
         console.log("this is in receive check me");
         setTimeout(function(){
            console.log('in setTimeout');
            checkInfo(chat_userId);
         }, 1000);
      }
      
      
      var isCalulate = user_defined.is_calculate;
      
      if(isCalulate == true){
         var calFormula = user_defined.gita_calFormula;
         if(calFormula != null){
            try{
               var calResult = eval(calFormula);
               console.log("답은 .." + calResult);
               setTimeout(function() {
                  var calResultDiv = $('.calResult').last();
                  calResultDiv.append("답은 " + calResult + "입니다!");
               }, 50);

            }catch(EvalError){
               setTimeout(function() {
                  var calResultDiv = $('.calResult').last();
                  calResultDiv.append("입력식이 올바르지 않습니다.");
               }, 50);
            }
         }
            event.data.context.skills['main skill'].user_defined.is_calculate = false;
         }
      


   }
   
   
   
   //챗봇 메시지를 보낼 때 설정부
   function preSend(event) {
	  var user_defined = event.data.context.skills['main skill'].user_defined;
      console.log("preSend.....");
      console.log(event);
	   //도서 대출 메소드
	   var isBorrow = user_defined.is_borrow;
	   if(isBorrow == true){
		   	chatRentBook(event);
	   }

   }

   


   //에러 발생 시 설정부
   function error(event){
      console.log('개발자님.. 뭔가 문제가 생긴 것 같아요');
      console.log('error type : ' + event.type);
      console.log('error data : ' + event.data);
   }
   
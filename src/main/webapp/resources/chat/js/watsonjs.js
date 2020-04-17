
   
const options = {
          integrationID: "17492039-629e-4de1-bd22-7e87d039b29a", // The ID of this integration.
          region: "kr-seo", // The region your integration is hosted in.
         showLauncher: false
   };
   
   
   //메시지 윈도우를 열 때 설정해야하는 부분
   function windowOpen(event){
      console.log('window:open');
   }

	
	
	//챗봇 메시지를 받기 전 설정해야하는 부분
	function preRecieve(event){
		console.log('pre:receive');
		checkId(event);
		var user_defined = event.data.context.skills['main skill'].user_defined;
		var search_bookName = JSON.stringify(event.data.context.skills['main skill'].user_defined.search_bookName);
		
		if(search_bookName != undefined && search_bookName != "null" && search_bookName != null){
			console.log("search_bookName : " + search_bookName);
			setTimeout(function(){
				chat_searchBook(event);
			}, 200);
			//search_bookName = null;
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
	
	/*
	function checkBook(event){
		var user_defined = event.data.context.skills['main skill'].user_defined;
		console.log("user_defined is....." + user_defined);
		var is_borrow =  user_defined.is_borrow;
		var borrow_bookNumber = user_defined.borrow_bookNumber;
		console.log('book number is...' + borrow_bookNumber);
		if(is_borrow == true){
			// 추후 이곳에 bookNumber를 가져와서 서버 단에서 유효성을 검사하고, borrow_okay를 false 또는 true로 결정해주는 부분 필요
			event.data.context.skills['main skill'].user_defined.borrow_okay = true;
			
			$.ajax({
				url: '/chat/borrowBook.do',
				async:false,
				dataType : 'json',
				contentType : 'application/json; charset=utf-8',
				data : {"bookNumber" : borrow_bookNumber}, 
				type : 'get',
				success : function(result){
					
					console.log(result);
					
					if(result.error !== null && result.error !== undefined){
						container.append(result.error);
					}else{
						container.append("<span style = 'background-color:orange'>회원 성명</span>&nbsp;&nbsp;" + result.mem_id + "<br>");
						container.append("<span style = 'background-color:orange'>현재 대여 권수</span>&nbsp;&nbsp;" + result.mem_bookcount);
					}
				
				},
				error : function(result, status, error){
					container.append("error alert!");
				}
			})
			
		}
	}
	*/
	
	//위젯 열 때 실행될 메소드 1. 회원 아이디가 있는지 체크. 있다면 $isLogin을 true로 바꾸기.
	function checkId(event){
		console.log('I am in checkId');
		
		var chat_userId = decodeURIComponent(event.data.context.global.system.user_id);
		console.log("현재 접속한 유저의 아이디 : " + chat_userId);
		
		if(!chat_userId.includes('IBM')){
			console.log(event.data.context.skills['main skill'].user_defined);
			event.data.context.skills['main skill'].user_defined.is_login = true;
			event.data.context.skills['main skill'].user_defined.username = chat_userId;
		}	
	}

   
	
	
	//챗봇 메시지를 받을 때 설정부
	function receive(event){
		console.log('receive');
		var message = JSON.stringify(event.data.output.generic[0].text);
		
		var user_defined = event.data.context.skills['main skill'].user_defined;
		var chat_userId = user_defined.username;
		var check_me =  user_defined.check_me;
		var is_borrow =  user_defined.is_borrow;
		var borrow_bookNumber = user_defined.borrow_bookNuumber;
		
		message = decodeURIComponent(message);
		
		if(event.data.output.generic[0].description){
			var desc = event.data.output.generic[0].description;
			console.log("desc :" + desc);
		}
		
		console.log("user ID : " + chat_userId);
		
		if(message.includes('지도')){
			setTimeout(addMap, 300);
		}else if(desc){
			if(desc.includes('지도'))setTimeout(addMap, 300);
		}
		
		if(chat_userId != null && check_me == true){
			console.log("this is in receive check me");
			setTimeout(function(){
				console.log('in setTimeout');
				checkMember(chat_userId);
			}, 100);
		}
	}
	
	
	
	//챗봇 메시지를 보낼 때 설정부
	function send(event) {
		console.log("send....."); 
		console.log(event.data.context);
		
	}
	

   
  
   
   //챗봇 메시지를 보낼 때 설정부
   function send(event) {
      console.log("send....."); 
      console.log(event.data.context);
      
   }
   


   //에러 발생 시 설정부
   function error(event){
      console.log('개발자님.. 뭔가 문제가 생긴 것 같아요');
      console.log('error type : ' + event.type);
      console.log('error data : ' + event.data);
   }
   

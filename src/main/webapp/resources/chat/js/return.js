

function chatReturnBook(event){
	var user_defined = event.data.context.skills['main skill'].user_defined;
	
	var returnId = null;
	var bookNumber = null;
	
	// '도서 반납 - 관리자'에서 처음 아이디를 입력받을 때
	if(user_defined.return_id == null && user_defined.return_id_okay == null
			&& user_defined.return_bookNumber == null && user_defined.return_bookNumber_okay == null
			&& user_defined.return_okay == false && user_defined.return_go == false){
		returnId = event.data.input.text;
		console.log("1");
		
		if(returnId != null && returnId.length != 0){
			
			//returnId의 유효성 검사 및 대출한 도서가 0이라 반납할 거리가 없을 때가 아닐 때
			if(checkReturnID(returnId) == true){
				console.log("It's true!!");
				
				event.data.context.skills['main skill'].user_defined.return_id = returnId;
				event.data.context.skills['main skill'].user_defined.return_id_okay = true;
				
			//returnId의 검사 결과가 유효하지 않았을 때
			}else{
				event.data.context.skills['main skill'].user_defined.return_id_okay = false;
			}
		}else{
		}
		
	}


	// '도서 대출 - 관리자 - 정상아이디'에서 도서번호를 입력받을 때
	if(user_defined.return_id != null && user_defined.return_id_okay == true
			&& user_defined.return_bookNumber == null && user_defined.return_bookNumber_okay == null
			&& user_defined.return_okay == false && user_defined.return_go == false){
		console.log("2");
		var bookNumber = event.data.input.text;
		returnId = event.data.context.skills['main skill'].user_defined.return_id;
		
		checkBookRentNumber(returnId);
		
		/*
		if(returnBookFinal(bookNumber) == true){
			event.data.context.skills['main skill'].user_defined.return_bookNumber_okay = true;
			event.data.context.skills['main skill'].user_defined.return_bookNumber = bookNumber;

		}else{
		}*/
		

	}

	
	
  	if (user_defined.return_id != null && user_defined.return_id_okay == true
			&& user_defined.return_bookNumber == null && user_defined.return_bookNumber_okay == null
			&& user_defined.return_okay == false && user_defined.return_go == true) {
  		

  		console.log("3");
  		
  		var userid = event.data.context.skills['main skill'].user_defined.return_id;
  		var bookNumber = event.data.input.text;
  		

		$.ajax({
			url:"/chat/ReturnBook.do",
			data: {"userid" : userid , "bookNumber" : bookNumber},
			method:"GET",
			async: false,
			contentType: "application/json",
			success:function(data) {
				
				if(data == 1){
					console.log("반납 작업 완료");
					event.data.context.skills['main skill'].user_defined.return_okay = true;
					  
				}else{
					event.data.context.skills['main skill'].user_defined.return_okay = false;
					console.log("반납 작업 실패");
				}
				

			},error:function(request,status,error){
				console.log("ajax error3");
			}
		})
 	
	}
      


//'도서 대출- 관리자' 에서 입력받은 사용자 아이디가 유효한지 && 검사 및 대출가능 권수가 0 이하가 아닌지 검사하는 method
function checkReturnID(userid){
	var result = false;
	
	var a = {"userid" : userid};
	
	$.ajax({
		url:"/chat/checkID.do",
		data: JSON.stringify(a),
		method:"POST",
		async: false,
		contentType: "application/json",
		success:function(data) {
			
			if(data.borrowcnt){
				
				var bookCount = data.borrowcnt;
				
				if(bookCount > 0){
					result = true;
				}else{
					console.log("borrow count가 0이기 때문에 반납할 책이 없음");
				}
			}else{
				console.log(data.error);
			}
		},error:function(request,status,error){
			console.log("ajax error");
		}
	})
	return result;
}



//유저를 검색하여 이 우저가 현재 대출중인 도서를 가져오기
//반납할 도서의 검색 결과 출력
function checkBookRentNumber(mem_id){
	

	$.ajax({
		url: '/chat/searchMember.do',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8',
		data : {"mem_id" : mem_id}, 
		type : 'get',
		success : function(result){
			
			
			setTimeout(function(){
				console.log(result);
				
				var container = $('.returnAllBook').last();
				if(container){
					if(result.error !== null && result.error !== undefined){
						container.append("error alert!");
					}else{
						
						var memTable = "";
						
						memTable += "<table class='memTable'>"
						for(i in result.rentList){
							

							console.log("i는  " + i);
							
							
							memTable += "<tr><td class = 'sub'>도서명</td><td class='con'>"+result.rentList[i].BOOKNAME+"</td></tr>";
							memTable += "<tr><td class = 'sub'>고유번호</td><td class='con'>"+result.rentList[i].BOOKNUMBER+"</td></tr>";
							if(i == 0) memTable += "<tr class='hrHere'><td colspan='2'><hr></td></tr>";
							
						}
						
						memTable += "</table>";

						container.append(memTable);
						
						container.css('height','auto');
						container.css('border','1px solid #F07E30');
						container.css('background-color','white');
						container.css('border-radius','8px');
						container.css('padding','10px');
						container.css('font-size','13px');
						container.css('margin','auto');
						container.css('margin-top','15px');
						container.css('text-align','center');
						
						
						
						var labletrs = $('.memTable .sub');
						labletrs.css('display','inline');
						labletrs.css('padding','0px 5px 0px 5px');
						labletrs.css('white-space','nowrap');
						labletrs.css('font-weight','bold');
						labletrs.css('font-size','11px');
						labletrs.css('background-color','#E44D3A');
						labletrs.css('border-radius','8px');
						labletrs.css('color','white');
						
						
						var contds = $('.memTable .con');
						contds.css("width", '220px');
						contds.css('height','auto');
						
						
						
						if($('.memTable').last().find('tr').length <= 3){
							console.log("length ㄴㅁㅇㅁㅇㅁㅇㄴㅁㅇ!!" + $('.memTable').last().find('tr').length);
							$('tr.hrHere').css('display','none');
						}else{
							var hrs =  $('.memTable').last().find('tr hr');
							hrs.css("text-align","center");
							hrs.css("width","100%");
							hrs.css("margin","auto");
							hrs.css("color","#5D5D5D");
						}
					}
				}
				
				
			},1000);

		},
		error : function(result, status, error){
			setTimeout(function(){
				var container = $('.returnAllBook').last();
				container.append("error alert!");
			},1000);
		}
	}); 
}

}
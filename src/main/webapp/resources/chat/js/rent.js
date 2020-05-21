

function chatRentBook(event){
	var user_defined = event.data.context.skills['main skill'].user_defined;
	
	
	var isBorrow = user_defined.isBorrow;

	
	var borrowId = null;
	var bookNumber = null;
	
	// '도서 대출- 관리자'에서 처음 아이디를 입력받을 때
	if(user_defined.borrow_id == null && user_defined.borrow_id_okay == null
			&& user_defined.borrow_bookNumber == null && user_defined.borrow_bookNumber_okay == null
			&& user_defined.borrow_okay == false){
		borrowId = event.data.input.text;
		
		if(borrowId != null && borrowId.length != 0){
			//borrowId의 유효성 검사 및 대출가능 권수가 0 이하가 아닐 때
			if(checkRentID(borrowId) == true){
				event.data.context.skills['main skill'].user_defined.borrow_id = borrowId;
				event.data.context.skills['main skill'].user_defined.borrow_id_okay = true;
				//borrowId의 검사 결과가 유효하지 않았을 때
			}else{
				event.data.context.skills['main skill'].user_defined.borrow_id_okay = null;
			}
		}else{
			console.log("borrowId에 문제가 있는듯합니다이00");
		}
		
	}


	// '도서 대출 - 관리자 - 정상아이디'에서 도서번호를 입력받을 때
	if(user_defined.borrow_id != null && user_defined.borrow_id_okay == true
			&& user_defined.borrow_bookNumber == null && user_defined.borrow_bookNumber_okay == null
			&& user_defined.borrow_okay == false){
		
		var bookNumber = event.data.input.text;
		borrowId = event.data.context.skills['main skill'].user_defined.borrow_id;
		

		if(checkBookNumber(bookNumber) == true){
			event.data.context.skills['main skill'].user_defined.borrow_bookNumber_okay = true;
			event.data.context.skills['main skill'].user_defined.borrow_bookNumber = bookNumber;
			
			rentBookSearch(bookNumber);

		}else{
		}
	}
	
	
	
  	if (user_defined.borrow_id != null
  			&& user_defined.borrow_id_okay == true
  			&& user_defined.borrow_bookNumber != null
  			&& user_defined.borrow_bookNumber_okay == true
  			&& isThatYes(event.data.input.text) == true) {

  		var userid = event.data.context.skills['main skill'].user_defined.borrow_id;
  		var bookNumber = event.data.context.skills['main skill'].user_defined.borrow_bookNumber;

		
		$.ajax({
			url:"chatBookRent.do",
			data: {"userid" : userid , "bookNumber" : bookNumber},
			method:"GET",
			async: false,
			contentType: "application/json",
			success:function(data) {
				
				if(data == 1){
					console.log("대출 작업 완료");
					event.data.context.skills['main skill'].user_defined.borrow_okay = true;
					  
				}else{
					console.log("대출 작업 실패");
				}
				

			},error:function(request,status,error){
				console.log("ajax error3");
			}
		})

	}
      
	
	//이후 user_defined.borrow_id != null && user_defined.borrow_id_okay == true
	//&& user_defined.borrow_bookNumber == null && user_defined.borrow_bookNumber_okay == null
	//&& user_defined.borrow_okay == true
	//라는 조건을 만족할 때 해당 borrow_id와 borrow_bookNumber를 가지고 대출을 실행할 메소드를 pre:receive에 기재한다.
	
}


function isThatYes(input){
	var result = false;
	var yeses = ["동의","네","응","맞아","옹옹","네, 맞아요!","그렇습니다","그래","oo","o"];
	
	for(i in yeses){
		if(input == yeses[i]) result = true;
	}

	return result;
}


//'도서 대출- 관리자' 에서 입력받은 사용자 아이디가 유효한지 && 검사 및 대출가능 권수가 0 이하가 아닌지 검사하는 method
function checkRentID(userid){
	var rentResult = false;
	
	var a = {"userid" : userid};
	
	$.ajax({
		url:"c.do",
		data: JSON.stringify(a),
		method:"POST",
		async: false,
		contentType: "application/json",
		success:function(data) {
			
			var bookCount = data.borrowcnt;
			console.log("이 넘이 현재까지 빌린 도서 권 수는...." + bookCount);
			if((2-bookCount) > 0){
				rentResult = true;
				  
			}else{
			}
			

		},error:function(request,status,error){
			console.log("ajax error");
		}
	})
	return rentResult;
}



//도서번호를 검색하여 있는 도서인지, 대출 가능한 도서인지 찾는 메소드
function checkBookNumber(bookNumber){
	
	var b = {"bookNumber" : bookNumber};
	var result = false;
	
	$.ajax({
		url:"d.do",
		data:JSON.stringify(b),
		method:"POST",
		async: false,
		contentType: "application/json",
		success:function(data) {
			var info = data;
			if(info.booklist[0]!=undefined){
				
				var ff = info.booklist[0].BOOKRENT;
				
				if(ff == "대출가능") {
					result = true;
				}
				
			}
		},error:function(request,status,error){
			console.log("ajax 오류 2");
		}
	}); 
	
	return result;
}

//빌릴 도서의 검색 결과 출력
function rentBookSearch(bookNumber){
		var b = {"bookNumber" : bookNumber};
		
		$.ajax({
			url: '/d.do',
			data:JSON.stringify(b),
			type : 'POST',
			contentType: "application/json",
			success : function(result){
				setTimeout(function(){
				var container = $('.rentBook').last();
				container.css('border','1px solid #F07E30');
				container.css('background-color','white');
				container.css('border-radius','8px');
				container.css('padding','10px');
				container.css('font-size','13px');
				container.css('margin','auto');
				container.css('text-align','center');
				

				
					
				if(result.length == 0){
					container.append("결과가 존재하지 않습니다.");
				}else{
					
					
					var rentTable = "";
					
					rentTable += "<table class='rentBook'>";
					rentTable += "<tr><td class = 'sub'>책 제목</td><td>"+result.booklist[0].BOOKNAME+"</td></tr>"	;
					rentTable += "<tr><td class = 'sub'>작가</td><td>"+result.booklist[0].BOOKWRITER+"</td></tr>"	;
					rentTable += "<tr><td class = 'sub'>출판사</td><td>"+result.booklist[0].BOOKPUBLISHER+"</td></tr>"	;
					rentTable += "<tr><td class = 'sub'>ISBN</td><td>"+result.booklist[0].ISBN+"</td></tr>"	;
					rentTable += "<tr><td class = 'sub'>대출 상태</td><td>"+result.booklist[0].BOOKRENT+"</td></tr>"	;
					rentTable += "</table>";

					container.append(rentTable);
					
					
					
					var labletrs = $('.rentBook .sub');
					labletrs.css('display','inline');
					labletrs.css('padding','0px 5px 0px 5px');
					labletrs.css('white-space','nowrap');
					labletrs.css('font-weight','bold');
					labletrs.css('font-size','11px');
					labletrs.css('background-color','#E44D3A');
					labletrs.css('border-radius','8px');
					labletrs.css('color','white');
					
				}
				},2000);
			},
			error : function(result, status, error){
				setTimeout(function(){
					var container = $('.rentBook').last();
					container.append("시스템에 오류가 발생하였습니다.<br>챗봇을 다시 실행하여 주세요.");
				},2000)

			}
		})

	
	
}
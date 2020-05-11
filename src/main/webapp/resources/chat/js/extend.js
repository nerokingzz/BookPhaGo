function chatExtendBook(event){
var user_defined = event.data.context.skills['main skill'].user_defined;
	



	// '도서 연장 - 회원'에서 해당 회원에게 연장 가능한 도서가 있는지 확인하기.
	if(event.data.input.text.includes("연장") && user_defined.extend_id_okay == null
			&& user_defined.extend_bookNumber == null && user_defined.extend_bookNumber_okay == null
			&& user_defined.extend_go == false && user_defined.extend_okay == false ){


			var username = user_defined.username;
			
			//extendId의 유효성 검사 및 대출한 도서가 0이라 반납할 거리가 없을 때가 아닐 때
			if(checkExtendID(username) == true){
				event.data.context.skills['main skill'].user_defined.extend_id_okay= true;
				console.log("It's true!!");
				
				setTimeout(function(){
					checkBookExtendNumber(username);
				},1300);
				
			//extendId의 검사 결과가 유효하지 않았을 때
			}else{
				console.log("It's false!!");
				event.data.context.skills['main skill'].user_defined.extend_id_okay= false;
			}
		
	}


	// '도서 대출 - 관리자 - 정상아이디'에서 도서번호를 입력받을 때
	if(user_defined.is_extend == true && user_defined.extend_id_okay == true
			&& user_defined.extend_bookNumber == null && user_defined.extend_bookNumber_okay == null
			&& user_defined.extend_go == true && user_defined.extend_okay == false ){
		console.log("2");
		var bookNumber = event.data.input.text;
		
		console.log("bookNumber is ... " + bookNumber);
		
		event.data.context.skills['main skill'].user_defined.extend_bookNumber_okay = true;
		event.data.context.skills['main skill'].user_defined.extend_bookNumber = bookNumber;


	}

	
	
  	if (user_defined.is_extend == true && user_defined.extend_id_okay == true
			&& user_defined.extend_bookNumber != null && user_defined.extend_bookNumber_okay == true
			&& user_defined.extend_go == true && user_defined.extend_okay == false ) {
  		
  		console.log("extend_go가 제대로 되었는지 말해주쎄용~");
  		
  		
  		var userid = user_defined.username;
  		var bookNumber = user_defined.extend_bookNumber;
  		

		$.ajax({
			url:"/chat/ExtendBook.do",
			data: {"userid" : userid , "bookNumber" : bookNumber},
			method:"GET",
			async: false,
			contentType: "application/json",
			success:function(data) {
				
				if(data == 1){
					console.log("반납 작업 완료");
					event.data.context.skills['main skill'].user_defined.extend_okay = true;
					  
				}else{
					event.data.context.skills['main skill'].user_defined.extend_okay = false;
					console.log("반납 작업 실패");
				}
				

			},error:function(request,status,error){
				console.log("ajax error3");
			}
		})
 	
	}
      


//'도서 대출- 관리자' 에서 입력받은 사용자 아이디가 유효한지 && 검사 및 대출가능 권수가 0 이하가 아닌지 검사하는 method
function checkExtendID(userid){
	var result = false;
	
	$.ajax({
		url:"/extendID.do",
		data: {"userid" : userid},
		method:"POST",
		async: false,
		success:function(data) {

			console.log(data);
			console.log("I am checkExtendID");
			
			
			if(data.error == null){
				
			var rentList = data.rentList;
			
				for(i in rentList){
					var rentDate = rentList[i].RENTDATE;
					var returnDate = rentList[i].RETURNDATE;
					
					if(getDateDiff(returnDate,rentDate)==7){
						result = true;
					}else{
						console.log(rentList[i].BOOKNAME + "은 이미 한 번 연장된 도서입니다이");
					}
				}
				
			}else{
				console.log("data.error 에러 발생");
			}
			
		},error:function(request,status,error){
			console.log("ajax error");
		}
	})
	return result;
}



//유저를 검색하여 이 우저가 현재 대출중인 도서를 가져오기
//반납할 도서의 검색 결과 출력
function checkBookExtendNumber(userid){
	

	$.ajax({
		url: '/extendID.do',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8',
		data : {"userid" : userid}, 
		async : false,
		type : 'get',
		success : function(result){
			setTimeout(function(){
				console.log(result);
				
				var container = $('.extendAllBook').last();
				if(container){
					if(result.error !== null && result.error !== undefined){
						container.append("error alert!");
					}else{
						
						var memTable = "";
						memTable += "<table class='memTable'>"
						for(i in result.rentList){
							

							var rentDate = result.rentList[i].RENTDATE;
							var returnDate = result.rentList[i].RETURNDATE;
							
							if(getDateDiff(returnDate,rentDate)==7){

								memTable += "<tr><td class = 'sub'>도서명</td><td class='con'>"+result.rentList[i].BOOKNAME+"</td></tr>";
								memTable += "<tr><td class = 'sub'>고유번호</td><td class='con'>"+result.rentList[i].BOOKNUMBER+"</td></tr>";
								memTable += "<tr><td class = 'sub'>대출일</td><td class='con'>"+result.rentList[i].RENTDATE+"</td></tr>";
								memTable += "<tr><td class = 'sub'>반납일</td><td class='con'>"+result.rentList[i].RETURNDATE+"</td></tr>";
								
								if(i == 0) memTable += "<tr class='hrHere'><td colspan='2'><hr></td></tr>";
								
							}else{
								continue;
							}
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
				
				
			},100);

		},
		error : function(result, status, error){
			setTimeout(function(){
				var container = $('.extendAllBook').last();
				container.append("error alert!");
			},100);
		}
	}); 
	}
}	

//'yyyy-MM-dd' 형태의 string 두 개를 빼기 연산할 수 있게 해주는 function.
function getDateDiff(date1,date2)
{
    var arrDate1 = date1.split("-");
    var getDate1 = new Date(parseInt(arrDate1[0]),parseInt(arrDate1[1])-1,parseInt(arrDate1[2]));
    var arrDate2 = date2.split("-");
    var getDate2 = new Date(parseInt(arrDate2[0]),parseInt(arrDate2[1])-1,parseInt(arrDate2[2]));
    
    var getDiffTime = getDate1.getTime() - getDate2.getTime();
    
    return Math.floor(getDiffTime / (1000 * 60 * 60 * 24));
}
function chat_searchBook(event){
	var search_bookName = JSON.stringify(event.data.context.skills['main skill'].user_defined.search_bookName);
	
	
	console.log("in chat_searchBook");
	
	console.log("book name is..." + search_bookName);
	var container = $('.chat_searchList').last();

	container.css("width","auto");
	container.css("height","auto");
	container.css("padding","15px");
	
	//container.append("시공의 폭풍은 정말 최고야!!");
	
	
	if(search_bookName != undefined && search_bookName != ""){
	$.ajax({
			url: '/chat_usersearchbook.do',
			async:false,
			dataType : 'json',
			contentType : 'application/json; charset=utf-8',
			data : {"search_value" : search_bookName}, 
			type : 'get',
			success : function(result){
				
				console.log(result);
				
				if(/*true 결과가 없을 때의 if문*/true){
					container.append(result.error);
				}else{
					//container.append("<span style = 'background-color:orange'>회원 성명</span>&nbsp;&nbsp;" + result.mem_id + "<br>");
					//container.append("<span style = 'background-color:orange'>현재 대여 권수</span>&nbsp;&nbsp;" + result.mem_bookcount);
				}
			
			},
			error : function(result, status, error){
				container.append("error alert!");
			}
		})
		
	}
}
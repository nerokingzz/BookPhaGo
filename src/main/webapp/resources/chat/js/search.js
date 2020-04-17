function chat_searchBook(event){
	var search_bookName = JSON.stringify(event.data.context.skills['main skill'].user_defined.search_bookName);
	console.log("in chat_searchBook");
	
	
	if(search_bookName != null && search_bookName != undefined){
		search_bookName = search_bookName.replace(/\"/gi, "");
		console.log("book name is..." + search_bookName);
	
		var container = $('.chat_searchList').last();

		container.css("width","auto");
		container.css("height","auto");
		container.css("padding","15px");
	
	
		//if(search_bookName != undefined && search_bookName != ""){
		$.ajax({
			url: '/chatSearchBook.do',
			data : {"searchKeyword" : search_bookName}, 
			type : 'post',
			success : function(result){
				console.log(result);
				
				if(result.length == 0){
					container.append("결과가 존재하지 않습니다.");
				}else{
					//스타일 작업 필요
					for(i in result){
						container.append("책 제목 : &nbsp;&nbsp;" + result[0].BOOKNAME + "<br>");
						container.append("장르 : &nbsp;&nbsp;" + result[0].BOOKGENRE + "<br>");
						container.append("작가 : &nbsp;&nbsp;" + result[0].BOOKWRITER + "<br>");
						container.append("출판사 : &nbsp;&nbsp;" + result[0].BOOKPUBLISHER + "<br>");
						container.append("<hr>");
					}
				}
			},
			error : function(result, status, error){
				container.append("error alert!");
			}
		})
		
		event.data.context.skills['main skill'].user_defined.search_bookName = null;
	}
	
}
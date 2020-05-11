function chat_searchBook(event){
	var search_bookName = JSON.stringify(event.data.context.skills['main skill'].user_defined.search_bookName);
	console.log("in chat_searchBook");
	
	
	if(search_bookName != null && search_bookName != undefined){
		search_bookName = search_bookName.replace(/\"/gi, "");
		console.log("book name is..." + search_bookName);
	
		var container = $('.chat_searchList').last();

		container.css("width","100%");
		container.css("height","auto");
		container.css("margin-top","8px");
		
	
	
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
						var searchTable = "";
						
						searchTable += "<table class='chatSearchTable'>";
						searchTable += "<tr><td class = 'sub'>책 제목</td><td class = 'con'>"+result[i].BOOKNAME+"</td></tr>";
						searchTable += "<tr><td class = 'sub'>작가</td><td class = 'con'>"+result[i].BOOKWRITER+"</td></tr>";
						searchTable += "<tr><td class = 'sub'>출판사</td><td class = 'con'>"+result[i].BOOKPUBLISHER+"</td></tr>";
						searchTable += "<tr><td class = 'sub'>고유번호</td><td class = 'con'>"+result[i].BOOKNUMBER+"</td></tr>";
						searchTable += "<tr><td class = 'sub'>상태</td><td class = 'con'>"+result[i].BOOKRENT+"</td></tr>";
						searchTable += "</table>";
						container.append(searchTable);
						
					}
					

					
					var searchTables = $('.chatSearchTable');
					searchTables.css('border','1px solid #F07E30');
					searchTables.css('border-radius','8px');
					searchTables.css('background-color','white');
					searchTables.css('table-radius','8px');
					searchTables.css('padding','5px');
					searchTables.css('font-size','13px');
					searchTables.css('margin','auto');
					searchTables.css('margin-bottom','10px');
					searchTables.css('text-align','center');
					
					
					
					
					var labletrs = $('.chatSearchTable .sub');
					labletrs.css('display','inline');
					labletrs.css('padding','0px 5px 0px 5px');
					labletrs.css('white-space','nowrap');
					labletrs.css('font-weight','bold');
					labletrs.css('font-size','11px');
					labletrs.css('background-color','#E44D3A');
					labletrs.css('border-radius','8px');
					labletrs.css('color','white');
					labletrs.css('margin-left','7px');
					
					
					var contds = $('.chatSearchTable .con');
					contds.css("width", '220px');
					contds.css('height','auto');
					
					
				}
			},
			error : function(result, status, error){
				container.append("error alert!");
			}
		})
		
		event.data.context.skills['main skill'].user_defined.search_bookName = null;
	}
	
}
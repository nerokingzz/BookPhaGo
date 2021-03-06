
function checkInfo(userId){
	
	var mem_id = decodeURI(userId);

	
	$.ajax({
			url: '/chat/searchMember.do',
			async : false,
			dataType : 'json',
			contentType : 'application/json; charset=utf-8',
			data : {"mem_id" : mem_id}, 
			type : 'get',
			success : function(result){
				
				console.log(result);
				
				var container = $('.chatMember').last();

				
				if(result.error !== null && result.error !== undefined){
					container.append("error alert!");
				}else{
					
					var memTable = "";
					
					memTable += "<table class='memTable'>";
					memTable += "<tr><td class = 'sub'>회원 성명</td><td class='con'>"+result.username+"</td></tr>"	;
					memTable += "<tr><td class = 'sub'>가입일</td><td class='con'>"+result.regdate+"</td></tr>"	;
					memTable += "<tr><td class = 'sub'>이메일</td><td class='con'>"+result.useremail+"</td></tr>"	;
					memTable += "<tr><td class = 'sub'>경고 횟수</td><td class='con'>"+result.badcnt+"</td></tr>"	;
					memTable += "<tr><td class = 'sub'>도서 취향</td><td class='con'>"+result.usertaste1+"</td></tr>"	;
					memTable += "<tr><td></td><td class='con'>"+result.usertaste2+"</td></tr>"	;
					memTable += "<tr><td></td><td class='con'>"+result.usertaste3+"</td></tr>"	;
					for(i in result.rentList){
						if(i == 0){
							memTable += "<tr><td class = 'sub'>대출 목록</td><td class='con'>" + result.rentList[i].BOOKNAME+"</td></tr>";
						}else{
							memTable += "<tr><td></td><td class='con'>" + result.rentList[i].BOOKNAME+"</td></tr>";
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
					
					
					
					var labletrs = $('.memTable .sub');
					labletrs.css('display','inline');
					labletrs.css('padding','0px 5px 0px 5px');
					labletrs.css('white-space','nowrap');
					labletrs.css('font-weight','bold');
					labletrs.css('font-size','11px');
					labletrs.css('background-color','#E44D3A');
					labletrs.css('border-radius','8px');
					labletrs.css('color','white');

					labletrs.css('text-align','center');
					
					
					var contds = $('.memTable .con');
					contds.css("width", '220px');
					contds.css('height','auto');
					contds.css('text-align','left');
					contds.css('padding-left','25px');
			
				}
			
			},
			error : function(result, status, error){
				var container = $('.chatMember').last();
				container.append("error alert!");
			}
		})
		
		
		
		
		
		
	 
}
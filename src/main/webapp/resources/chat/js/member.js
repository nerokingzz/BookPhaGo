
function checkMember(userId){
	console.log("i amm in checkMember");
	var mem_id = decodeURI(userId);
	
	console.log("id : " + mem_id);
	
	console.log("in checkMember");
	var container = $('.member').last();

	container.css("width","auto");
	container.css("height","auto");
	container.css("padding","15px");

	
	$.ajax({
			url: '/chat/searchMember.do',
			async:false,
			dataType : 'json',
			contentType : 'application/json; charset=utf-8',
			data : {"mem_id" : mem_id}, 
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
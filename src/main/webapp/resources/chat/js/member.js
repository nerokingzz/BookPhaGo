
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
					container.append("<span style = 'background-color:orange'>회원 성명</span>&nbsp;&nbsp;" + result.username + "<br>");
					container.append("<span style = 'background-color:orange'>경고 횟수</span>&nbsp;&nbsp;" + result.badcnt + "<br>");
					container.append("<span style = 'background-color:orange'>회원 취향 1</span>&nbsp;&nbsp;" + result.usertaste1 + "<br>");
					container.append("<span style = 'background-color:orange'>회원 취향 2</span>&nbsp;&nbsp;" + result.usertaste2 + "<br>");
					container.append("<span style = 'background-color:orange'>회원 취향 3</span>&nbsp;&nbsp;" + result.usertaste3 + "<br>");
				}
			
			},
			error : function(result, status, error){
				container.append("error alert!");
			}
		})
	 
}
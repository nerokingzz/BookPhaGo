$('.helpforum a').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url : '/chat/down.do',
			type : 'get',
			success : function(result) {
				alert("다운로드가 완료되었습니다!");
			},
			beforeSend:function(){
				$('.wrap-loading').removeClass('display-none');
			},
			complete:function(){
				$('.wrap-loading').addClass('display-none');
			},
			//에러 처리 필요함.
			error : function(result, status) {
				alert("에러가 발생하였습니다.");
			}
		})

	})

	$(document).ready(function(){

		//누적 이용자수, 누적 로그 수, 누적 실패대화 수를 구해오는 ajax
		$.ajax({
			url: 'log/totalID.do',
			async: true,
			type : 'post',
			success : function(result){
				var container1 = $('h1#totalID');
				container1.append(result[0]);
				
				
				var totalLog = $('h1#totalLog');
				totalLog.append(result[1]);
				
				var failCount = $('h1#failCount');
				failCount.append(result[2]);
				
			},
			beforeSend:function(){
				var container = $('h1#totalID');
				container.append("<img style='margin:auto;' src='/resources/chat/small_loader.gif' />");
				
				var totalLog = $('h1#totalLog');
				totalLog.append("<img style='margin:auto;' src='/resources/chat/small_loader.gif' />");
				
				var failCount = $('h1#failCount');
				failCount.append("<img style='margin:auto;' src='/resources/chat/small_loader.gif' />");
			},
			complete:function(){
				$('h1#totalID img').css("display","none");

				$('h1#totalLog img').css("display","none");
				
				$('h1#failCount img').css("display","none");
			},
			//에러 처리 필요함.
			error : function(result, status){
				console.log("totalID ajax에서 에러가 발생하였습니다.");
			}
		})

	
	

	//금일 이용자수와 총 log 수를 구해오는 ajax
	$(document).ready(function(){
		
		$.ajax({
			url: 'log/todayID.do',
			async: true,
			type : 'post',
			success : function(result){
				console.log("todayID result is..." + result);
				var todayID = $('h1#todayID');
				

				todayID.append(result);

			},
			beforeSend:function(){
				var todayID = $('h1#todayID');
				todayID.append("<img style='margin:auto;' src='/resources/chat/small_loader.gif' />");
			},
			complete:function(){
				$('h1#todayID img').css("display","none");	
			},
			//에러 처리 필요함.
			error : function(result, status){
				console.log("todayID ajax에서 에러가 발생하였습니다.");
			}
		})
	
		
		
		
		
		//trends 패널에 등록될 intent와 entity 순위를 가져오는 ajax
		$.ajax({
			url: 'log/ranks.do',
			async: true,
			type : 'post',
			success : function(result){
				//console.log(result[1]);
				var container = $('#resultDiv');
				var intentRank = 1;
				container.append("<div class = 'trends_panel'></div>");
				var panel = $('.trends_panel').last();
				panel.append("<h5>Top 대화유형</h5><br><hr><br>");
				for(key in result[0]){
					if(intentRank > 5){
						break;
					}
					var str = "";
					str += "<div class ='trends_row'>";
					str += "<span class='rowRank'>"+intentRank+"</span>";
					str += "<div class ='trends_label'>" + key + "</div>";
					str += "<div class='trends_value'>" + result[0][key] + "</div></div>";
					panel.append(str);
					intentRank++;
				}
				
				
				container.append("<br>");
				container.append("<div class = 'trends_panel'></div>");
				var panel = $('.trends_panel').last();
				panel.append("<h5>Top 대화 키워드</h5><br><hr><br>");
				var entityRank = 1;
				for(key in result[1]){
					if(entityRank > 5){
						break;
					}
					var str = "";
					str += "<div class ='trends_row'>";
					str += "<span class='rowRank'>"+entityRank+"</span>";
					str += "<div class ='trends_label'>" + key + "</div>";
					str += "<div class='trends_value'>" + result[1][key] + "</div></div>";
					panel.append(str);
					entityRank++;
				}
				
			},
			beforeSend:function(){
				var container = $('#resultDiv');
				container.css("min-height","358px");
				container.append("<img style='margin:auto' src='/resources/chat/loader.gif' />");
			},
			complete:function(){
				var container = $('#resultDiv');
				container.css("min-height","");
				$('#resultDiv img').remove();
			},
			//에러 처리 필요함.
			error : function(result, status){
				console.log("error occured!");
			}
		})
		
	})
})
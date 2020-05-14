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

   
	function logLoad(){
		
		//누적 이용자수, 누적 로그 수, 누적 실패대화 수를 구해오는 ajax
		$.ajax({
			url: 'log/totalID.do',
			async: true,
			type : 'post',
			success : function(result){
				//static start
				var container1 = $('h1#totalID');
				container1.append(result.totalID);
				
				
				var totalLog = $('h1#totalLog');
				totalLog.append(result.logCount);
				
				var failCount = $('h1#failCount');
				failCount.append(result.failCount);
				//static end
				
				
				
				//line chart start
				 google.load("visualization", "1", {packages:["corechart"]});
				 google.setOnLoadCallback(drawChart1);
				 
				 function drawChart1() {
       	          
       	          var dataRows = [['Date', '대화 수']];
       	          
       	       for(key in result.linechart){
 	        	  dataRows.push([key, result.linechart[key]]);
           		}

 	          var line_data = google.visualization.arrayToDataTable(dataRows);

 	          var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

       	          
       	          chart.draw(line_data,{
       	              legend: { position: 'none' },
       	              chartArea:{
       	            	  left:50,
       	            	  top:50,
       	            	  bottom : 50,
       	            	  right : 50,
       	            	  width:"100%",
       	            	  height:"100%"
       	            		  },
       	            	colors: ['#e44d3a']
       	          });
       	   }
       	 
       	 
       	 $(window).resize(function(){
       		  drawChart1();
       		});
				 

				//line chart end
				
				
				
				//rank start
				var container = $('#resultDiv');
				var intentRank = 1;
				container.append("<div class = 'trends_panel'></div>");
				var panel = $('.trends_panel').last();
				panel.append("<h5>Top 대화유형</h5><br><hr><br>");
				for(key in result.ranks[0]){
					if(intentRank > 5){
						break;
					}
					var str = "";
					str += "<div class ='trends_row'>";
					str += "<span class='rowRank'>"+intentRank+"</span>";
					str += "<div class ='trends_label'>" + key + "</div>";
					str += "<div class='trends_value'>" + result.ranks[0][key] + "</div></div>";
					panel.append(str);
					intentRank++;
				}
				
				
				container.append("<br>");
				container.append("<div class = 'trends_panel'></div>");
				var panel = $('.trends_panel').last();
				panel.append("<h5>Top 대화 키워드</h5><br><hr><br>");
				var entityRank = 1;
				for(key in result.ranks[1]){
					if(entityRank > 5){
						break;
					}
					var str = "";
					str += "<div class ='trends_row'>";
					str += "<span class='rowRank'>"+entityRank+"</span>";
					str += "<div class ='trends_label'>" + key + "</div>";
					str += "<div class='trends_value'>" + result.ranks[1][key] + "</div></div>";
					panel.append(str);
					entityRank++;
				} //rank end
				
			},
			beforeSend:function(){
				var container = $('h1#totalID');
				container.append("<img style='margin:auto;' src='/resources/chat/small_loader.gif' />");
				
				var totalLog = $('h1#totalLog');
				totalLog.append("<img style='margin:auto;' src='/resources/chat/small_loader.gif' />");
				
				var failCount = $('h1#failCount');
				failCount.append("<img style='margin:auto;' src='/resources/chat/small_loader.gif' />");
				
				var container = $('#resultDiv');
				container.append("<img style='margin:auto;' src='/resources/chat/loader.gif' />");
			},
			complete:function(){
				$('h1#totalID img').css("display","none");
				$('h1#totalLog img').css("display","none");
				$('h1#failCount img').css("display","none");
				$('#resultDiv img').css("display","none");
			},
			//에러 처리 필요함.
			error : function(result, status){
				alert("API로 너무 많은 요청을 전송하였습니다. 10분 후 다시 요청해주세요.");
			}
		})


   

   //금일 이용자수와 수를 구해오는 ajax
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
	
	
	}


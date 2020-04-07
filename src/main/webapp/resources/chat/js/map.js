	function addMap(){
				
				var container = document.getElementsByClassName("map")[document.getElementsByClassName("map").length - 1] //지도를 담을 영역의 DOM 레퍼런스
				var new_options = { //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(37.57046524075292,126.98530714900265), //지도의 중심좌표.
					level: 4 //지도의 레벨(확대, 축소 정도)
					};
				var map = new kakao.maps.Map(container, new_options);

				
				
/*				// 비트캠프 종로
				var c_position =  new kakao.maps.LatLng(37.570469745377274, 126.98530431821564);
				var c_marker = new kakao.maps.Marker({
				  position: c_position
				});
				c_marker.setMap(map);
				var c_iwContent = '<div style="width:auto;">비트캠프 종로 '
					+ '<a href = "https://place.map.kakao.com/998200294" target="_blank">상세정보</div>';
				var c_infowindow = new kakao.maps.InfoWindow({
				    content : c_iwContent
				});
				
				
				
				//카츠야
				var ka_position =  new kakao.maps.LatLng(37.56896966147309,126.98590737000391);
				var ka_marker = new kakao.maps.Marker({
				  position: ka_position
				});
				ka_marker.setMap(map);
				var ka_iwContent = '<div style="width:auto;">카츠야 '
						+ '<a href = "https://place.map.kakao.com/24183826" target="_blank">상세정보</div>';
				var ka_infowindow = new kakao.maps.InfoWindow({
				    content : ka_iwContent
				});
				
				
				
				
				
				//삼숙이라면
				var sam_position =  new kakao.maps.LatLng(37.57158702228211, 126.98565218184731);
				var sam_marker = new kakao.maps.Marker({
				  position: sam_position
				});
				sam_marker.setMap(map);
				var sam_iwContent = '<div style="width:auto;">삼숙이라면 '
						+ '<a href = "https://place.map.kakao.com/13302525" target="_blank">상세정보</div>';
				var sam_infowindow = new kakao.maps.InfoWindow({
				    content : sam_iwContent
				});
				
				
				
				
				
				//종로고기집 
				var jong_position =  new kakao.maps.LatLng(37.56948778510887, 126.98634307158973);
				var jong_marker = new kakao.maps.Marker({
				  position: jong_position
				});
				jong_marker.setMap(map);
				var jong_iwContent = '<div style="width:auto;">종로고기집 '
						+ '<a href = "https://place.map.kakao.com/26794800" target="_blank">상세정보</div>';
				var jong_infowindow = new kakao.maps.InfoWindow({
				    content : jong_iwContent
				});
				
				
				
				//백부장집 닭한마리 
				var baek_position =  new kakao.maps.LatLng(37.571811872947116, 126.98268351812425);
				var baek_marker = new kakao.maps.Marker({
				  position: baek_position
				});
				baek_marker.setMap(map);
				var baek_iwContent = '<div style="width:auto;">백부장집 닭한마리 '
						+ '<a href = "https://place.map.kakao.com/8381402" target="_blank">상세정보</div>';
				var baek_infowindow = new kakao.maps.InfoWindow({
				    content : baek_iwContent
				});
				*/
				
				
				var positions = [
				    {
				        title: '비트캠프 종로', 
				        latlng: new kakao.maps.LatLng(37.57046524075292,126.98530714900265)
				    },
				    {
				        title: '카츠야', 
				        latlng: new kakao.maps.LatLng(37.56896966147309,126.98590737000391)
				    },
				    {
				        title: '삼숙이라면', 
				        latlng: new kakao.maps.LatLng(37.57158702228211, 126.98565218184731)
				    },
				    {
				        title: '종로고기집 ',
				        latlng: new kakao.maps.LatLng(37.56948778510887, 126.98634307158973)
				    },
				    {
				        title: '백부장집 닭한마리 ',
				        latlng: new kakao.maps.LatLng(37.571811872947116, 126.98268351812425)
				    }
				];

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				    
				for (var i = 0; i < positions.length; i++) {
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    

				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				    
				    marker.addListener('click', function() {
				    	console.log(marker);
			    	    infowindow.open(map, marker);
			    	});
				    
				    marker.setMap(map);
				    
				    
				    var iwContent = '';
				    iwContent = '<div style="width:130px">'+ positions[i].title + '</div>';
				    
				    var infowindow = null;
				    	
				    infowindow = new kakao.maps.InfoWindow({
				    	position : positions[i].latlng,
					    content : iwContent
					});
				    
				    infowindow.open(map, marker); 
				    
				}
				

/*				kakao.maps.event.addListener(c_marker , 'click', function() {
					c_infowindow.open(map, c_marker);
				});
				kakao.maps.event.addListener(ka_marker , 'click', function() {
					ka_infowindow.open(map, ka_marker);
					});
				kakao.maps.event.addListener(sam_marker , 'click', function() {
					sam_infowindow.open(map, sam_marker);
				});
				kakao.maps.event.addListener(jong_marker , 'click', function() {
					jong_infowindow.open(map, jong_marker);
				});
				kakao.maps.event.addListener(baek_marker , 'click', function() {
					baek_infowindow.open(map, baek_marker);
				});*/
			
				
			}
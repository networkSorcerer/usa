<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
 <style>
            /* 추가된 스타일 */
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .table-striped tbody tr:nth-child(odd) {
                background-color: #f5f5f5;
            }
        </style>
<body>
	<div class="container">
		<div class="text-center"><h4 class="mb-2">찾아오시는 길</h4></div>	
		<div id="mapList">
			<table  class="table table-striped">
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty mapList }">		
								<tr class = "text-center centerName">	
							<c:forEach var="center" items="${mapList }" varStatus="status">									
									<td class="centerName">${center.centerName}</td>					
							</c:forEach>	
								<tr>						
								<tr class = "text-center centerAddress" >									
							<c:forEach var="center" items="${mapList }" varStatus="status">		
									<td class="centerAddress">${center.centerAddress}</td>					
							</c:forEach>	
								<tr>
								<tr class = "text-center centerOperating" >									
							<c:forEach var="center" items="${mapList }" varStatus="status">		
									<td classs="centerOperating">${center.centerOperating}</td>					
							</c:forEach>	
								<tr>
								<tr class = "text-center centerTell">									
							<c:forEach var="center" items="${mapList }" varStatus="status">		
									<td class="centerTell">${center.centerTell}</td>					
							</c:forEach>	
								<tr>					
								<tr>							
									<td  class="link-primary ">
										<button  class="btn btn-primary" onclick="resetCenter()">서초 동물 사랑</button>
									</td>
									<td  class="link-primary ">
										<button  class="btn btn-primary" onclick="setCenter()">아이조아</button> 
									</td>
									<td  class="link-primary ">
										<button  class="btn btn-primary" onclick="panTo()">도그마루</button> 
									</td>				
								</tr>								
						</c:when>
						<c:otherwise>
						
							<td colspan="5" class ="text-center">등록된 게시물이 존재하지 않습니다</td>
						</tr>
						</c:otherwise>
					</c:choose>	
				</tbody>
			</table>
		</div>
		<div class="container my-5">
			<div class = "p-5 text-center bg-body-tertiary rounded-3">
				<div id="map" style="width: 1000px; height: 400px;"></div>
			</div>
		</div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e606ce0c708054c07480dbc81c66db4b"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.4763321,127.0381241), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		
		
		function setCenter() {            
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(37.5334362, 126.9902071);
		    
		    // 지도 중심을 이동 시킵니다
		    map.setCenter(moveLatLon);
		}

		function panTo() {
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(37.5077209, 127.0884273);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);            
		}        
		
		function resetCenter() {
	        var initialLatLon = new kakao.maps.LatLng(37.4763321, 127.0381241);
	        map.panTo(initialLatLon);
	    }
		
		var positions = [
		    {
		        content: '<div>도그마루</div>', 
		        latlng: new kakao.maps.LatLng(37.5077209, 127.0884273)
		    },
		    {
		        content: '<div>아이조아</div>', 
		        latlng: new kakao.maps.LatLng(37.5334362, 126.9902071)
		    },
		    {
		        content: '<div>서초동물사랑</div>', 
		        latlng: new kakao.maps.LatLng(37.4763321, 127.0381241)
		    }
		   
		];

		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}

		/* 아래와 같이도 할 수 있습니다 */
		/*
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    (function(marker, infowindow) {
		        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		        kakao.maps.event.addListener(marker, 'mouseover', function() {
		            infowindow.open(map, marker);
		        });

		        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		        kakao.maps.event.addListener(marker, 'mouseout', function() {
		            infowindow.close();
		        });
		    })(marker, infowindow);
		}
		*/
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
</body>
</html>
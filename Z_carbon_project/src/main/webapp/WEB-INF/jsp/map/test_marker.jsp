<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/ol@v8.1.0/dist/ol.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ol@v8.1.0/ol.css">
<script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="https://cdn.jsdelivr.net/npm/hls.js@1"></script>

<style>
.map {
	height: 800px;
	width: 100%;
}
#loading {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	opacity: 0.5;
	background: #ffffff;
	text-align: center; 
	z-index: 2;
}
#loading>img {
	position: absolute;
	top: 35%;
	left: 45%;
}
#marker {
  width: 20px;
  height: 20px;
  border: 1px solid #088;
  border-radius: 10px;
  background-color: #0FF;
  opacity: 0.5;
}
#vienna {
  text-decoration: none;
  color: white;
  font-size: 11pt;
  font-weight: bold;
  text-shadow: black 0.1em 0.1em 0.2em;
}
.popover-body {
  min-width: 276px;
}
</style>
</head>
<body>
	    
	<div class="test" id = loading>
		<img src="/images/loading.gif" />
	</div>
<!-- <video id = "video-player" autoplay muted controls width="300" height="200" src="http://cctvsec.ktict.co.kr/2/+MAKvmhuhLCng+SmwOzwVRr9ADys3kFBmCW4OGY0XH42/fg2Xx+LaT31c9P6p8B6zeDT2IiT0gnAOHLJlPChPw=="></video> -->
<div id="info"></div>
	<button class="load_btn" onclick = "cctvapidata(this)"  data-load = '수도권제1순환선'>수도권제1순환선</button>
	<button class="load_btn" onclick = "cctvapidata(this)"  data-load = '중부선'>중부선</button>
	<button class="load_btn" onclick = "cctvapidata(this)"  data-load = '제2중부선'>제2중부선</button>
	<h2>국가교통정보센터 wmts Tile Sample</h2>
	<!-- <img src="/images/marker_icon.png" alt="총 배출량"> -->
	<div id="map" class="map"></div>
	
	<div style="display: none;">
      <div id="marker" title="Marker"></div>
      <div id="popup"></div>
    </div>
	<script>
		$(function() {
			//basemap()
			cctvapidata()
		})

		function cctvapidata(da){
			$(".test").css("display", "block"); // 메뉴 클릭시 로딩 화면 띄우기
			$("#map").empty();
		
			if(da == null || da == undefined){
				$("#map").empty();
				basemap()
			}else{
				$.post('/map/cctvapidata.do', {}, function(json) {
				console.log("da"+da.dataset.load);
				console.log("data" + json.data.response.data[0])
				$("#map").empty();
				var markerLayer; //마커 Layer
				var vectorLayer = new ol.layer.Vector({
					source : new ol.source.Vector()
				});
				
				var str = json.data.response.data[0].cctvname;
				/* 특정 문자  */
				var rs = str.split("]");
				console.log("str : " + rs[1]);
				
				/* 특정 문자 사이값 추출 */
				var start = str.indexOf("[") + 1;
				var end = str.indexOf("]")
				var result = str.substring(start,end);
				console.log(result);
				
			      var source =new ol.source.XYZ({
			          url: 'https://its.go.kr:9443/geoserver/gwc/service/wmts/rest/ntic:N_LEVEL_{z}/ntic:REALTIME/EPSG:3857/EPSG:3857:{z}/{y}/{x}?format=image/png8'
			        });
				
				// 마커 레이어에 들어갈 소스 생성
				var markerSource = new ol.source.Vector();
				
				for(var i = 0; i<json.data.response.data.length; i++){
					
					var str = json.data.response.data[i].cctvname;
					
					var start = str.indexOf("[") + 1;
					var end = str.indexOf("]")
					var result = str.substring(start,end);

					if(result == da.dataset.load){
					   var point_feature = new ol.Feature({
					        geometry: new ol.geom.Point([json.data.response.data[i].coordx, json.data.response.data[i].coordy]),
					        cctvname : json.data.response.data[i].cctvname,
					        cctvurl : json.data.response.data[i].cctvurl
					    });
					    
					    //markerSource에 등록한 point를 담는다. addFeature를 이용해서, 여러개의 point를 source에 담는다.
					    markerSource.addFeature(point_feature);

					    //style을 활용해서, point의 style을 변경한다.
					    var markerStyle = new ol.style.Style({
						    image: new ol.style.Icon({ //마커 이미지
						        opacity: 1, //투명도 1=100% 
						        scale: 0.1, //크기 1=100%
						        //marker 이미지, 해당 point를 marker로 변경한다.
						        src: '/images/marker_icon.png'
						    }),
					        //html의 css, z-index 기능이다.
						    zindex: 10
						});

					    // 마커 레이어 생성
						markerLayer = new ol.layer.Vector({
						    source: markerSource, //마커 feacture들
						    style: markerStyle //마커 스타일
						});
					}
				}
				
				var map = new ol.Map({
					controls : ol.control.defaults.defaults({
						attribution : false,
						zoom : false
					}),
				    view: new ol.View({
				    	maxZoom : 20,
				    	minZoom : 11,
				        zoom: 13,
				        projection : 'EPSG:4326',
				        center : point_feature.values_.geometry.flatCoordinates // 선택한 도로 좌표값
				    }),
				    target: 'map',
				    layers: [
				        new ol.layer.Tile({
				        	 source: new ol.source.OSM()
				        }),
				        vectorLayer
				    ],
				});
				
				 //overviewmap 생성하기
			      var overViewMapCtrl = new ol.control.OverviewMap({
			            layers: [
			              new ol.layer.Tile({
			                source: source,
			              })],
			            collapsed: false,
			      });
			      map.addControl(overViewMapCtrl);
		
				var tile = new ol.layer.Tile({
					source : new ol.source.XYZ({
						url : 'https://its.go.kr:9443/geoserver/gwc/service/wmts/rest/ntic:N_LEVEL_{z}/ntic:REALTIME/EPSG:3857/EPSG:3857:{z}/{y}/{x}?format=image/png8'
					})
				});
				map.addLayer(tile);
				
				// 지도에 마커가 그려진 레이어 추가
				map.addLayer(markerLayer);
				
				var marker = new ol.Overlay({
					  position: [16.3725, 48.208889],
					  positioning: 'center-center',
					  element: document.getElementById('marker'),
					  stopEvent: false
					});
					map.addOverlay(marker);

				var popup = new ol.Overlay({
					  element: document.getElementById('popup')
					});
					map.addOverlay(popup);	
					
				map.on('click', function(evt) {
					var element = popup.getElement();
					console.log("element"+ element)
					var coordinate = evt.coordinate;
					var feature = map.forEachFeatureAtPixel(evt.pixel, function(feature) {
									let values = feature.getProperties();
									console.log(values);
									return feature;
								});
					//feature 값 불러오기
					if (feature != null) {
						  popup.setPosition(coordinate);
						  var popover = bootstrap.Popover.getInstance(element);
						  console.log("popover"+popover)
						  
						  if (popover) {
						    popover.dispose();
						  }
						  popover = new bootstrap.Popover(element, {
						    animation: false,
						    sanitize: false,
						    html:true,
						    container: element,
						    content: '<p><video id="video-player" autoplay muted controls width="270" height="235" src =""></video></p>',
						    html: true,
						    placement: 'top',
						    title: 'Welcome to OpenLayers',
						  });
						  popover.show();
						
					    /* 비디오 재생 부분 */
						var video = document.getElementById('video-player');
						var videoSrc = feature.values_.cctvurl;
						if (video.canPlayType('application/vnd.apple.mpegurl')) {
							video.src = videoSrc;
						} else if (Hls.isSupported()) {
							var hls = new Hls();
							hls.loadSource(videoSrc);
							hls.attachMedia(video);
						}
					    /* 비디오 재생 부분 */
					}
				});
				}, "json").done(function(json) { // 로딩 스피너 표새ㅣ
					$(".test").css("display", "block");
				}).always(function(json) {
					$(".test").css("display", "none");
				});
			}
			
		}
	
		function basemap(){
			var map = new ol.Map({
			    view: new ol.View({
			    	maxZoom : 20,
			    	minZoom : 10,
			        zoom: 13,
			        projection : 'EPSG:4326',
			        //extent : [126.59610764576948, 35.01960485206217, 127.05410019948044, 35.2916004176963], // 지도의 뷰잉 범위 지정된 범위밖을 못 벋어나게 함
			        center : [ 127.10438118796932,37.461704266196776 ]
			    }),
			    target: 'map',
			    layers: [
			        new ol.layer.Tile({
			        	 source: new ol.source.OSM()
			        })
			    ]
			});
	
			var tile = new ol.layer.Tile({
				source : new ol.source.XYZ({
					url : 'https://its.go.kr:9443/geoserver/gwc/service/wmts/rest/ntic:N_LEVEL_{z}/ntic:REALTIME/EPSG:3857/EPSG:3857:{z}/{y}/{x}?format=image/png8'
				})
			});
			map.addLayer(tile);
			$(".test").css("display", "none");

		}
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
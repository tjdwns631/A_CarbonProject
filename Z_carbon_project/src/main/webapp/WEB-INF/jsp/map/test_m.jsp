<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지오서버 wms 가지고 오기</title>
<script src="https://cdn.jsdelivr.net/npm/ol@v8.1.0/dist/ol.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ol@v8.1.0/ol.css">
<script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
</head>
<body>
<script>
var mouse_mode = {
		mm_move_grab	: 0,	// 손 이동
		mm_ppt_text		: 1,	// TEXT 입력
		mm_ppt_poi		: 2,	// POI 입력
		mm_ppt_line		: 3,	// 라인 입력
		mm_ppt_polygon	: 4,	// 영역 입력
		mm_measure_dist	: 5,	// 거리 측정
		mm_measure_area	: 6,	// 영역 측정
		mm_select		: 7,	// 객체 선택
		mm_show_info	: 8,	// 정보보기
		mm_set_cont_pos	: 9,	// 콘텐츠 등록 위치 지정
		mm_srch_circle	: 11,	// 검색용 원 그리기
		mm_srch_box		: 12,	// 검색용 박스 그리기
		mm_srch_polygon	: 13,	// 검색용 다각형 그리기
		mm_measure_hei	: 21,	// 높이 측정
		mm_fac_info		: 28,	// 시설물 정보보기
		mm_pnu_info		: 29,	// 토지 정보보기
		mm_bld_info		: 30,	// 건축물 정보보기
		mm_anal_slice	: 41,	// 단면분석용 라인
		mm_anal_slope	: 42,	// 경사도분석용 영역
		mm_select_draw	: 71,	// 객체 선택
		mm_select_index	: 72	// 객체 선택
	}
	var mouse_work = mouse_mode.mm_move_grab;
	var mouse_work_mode = null; 
</script>
  <div style="width:800px; height: 800px; display: flex;">
      <div style="flex:1;">
        <div id="map" class="map" style="width: 100%; height: 50%;"></div>
        <div>
          <div>Vector Layer Data : </div>
          <div id="info"></div>
        </div>
      </div>
    </div>
    <button id="map_tool_anal_dist" name="map_tools" onclick="javascript: toolArea();">
          <img src="${pageContext.request.contextPath}/images/cf_icon_total.png" alt="거리 측정" title="너비 측정">
    </button>
    <button id="map_tool_anal_dist" name="map_tools" onclick="javascript: toolDist();">
          <img src="${pageContext.request.contextPath}/images/cf_icon_total.png" alt="너비 측정" title="너비 측정">
    </button>
     <button id="map_tool_anal_dist" name="map_tools" onclick="javascript: mapclear();">
          <img src="${pageContext.request.contextPath}/images/cf_icon_total.png" alt="너비 측정" title="너비 측정">
    </button>
    <script>
    
    function toolDist(){
    	//clearUIMapTools();
    	if (mouse_work == mouse_mode.mm_measure_dist){
    		mouse_work = mouse_mode.mm_move_grab;
    		drawClear();
    	}else{
    		mouse_work = mouse_mode.mm_measure_dist;
    		setDraw('Polygon');	
    	}
    }
    function toolArea(){
    	//clearUIMapTools();
    	if (mouse_work == mouse_mode.mm_measure_area){
    		mouse_work = mouse_mode.mm_move_grab;
    		drawClear();
    	}else{
    		mouse_work = mouse_mode.mm_measure_area;
    		setDraw('LineString');	

    	}
    }
    
    function setDraw(type){
    	if (type == 'Polygon'){
    		addInteraction('Polygon');
    	}else if(type == 'LineString'){
    		addInteraction('LineString');
    	}
    }
    
    var sketch;
    var measureTooltipElement;
    var measureTooltip;
    // 배경지도 레이어
    var viewLayer = new ol.layer.Tile({
        source: new ol.source.OSM()
    });
    // geoserver 설정
    var wmsSource = new ol.source.TileWMS({
        url: 'http://localhost:8080/geoserver/gis_test/wms',
        params: {
            'FORMAT': 'image/png',
            'VERSION': '1.1.1',
            tiled: true,
            "STYLES": '',
            "LAYERS": 'gis_test:data' // workspace:layer
        },
        serverType: 'geoserver',
        crossOrigin: 'anonymous',
    });
    // wms 레이어
    var tileImg = new ol.layer.Tile({
        visible: true,
        source: wmsSource
    });
    // 배경지도의 View 객체
    var view = new ol.View({
    	   center: [126.65384323572457,37.675900831136595],
    	    projection : 'EPSG:4326',
    	    zoom: 11
    });
  //빈객체생성
    var Source = new ol.source.Vector();
    var polyVector = new ol.layer.Vector({
        source: Source
    })
    var mapView = new ol.Map({
        target: "map", // 지도를 생성할 element 객체의 id 값,
        layers: [viewLayer, tileImg, polyVector], //생성한 레이어 추가,
        view: view //view 설정
    });
    
    var pointerMoveHandler = function(evt) {
        if (evt.dragging) {
            return;
        }

        if (sketch) {
            var geom = sketch.getGeometry();
        }
    };
    mapView.on('pointermove', pointerMoveHandler);
    var draw;

    function addInteraction(type) {
    	drawClear();
    	var draw_style = new ol.style.Style({
            fill: new ol.style.Fill({
            	color: 'rgba(255, 255, 255, 0.2)'
            }),
            stroke: new ol.style.Stroke({
            	color: 'rgba(0, 0, 0, 0.5)',
            	lineDash: [10, 10],
            	width: 2
            }),
            image: new ol.style.Circle({
            	radius: 5,
            	stroke: new ol.style.Stroke({
            		color: 'rgba(0, 0, 0, 0.7)'
            	}),
            	fill: new ol.style.Fill({
            		color: 'rgba(255, 255, 255, 0.2)'
            	})
            })	    	
    	});
    	if(type == 'Polygon'){
	        draw = new ol.interaction.Draw({
	            source: Source,
	            type: 'Polygon',
	            style: draw_style,
	        })
    	}else if(type == 'LineString'){
			draw = new ol.interaction.Draw({
			       source: Source,
			       type: 'LineString',
			       style: draw_style,
			 })
    	}
        mapView.addInteraction(draw);
        createMeasureTooltip();

        var listener;
        draw.on('drawstart', function(evt) {
            sketch = evt.feature;
            //var tooltipCoord = evt.coordinate;

            listener = sketch.getGeometry().on('change', function(evt) {
                var geom = evt.target;
                var output = formatArea(type,geom);
                if(type == 'Polygon'){
                	tooltipCoord = geom.getInteriorPoint().getCoordinates();	
                }else if(type == 'LineString'){
                	tooltipCoord = geom.getLastCoordinate();
                }
                
                measureTooltipElement.innerHTML = output;
                measureTooltip.setPosition(tooltipCoord);
            })

        })

        draw.on('drawend', function() {
            measureTooltipElement.className = 'ol-tooptip ol-tooltip-static';
            measureTooltip.setOffset([0, -7]);

            //unset sketch
            sketch = null;
            measureTooltipElement = null;
            createMeasureTooltip();
            new ol.Observable(listener)
        })
    }

    function createMeasureTooltip() {
        if (measureTooltipElement) {
            measureTooltipElement.parentNode.removeChild(measureTooltipElement);
        }
        measureTooltipElement = document.createElement('div');
        measureTooltipElement.className = 'ol-tooltip ol-tooltip-measure';
        measureTooltip = new ol.Overlay({
            element: measureTooltipElement,
            offset: [0, -15],
            positioning: 'bottom-center',
        });
        mapView.addOverlay(measureTooltip);
    }

    function formatArea(type , polygon) {
    	const opts = { projection: 'EPSG:4326' }; // 지도 설정
        var output;
    	if(type == 'Polygon'){
			var area = ol.sphere.getArea(polygon,opts);
    	    //var area = polygon.getArea;
	        if (area > 10000) {
	            output = (Math.round(area / 1000000 * 100) / 100) + ' ' + 'km<sup>2</sup>';
	        } else {
	            output = (Math.round(area * 100) / 100) + ' ' + 'm<sup>2</sup>';
	        }
    	}else if(type == 'LineString'){
        	var length = ol.sphere.getLength(polygon);
			if (length > 100) {
			       output = Math.round((length / 1000) * 100) / 100 + ' ' + 'km';
		    } else {
		       output = Math.round(length * 100) / 100 + ' ' + 'm';
		    }
    	}
        return output;
    };
    
    mapView.on('click', function(evt) {
    	
    	let coordinate = evt.coordinate;
  		var view = mapView.getView();
	    var viewResolution = view.getResolution();
	    var source = tileImg.getSource();
	    var url = source.getFeatureInfoUrl(
	        evt.coordinate, viewResolution, view.getProjection(), {
	            'INFO_FORMAT': 'application/json',
	            'FEATURE_COUNT': 100
	        });
	    if (url) {
	    	fetch(url).then(async function(response) {
	    		 var jsonStr = await response.json();
	    		 /* 키값이 한글 또는 숫자 일시 불러오기 */
	    		 console.log("key:"+Object.keys(jsonStr.features[0].properties));
	    		 console.log("value:"+Object.values(jsonStr.features[0].properties)[6]);
				 /* 클릭한 좌표 데이터 가져오기 */
				 document.getElementById('info').innerHTML = ''; // 속성정보를 표출할 div 초기화
				 console.log(coordinate);
				 document.getElementById('info').innerHTML = '<div>' + coordinate + jsonStr.features[0].properties.adm_nm
						+ '</div>';
				 /*/클릭한 좌표 데이터 가져오기/*/	    		
	             
	             console.log("jsonStr"+ JSON.stringify(jsonStr)); // json 데이터
	             var data = JSON.stringify(jsonStr);
	             //console.log("featuresasd12"+ data.features);
	             console.log("features"+ jsonStr.features[0].properties.adm_nm);
	             console.log("response"+ JSON.parse(JSON.stringify(jsonStr.features)))
	             var text = await response.text();
	             console.log(text)
	             var jsondata = JSON.parse(JSON.stringify(response));
	             //console.log("jsondata : "+ jsondata.features[0])
	         });
	    } 
	});
    
    function mapclear(){ //맵 클리어
    	Source.clear();
    	clearOverlays();
    	drawClear();
    }
    
    function clearOverlays(){ //오버레이 제거
    	var ols = mapView.getOverlays();
    	if (ols){
    		var len = ols.getLength();
    		if (len > 0){
    			for (var i = len-1; i >= 0; i--){
    				mapView.removeOverlay(ols.item(i));
    			}
    		}
    	}
    }
    function drawClear(){ // draw 초기화
    	if(draw){	
    		mapView.removeInteraction(draw);	
    		draw = null;
    	}
    }
    
    </script>
    
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>면 선 그리기</title>
<script src="https://cdn.jsdelivr.net/npm/ol@v8.1.0/dist/ol.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ol@v8.1.0/ol.css">
<script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
</head>
<body>
  <div style="width:800px; height: 800px; display: flex;">
      <div style="flex:1;">
        <div id="map" class="map" style="width: 100%; height: 50%;"></div>
        <div>
          <div>tttttVector Layer Data : </div>
          <div id="info"></div>
        </div>
      </div>
    </div>
    <button id="map_tool_anal_dist" name="map_tools" onclick="javascript: mapclear();">
          <img src="${pageContext.request.contextPath}/images/cf_icon_total.png" alt="너비 측정" title="너비 측정">
    </button>
     <button id="map_tool_anal_dist" name="map_tools" onclick="javascript: addInteraction();">
          <img src="${pageContext.request.contextPath}/images/logo_wh.png" alt="너비 측정" title="너비 측정">
    </button>
    <script>
    var sketch;
    var measureTooltipElement;
    var measureTooltip;

    //브이월드 타일레이어 url 설정s
    var source = new ol.source.XYZ({
        url: 'http://xdworld.vworld.kr:8080/2d/Base/201802/{z}/{x}/{y}.png'
    });

    //타일레이어 생성하기
    var viewLayer = new ol.layer.Tile({
        source: source
    });

    //위치는 우리나라 중앙쯤(?)
    var view = new ol.View({
        center: [14248656.389982047, 4331624.063626864],
        zoom: 7,
    });

    //빈객체생성
    var polySource = new ol.source.Vector();
    var polyVector = new ol.layer.Vector({
        source: polySource
    })

    var mapView = new ol.Map({
        target: "map", // 지도를 생성할 element 객체의 id 값,
        layers: [viewLayer, polyVector], //생성한 레이어 추가,
        view: view, //view 설정
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

    function addInteraction() {
        draw = new ol.interaction.Draw({
            source: polySource,
            type: 'Polygon',
            style: new ol.style.Style({
                fill: new ol.style.Fill({
                    color: 'rgba(255, 255, 255, 0.2)',
                }),
                stroke: new ol.style.Stroke({
                    color: 'rgba(0, 0, 0, 0.5)',
                    lineDash: [10, 10],
                    width: 2,
                }),
                image: new ol.style.Circle({
                    radius: 5
                }),
            }),
        })
        mapView.addInteraction(draw);
        createMeasureTooltip();

        var listener;
        draw.on('drawstart', function(evt) {
            sketch = evt.feature;
            //var tooltipCoord = evt.coordinate;

            listener = sketch.getGeometry().on('change', function(evt) {
                var geom = evt.target;
                var output = formatArea(geom);
                tooltipCoord = geom.getInteriorPoint().getCoordinates();

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

    function formatArea(polygon) {
        var area = ol.sphere.getArea(polygon);
        var output;
        if (area > 10000) {
            output = Math.round((area / 1000000) * 100) / 100 + ' ' + 'km<sup>2</sup>';
        } else {
            output = Math.round(area * 100) / 100 + ' ' + 'm<sup>2</sup>';
        }
        return output;
    };
    
    function mapclear(){ //맵 클리어
    	polySource.clear();
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
    		map.removeInteraction(draw);	
    		draw = null;
    	}
    }
    
    //addInteraction();
    </script>
    
</body>
</html>

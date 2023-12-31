<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>김포 탄소중립 대시보드</title>
</head>
<body>
	<!--연간 총 배출량-->
	<section class="graph_cont year_total_emission">
	<div class="graph_title">연간 총 배출량
		<span class="unit">(단위 : tCO₂eq)</span>
	</div>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="barChart"></canvas>
		</div>
	</section>
	<!--파이(파이 or 도넛) 그래프-->
	<section class="graph_cont stack_line_graph">
	<div class="graph_title" id="pie_charttitle"></div>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="dashboard_piechart"></canvas>
		</div>
	</section>
	<!--감축인벤토리 + 연도선택기능-->
	<section class="graph_cont reduction_inventory">
	<div class="graph_title">감축 인벤토리
		<span class="unit">(단위 : tCO₂eq)</span>
	</div>
		<div class="chart_box">
			<canvas id="d_bar_chart"></canvas>
		</div>
		<!-- 연도 선택 select option -->
		<div class="year_select">
			<button class="label" id="year_data" value="optValue">
				2018년
				<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
					<path fill="#0075ff" d="M201.4 342.6c12.5 12.5 32.8 12.5 45.3 0l160-160c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L224 274.7 86.6 137.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l160 160z"/>
				</svg>
			</button>
			<ul class="optionList">
				<c:forEach var ="year" items="${year_list}">
					<li class="optionItem" value = "${year.data_date}">${year.data_date}년</li>
				</c:forEach>
			</ul>
		</div>
	</section>
		<!--맨 위 그래프없이 숫자 나열 미니 박스 4개 디자인-->
	<section class="mini_cont">
		<div id="mc_year">2018년</div>
		<div class="mini_box">
			<div class="text">
				<p class="title main" id="total_title">총 배출량</p>
				<p class="num small main" id="total_num">1,996,276</p>
			</div>
			<div class="col_line"></div>
			<div class="text">
				<p class="title" id="di_title">직접 배출량</p>
				<p class="num small" id="di_num">1,575,198</p>
			</div>
			<div class="col_line"></div>
			<div class="text">
				<p class="title" id="indi_title">간접 배출량</p>
				<p class="num small" id="indi_num">1,575,198</p>
			</div>
			<div class="col_line"></div>
			<div class="text">
				<p class="title" id="lu_title">순 배출량</p>
				<p class="num small" id="lu_num">10,031,192</p>
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title main" id="low_total_title">감축 인벤토리</p>
				<p class="num small main" id="low_total_num">965,084</p>
			</div>
			<div class="col_line"></div>
			<div class="text">
				<p class="title" id="low_di_title">직접 배출량</p>
				<p class="num small" id="low_di_num">1,575,198</p>
			</div>
			<div class="col_line"></div>
			<div class="text">
				<p class="title" id="low_indi_title">간접 배출량</p>
				<p class="num small" id="low_indi_num">1,575,198</p>
			</div>
		</div>
	</section>
	<script>
		$(function() {
			SelectBoxClick() // 셀텍트 박스 클릭 이벤
			
			DashboardYearData(); //연간 배출량 데이터
			DashboardSelectData(); //연별 선택 감축 데이터 및 배출량 데이터
			Dashboard_piechart() //파이차트 데이터 (default 2018년 데이터)
			
			
		})

		function DashboardSelectData(year) { // 선택연도 데이터
			$.post('/dashboardSelectList.do', {"year" : year},
					function(json) {
						console.log("DashboardSelectList : "+ json)
						//감축 인벤토리 데이터
						$("#d_bar_chart").empty(); 
						dashboard_d_barchart('d_bar_chart',json);
						//배출량 데이터 
						$("#total_title").empty();
						$("#total_title").html("총 배출량"+ '<span class="tooltips color" data-text="총배출량 : 온실가스 인벤토리에서 에너지, 산업공정, 농업, 폐기물 등 지역 경계 내 배출되는 온실가스의 총합"></span>');
						$("#total_num").empty();
						$("#total_num").html(comma(json.total_val));
						$("#lu_title").empty();
						$("#lu_title").html("순 배출량" + '<span class="tooltips" data-text="순배출량 : 총배출량에서 ‘토지이용, 토지이용 변화 및 임업(LULUCF :Land Use, Land-use Change and Forestry) 분야를 포함한 배출량으로 대기 중에 배출되는 온실가스 양에서 온실가스 흡수 양을 상쇄한 배출량을 의미하며, 탄소중립이란 순배출량이 0이 되는 상태를 말함"></span>');
						$("#lu_num").empty();
						$("#lu_num").html(comma(json.total_lu_val));
						$("#di_title").empty();
						$("#di_title").html("직접 배출량" + '<span class="tooltips" data-text="직접배출(Scope1) : 온실가스가 직접적으로 배출·흡수되는 배출원"></span>');
						$("#di_num").empty();
						$("#di_num").html(comma(json.di_val));
						$("#indi_title").empty();
						$("#indi_title").html("간접 배출량" + '<span class="tooltips" data-text="간접배출(Scope2) : 간접적으로 온실가스를 발생시키는 배출원으로 사용단계에서는 온실가스가 배출되지는 않으나 생산단계에서 온실가스를 배출"></span>');
						$("#indi_num").empty();
						$("#indi_num").html(comma(json.indi_val));
						
						$("#mc_year").empty();
						$("#mc_year").html(json.year+"년");
						$("#low_total_title").empty();
						$("#low_total_title").html("감축 인벤토리" + '<span class="tooltips color" data-text="감축 인벤토리 : 온실가스 인벤토리 활용성을 극대화하기 위해 지자체 관리권한에 중점을 둔 인벤토리로 비산업부문 인벤토리를 의미하며, 지자체 감축목표 달성을 위한 온실가스 배출량 기준으로 활용"></span>');
						$("#low_total_num").empty();
						$("#low_total_num").html(comma(json.total_low_val));
						$("#low_di_title").empty();
						$("#low_di_title").html("직접 배출량(감축)");
						$("#low_di_num").empty();
						$("#low_di_num").html(comma(json.di_low_val));
						$("#low_indi_title").empty();
						$("#low_indi_title").html("간접 배출량(감축)");
						$("#low_indi_num").empty();
						$("#low_indi_num").html(comma(json.indi_low_val));
						
					}, "json");
		}
		
		function DashboardYearData() { // 연간 배출량 그래프
			$.post('/DashboardDataList.do', {},
					function(json) {
						console.log(json)
						$("#barChart").empty(); 
						dashboard_barchart('barChart', json);
					}, "json");
		}
		function Dashboard_piechart(year) { //연간 총배출량 차트 클릭시 파이차트 
			$.post('/desposeData.do', {"year": year},
					function(json) {
						console.log("Dashboard_piechart : "+json)
						$("#dashboard_piechart").empty(); // 연간 총 배출량 그래프
						dashboard_pie_chart('dashboard_piechart', json);
						
						$("#pie_charttitle").empty();
						$("#pie_charttitle").html(json.year+"년 총 배출량 상세 그래프" + '<span class="unit">(단위 : tCO₂eq)</span>');
					}, "json");
		}
		
		function comma(strNum) {	// 숫자 콤마 찍는 함수
		    return strNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');	// 세자리 콤마
		}
		
		function SelectBoxClick(){
			/* 일반함수 */
			const label = document.querySelector('.year_select .label');
			const options = document.querySelectorAll('.year_select .optionItem');
			// 클릭한 옵션의 텍스트를 라벨 안에 넣음
			const handleSelect = function(item) {
				label.innerHTML = item.textContent;
				label.innerHTML += '<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><path fill="#0075ff" d="M201.4 342.6c12.5 12.5 32.8 12.5 45.3 0l160-160c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L224 274.7 86.6 137.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l160 160z"/></svg>';
				label.parentNode.classList.remove('active');
				// label.innerHTML = "222222"; 라벨에 값 넣기
			}
			// 옵션 클릭시 클릭한 옵션을 넘김
			options.forEach(function(option) {
				option.addEventListener('click', function() {
					handleSelect(option)
					
					let year ="";
					year = $(this).val(); //선택된 연도 담기
					DashboardSelectData(year); 
				})
			})
			// 라벨을 클릭시 옵션 목록이 열림/닫힘
			label.addEventListener('click', function() {
				if (label.parentNode.classList.contains('active')) {
					label.parentNode.classList.remove('active');
				} else {
					label.parentNode.classList.add('active');
				}
			});
		}
	</script>
</body>
</html>
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
	<div class="graph_title">연간 총 배출량</div>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="barChart"></canvas>
		</div>
	</section>
	<!--파이(파이 or 도넛) 그래프-->
	<section class="graph_cont stack_line_graph">
	<div class="graph_title">누적 라인 그래프</div>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="dashboard_piechart"></canvas>
		</div>
	</section>
	<!--감축인벤토리 + 연도선택기능-->
	<section class="graph_cont reduction_inventory">
	<div class="graph_title">감축 인벤토리</div>
		<div class="chart_box">
			<canvas id="d_bar_chart"></canvas>
		</div>
		<!-- 연도 선택 select option -->
		<div class="year_select">
			<button class="label" id="year_data" value="optValue">
				2018년
				<i class="fa-solid fa-chevron-down" style="margin-left: 25px; margin-bottom: 4px;"></i>
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
		<div class="mini_box">
			<div class="text">
				<p class="title" id="total_title">총 배출량</p>
				<p class="num small" id="total_num">1,996,276</p>
			</div>
			<div class="icon" title="총 배출량">
				<img src="${pageContext.request.contextPath}/images/cf_icon_total.png" alt="총 배출량">
			</div>
		</div>
		<div class="mini_box col2">
			<div class="text">
				<p class="title" id="di_title">직접 배출량</p>
				<p class="num small" id="di_num">1,575,198</p>
			</div>
			<div class="col_line"></div>
			<div class="text">
				<p class="title" id="indi_title">간접 배출량</p>
				<p class="num small" id="indi_num">1,575,198</p>
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title" id="lu_title">순 배출량</p>
				<p class="num small" id="lu_num">10,031,192</p>
			</div>
			<div class="icon" title="직접 배출량">
				<img src="${pageContext.request.contextPath}/images/cf_icon_direct.png" alt="직접 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title" id="low_total_title">감축 인벤토리</p>
				<p class="num small" id="low_total_num">965,084</p>
			</div>
			<div class="icon" title="감축 인벤토리">
				<img src="${pageContext.request.contextPath}/images/cf_icon_indirect.png" alt="간접 배출량">
			</div>
		</div>
		<div class="mini_box col2">
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
			console.log(window.location.href);
			console.log(window.location.pathname.split("/")[1]);
			DashboardYearData(); //연간 배출량 데이터
			DashboardSelectData(); //연별 선택 감축 데이터 및 배출량 데이터
			Dashboard_piechart() //파이차트 데이터 (default 2018년 데이터)
			
			SelectBoxClick() // 셀텍트 박스 클릭 이벤
			
		})

		function DashboardSelectData(year) { // 선택연도 데이터
			$.post('/DashboardSelectList.do', {"year" : year},
					function(json) {
						console.log(json)
						//감축 인벤토리 데이터
						$("#d_bar_chart").empty(); 
						dashboard_d_barchart('d_bar_chart',json);
						//배출량 데이터 
						$("#total_title").empty();
						$("#total_title").html(json.year+"년 총 배출량");
						$("#total_num").empty();
						$("#total_num").html(comma(json.total_val));
						$("#lu_title").empty();
						$("#lu_title").html(json.year+"년 순 배출량");
						$("#lu_num").empty();
						$("#lu_num").html(comma(json.total_lu_val));
						$("#di_title").empty();
						$("#di_title").html(json.year+"년 직접 배출량");
						$("#di_num").empty();
						$("#di_num").html(comma(json.di_val));
						$("#indi_title").empty();
						$("#indi_title").html(json.year+"년 간접 배출량");
						$("#indi_num").empty();
						$("#indi_num").html(comma(json.indi_val));
						
						$("#low_total_title").empty();
						$("#low_total_title").html(json.year+"년 감축 인벤토리");
						$("#low_total_num").empty();
						$("#low_total_num").html(comma(json.total_low_val));
						$("#low_di_title").empty();
						$("#low_di_title").html(json.year+"년 직접 배출량(감축)");
						$("#low_di_num").empty();
						$("#low_di_num").html(comma(json.di_low_val));
						$("#low_indi_title").empty();
						$("#low_indi_title").html(json.year+"년 간접 배출량(감축)");
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
						$("#pie_charttitle").html(json.year+"년 배출량 상세 그래프");
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
				label.innerHTML += ' <i class="fa-solid fa-chevron-down" style="margin-left: 25px; margin-bottom: 4px;"></i>';
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
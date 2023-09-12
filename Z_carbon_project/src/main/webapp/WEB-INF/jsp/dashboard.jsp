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
	<!--서책임님이 말씀한 누적 라인그래프-->
	<section class="graph_cont stack_line_graph">
	<div class="graph_title">누적 라인 그래프</div>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="dashboard_stacked_linechart"></canvas>
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
				2018년     <i class="fa-solid fa-chevron-down" style="margin-left: 25px; margin-bottom: 4px;"></i>
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
				<p class="num" id="total_num">1,996,276</p>
			</div>
			<div class="icon" title="총 배출량">
				<img src="${pageContext.request.contextPath}/images/cf_icon_total.png" alt="총 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title" id="lu_title">순 배출량</p>
				<p class="num" id="lu_num">1,575,198</p>
			</div>
			<div class="icon" title="순 배출량">
				<img src="${pageContext.request.contextPath}/images/cf_icon_normal.png" alt="순 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title" id="di_title">직접 배출량</p>
				<p class="num" id="di_num">10,031,192</p>
			</div>
			<div class="icon" title="직접 배출량">
				<img src="${pageContext.request.contextPath}/images/cf_icon_direct.png" alt="직접 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title" id="indi_title">간접 배출량</p>
				<p class="num" id="indi_num">965,084</p>
			</div>
			<div class="icon" title="간접 배출량">
				<img src="${pageContext.request.contextPath}/images/cf_icon_indirect.png" alt="간접 배출량">
			</div>
		</div>
	</section>
	<script>
		$(function() {
			
			dashboarddataList();
			dashboardSelectList();
			
			/* 일반함수 */
			const label = document.querySelector('.label');
			const options = document.querySelectorAll('.optionItem');
			// 클릭한 옵션의 텍스트를 라벨 안에 넣음
			const handleSelect = function(item) {
				label.innerHTML = item.textContent;
				label.parentNode.classList.remove('active');
				// label.innerHTML = "222222"; 라벨에 값 넣기
			}
			// 옵션 클릭시 클릭한 옵션을 넘김
			options.forEach(function(option) {
				option.addEventListener('click', function() {
					handleSelect(option)
					
					let year ="";
					year = $(this).val(); //선택된 연도 담기
					
					dashboardSelectList(year); 
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
			
		})
		
		function dashboardSelectList(year) { // 선택연도 데이터
			console.log(year);
			$.post('/dashboardSelectList.do', {"year" : year},
					function(json) {
						console.log(json)

						$("#d_bar_chart").empty(); // 초기화 후 재생성
						dashboard_d_barchart('d_bar_chart',json);
						
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
						
					}, "json");
		}
		
		function comma(strNum) {	// 숫자 콤파 찍는 함수
		    return strNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');	// 세자리 콤마
		}

		function dashboarddataList() { // 차트 
			$.post('/dashboarddatalist.do', {},
					function(json) {
						console.log(json)

						$("#barChart").empty(); // 연간 총 배출량 그래프
						dashboard_barchart('barChart', json);

						$("#dashboard_stacked_linechart").empty(); // 초기화 후 재생성
						dashboard_stacked_linechart('dashboard_stacked_linechart', json);
					

					}, "json");
		}
	</script>
</body>
</html>
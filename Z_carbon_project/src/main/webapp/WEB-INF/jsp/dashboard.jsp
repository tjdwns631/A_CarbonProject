<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>김포 탄소중립 대시보드</title>
</head>
<body>
	<!--연간 총 배출량-->
	<section class="graph_cont year_total_emission">
		<h3 class="graph_title">연간 총 배출량</h3>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="barChart"></canvas>
		</div>
	</section>
	<!--서책임님이 말씀한 누적 라인그래프-->
	<section class="graph_cont stack_line_graph">
		<h3 class="graph_title">누적 라인그래프</h3>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="dashboard_stacked_linechart"></canvas>
		</div>
	</section>
	<!--감축인벤토리 + 연도선택기능-->
	<section class="graph_cont reduction_inventory">
		<h3 class="graph_title" style="display:flex; align-items:center;">
			감축 인벤토리
			<!-- 연도 선택 select option -->
			<div class="year_select">
                <button class="label">연도 선택
                	<i class="fa-solid fa-chevron-down" style="margin-left:16px; margin-bottom:4px;"></i>
                </button>
                <ul class="optionList">
                    <li class="optionItem">2020년</li>
                    <li class="optionItem">2021년</li>
                    <li class="optionItem">2022년</li>
                    <li class="optionItem">2023년</li>
                </ul>
            </div>
		</h3>
		<!-- 감축 인벤토리 항목들만 넣는 곳 -->
		<div class="inven_wrap">
		</div>
	</section>
		<!--맨 위 그래프없이 숫자 나열 미니 박스 4개 디자인-->
	<section class="mini_cont">
		<div class="mini_box">
			<div class="text">
				<p class="title">총 배출량</p>
				<p class="num">1,996,276</p>
			</div>
			<div class="icon" title="총 배출량">
				<img src="${pageContext.request.contextPath}/images/dispose_icon_total.png" alt="총 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title">순 배출량</p>
				<p class="num">1,575,198</p>
			</div>
			<div class="icon" title="순 배출량">
				<img src="${pageContext.request.contextPath}/images/dispose_icon_normal.png" alt="순 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title">직접 배출량</p>
				<p class="num">10,031,192</p>
			</div>
			<div class="icon" title="직접 배출량">
				<img src="${pageContext.request.contextPath}/images/dispose_icon_direct.png" alt="직접 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title">간접 배출량</p>
				<p class="num">965,084</p>
			</div>
			<div class="icon" title="간접 배출량">
				<img src="${pageContext.request.contextPath}/images/dispose_icon_indirect.png" alt="간접 배출량">
			</div>
		</div>
	</section>
	<script>
		$(function() {
			
			// test code
		
			console.log("dahsboard 페이지");
			dashboarddataList();
			dashbarddataListstack();

			$("#areaChart").empty(); // 초기화 후 재생성
			dashboard_linechart('areaChart');

			$("#d_bar_chart").empty(); // 초기화 후 재생성
			dashboard_d_barchart('d_bar_chart');

			$("#pie").empty(); // 초기화 후 재생성
			dashboard_pie_chart('pie');
			
		})
		//aside 클릭시 토글
		$('.depth2').hide();
		$('.nav_list.depth1').on('click', function() {
			$(this).children('.depth2').slideToggle();
			$(this).toggleClass('reverse');
		})

		function dashboarddataList() { // 차트 
			$.post('/dashbarddataList.do', {}, function(json) {
				console.log(json)
				
				$("#barChart").empty(); // 연간 총 배출량 그래프
				dashboard_barchart('barChart',json);
				
				$("#dashboard_stacked_linechart").empty(); // 초기화 후 재생성
				dashboard_stacked_linechart('dashboard_stacked_linechart',json);
				
			}, "json");
		}
		
		
		function dashbarddataListstack() { //  
			$.post('/dashbarddataListstack.do', {}, function(json) {
				console.log(json)
				
			}, "json");
		}
		
		/* 일반함수 */
		const label = document.querySelector('.label');
		const options = document.querySelectorAll('.optionItem');
		// 클릭한 옵션의 텍스트를 라벨 안에 넣음
		const handleSelect = function(item) {
		  label.innerHTML = item.textContent;
		  label.parentNode.classList.remove('active');
		}
		// 옵션 클릭시 클릭한 옵션을 넘김
		options.forEach(function(option){
		  option.addEventListener('click', function(){handleSelect(option)})
		})
		// 라벨을 클릭시 옵션 목록이 열림/닫힘
		label.addEventListener('click', function(){
		  if(label.parentNode.classList.contains('active')) {
		    label.parentNode.classList.remove('active');
		  } else {
		    label.parentNode.classList.add('active');
		  }
		});
	</script>
</body>
</html>
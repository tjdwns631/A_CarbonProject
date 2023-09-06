<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<div class="mini_box">
			<div class="text">
				<p class="title">연도 선택</p>
				<select>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				</select>
			</div>
		</div>
	</section>
	<!--연간 총 배출량-->
	<section class="graph_cont year_total_emission">
		<h3 class="graph_title">연간 총 배출량</h3>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="barChart" height=200px></canvas>
		</div>
	</section>
	<!--서책임님이 말씀한 누적 라인그래프-->
	<section class="graph_cont stack_line_graph">
		<h3 class="graph_title">서책임님이 말씀한 누적 라인그래프</h3>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="dashboard_stacked_linechart" height=200px></canvas>
		</div>
	</section>
	<!--감축인벤토리 + 연도선택기능-->
	<section class="graph_cont reduction_inventory">
		<h3 class="graph_title">감축 인벤토리</h3>
		<div class="inven_wrap">
			<!--왼쪽 : 직접배출량-->
			<div class="direct">
				<p>직접 배출량</p>
				<!--차트 넣는 곳-->
				<div class="chart_box"></div>
			</div>
			<!--오른쪽 : 간접배출량-->
			<div class="indirect">
				<p>간접 배출량</p>
				<!--차트 넣는 곳-->
				<div class="chart_box"></div>
			</div>
		</div>

	</section>
</body>
<script>
	$(function() {
		$("#despose_barchart").empty(); // 초기화 후 재생성
		despose_barchart('despose_barchart');

		$("#despose_pie").empty(); // 초기화 후 재생성
		despose_pie('despose_pie');
		$("#despose_pie2").empty(); // 초기화 후 재생성
		despose_pie('despose_pie2');

		$("#despose_table_chart").empty(); // 초기화 후 재생성
		despose_table_chart('despose_table_chart');
	})
</script>
</html>
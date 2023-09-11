<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배출현황 조회 - 현황 조회</title>
</head>
<body>
	<section class="mini_cont">
		<div class="mini_box">
			<div class="text">
				<p class="title">첫 번째 박스</p>
				<p class="num">1,996,276</p>
			</div>
			<div class="icon" title="총 배출량">
				<img src="${pageContext.request.contextPath}/images/dispose_icon_total.png" alt="총 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title">두 번째 박스</p>
				<p class="num">1,575,198</p>
			</div>
			<div class="icon" title="순 배출량">
				<img src="${pageContext.request.contextPath}/images/dispose_icon_normal.png" alt="순 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title">세 번째 박스</p>
				<p class="num">10,031,192</p>
			</div>
			<div class="icon" title="직접 배출량">
				<img src="${pageContext.request.contextPath}/images/dispose_icon_direct.png" alt="직접 배출량">
			</div>
		</div>
		<div class="mini_box">
			<div class="text">
				<p class="title">네 번째 박스</p>
				<p class="num">965,084</p>
			</div>
			<div class="icon" title="간접 배출량">
				<img src="${pageContext.request.contextPath}/images/dispose_icon_indirect.png" alt="간접 배출량">
			</div>
		</div>
			<div class="mini_box">
			<div class="text">
				<p class="title">다섯 번째 박스</p>
				<p class="num">965,084</p>
			</div>
			<div class="icon" title="간접 배출량">
				<img src="${pageContext.request.contextPath}/images/dispose_icon_indirect.png" alt="간접 배출량">
			</div>
		</div>
	</section>
	<!--첫번째 차트 박스-->
	<section class="graph_cont first_chart_box">
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id=""></canvas>
		</div>
	</section>
	<!--두번째 차트 박스-->
	<section class="graph_cont second_chart_box">
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id=""></canvas>
		</div>
	</section>
	<!--세번째 차트 박스-->
	<section class="graph_cont third_chart_box">
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id=""></canvas>
		</div>
	</section>
	<!--네번째 차트 박스-->
	<section class="graph_cont fourth_chart_box">
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id=""></canvas>
		</div>
	</section>
	<!--다섯번째 차트 박스-->
	<section class="graph_cont fifth_chart_box">
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id=""></canvas>
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
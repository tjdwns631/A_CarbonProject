<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-bottom: 20px;">
		<select class="pl" name="year">
			<option value="">연도선택</option>
			<option value="2015" selected>2015년</option>
			<option value="2016">2016년</option>
			<option value="2017">2017년</option>
			<option value="2018">2018년</option>
			<option value="2019">2019년</option>
			<option value="2020">2020년</option>
		</select> <select class="pl" name="lev1">
			<option value="">배출방법</option>
			<option value="1" selected>직접배출</option>
			<option value="2">간접배출</option>
		</select>
	</div>

	<div class="row">
		<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-9">
							<div class="d-flex align-items-center align-self-start">
								<h2 class="mb-0">1,996,276</h2>
							</div>
						</div>
					</div>
					<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">총
						배출량</h6>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-9">
							<div class="d-flex align-items-center align-self-start">
								<h2 class="mb-0">1,575,198</h2>
							</div>
						</div>
					</div>
					<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">총
						사용량</h6>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-9">
							<div class="d-flex align-items-center align-self-start">
								<h3 class="mb-0">10,031,192</h3>
							</div>
						</div>
					</div>
					<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">직접
						배출량</h6>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-9">
							<div class="d-flex align-items-center align-self-start">
								<h3 class="mb-0">965,084</h3>
							</div>
						</div>
					</div>
					<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">간접
						배출량</h6>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-weight: 900;">2015년 배출량</h4>
					<canvas id="despose_barchart" height="120px"></canvas>
				</div>
			</div>
		</div>

		<div class="col-lg-3 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
				<h4 class="card-title" style="font-weight: 900;">2015년 배출량</h4>
					<canvas id="despose_pie" style=" margin-left: 40px;" height="300px"></canvas>
				</div>
			</div>
		</div>

		<div class="col-lg-3 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
				<h4 class="card-title" style="font-weight: 900;">2015년 배출량</h4>
					<canvas id="despose_pie2"  style=" margin-left: 40px;" height="300px"></canvas>
				</div>
			</div>
		</div>

	</div>

	<div class="row">
			<div class="col-lg-5 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">배출량 데이터</h4>
						<p class="card-description">
							<code>직접배출</code>
						</p>
						<div class="table-responsive" style="height:350px;overflow: auto">
							<table class="table" >
								<thead>
									<tr>
										<th>분류</th>
										<th>배출량</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>도로</td>
										<td>794865</td>
									</tr>
									<tr>
										<td>상업</td>
										<td>43386</td>
									</tr>
									<tr>
										<td>공공</td>
										<td>13197</td>
									</tr>
									<tr>
										<td>가정</td>
										<td>83060</td>
									</tr>
									<tr>
										<td>장내발효</td>
										<td>19651</td>
									</tr>
									<tr>
										<td>CH4</td>
										<td>3012</td>
									</tr>
									<tr>
										<td>N2O</td>
										<td>10835</td>
									</tr>
									<tr>
										<td>석회시용</td>
										<td>0</td>
									</tr>
									<tr>
										<td>벼재배</td>
										<td>13</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-7 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">상업 배출량 상세조회</h4>
						<canvas id="despose_table_chart" height=130px></canvas>
					</div>
				</div>
			</div>
		</div>
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
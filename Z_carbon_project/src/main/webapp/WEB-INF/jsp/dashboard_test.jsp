<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="row">
			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h3 class="mb-0" style="padding-bottom: 20px;">연간 총 배출량</h3>
						<canvas id="areaChart" height=110px></canvas>
					</div>
				</div>
			</div>

			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h3 class="mb-0" style="padding-bottom: 20px;">연간 직/간접 배출량</h3>
						<canvas id="barChart" height=110px></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<select class="pl" name="job">
								<option value="">연도선택</option>
								<option value="2015">2015년</option>
								<option value="2016">2016년</option>
								<option value="2017">2017년</option>
								<option value="2018">2018년</option>
								<option value="2019">2019년</option>
								<option value="2020">2020년</option>
								<option value="2021">2021년</option>
								<option value="2022">2022년</option>
								<option value="2023" selected>2023년</option>
								
							</select>
						</h4>
						<canvas id="d_bar_chart" height=150px></canvas>
					</div>
				</div>
			</div>

			<div class="col-lg-4 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<canvas id="pie" height=150px></canvas>
					</div>
				</div>
			</div>
			
			<!-- 배출량 -->
	            <div class="num-data-box col-lg-4 d-flex align-items-between flex-wrap justify-content-between row">
              <div class="col-lg-6 grid-margin stretch-card ml10">
                <div class="card" style="background-color:#11c4d4">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-9">
                        <div class="d-flex align-items-center align-self-start">
                          <h3 class="mb-0 num-large">1,996,276</h3>
                        </div>
                      </div>
                    </div>
                    <h6 style="margin-top: 15px; color:#111; font-weight: bold;">총 배출량</h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 grid-margin stretch-card pr-0">
                <div class="card" style="background-color:#113bd4">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-9">
                        <div class="d-flex align-items-center align-self-start">
                          <h3 class="mb-0 num-large">1,575,198</h3>
                        </div>
                      </div>
                    </div>
                    <h6 style="margin-top: 15px; font-weight: bold;">순 배출량</h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 grid-margin stretch-card ml10">
                <div class="card" style="background-color:#4f11d4">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-9">
                        <div class="d-flex align-items-center align-self-start">
                          <h3 class="mb-0 num-large">10,031,192</h3>
                        </div>
                      </div>
                    </div>
                    <h6 style="margin-top: 15px; font-weight: bold;">직접 배출량</h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 grid-margin stretch-card pr-0">
                <div class="card" style="background-color:#11d4b7">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-9">
                        <div class="d-flex align-items-center align-self-start">
                          <h3 class="mb-0 num-large">965,084</h3>
                        </div>
                      </div>
                    </div>
                    <h6 style="margin-top: 15px; color: #111; font-weight: bold;">간접 배출량</h6>
                  </div>
                </div>
              </div>
            </div>
			<!-- 배출량 -->
		</div>

		<div class="row">
			<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<div class="d-flex align-items-center align-self-start">
									<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">총 배출량</h6>
								</div>
							</div>
						</div>
									<h2 class="mb-0">1,996,276</h2>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<div class="d-flex align-items-center align-self-start">
									<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">순 배출량</h6>
								</div>
							</div>
						</div>
									<h2 class="mb-0">1,575,198</h2>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<div class="d-flex align-items-center align-self-start">
									<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">직접 배출량</h6>
								</div>
							</div>
						</div>
									<h3 class="mb-0">10,031,192</h3>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<div class="d-flex align-items-center align-self-start">
									<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">간접 배출량</h6>
								</div>
							</div>
									<h3 class="mb-0">965,084</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script>
	$(function() {
		$("#barChart").empty(); // 초기화 후 재생성
		dashboard_barchart('barChart');

		$("#areaChart").empty(); // 초기화 후 재생성
		dashboard_linechart('areaChart');

	})
</script>
</html>
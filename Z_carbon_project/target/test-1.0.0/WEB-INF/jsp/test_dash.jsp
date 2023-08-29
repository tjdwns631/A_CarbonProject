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
            <div class="col-lg-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">ì°ê° ì´ ë°°ì¶ë</h4>
                  <canvas id="areaChart" height=160px></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">ì°ê° ì§/ê°ì  ë°°ì¶ë</h4>
                  <canvas id="barChart" height=160px></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">
                    ì°¨í¸ ì ëª©
                    <select class="pl" name="job">
                      <option value="">ì°ëì í</option>
                      <option value="2015">2015ë</option>
                      <option value="2016">2016ë</option>
                      <option value="2017">2017ë</option>
                      <option value="2018">2018ë</option>
                      <option value="2019">2019ë</option>
                      <option value="2020">2020ë</option>
                    </select>
                  </h4>
                  <canvas id="d_bar_chart" height=160px></canvas>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
          
            <div class="col-lg-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">ì°¨í¸ ì ëª©</h4>
                  <canvas id="pie" height=180px></canvas>
                </div>
              </div>
            </div>
            
            <div class="num-data-box col-lg-8 d-flex align-items-between flex-wrap justify-content-between row">
              <div class="col-lg-6 grid-margin stretch-card ml10">
                <div class="card" style="background-color:#11c4d4">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-9">
                        <div class="d-flex align-items-center align-self-start">
                          <h2 class="mb-0 num-large">1,996,276</h2>
                        </div>
                      </div>
                    </div>
                    <h6 style="margin-top: 15px; color:#111;">ì´ ë°°ì¶ë</h6>
                  </div>
                </div>
              </div>
              
              <div class="col-lg-6 grid-margin stretch-card pr-0">
                <div class="card" style="background-color:#113bd4">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-9">
                        <div class="d-flex align-items-center align-self-start">
                          <h2 class="mb-0 num-large">1,575,198</h2>
                        </div>
                      </div>
                    </div>
                    <h6 style="margin-top: 15px;">ì ë°°ì¶ë</h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 grid-margin stretch-card ml10">
                <div class="card" style="background-color:#4f11d4">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-9">
                        <div class="d-flex align-items-center align-self-start">
                          <h2 class="mb-0 num-large">10,031,192</h2>
                        </div>
                      </div>
                    </div>
                    <h6 style="margin-top: 15px;">ì§ì  ë°°ì¶ë</h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 grid-margin stretch-card pr-0">
                <div class="card" style="background-color:#11d4b7">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-9">
                        <div class="d-flex align-items-center align-self-start">
                          <h2 class="mb-0 num-large">965,084</h2>
                        </div>
                      </div>
                    </div>
                    <h6 style="margin-top: 15px; color: #111;">ê°ì  ë°°ì¶ë</h6>
                  </div>
                </div>
              </div>
            </div>
            
          </div>

  <script>
    $(function () {
      $("#barChart").empty(); // ì´ê¸°í í ì¬ìì±
      dashboard_barchart('barChart');

      $("#areaChart").empty(); // ì´ê¸°í í ì¬ìì±
      dashboard_linechart('areaChart');

      $("#d_bar_chart").empty(); // ì´ê¸°í í ì¬ìì±
      dashboard_d_barchart('d_bar_chart');

      $("#pie").empty(); // ì´ê¸°í í ì¬ìì±
      dashboard_pie_chart('pie');
    })
  </script>
</body>

</html>
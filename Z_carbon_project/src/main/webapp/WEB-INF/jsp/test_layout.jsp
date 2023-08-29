<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%-- <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/js/jquery-3.7.0.min.js"></script> 
	
   <%-- <tiles:insertAttribute name="loadFile"/> --%>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/jvectormap/jquery-jvectormap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/owl-carousel-2/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/owl-carousel-2/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/add.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- <link rel="stylesheet" href="js/g_chart.js"> -->
    <script src="${pageContext.request.contextPath}/js/g_chart.js"></script>
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="images/favicon.png" /> 
    <script src="${pageContext.request.contextPath}/vendors/chart.js/Chart.min.js"></script>

</head>
<body>
<div class="container-scroller">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <a class="sidebar-brand brand-logo" href="index.html"><img src="" alt="logo" /></a>
          <a class="sidebar-brand brand-logo-mini" href="index.html"><img src="" alt="logo" /></a>
        </div>
        <ul class="nav" style="margin-top: 30px">
          <li class="nav-item menu-items" style="margin-top: 20px">
            <a class="nav-link" href="index.html">
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
              </span>
              <span class="menu-title">대시보드</span>
            </a>
          </li>
          <li class="nav-item menu-items" style="margin-top: 20px">
            <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-laptop"></i>
              </span>
              <span class="menu-title">배출현황 조회</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item" style="margin-top: 20px" > <a class="nav-link" href="pages/ui-features/buttons.html">현황조회</a></li>
                <li class="nav-item" style="margin-top: 20px" > <a class="nav-link" href="pages/ui-features/dropdowns.html">상세현황 조회</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item menu-items" style="margin-top: 20px">
            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <span class="menu-icon">
                <i class="mdi mdi-security"></i>
              </span>
              <span class="menu-title">설정</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.html">데이터관리</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_navbar.html -->
        <nav class="navbar p-0 fixed-top d-flex flex-row">
          <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
            <a class="navbar-brand brand-logo-mini" href="index.html"><img src="" alt="logo" /></a>
          </div>
          <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
              <span class="mdi mdi-menu"></span>
            </button>

            <ul class="navbar-nav navbar-nav-right">
              <li class="nav-item dropdown">
                <a class="nav-link" id="profileDropdown" href="#" data-bs-toggle="dropdown">
                  <div class="navbar-profile">
                    <img class="img-xs rounded-circle" src="" alt="">
                    <p class="mb-0 d-none d-sm-block navbar-profile-name">Henry Klein</p>
                    <i class="mdi mdi-menu-down d-none d-sm-block"></i>
                  </div>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
                  <h6 class="p-3 mb-0">Profile</h6>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-settings text-success"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">정보수정</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-logout text-danger"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">로그아웃</p>
                    </div>
                  </a>
                </div>
              </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-format-line-spacing"></span>
            </button>
          </div>
        </nav>
        
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          
	       	<div class="row">
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<canvas id="areaChart" height = 130px></canvas>
						</div>
					</div>
				</div>
	
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<canvas id="barChart" height = 130px></canvas>
						</div>
					</div>
				</div>
			</div>
					<div class="row">
				<div class="col-lg-7 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">
							<select class="pl" name="job" >
							    <option value="">연도선택</option>
							    <option value="2015">2015년</option>
							    <option value="2016">2016년</option>
							    <option value="2017">2017년</option>
							    <option value="2018">2018년</option>
							    <option value="2019">2019년</option>
							    <option value="2020">2020년</option>
							</select>
							</h4>
							<canvas id="d_bar_chart" height = 90px></canvas>
						</div>
					</div>
				</div>
	
				<div class="col-lg-5 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<canvas id="pie" ></canvas>
						</div>
					</div>
				</div>
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
                    <h6 class="text-muted font-weight-normal" style="margin-top: 7px;">총 배출량</h6>
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
                     <h6 class="text-muted font-weight-normal" style="margin-top: 7px;">순 배출량</h6>
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
                    <h6 class="text-muted font-weight-normal" style="margin-top: 7px;">직접 배출량</h6>
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
                    <h6 class="text-muted font-weight-normal" style="margin-top: 7px;">간접 배출량</h6>
                  </div>
                </div>
              </div>
            </div>
		</div>
          <!-- content-wrapper ends -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    
    <script>
$(function(){
	$("#barChart").empty(); // 초기화 후 재생성
	dashboard_barchart('barChart');
	
	$("#areaChart").empty(); // 초기화 후 재생성
	dashboard_linechart('areaChart');
	
	$("#d_bar_chart").empty(); // 초기화 후 재생성
	dashboard_d_barchart('d_bar_chart');
	
 	$("#pie").empty(); // 초기화 후 재생성
 	dashboard_pie_chart('pie'); 
})
</script>
    
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="${pageContext.request.contextPath}/vendors/chart.js/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
   
    <script src="${pageContext.request.contextPath}/vendors/progressbar.js/progressbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/jvectormap/jquery-jvectormap.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/boot/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/js/boot/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/js/boot/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/js/boot/misc.js"></script>
    <script src="${pageContext.request.contextPath}/js/boot/settings.js"></script>
    <script src="${pageContext.request.contextPath}/js/boot/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${pageContext.request.contextPath}/js/boot/dashboard.js"></script>
    <!-- End custom js for this page -->
</body>
</html>
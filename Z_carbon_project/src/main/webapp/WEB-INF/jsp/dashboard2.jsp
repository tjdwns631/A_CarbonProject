<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>김포시 탄소중립 대시보드2</title>
        <!--css-->
        <!--웹폰트 아이콘-->
        <script src="https://kit.fontawesome.com/63ee985f7b.js" crossorigin="anonymous"></script>
        <!-- plugins:css -->
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <link rel="stylesheet" href="assets/vendors/jvectormap/jquery-jvectormap.css">
        <link rel="stylesheet" href="assets/vendors/owl-carousel-2/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/vendors/owl-carousel-2/owl.theme.default.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/add.css">
        <!--폰트-->
        <link rel="stylesheet" as="style" crossorigin="" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable-dynamic-subset.css">
        <link rel="stylesheet" href="assets/css/style2.css">
        <!--js-->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="assets/js/g_chart.js"></script>
        <link rel="shortcut icon" href="images/favicon.png" />
        <script src="assets/vendors/chart.js/Chart.min.js"></script>
    </head>
    <body>
        <div id="container">
            <!--왼쪽 사이드 메뉴-->
            <aside>
                <!--로고-->
                <div class="top">
                    <h1>
                        <a href="#">
                            <img src="assets/images/logo_wh.png" alt="임시 로고">
                        </a>
                    </h1>
                </div>
                <!--로고와 nav 구분선-->
                <hr class="nav_line"></hr>
                <!--nav-->
                <nav>
                    <ul class="nav_wrap">
                        <li class="nav_list depth1 active">
                            <div class="depth1_box">
                                <div class="nav_icon">
                                    <i class="fa-solid fa-chart-line"></i>
                                </div>
                                <div class="nav_name">
                                    대시보드
                                </div>
                            </div>
                        </li>
                        <li class="nav_list depth1">
                            <div class="depth1_box">
                                <div class="nav_icon">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                                <div class="nav_name">
                                    배출현황 조회
                                </div>
                                <i class="fa-solid fa-chevron-down"></i>
                            </div>
                            <ul class="depth2">
                                <li class="nav_list">
                                    <div class="nav_name">
                                        현황 조회
                                    </div>
                                </li>
                                <li class="nav_list">
                                    <div class="nav_name">
                                        상세현황 조회
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav_list depth1">
                            <div class="depth1_box">
                                <div class="nav_icon">
                                    <i class="fa-solid fa-gear"></i>
                                </div>
                                <div class="nav_name">
                                    설정
                                </div>
                                <i class="fa-solid fa-chevron-down"></i>
                            </div>
                            <ul class="depth2">
                                <li class="nav_list">
                                    <div class="nav_name">
                                        데이터 관리
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!--계정 account profile-->
                <div class="bot">
                    <div class="account">
                        <div class="user_icon">
                            <i class="fa-solid fa-user"></i>
                        </div>
                        <div class="account_name">홍길동</div>
                        <div class="account_grade">ㅇㅇ부서 연구원</div>
                        <button class="account_edit">정보수정</button>
                    </div>
                    <button class="logout">LOGOUT</button>
                </div>
            </aside>
            <!--오른쪽 메인 컨텐츠-->
            <main>
                <!--맨 위 그래프없이 숫자 나열 미니 박스 4개 디자인-->
                <section class="mini_cont">
                    <div class="mini_box">
                        <div class="text">
                            <p class="title">총 배출량</p>
                            <p class="num">1,996,276</p>
                        </div>
                        <div class="icon" title="총 배출량">
                            <img src="assets/images/dispose_icon_total.png" alt="총 배출량">
                        </div>
                    </div>
                    <div class="mini_box">
                        <div class="text">
                            <p class="title">순 배출량</p>
                            <p class="num">1,575,198</p>
                        </div>
                        <div class="icon" title="순 배출량">
                            <img src="assets/images/dispose_icon_normal.png" alt="순 배출량">
                        </div>
                    </div>
                    <div class="mini_box">
                        <div class="text">
                            <p class="title">직접 배출량</p>
                            <p class="num">10,031,192</p>
                        </div>
                        <div class="icon" title="직접 배출량">
                            <img src="assets/images/dispose_icon_direct.png" alt="직접 배출량">
                        </div>
                    </div>
                    <div class="mini_box">
                        <div class="text">
                            <p class="title">간접 배출량</p>
                            <p class="num">965,084</p>
                        </div>
                        <div class="icon" title="간접 배출량">
                            <img src="assets/images/dispose_icon_indirect.png" alt="간접 배출량">
                        </div>
                    </div>
                </section>
                <!--연간 총 배출량-->
                <section class="graph_cont year_total_emission">
                    <h3 class="graph_title">연간 총 배출량</h3>
                    <!--차트 넣는 곳-->
                    <div class="chart_box">
                        <canvas id="barChart"  height=200px></canvas>
                    </div>
                </section>
                <!--서책임님이 말씀한 누적 라인그래프-->
                <section class="graph_cont stack_line_graph">
                    <h3 class="graph_title">서책임님이 말씀한 누적 라인그래프</h3>
                    <!--차트 넣는 곳-->
                    <div class="chart_box">
                        <canvas id="d_bar_chart" height=200px></canvas>
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
                            <div class="chart_box">

                            </div>
                        </div>
                        <!--오른쪽 : 간접배출량-->
                        <div class="indirect">
                            <p>간접 배출량</p>
                            <!--차트 넣는 곳-->
                            <div class="chart_box">

                            </div>
                        </div>
                    </div>

                </section>
            </main>
        </div>
        <script>
            $(function () {
                $("#barChart").empty(); // 초기화 후 재생성
                dashboard_barchart('barChart');
            
                $("#areaChart").empty(); // 초기화 후 재생성
                dashboard_linechart('areaChart');
            
                $("#d_bar_chart").empty(); // 초기화 후 재생성
                dashboard_d_barchart('d_bar_chart');
            
                $("#pie").empty(); // 초기화 후 재생성
                dashboard_pie_chart('pie');
            })
            //aside 클릭시 토글
            $('.depth2').hide();
                $('.nav_list.depth1').on('click',function(){
                    $(this).children('.depth2').slideToggle();
                    $(this).toggleClass('reverse');
                })
        </script>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="assets/vendors/chart.js/Chart.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>

        <script src="assets/vendors/progressbar.js/progressbar.min.js"></script>
        <script src="assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
        <script src="assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <script src="assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
        <script src="assets/js/boot/jquery.cookie.js" type="text/javascript"></script>
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="assets/js/off-canvas.js"></script>
        <script src="assets/js/hoverable-collapse.js"></script>
        <script src="assets/js/misc.js"></script>
        <script src="assets/js/settings.js"></script>
        <script src="assets/js/todolist.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page -->
        <script src="assets/js/dashboard.js"></script>
        <script src="assets/js/dashboard_chart.js"></script>
        <script src="assets/js/aa.js"></script>
        <!-- End custom js for this page -->
    </body>
</html>

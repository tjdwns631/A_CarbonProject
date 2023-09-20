<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배출현황 조회 - 현황 조회</title>
<link rel="stylesheet" href="css/emission_status.css">
</head>
<body>
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
		<div class="mini_box">
			<div class="text">
				<p class="title" id="lu_title">순 배출량</p>
				<p class="num" id="lu_num">1,575,198</p>
			</div>
			<div class="icon" title="순 배출량">
				<img src="${pageContext.request.contextPath}/images/cf_icon_normal.png" alt="순 배출량">
			</div>
		</div>
			<div class="mini_box select_year" style="aligm-items:flex-start; overflow:visible; z-index:2;">
				<div class="text">
					<p class="title" id="indi_title">연도 선택</p>
				</div>
				<div class="year_select_cf">
					<button class="label" id="year_data" value="optValue">
						2018년 <i class="fa-solid fa-chevron-down"></i>
					</button>
					<ul class="optionList">
						<c:forEach var="year" items="${year_list}">
							<li class="optionItem" value="${year.data_date}">${year.data_date}년</li>
						</c:forEach>
					</ul>
				</div>
			</div>
	</section>
	<!-- 대분류별 차트 (에너지 농업 lulucf 등)-->
	<section class="graph_cont first_chart_box">
	<div class="graph_title">총배출량 (직접/간접)</div>
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<canvas id="barChart"></canvas>
		</div>
	</section>
	<!--두번째 차트 박스-->
	<section class="graph_cont second_chart_box">
	
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<div class="graph_title">Level 2 분류</div>
			<canvas id="cf_barchart"></canvas>
		</div>
	</section>
	
	<!--세번째 차트 박스-->
	<div class="folding_wrap">
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">에너지</div>
                <canvas id="energy"></canvas>
            </div>
			<div class="min_cont" id="energy_sum">
				<h4 class="min_cont_title">에너지</h4>
				<p class="min_cont_num">1111</p>
				<p class="tCO2eq">tCO2eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">산업공정</div>
                <canvas id="indus"></canvas>
            </div>
            <div class="min_cont" id="indus_sum">
				<h4 class="min_cont_title">산업공정</h4>
				<p class="min_cont_num">1111</p>
				<p class="tCO2eq">tCO2eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">농업</div>
                <canvas id="agri"></canvas>
            </div>
            <div class="min_cont" id="agri_sum">
				<h4 class="min_cont_title">농업</h4>
				<p class="min_cont_num">1111</p>
				<p class="tCO2eq">tCO2eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">lulu cf</div>
                <canvas id="lulucf"></canvas>
            </div>
            <div class="min_cont" id="lulucf_sum">
				<h4 class="min_cont_title">lulu cf</h4>
				<p class="min_cont_num">1111</p>
				<p class="tCO2eq">tCO2eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">폐기물(직접)</div>
                <canvas id="waste"></canvas>
            </div>
            <div class="min_cont" id="waste_sum">
				<h4 class="min_cont_title">폐기물(직접)</h4>
				<p class="min_cont_num">1111</p>
				<p class="tCO2eq">tCO2eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">전력</div>
                <canvas id="elect"></canvas>
            </div>
            <div class="min_cont" id="elect_sum">
				<h4 class="min_cont_title">전력</h4>
				<p class="min_cont_num">1111</p>
				<p class="tCO2eq">tCO2eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box">
            	<div class="graph_title">폐기물(간접)</div>
                <canvas id="indiwaste"></canvas>
            </div>
            <div class="min_cont" id="indiwaste_sum">
            	<h4 class="min_cont_title">폐기물(간접)</h4>
				<p class="min_cont_num">1111</p>
				<p class="tCO2eq">tCO2eq</p>
            </div>
        </section>
    </div>
</body>
<script>
	$(function() {
		//$('.depth2 .nav_list .nav_name').eq(0).addClass('active');
		DashboardYearData()
		DesposeData();
		
		SelectBoxClick() // 셀텍트 박스 클릭 이벤
	})
	

	function DashboardYearData() { // 연간 배출량 그래프
		$.post('/DashboardDataList.do', {}, function(json) {
			$("#barChart").empty();
			dashboard_barchart('barChart', json);
		}, "json");
	}

	function DesposeData(year) { // 선택연도 데이터
		console.log(year);
		$.post('/desposeData.do', {
			"year" : year
		}, function(json) {
			console.log(json)
			$("#cf_barchart").empty(); // 초기화 후 재생성
			despose_barchart('cf_barchart', json);
			//despose_stackbarchart('cf_barchart', json);
			
			$("#energy").empty(); // 초기화 후 재생성
			despose_energy('energy', json);
			$("#indus").empty(); // 초기화 후 재생성
			despose_indus('indus', json);
			$("#agri").empty(); // 초기화 후 재생성
			despose_agri('agri', json);
			$("#lulucf").empty(); // 초기화 후 재생성
			despose_lulucf('lulucf', json);
			$("#waste").empty(); // 초기화 후 재생성
			despose_waste('waste', json);
			$("#elect").empty(); // 초기화 후 재생성
			despose_elect('elect', json);
			$("#indiwaste").empty(); // 초기화 후 재생성
			despose_indiwaste('indiwaste', json);
			
			$("#total_title").empty();
			$("#total_title").html(json.year + "년 총 배출량");
			$("#total_num").empty();
			$("#total_num").html(comma(json.total_val));

			$("#lu_title").empty();
			$("#lu_title").html(json.year + "년 순 배출량");
			$("#lu_num").empty();
			$("#lu_num").html(comma(json.total_lu_val));

			$("#di_title").empty();
			$("#di_title").html(json.year + "년 직접 배출량");
			$("#di_num").empty();
			$("#di_num").html(comma(json.di_val));

			$("#indi_title").empty();
			$("#indi_title").html(json.year + "년 간접 배출량");
			$("#indi_num").empty();
			$("#indi_num").html(comma(json.indi_val));

		}, "json");
	}

	function comma(strNum) { // 숫자 콤마 찍는 함수
		return strNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); // 세자리 콤마
	}
	
	function SelectBoxClick(){
		/* 일반함수 */
		const label = document.querySelector('.label');
		const options = document.querySelectorAll('.optionItem');
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
				
				DesposeData(year); 
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
	

    $(document).ready(function () {
        $(".folding_wrap .graph_cont").click(function () {
        	//chart_box 숨기기
            $('.folding_wrap .chart_box').css('display', 'none');
        	//min_cont들 보이게 하기
            $('.min_cont').css('display', 'flex');
            //graph_cont들 모두 expanded 클래스 제거
            $(".folding_wrap .graph_cont").removeClass("expanded");
            // 현재 클릭한 chart_box 요소를 확장하고 나머지를 최소화
            $(this).addClass("expanded");
            $(this).find('.chart_box').css('display', 'flex');
            $(this).find('.min_cont').css('display', 'none');
        });
    });

</script>
</html>
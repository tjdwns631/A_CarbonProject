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
						2018년
						<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
							<path fill="#0075ff" d="M201.4 342.6c12.5 12.5 32.8 12.5 45.3 0l160-160c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L224 274.7 86.6 137.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l160 160z"/>
						</svg>
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
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<div class="graph_title">총배출량 (직접/간접)
				<span class="unit">(단위 : tCO₂eq)</span>
			</div>
			<canvas id="barChart"></canvas>
		</div>
	</section>
	<!--두번째 차트 박스-->
	<section class="graph_cont second_chart_box">
	
		<!--차트 넣는 곳-->
		<div class="chart_box">
			<div class="graph_title" id="detail_graph_title">Level 2 분류</div>
			<canvas id="cf_barchart"></canvas>
		</div>
	</section>
	
	<!--세번째 차트 박스-->
	<div class="folding_wrap">
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">에너지
            		<span class="unit">(단위 : tCO₂eq)</span>
            	</div>
                <canvas id="energy"></canvas>
            </div>
			<div class="min_cont">
				<div class="min_cont_icon energy"></div>
				<h4 class="min_cont_title">에너지</h4>
				<p class="min_cont_num green" id="energy_sum">1111</p>
				<p class="tCO₂eq">tCO₂eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">산업공정
            		<span class="unit">(단위 : tCO₂eq)</span>
            	</div>
                <canvas id="indus"></canvas>
            </div>
            <div class="min_cont" >
            	<div class="min_cont_icon industry"></div>
				<h4 class="min_cont_title">산업공정</h4>
				<p class="min_cont_num green" id="indus_sum">1111</p>
				<p class="tCO₂eq">tCO₂eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">농업
            		<span class="unit">(단위 : tCO₂eq)</span>
            	</div>
                <canvas id="agri"></canvas>
            </div>
            <div class="min_cont" >
            	<div class="min_cont_icon agri"></div>
				<h4 class="min_cont_title">농업</h4>
				<p class="min_cont_num green" id="agri_sum">1111</p>
				<p class="tCO₂eq">tCO₂eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">LULUCF
            		<span class="unit">(단위 : tCO₂eq)</span>
            	</div>
                <canvas id="lulucf"></canvas>
            </div>
            <div class="min_cont">
            	<div class="min_cont_icon lulucf"></div>
				<h4 class="min_cont_title">LULUCF</h4>
				<p class="min_cont_num green" id ="lulucf_sum">1111</p>
				<p class="tCO₂eq">tCO₂eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">폐기물
            		<span class="unit">(단위 : tCO₂eq)</span>
            	</div>
                <canvas id="waste"></canvas>
            </div>
            <div class="min_cont">
            	<div class="min_cont_icon trash_green"></div>
				<h4 class="min_cont_title">폐기물</h4>
				<p class="min_cont_num green" id="waste_sum">1111</p>
				<p class="tCO₂eq">tCO₂eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box" >
            	<div class="graph_title">전력
            		<span class="unit">(단위 : tCO₂eq)</span>
            	</div>
                <canvas id="elect"></canvas>
            </div>
            <div class="min_cont">
            	<div class="min_cont_icon elec"></div>
				<h4 class="min_cont_title">전력</h4>
				<p class="min_cont_num" id="elect_sum">1111</p>
				<p class="tCO₂eq">tCO₂eq</p>
			</div>
        </section>
        <section class="graph_cont">
            <div class="chart_box">
            	<div class="graph_title">폐기물
            		<span class="unit">(단위 : tCO₂eq)</span>
            	</div>
                <canvas id="indiwaste"></canvas>
            </div>
            <div class="min_cont" >
            	<div class="min_cont_icon trash_blue"></div>
            	<h4 class="min_cont_title">폐기물</h4>
				<p class="min_cont_num" id="indiwaste_sum">1111</p>
				<p class="tCO₂eq">tCO₂eq</p>
            </div>
        </section>
    </div>
</body>
<script>
	$(function() {
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
		$.post('/desposeData.do', { "year" : year }, function(json) {
			console.log(json)
			$("#cf_barchart").empty(); // 초기화 후 재생성
			despose_barchart('cf_barchart', json);
			//despose_stackbarchart('cf_barchart', json);
			
			$("#energy").empty(); 
			despose_energy('energy', json);
			$("#energy_sum").empty();
			$("#energy_sum").html(comma(json.energy_sum));
			
			$("#indus").empty(); 
			despose_indus('indus', json);
			$("#indus_sum").empty();
			$("#indus_sum").html(comma(json.indus_sum));
			
			$("#agri").empty();
			despose_agri('agri', json);
			$("#agri_sum").empty();
			$("#agri_sum").html(comma(json.agri_sum));
			
			$("#lulucf").empty(); 
			despose_lulucf('lulucf', json);
			$("#lulucf_sum").empty();
			$("#lulucf_sum").html(comma(json.lulucf_sum));
			
			$("#waste").empty(); 
			despose_waste('waste', json);
			$("#waste_sum").empty();
			$("#waste_sum").html(comma(json.waste_sum));
			
			$("#elect").empty(); 
			despose_elect('elect', json);
			$("#elect_sum").empty();
			$("#elect_sum").html(comma(json.elect_sum));
			
			$("#indiwaste").empty();
			despose_indiwaste('indiwaste', json);
			$("#indiwaste_sum").empty();
			$("#indiwaste_sum").html(comma(json.indiwaste_sum));
			
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
			
			$("#detail_graph_title").empty();
			$("#detail_graph_title").html(json.year + "년 배출량 상세 그래프" + '<span class="unit">(단위 : tCO₂eq)</span>');
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
			label.innerHTML += '<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><path fill="#0075ff" d="M201.4 342.6c12.5 12.5 32.8 12.5 45.3 0l160-160c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L224 274.7 86.6 137.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l160 160z"/></svg>';
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
	
	//에너지, 산업공정, 농업, lulu cf, 폐기물(직간접 따로), 전력 그래프/숫자 컨텐츠 클릭해서 번갈아가면서 볼 수 있는 기능
    $(document).ready(function () {
        $(".folding_wrap .graph_cont").click(function () {
            if($(this).hasClass('expanded')){ //누른 컨텐츠가 이미 그래프 컨텐츠를 보여주는 상태인 경우
            	$(this).removeClass('expanded'); //크기 줄이기
            	$('.folding_wrap .chart_box').css('display', 'none'); //모든 그래프 차트 박스 숨기기
            	$(this).find('.min_cont').css('display', 'flex'); //클릭한 부분의 숫자 컨텐츠 보이기
            } else { //숫자 컨텐츠가 보이는 상태의 부분을 클릭한 경우
            	$(".folding_wrap .graph_cont").removeClass('expanded'); //모든 박스 크기 줄이기
            	$('.folding_wrap .chart_box').css('display', 'none'); //모든 그래프 차트 박스 숨기기
            	$('.min_cont').css('display', 'flex'); //숫자 컨텐츠만 보이기
                $(this).addClass("expanded"); //클릭한 부분의 크기 키우기
                $(this).find('.chart_box').css('display', 'flex'); //클릭한 부분의 그래프 차트 박스 보이기
                $(this).find('.min_cont').css('display', 'none'); //클릭한 부분의 숫자 컨텐츠 숨기기
            }
        });
    });

</script>
</html>
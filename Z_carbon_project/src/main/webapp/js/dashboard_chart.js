function dashboard_barchart(area_id, data) { // 대시보드 첫 번째 차트 - 연간 총 배출량

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.year_date/*["2015년", "2016년", "2017년", "2018년", "2019년", "2020년"]*/,
			datasets: [{
				label: '직접배출',
				data: data.data_val_2/*[917254, 972529, 951253, 1064555, 1032352, 1032323]*/,
				backgroundColor: 'rgba(46,253,129,0.5)',
				borderColor: 'rgba(46,253,129,1)',
				borderWidth: 2,
				fill: false,
				barPercentage: 0.5,
			}, {
				label: '간접배출',
				data: data.data_val_10/*[601254, 712529, 751253, 864555, 902352, 962323]*/,
				backgroundColor: 'rgba(45,115,251,0.5)',
				borderColor: 'rgba(45,115,251,1)',
				borderWidth: 2,
				fill: false,
				barPercentage: 0.5, // bar 굵기 조절
			}],
		},
		options: {
			onClick: function(point,event) {
				if (event.length <= 0) return;
				var clickedElementindex = event[0]["_index"];
				console.log("labels"+myChart.data.labels[clickedElementindex])
				var year = myChart.data.labels[clickedElementindex];
				Dashboard_piechart(year);
			},
			responsive: true, // 반응형 설정 활성화
        	maintainAspectRatio: false, // 가로세로비율유지X
			layout : {
				padding:{
					left:20,
					top : 70,
					right:20,
					bottom:20
				},
			},  
			datalabels: {
				color: '#FFFFFF',
				display: function(context) {
					return context.dataset.data[context.dataIndex] > 150000;
				},
				font: {
					weight: 'bold'
				},
				formatter: function(value, context) {
					let result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					return result
				},
			},
			legend: {
				display: true,
				position: 'bottom',
				labels : {
					fontColor:'#D5D5D5',
				},
			},
			scales: {
				yAxes: [{
					stacked: true,
					gridLines: {
						color: "rgba(204, 204, 204,0.1)",
						zeroLineWidth : 1, //y축 0 부분의 선 두께
						zeroLineColor : 'rgba(255,255,255,0.5)', //y축 0 부분의 선 색깔
					},
					ticks: {
						min: 0,
						maxTicksLimit: 5,
					},
				}],
				xAxes: [{
					stacked: true,
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
					
				}]
			},
		},
	});
}	

function dashboard_pie_chart(area_id,data) { // 대시보드 파이 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#ffffff';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: data.cate_nm,
			datasets: [{
				data: data.Low_arr, //58,42
				backgroundColor: ['rgba(46,253,129,0.5)', 'rgba(42,232,177,0.5)','rgba(53,243,227,0.5)','rgba(56,227,255,0.5)', 'rgba(50,203,247,0.5)', 'rgba(42,154,232,0.5)', 'rgba(45,115,251,0.5)'],
				borderColor: ['rgba(46,253,129,1)', 'rgba(42,232,177,1)','rgba(53,243,227,1)','rgba(56,227,255,1)', 'rgba(50,203,247,1)', 'rgba(42,154,232,1)', 'rgba(45,115,251,1)'],
			}],
		},
		options: {
			//cutoutPercentage: 85, 
			responsive: true, // 반응형 설정 활성화
        	maintainAspectRatio: false, // 가로세로비율유지X
			legend: {
				display: true,
				position: 'right',
				labels : {
					fontColor:'#D5D5D5',
				},
			},
			layout : {
				padding:{
					left:20,
					top : 70,
					right:20,
					bottom:30
				},
			},  
			plugins: {
				datalabels: {
					color: '#ffffff',
					display: function(context) {
						return context.dataset.data[context.dataIndex] > 1000000;
					},
					font: {
						weight: 'bold'
					},
				},
		
			},
			
		},
	});
}

//누적 라인그래프 -> 지금은 안 씀
function dashboard_stacked_linechart(area_id, json) {
	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';
	var ctx = document.getElementById(area_id).getContext("2d");

	//누적 라인그래프 배경 그라데이션
	function createLinearGradient(ctx, startColor, endColor) {
	    var gradient = ctx.createLinearGradient(0, 0, 0, 400);
	    gradient.addColorStop(0, startColor);
	    gradient.addColorStop(1, endColor);
    	return gradient;
	}

	// 그라데이션 생성 및 사용 예제
	var gradient1 = createLinearGradient(ctx, 'rgba(46,253,129,1)', 'rgba(0,0,0,0)');
	var gradient2 = createLinearGradient(ctx, 'rgba(42,232,177,1)', 'rgba(0,0,0,0)');
	var gradient3 = createLinearGradient(ctx, 'rgba(53,243,227,1)', 'rgba(0,0,0,0)');
	var gradient4 = createLinearGradient(ctx, 'rgba(56,227,255,1)', 'rgba(0,0,0,0)');
	var gradient5 = createLinearGradient(ctx, 'rgba(50,203,247,1)', 'rgba(0,0,0,0)');
	var gradient6 = createLinearGradient(ctx, 'rgba(42,154,232,1)', 'rgba(0,0,0,0)');
	var gradient7 = createLinearGradient(ctx, 'rgba(45,115,251,1)', 'rgba(0,0,0,0)');
	
	const loggedIn = [26, 36, 42, 38, 40, 30, 12];
	const available = [34, 44, 33, 24, 25, 28, 25];
	const availableForExisting = [16, 13, 25, 33, 40, 33, 45];
	const unavailable = [5, 9, 10, 9, 18, 19, 20];
	const xData = [13, 14, 15, 16, 17, 18, 19];

	const myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: json.year,
			datasets: [{
				label: "에너지",
				fill: true,
				backgroundColor: gradient1,
				pointBackgroundColor: 'rgba(46,253,129,1)',
				borderColor: 'rgba(46,253,129,1)',
				pointHighlightStroke: 'rgba(46,253,129,1)',
				borderCapStyle: 'butt',
				data:  json.stack_data[0],

			}, {
				label: "산업공정",
				fill: true,
				backgroundColor: gradient2,
				pointBackgroundColor: 'rgba(42,232,177,1)',
				borderColor: 'rgba(42,232,177,1)',
				pointHighlightStroke: 'rgba(42,232,177,1)',
				borderCapStyle: 'butt',
				data: json.stack_data[1],
			}, {
				label: "농업",
				fill: true,
				backgroundColor: gradient3,
				pointBackgroundColor: 'rgba(53,243,227,1)',
				borderColor: 'rgba(53,243,227,1)',
				pointHighlightStroke: 'rgba(53,243,227,1)',
				borderCapStyle: 'butt',
				data: json.stack_data[2],
			}, {
				label: "LULUCF",
				fill: true,
				backgroundColor: gradient4,
				pointBackgroundColor: 'rgba(56,227,255,1)',
				borderColor: 'rgba(56,227,255,1)',
				pointHighlightStroke: 'rgba(56,227,255,1)',
				data: json.stack_data[3],
			}, {
				label: "폐기물",
				fill: true,
				backgroundColor: gradient5,
				pointBackgroundColor: 'rgba(50,203,247,1)',
				borderColor: 'rgba(50,203,247,1)',
				pointHighlightStroke: 'rgba(50,203,247,1)',
				data: json.stack_data[4],
			}, {
				label: "전력",
				fill: true,
				backgroundColor: gradient6,
				pointBackgroundColor: 'rgba(42,154,232,1)',
				borderColor: 'rgba(42,154,232,1)',
				pointHighlightStroke: 'rgba(42,154,232,1)',
				data: json.stack_data[5],
			}, {
				label: "폐기물(간접)",
				fill: true,
				backgroundColor: gradient7,
				pointBackgroundColor: 'rgba(45,115,251,1)',
				borderColor: 'rgba(45,115,251,1)',
				pointHighlightStroke: 'rgba(45,115,251,1)',
				data: json.stack_data[6],
			}]
		},
		options: {
			responsive: true, // 반응형 설정 활성화
        	maintainAspectRatio: false, // 가로세로비율유지X
			layout : {
				padding:{
					left:20,
					top : 70,
					right:20,
					bottom:20
				},
			},  
			legend : {
				display:true,
				position : 'bottom',
			},
			responsive: false,
			// Can't just just `stacked: true` like the docs say
			scales: {
				yAxes: [{
					stacked: true,
				}]
			},
			animation: {
				duration: 750,
			},
			plugins : {
				datalabels : {
					display:false,
				},
			},			
		}
	});
}

function dashboard_d_barchart(area_id, data) { // 감축인벤토리 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';
	
	var min_data = Math.min(...data.Low_arr);
	console.log(min_data);
	
	
	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.prdt_nm,
			datasets: [{
				data: data.Low_arr,
				backgroundColor: function(context) {
                    var value = context.dataset.data[context.dataIndex];
                    return value <= 0 ? 'rgba(45,115,251,1)' : 'rgba(50,203,247,1)'; //앞의 색이 음수배경색, 뒤의 색이 양수배경색
                },
				fill:true,
				barPercentage: 0.7,
			}],
		},
		options: {
			responsive: true,
			maintainAspectRatio : false,
			layout : {
				padding:{
					left:20,
					top : 70,
					right:20,
					bottom:20
				},
			},  
			legend: {
				display: false,
				position: 'bottom'
			},
			plugins: {
				datalabels: {
					display:false,
				}
			},

			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)",
						zeroLineWidth : 1, //y축 0 부분의 선 두께
						zeroLineColor : 'rgba(255,255,255,0.5)', //y축 0 부분의 선 색깔
					},
					
				}],
				xAxes: [{
					gridLines: {
						color: /*"rgba(204, 204, 204,0.1)"*/
						(context) => {
							console.log("tetsetests" + context)
							if(context.ticks.value === 0){
								return "blue"
							}
						},
					},
				}],
			}
		},
	});
}
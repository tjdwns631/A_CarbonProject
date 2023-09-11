function dashboard_barchart(area_id, data) { // 대시보드 첫 번째 차트 - 연간 총 배출량

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.year/*["2015년", "2016년", "2017년", "2018년", "2019년", "2020년"]*/,
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
				data: data.data_val_2/*[601254, 712529, 751253, 864555, 902352, 962323]*/,
				backgroundColor: 'rgba(45,115,251,0.5)',
				borderColor: 'rgba(45,115,251,1)',
				borderWidth: 2,
				fill: false,
				barPercentage: 0.5, // bar 굵기 조절
			}],
		},
		options: {
			layout : {
				padding: 20,
			},
			title : {
			 	display: true,
				position : 'top',
		        text: '연간 총 배출량',
				fontColor: '#FFFFFF',
				fontSize:20,
				fontStyle:600,
			},
			legend: {
				display: true,
				position: 'bottom',
				labels : {
					fontColor:'#D5D5D5',
				}
			},
			plugins: {
				
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
				}
			},
			scales: {
				yAxes: [{
					stacked: true,
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
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
			}
		},
	});
}

//누적 라인그래프
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
			layout : {
				padding: 20,
			},
			title : {
			 	display: true,
				position : 'top',
		        text: '누적 라인 그래프',
				fontColor: '#FFFFFF',
				fontSize:20,
				fontStyle:600,
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

function dashboard_d_barchart(area_id, data) { // 대시보드 3번째 차트

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
				backgroundColor: 'rgba(45,115,251,1)',
				fill:true,
				barPercentage: 0.7,
			}],
		},
		options: {
			layout : {
				padding: 20,
			},
			title : {
			 	display: true,
				position : 'top',
		        text: '감축 인벤토리',
				fontColor: '#FFFFFF',
				fontSize:20,
				fontStyle:600,
			},
			legend: {
				display: false,
				position: 'bottom'
			},
			plugins: {
				datalabels: {
					display:false,
			/*		color: '#D5D5D5',
					display: function(context) {
						return context.dataset.data[context.dataIndex] > 150000;
					},
					font: {
						weight: 'bold'
					},
					formatter: function(value, context) {
						let result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						return result
					},*/
				}
			},
			responsive: true,
			maintainAspectRatio : false,
			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
				}],
				xAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
				}]
			}
		},
	});
}

function dashboard_pie_chart(area_id) { // 대시보드 파이 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: ["직접배출량", "간접배출량"],
			datasets: [{
				data: [61, 39], //58,42
				backgroundColor: ['#4f11d450', '#11d4b750'],
				borderColor: ['#4f11d4', '#11d4b7'],
			}],
		},
		options: {
			cutoutPercentage: 85,
			legend: {
				//display: false,
			},
			plugins: {
				doughnutlabel: {
					labels: [
						{
							text: 'The title4433434',
							font: {
								size: '60'
							},
							color: 'red'
						},
					]
				},
				datalabels: {
					//display: false,
					color: '#D5D5D5',
					display: function(context) {
						return context.dataset.data[context.dataIndex] > 15;
					},
					font: {
						weight: 'bold'
					},
					formatter: function(value, context) {
						let result = value + "%";
						return result
					},
				},
		
			},
/*			elements: {
				center: {
					text: '12313123131',
					color: 'white',
					fontStyle: 'Helvetica', //Default Arial 
					//sidePadding: 15 //Default 20 (as a percentage) 
				}
			},*/
		},
	});
}
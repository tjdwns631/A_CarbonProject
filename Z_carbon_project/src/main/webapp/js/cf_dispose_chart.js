function dispose_yearchart(area_id, data) { // 총 배출량(직접/간접)

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';
	
	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.year_date,
			datasets: [{
				label: '직접배출',
				data: data.data_val_2,
				backgroundColor: 'rgba(46,253,129,0.5)',
				borderColor: 'rgba(46,253,129,1)',
				borderWidth: 2,
				fill: false,
				barPercentage: 0.5,
			}, {
				label: '간접배출',
				data: data.data_val_10,
				backgroundColor: 'rgba(45,115,251,0.5)',
				borderColor: 'rgba(45,115,251,1)',
				borderWidth: 2,
				fill: false,
				barPercentage: 0.5, // bar 굵기 조절
			}],
		},
		options: {
			layout : {
				padding:{
					left:20,top : 70,right:20,bottom:20
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

function despose_barchart(area_id, data) { // 배출량 상세 그래프

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	var min_data = Math.min(...data.Low_arr);
	console.log(min_data);


	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.cate_nm,
			datasets: [{
				data: data.Low_arr,
				backgroundColor: ['rgba(46,253,129,0.5)','rgba(46,253,129,0.5)','rgba(46,253,129,0.5)','rgba(46,253,129,0.5)', 'rgba(46,253,129,0.5)', 'rgba(45,115,251,0.5)', 'rgba(45,115,251,0.5)'],
				borderColor: ['rgba(46,253,129,1)','rgba(46,253,129,1)','rgba(46,253,129,1)','rgba(46,253,129,1)', 'rgba(46,253,129,1)', 'rgba(45,115,251,1)', 'rgba(45,115,251,1)'],
				borderWidth:2,
				fill: true,
				barPercentage: 0.7,
			}],
		},
		options: {
			layout: {
				padding: {
					left: 20,
					top: 70,
					right: 20,
					bottom: 20
				},
			},
			legend: {
				display: false,
				position: 'bottom'
			},
			plugins: {
				datalabels: {
					display: false,
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
			maintainAspectRatio: false,
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
						color: "rgba(204, 204, 204,0.1)"
					},
				}]
			}
		},
	});
}

function despose_stackbarchart(area_id, data) { // 스택 바 차트 보류 불가능 할듯

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	var min_data = Math.min(...data.Low_arr);

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.cate_nm,
			datasets: [{
				data: data.energy_val,
				backgroundColor: 'rgba(45,115,251,1)',
				fill: true,
				barPercentage: 0.7,
			}],
		},
		options: {
			layout: {
				padding: {
					left: 20,
					top: 70,
					right: 20,
					bottom: 20
				},
			},
			legend: {
				display: false,
				position: 'bottom'
			},
			plugins: {
				datalabels: {
					display: false,
				}
			},
			maintainAspectRatio: false,
			scales: {
				yAxes: [{
					stacked: true,
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
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

function despose_pie(area_id,data) { // 현황조회 파이 차트

	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: data.cate_nm,
			datasets: [{
				data: data.Low_arr,
				backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)'],
				borderColor: ['rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)'],
			}],
		},
		options: {
			responsive:false,
		},
	});
}

function despose_pie2(area_id) { // 현황조회 파이 차트

	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: ["에너지", "AFOLU"],
			datasets: [{
				data: [61, 39], //58,42
				backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)'],
				borderColor: ['rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)'],
			}],
		},
		options: {
			plugins: {
				datalabels: {
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
				}
			},
		},
	});
}

function despose_table_chart(area_id) { // 현황조회 테이블 차트

	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ["휘발유", "등유", "경유", "벙커A유","벙커C유","용제","프로판","부탄","중유형","등유형"],
			datasets: [{
				label: '배출량',
				data: [2, 6747, 2460, 197, 61, 120, 30575, 1497, 1718, 463],
				backgroundColor: 'rgba(255, 99, 132, 0.2)',
				borderColor: 'rgba(255,99,132,1)',
				borderWidth: 1,
				fill: false,
				barPercentage: 0.5,
			}],
		},
		options: {
			plugins: {
				datalabels: {
					color: '#D5D5D5',
					display: function(context) {
						return context.dataset.data[context.dataIndex] > 100;
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
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
					ticks: {
						min: 0,
						maxTicksLimit: 4,
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

function despose_energy(area_id, data) { // 직접 - 에너지 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#ffffff';

	//var min_data = Math.min(...data.energy_nm);
	var	limit = 0;
	if(data.energy_sum == 0 || data.energy_sum == null){
		limit = 1;
	}

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.energy_nm,
			datasets: [{
				data: data.energy_val,
				backgroundColor: 'rgba(46,253,129,0.5)',
				borderColor: 'rgba(46,253,129,1)',
				borderWidth: 2,
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
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)",
						zeroLineWidth : 1, //y축 0 부분의 선 두께
						zeroLineColor : 'rgba(255,255,255,0.5)', //y축 0 부분의 선 색깔
					},
					ticks: {
						maxTicksLimit: limit,
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

function despose_indus(area_id, data) { // 직접 - 산업공정 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#ffffff';

	var	limit = 0;
	if(data.indus_sum == 0 || data.indus_sum == null){
		limit = 1;
	}

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.indus_nm,
			datasets: [{
				data: data.indus_val,
				backgroundColor: 'rgba(46,253,129,0.5)',
				borderColor: 'rgba(46,253,129,1)',
				borderWidth: 2,
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
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)",
						zeroLineWidth : 1, //y축 0 부분의 선 두께
						zeroLineColor : 'rgba(255,255,255,0.5)', //y축 0 부분의 선 색깔
					},
					ticks: {
						min:0,
						maxTicksLimit: limit,
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

function despose_agri(area_id, data) { // 직접 - 농업 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#ffffff';

	var	limit = 0;
	if(data.agri_sum == 0){
		limit = 1;
	}

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.agri_nm,
			datasets: [{
				data: data.agri_val,
				backgroundColor: 'rgba(46,253,129,0.5)',
				borderColor: 'rgba(46,253,129,1)',
				borderWidth: 2,
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
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)",
						zeroLineWidth : 1, //y축 0 부분의 선 두께
						zeroLineColor : 'rgba(255,255,255,0.5)', //y축 0 부분의 선 색깔
					},
					ticks: {
						min : 0,
						maxTicksLimit: limit,
					}
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

function despose_lulucf(area_id, data) { // 직접 -lulu cf 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#ffffff';

	var	limit = 0;
	if(data.lulucf_sum == 0){
		limit = 1;
	}

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.lulucf_nm,
			datasets: [{
				data: data.lulucf_val,
				borderWidth: 2,
				backgroundColor: function(context) {
                    var value = context.dataset.data[context.dataIndex];
                    return value <= 0 ? 'rgba(42,232,177,0.5)' : 'rgba(46,253,129,0.5)'; //앞의 색이 음수배경색, 뒤의 색이 양수배경색
                },
				borderColor: function(context2) {
                    var value = context2.dataset.data[context2.dataIndex];
                    return value <= 0 ? 'rgba(42,232,177,1)' : 'rgba(46,253,129,1)'; //앞의 색이 음수배경색, 뒤의 색이 양수배경색
                },
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
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)",
						zeroLineWidth : 1, //y축 0 부분의 선 두께
						zeroLineColor : 'rgba(255,255,255,0.5)', //y축 0 부분의 선 색깔
					},
					ticks: {
						maxTicksLimit: limit,
					}
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
function despose_waste(area_id, data) { // 간접 - 전력 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#ffffff';
	
	var	limit = 0;
	if(data.waste_sum == 0){
		limit = 1;
	}

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.waste_nm,
			datasets: [{
				data: data.waste_val,
				backgroundColor: 'rgba(45,115,251,0.5)',
				borderColor: 'rgba(45,115,251,1)',
				borderWidth: 2,
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
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)",
						zeroLineWidth : 1, //y축 0 부분의 선 두께
						zeroLineColor : 'rgba(255,255,255,0.5)', //y축 0 부분의 선 색깔
					},
					ticks: {
						min:0,
						maxTicksLimit: limit,
					}
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
function despose_elect(area_id, data) { // 간접 - 페기물 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#ffffff';

	var	limit = 0;
	if(data.elect_sum == 0){
		limit = 1;
	}

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.elect_nm,
			datasets: [{
				data: data.elect_val,
				backgroundColor: 'rgba(45,115,251,0.5)',
				borderColor: 'rgba(45,115,251,1)',
				borderWidth: 2,
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
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)",
						zeroLineWidth : 1, //y축 0 부분의 선 두께
						zeroLineColor : 'rgba(255,255,255,0.5)', //y축 0 부분의 선 색깔
					},
					ticks: {
						min:0,
						maxTicksLimit: limit,
					}
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
function despose_indiwaste(area_id, data) { // 간접 - 폐기물

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#ffffff';

	var	limit = 0;
	if(data.indiwaste_sum == 0){
		limit = 1;
	}

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.indiwaste_nm,
			datasets: [{
				data: data.indiwaste_val,
				backgroundColor: 'rgba(45,115,251,0.5)',
				borderColor: 'rgba(45,115,251,1)',
				borderWidth: 2,
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
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)",
						zeroLineWidth : 1, //y축 0 부분의 선 두께
						zeroLineColor : 'rgba(255,255,255,0.5)', //y축 0 부분의 선 색깔
					},
					ticks: {
						min : 0,
						maxTicksLimit: limit,
					}
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
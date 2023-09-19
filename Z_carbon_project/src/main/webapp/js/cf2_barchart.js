function despose_energy(area_id, data) { // 에너지 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	//var min_data = Math.min(...data.energy_nm);

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.energy_nm,
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
			responsive: true,
			maintainAspectRatio: false,
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

function despose_indus(area_id, data) { // 에너지 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';


	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.indus_nm,
			datasets: [{
				data: data.indus_val,
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
			responsive: true,
			maintainAspectRatio: false,
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

function despose_agri(area_id, data) { // 에너지 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.agri_nm,
			datasets: [{
				data: data.agri_val,
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
			responsive: true,
			maintainAspectRatio: false,
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

function despose_lulucf(area_id, data) { // 에너지 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.lulucf_nm,
			datasets: [{
				data: data.lulucf_val,
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
			responsive: true,
			maintainAspectRatio: false,
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
function despose_waste(area_id, data) { // 에너지 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.waste_nm,
			datasets: [{
				data: data.waste_val,
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
			responsive: true,
			maintainAspectRatio: false,
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
function despose_elect(area_id, data) { // 에너지 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.elect_nm,
			datasets: [{
				data: data.elect_val,
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
			responsive: true,
			maintainAspectRatio: false,
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
function despose_indiwaste(area_id, data) { // 에너지 차트

	Chart.defaults.global.defaultFontFamily = 'pretendard', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#D5D5D5';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.indiwaste_nm,
			datasets: [{
				data: data.indiwaste_val,
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
			responsive: true,
			maintainAspectRatio: false,
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
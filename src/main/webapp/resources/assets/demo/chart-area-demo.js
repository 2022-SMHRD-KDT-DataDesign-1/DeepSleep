// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example

$(document).ready(function() {
	getGraph1();
});


function getGraph1() {
	let dayList = [];
	let dntList = [];
	var user_idx = $("#user_id").val();

	$.ajax({
		url: "chartDay.do",
		type: "get",
		data: { "id": user_idx },
		dataType: "json",
		success: function(data) {
			console.log(user_idx);

			for (let i = 0; i < data.length; i++) {
				dayList.push(data[i].day);
				dntList.push(data[i].dnt);
			}
			console.log(dayList);
			console.log(dntList);


			/*기본 차트*/
			var ctx = document.getElementById("myAreaChart");
			var myLineChart = new Chart(ctx, {
				type: 'line',
				data: {
					labels: dayList,	// x축
					datasets: [{
						label: "업로드 수",
						lineTension: 0.3,
						backgroundColor: 'rgba( 255, 255, 255, 0.5 )',
						borderColor: [
							'rgba(255, 99, 132, 0.5)',
							'rgba(54, 162, 235, 0.5)',
							'rgba(255, 206, 86, 0.5)',
							'rgba(75, 192, 192, 0.5)',
							'rgba(153, 102, 255, 0.5)',
							'rgba(255, 159, 64, 0.5)',
							'rgba(255, 000, 000, 0.5)'],
						boardWidth:2,
						pointRadius: 5,
						pointBackgroundColor: [
							'rgba(255, 99, 132, 0.5)',
							'rgba(54, 162, 235, 0.5)',
							'rgba(255, 206, 86, 0.5)',
							'rgba(75, 192, 192, 0.5)',
							'rgba(153, 102, 255, 0.5)',
							'rgba(255, 159, 64, 0.5)',
							'rgba(255, 000, 000, 0.5)'],
						pointBorderColor: "rgba(255,255,255,0.8)",
						pointHoverRadius: 5,
						pointHoverBackgroundColor: [
							'rgba(255, 99, 132, 0.5)',
							'rgba(54, 162, 235, 0.5)',
							'rgba(255, 206, 86, 0.5)',
							'rgba(75, 192, 192, 0.5)',
							'rgba(153, 102, 255, 0.5)',
							'rgba(255, 159, 64, 0.5)',
							'rgba(255, 000, 000, 0.5)'],
						pointHitRadius: 50,
						pointBorderWidth: 2,
						data: dntList,	// y축
					}],
				},
				options: {
					scales: {
						xAxes: [{
							time: {
								unit: 'date'
							},
							gridLines: {
								display: false
							},
							ticks: {
								maxTicksLimit: 30
							}
						}],
						yAxes: [{
							ticks: {
								min: 0,
								max: 10,
								maxTicksLimit: 5
							},
							gridLines: {
								color: "rgba(0, 0, 0, .125)",
							}
						}],
					},
					legend: {
						display: false
					}
				}
			});
			/*차트 끝*/

		},
		error: function() {

		},
		// ajax 끝나기 전에 async:false 처리 해야 비동기화 해서 선언된 배열에 값 넣을 수 있음
		async: false
	})
}


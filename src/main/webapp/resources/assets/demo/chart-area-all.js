// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example

$(document).ready(function() {
	getGraph3();
});


function getGraph3() {
	let dayList = [];      	// 라벨 리스트
	let dntList = [];		// 데이터 리스트
	var user_idx = $("#user_id").val();

	$.ajax({
		url: "allChartDay.do",
		type: "get",
		dataType: "json",
		success: function(data) {

			for (let i = 0; i < data.length; i++) {
				dayList.push(data[i].day);
				dntList.push(data[i].dnt);
			}

			console.log(dayList);
			console.log(dntList);
			
			// 데이터 리스트 중 최고값
			maxValue = dntList[0];
			
			for (let i = 0; i < dntList.length; i++) {
				if (maxValue < dntList[i]) {
					maxValue = dntList[i];
				}
			}
			
			
			maxValue = maxValue + (10 - (maxValue % 10));

			console.log(maxValue);

			/*기본 차트*/
			var ctx = document.getElementById("allAreaChart");
			var myLineChart = new Chart(ctx, {
				type: 'line',
				data: {
					labels: dayList,	// x축 (라벨 리스트)
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
						boardWidth: 2,
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
						data: dntList,	// y축 (데이터 리스트)
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
								max: maxValue,		// 데이터의 최고값 + (10-(최고값%10))
								maxTicksLimit: 10
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


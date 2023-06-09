// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example

$(document).ready(function() {
	getGraph4();
});


function getGraph4() {
	let monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];		// 라벨리스트
	let mntList = [];	// 데이터 리스트
	let January = 0; let February = 0; let March = 0; let April = 0; let May = 0; let June = 0; let July = 0; let August = 0; let September = 0; let October = 0; let November = 0; let December = 0;
	var user_idx = $("#user_id").val();

	$.ajax({
		url: "allChartMonth.do",
		type: "get",
		dataType: "json",
		success: function(data) {

			for (let i = 0; i < data.length; i++) {
				if (data[i].month == 1) {
					mntList.push(January += data[i].mnt);
				} else if (data[i].month == 2) {
					mntList.push(February += data[i].mnt);
				} else if (data[i].month == 3) {
					mntList.push(March += data[i].mnt);
				} else if (data[i].month == 4) {
					mntList.push(April += data[i].mnt);
				} else if (data[i].month == 5) {
					mntList.push(May += data[i].mnt);
				} else if (data[i].month == 6) {
					mntList.push(June += data[i].mnt);
				} else if (data[i].month == 7) {
					mntList.push(July += data[i].mnt);
				} else if (data[i].month == 8) {
					mntList.push(August += data[i].mnt);
				} else if (data[i].month == 9) {
					mntList.push(September += data[i].mnt);
				} else if (data[i].month == 10) {
					mntList.push(October += data[i].mnt);
				} else if (data[i].month == 11) {
					mntList.push(November += data[i].mnt);
				} else if (data[i].month == 12) {
					mntList.push(December += data[i].mnt);
				}
			}

			a = [January, February, March, April, May, June, July, August, September, October, November, December];

			maxValue = a[0];
			for (let i = 0; i < a.length; i++) {
				if (maxValue < a[i]) {
					maxValue = a[i];
				}
			}

			maxValue = maxValue + (10 - (maxValue % 10));

			console.log(monthList);
			console.log(mntList);

			console.log(maxValue);
			
			/*기본 차트*/
			var ctx = document.getElementById("allBarChart");
			var myLineChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: monthList,		// x축
					datasets: [{
						label: "업로드 수",
						backgroundColor: [
							'rgba(255, 99, 132, 0.5)',
							'rgba(54, 162, 235, 0.5)',
							'rgba(255, 206, 86, 0.5)',
							'rgba(75, 192, 192, 0.5)',
							'rgba(153, 102, 255, 0.5)',
							'rgba(255, 159, 64, 0.5)',
							'rgba(255, 000, 000, 0.5)',
							'rgba(153, 255, 255, 0.5)',
							'rgba(255, 255, 102, 0.5)',
							'rgba(204, 255, 102, 0.5)',
							'rgba(204, 000, 255, 0.5)',
							'rgba(255, 153, 153, 0.5)'
						],
						borderColor: [
							'rgba(255, 99, 132, 0.5)',
							'rgba(54, 162, 235, 0.5)',
							'rgba(255, 206, 86, 0.5)',
							'rgba(75, 192, 192, 0.5)',
							'rgba(153, 102, 255, 0.5)',
							'rgba(255, 159, 64, 0.5)',
							'rgba(255, 000, 000, 0.5)',
							'rgba(153, 255, 255, 0.5)',
							'rgba(255, 255, 102, 0.5)',
							'rgba(204, 255, 102, 0.5)',
							'rgba(204, 000, 255, 0.5)',
							'rgba(255, 153, 153, 0.5)'
						],
						data: mntList,		// y축
					}],
				},
				options: {
					scales: {
						xAxes: [{
							time: {
								unit: 'month'
							},
							gridLines: {
								display: false
							},
							ticks: {
								maxTicksLimit: 13
							}
						}],
						yAxes: [{
							ticks: {
								min: 0,
								max: maxValue,
								maxTicksLimit: 10
							},
							gridLines: {
								display: true
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
// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example

$(document).ready(function(){
	getGraph2();
});


function getGraph2() {
	let monthList = ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"];
	let mntList = [];
	let  January=0; let February=0; let March=0; let April=0; let May=0; let June=0; let July=0; let August=0; let September=0; let October=0; let November=0; let December=0;
	var user_idx = $("#user_id").val();
	
	$.ajax({
		url: "chartMonth.do",
		type: "get",
		data: { "id": user_idx},
		dataType: "json",
		success: function(data) {
			console.log(user_idx);
			for (let i = 0; i < data.length; i++) {
				if(data[i].month == 1){
					mntList.push(January += data[i].mnt);					
				} else if(data[i].month == 2){
					mntList.push(February += data[i].mnt);		
				} else if (data[i].month == 3){
					mntList.push(March += data[i].mnt);
				} else if (data[i].month == 4){
					mntList.push(April += data[i].mnt);	
				} else if (data[i].month == 5){
					mntList.push(May += data[i].mnt);
				} else if (data[i].month == 6){
					mntList.push(June += data[i].mnt);
				} else if (data[i].month == 7){
					mntList.push(July += data[i].mnt);
				} else if (data[i].month == 8){
					mntList.push(August += data[i].mnt);
				} else if (data[i].month == 9){
					mntList.push(September += data[i].mnt);	
				} else if (data[i].month == 10){
					mntList.push(October += data[i].mnt);
				} else if (data[i].month == 11){
					mntList.push(November += data[i].mnt);
				} else if (data[i].month == 12){
					mntList.push(December += data[i].mnt);
				}
			}
			console.log(monthList);
			console.log(mntList);
			
			
			/*기본 차트*/
			var ctx = document.getElementById("myBarChart");
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
							'rgba(255, 159, 64, 0.5)'],
						borderColor: ['rgb(255, 99, 132,1.5)',
							'rgba(54, 162, 235, 1.5)',
							'rgba(255, 206, 86, 1.5)',
							'rgba(75, 192, 192, 1.5)',
							'rgba(153, 102, 255, 1.5)',
							'rgba(255, 159, 64, 1.5)'],
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
								max: 100,
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
		error:function(){
		
		},
		// ajax 끝나기 전에 async:false 처리 해야 비동기화 해서 선언된 배열에 값 넣을 수 있음
		async: false
	})
}
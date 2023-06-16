// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example

$(document).ready(function(){
	getGraph2();
});


function getGraph2() {
	let monthList = ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"];
	let  J1=0; let F2=0; let M3=0; let A4=0; let M5=0; let J6=0; let J7=0; let A8=0; let S9=0; let O10=0; let N11=0; let D12=0;
	let mntList = [J1,F2,M3,A4,M5,J6,J7,A8,S9,O10,N11,D12];
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
					J1 = data[i].mnt;		
				} else if(data[i].month == 2){
					F2 = data[i].mnt;		
				} else if (data[i].month == 3){
					M3 = data[i].mnt;
				} else if (data[i].month == 4){
					A4 = data[i].mnt;	
				} else if (data[i].month == 5){
					M5 = data[i].mnt;
				} else if (data[i].month == 6){
					J6 = data[i].mnt;
				} else if (data[i].month == 7){
					J7 = data[i].mnt;
				} else if (data[i].month == 8){
					A8 = data[i].mnt;
				} else if (data[i].month == 9){
					S9 = data[i].mnt;	
				} else if (data[i].month == 10){
					O10 = data[i].mnt;
				} else if (data[i].month == 11){
					N11 = data[i].mnt;
				} else if (data[i].month == 12){
					D12 = data[i].mnt;
				} 
			}
			
			let mntList = [J1,F2,M3,A4,M5,J6,J7,A8,S9,O10,N11,D12];
			
			a = [J1,F2,M3,A4,M5,J6,J7,A8,S9,O10,N11,D12];
			maxValue = a[0];
			for(let i = 0 ; i < a.length ; i++){
				if(maxValue < a[i]) {
					maxValue = a[i];
				}
			}
			
			maxValue = maxValue + (10 -(maxValue % 10));
			
			console.log(monthList);
			console.log(mntList);
			
			console.log(maxValue);
			
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
		error:function(){
		
		},
		// ajax 끝나기 전에 async:false 처리 해야 비동기화 해서 선언된 배열에 값 넣을 수 있음
		async: false
	})
}
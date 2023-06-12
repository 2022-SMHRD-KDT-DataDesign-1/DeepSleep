console.log("js 연결")

/* 페이지가 로딩되자마자 호출 */
$('document').ready(function() {

	// 결과 json 받아오기
	$.ajax({
		type: "get",
		url: "http://127.0.0.1:5000/objectDetectionModel", // flask에서 return 값 가져오기
		dataType: "json",
		success: function(data) {

			// $('#resDiv').html(""); // 태그 초기화

			console.log("json 가져오기 성공")
			console.log(data)

			let imageArr = data.images // 결과 json에서 images 담겨 있는 배열


			let resImageName; // 결과 이미지 이름
			let resFileName; // 결과 이미지가 저장되는 파일명

			let i = 2;
			let htmlDiv = "";
			imageArr.forEach(e => {
				let arr = e.file_name.split("\\");
				resImageName = arr[arr.length - 1]; // 결과 이미지명
				resFileName = arr[arr.length - 2]; // 결과 이미지가 저장되는 파일명

				htmlDiv += `<div class="gallery-cell"><input type="checkbox" id="myCheckbox${i}" /><label for="myCheckbox${i}"><img id="resImg${i}" src="/filepath/${resFileName}/${resImageName}"></label></div>`

				i++
			})
			console.log(htmlDiv)
			$('#resDiv').append(htmlDiv).trigger("create");

		},
		error: function(e) {
			console.log("에러")
		}

	});
});

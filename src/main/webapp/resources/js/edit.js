console.log("js 연결")

// 라벨 입력 함수
$(document).ready(function() {
	$('#key1').one('click', function() {
		$('.addInput').append(
			'<input placeholder="  영어만 입력해주세요!" type="text" value="" id="inputstyle"><button type="submit" value="입력" class="btn btn-outline-primary" id = "key" onclick="repository()" style="color:#fff; border-color:#fff;">입력</button>'
		);
	});
});
//  



/* 이미지 하나 선택 후 라벨 수정하고 입력 누르면 관리자 DB에 저장 */
// 카테고리, 감지객체, 원본 사진 경로, 결과물 파일 경로
let repository = () => {
	console.log("라벨수정 ck")
	
	let keyword = $('#inputstyle').val() // 입력 키워드

	let checkIdArr = checkedImgID(); // 체크 이미지 아이디값
	console.log(checkIdArr)

	checkIdArr.forEach(k => { // 체크 아이디 리스트

		let repJson = new Object(); //  카테고리, 감지객체, 원본 사진 경로, 결과물 파일 경로 담을 json 객체 생성

		jsonRes.forEach(i => { // json 리스트
			// 아이디 값이 일치하면 json에서 값 꺼내고 db로 보낼 json 생성하기
			let imageArr = i.images
			let annoArr = i.annotations

			for (var j = 0; j < imageArr.length; j++) {
				if (annoArr[j].original_id == k) {
					console.log(annoArr[j].original_id)
					repJson.category = localStorage.getItem('cate')
					repJson.detected_object = annoArr[j].label_name  // 여기에 keyword?
					repJson.image_path = annoArr[j].original_img
					repJson.result_path = imageArr[j].file_name

					repJsonArr.push(repJson); // 배열 추가
				}

			}

		})

	});

	console.log(repJsonArr);
	// db로 저장할 json -> controller로 전송
	$.ajax({
		url: "repositorySave",  // 바꿔야되나?
		type: "post",
		contentType: "application/json",
		dataType: "text",
		data: JSON.stringify(repJsonArr),
		success: function(d) {
			console.log(d)
		},
		error: function(e) {
			console.log("실패")
		}

	});
}





// 리스트 로딩
let jsonRes = JSON.parse(localStorage.getItem('jsonRes')); // 로컬스토리지에 저장된 결과 json 불러오기
console.log(jsonRes)



let a = 1; // 겉 태그 아이디값
let b = 1; // 안 태그 아이디값 
jsonRes.forEach(k => {
   let imageArr = k.images // 결과 json에서 images 담겨 있는 배열
   let annoArr = k.annotations // 결과 json에서 annotations 담겨 있는 배열
   let resImageName; // 결과 이미지 이름
   let resFileName; // 결과 이미지가 저장되는 파일명

   // 겉 태그
   let htmlDiv1 = `<div id="resDiv${a}" class="gallery js-flickity" data-flickity-options='{ "wrapAround": true }'>`;
   $('#cellDiv').append(htmlDiv1).trigger("create"); // resDiv 추가

   let htmlDiv2 = ""; // 결과 태그 (안 태그)

   for (var i = 0; i < imageArr.length; i++) {
	  let original_id = annoArr[i].original_id; // 고유 아이디
	  let arr = imageArr[i].file_name.split("\\"); // \ 기준으로 경로 나누기
	  resImageName = arr[arr.length - 1]; // 결과 이미지명
	  resFileName = arr[arr.length - 2]; // 결과 이미지가 저장되는 파일명

	  htmlDiv2 += `<div class="gallery-cell"><input type="radio" id="myCheckbox${b}" class="optionCheck" name = "imgsel"/><label for="myCheckbox${b}"><img id="${original_id}" src="/filepath/${resFileName}/${resImageName}"></label></div>`

	  b++;

   }
   $(`#resDiv${a}`).append(htmlDiv2).trigger("create");

   a++;
});
console.log("js 연결")

let jsonRes = JSON.parse(localStorage.getItem('jsonRes')); // 로컬스토리지에 저장된 결과 json 불러오기
console.log(jsonRes)

document.getElementById('downloadBtn').addEventListener('click', () => {
	// 체크된 이미지 목록 가져오기
	checkArr = checkedImg();

	// 체크된 이미지 다운로드
	checkArr.forEach(e => {

		let img = $(`label[for='${e}']`).children('img').eq(0); // 선택된 이미지
		console.log(img.attr("id"));

		$('#hiddenA').prop('href', img.attr('src'));
		console.log(img.attr('src'))
		// $('#hiddenA').click();
		console.log('다운로드 완료??')
	})
})


/* 로드 시 결과 추가 */

// 임시 데이터 (나중에 삭제할 것)
let test1 = `<div id="resDiv${1}" class="gallery js-flickity" data-flickity-options='{ "wrapAround": true }'>`
$('#cellDiv').append(test1).trigger("create");
let test2 = '<div class="gallery-cell"><input type="checkbox" class="optionCheck" id="myCheckbox2" /><label for="myCheckbox2"><img id="resImg2" src="/filepath/new_20230609095127/person1.jpg"></label></div><div class="gallery-cell"><input class="optionCheck" type="checkbox" id="myCheckbox3" /><label for="myCheckbox3"><img id="resImg3" src="/filepath/new_20230609095127/person2.jpg"></label></div><div class="gallery-cell"><input class="optionCheck" type="checkbox" id="myCheckbox4" /><label for="myCheckbox4"><img id="resImg4" src="/filepath/new_20230609095127/person3.jpg"></label></div><div class="gallery-cell"><input class="optionCheck" type="checkbox" id="myCheckbox5" /><label for="myCheckbox5"><img id="resImg5" src="/filepath/new_20230609095127/person4.jpg"></label></div>'
$('#resDiv1').append(test2).trigger("create");
/////

let a = 1; // 겉 태그 아이디값
let b = 1; // 안 태그 아이디값 
/*jsonRes.forEach(k => {
	let imageArr = k.images // 결과 json에서 images 담겨 있는 배열
	let annoArr = k.annotations // 결과 json에서 annotations 담겨 있는 배열
	let resImageName; // 결과 이미지 이름
	let resFileName; // 결과 이미지가 저장되는 파일명

	// 겉 태그
	let htmlDiv1 = `<div id="resDiv${a}" class="gallery js-flickity" data-flickity-options='{ "wrapAround": true }'>`;
	$('#cellDiv').append(htmlDiv1).trigger("create"); // resDiv 추가

	let htmlDiv2 = ""; // 결과 태그 (안 태그)

	imageArr.forEach(e => {
		let arr = e.file_name.split("\\"); // \ 기준으로 경로 나누기
		resImageName = arr[arr.length - 1]; // 결과 이미지명
		resFileName = arr[arr.length - 2]; // 결과 이미지가 저장되는 파일명

		htmlDiv2 += `<div class="gallery-cell"><input type="checkbox" id="myCheckbox${b}" class="optionCheck" /><label for="myCheckbox${b}"><img id="resImg${b}" src="/filepath/${resFileName}/${resImageName}"></label></div>`

		b++;
	});
	$(`#resDiv${a}`).append(htmlDiv2).trigger("create");

	a++;

});*/

/* 선택된 이미지 id값 가져오는 함수 */
function checkedImg() {
	let checkBox = $('.optionCheck') // 체크박스 클래스
	let checkArr = []; // 체크된 input태크 id값 담을 배열

	for (var i = 0; i < checkBox.length; i++) {
		// checked 여부 확인
		if (checkBox[i].checked) {
			checkArr.push(checkBox.eq(i).attr('id')) // 체크된 input태크 id값 추가
		}
	}

	return checkArr;
}


/* 선택된 이미지 repository에 저장 */
// 카테고리, 감지객체, 원본 사진 경로, 결과물 파일 경로
let repository = () => {
	console.log("보관함 저장 ck")

	// 체크된 이미지 목록 가져오기
	checkArr = checkedImg();

	let checkIdArr = []; // 체크 이미지 아이디 배열

	let repJsonArr = []; // db로 보낼 json 목록 담는 배열
	// 체크된 이미지 id값 가져오기
	checkArr.forEach(e => {
		let imgID = $(`label[for='${e}']`).children('img').eq(0).attr("id"); // 선택된 이미지
		checkIdArr.push(imgID);
	})
	console.log(checkIdArr);


	checkIdArr.forEach(k => { // 체크 아이디 리스트

		let repJson = new object(); //  카테고리, 감지객체, 원본 사진 경로, 결과물 파일 경로 담을 json 객체 생성

		jsonRes.forEach(i => { // json 리스트
			// 아이디 값이 일치하면 json에서 값 꺼내고 db로 보낼 json 생성하기
			if (i.annotations.img_id == k) {
				repJson.category = localStorage.getItem('cate')
				repJson.detected_object = i.annotations.label_name
				repJson.image_path = i.annotations.original_img
				repJson.result_path = i.images.file_name

				repJsonArr.push(repJson); // 배열 추가
			}
		})

	});
	
	// db로 저장할 json -> controller로 전송
	$.ajax({
		url: "repositorySave",
		type: "post",
		contentType: "application/json",
		dataType: "text",
		data: JSON.stringify(repJsonArr),
		success: function(d) {
			console.log("성공")
		},
		error: function(e) {
			console.log("실패")
		}

	});
}


/* test 성공하면 삭제할 것 */
/*let repository = () => {
	
	let repJsonArr = [];
	
	let repJson = new Object();
	repJson.category = localStorage.getItem('cate')
	repJson.detected_object = "cat"
	repJson.image_path = "test1"
	repJson.result_path = "test1"
	repJson.user_idx = 0
	
	repJsonArr.push(repJson);
	
	repJson.category = localStorage.getItem('cate')
	repJson.detected_object = "dog"
	repJson.image_path = "test2"
	repJson.result_path = "test2"
	repJson.user_idx = 0
	
	repJsonArr.push(repJson);
	
	console.log(JSON.stringify(repJsonArr))
	
	
	$.ajax({
		url: "repositorySave",
		type: "post",
		contentType: "application/json",
		dataType: "text",
		data: JSON.stringify(repJsonArr),
		success: function(d) {
			console.log("성공")
		},
		error: function(e) {
			console.log("실패")
		}

	});
}*/
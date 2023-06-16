console.log("js 파일 연결")

// 라벨 입력 함수
$(document).ready(function() {
	$('#key1').one('click', function() {
		$('.addInput').append(
			'<input placeholder="  영어만 입력해주세요!" type="text" value="" id="inputstyle"><button type="button" value="입력" class="btn btn-outline-primary" id = "key" onclick="editLabel()" style="color:#fff; border-color:#fff;">입력</button>'
		);
	});
});

let jsonRes = JSON.parse(localStorage.getItem('jsonRes')); // 로컬스토리지에 저장된 결과 json 불러오기
console.log(jsonRes)
let imgArr = JSON.parse(sessionStorage.getItem('imgArr')); // 세션스토리지에 저장된 이미지 아이디 불러오기
console.log(imgArr)

/* 선택된 이미지 input태그 id값 가져오는 함수 */
function checkedInputImg() {
	let checkBox = $('.optionCheck') // 체크박스 클래스
	let checkArr = []; // 체크된 input태크 id값 담을 배열

	for (var i = 0; i < checkBox.length; i++) {
		// checked 여부 확인
		if (checkBox[i].checked) {
			checkArr.push(checkBox.eq(i).attr('id')) // 체크된 input태크 id값 추가
		}
	}

	return checkArr
}

/* 선택된 이미지 태그 id값 가져오는 함수 */
function checkedImgID() {
	checkArr = checkedInputImg();
	let checkIdArr = []; // 체크 이미지 아이디 배열

	checkArr.forEach(e => {
		let imgID = $(`label[for='${e}']`).children('img').eq(0).attr("id"); // 선택된 이미지
		checkIdArr.push(imgID);
	})

	return checkIdArr
}


/* 넘어온 이미지 화면에 구현 */
let a = 1; // 겉 태그 아이디값
let divHtml = "";
imgArr.forEach(k => {

	jsonRes.forEach(i => { // json 리스트
		// 아이디 값이 일치하면 json에서 값 꺼내고 db로 보낼 json 생성하기
		let imageArr = i.images
		let annoArr = i.annotations

		for (var j = 0; j < imageArr.length; j++) {
			if (annoArr[j].original_id == k) {
				// json --> i
				console.log(imageArr[j].file_name)
				let arr = imageArr[j].file_name.split("\\");
				let resFileName = arr[arr.length - 2];
				let resImageName = arr[arr.length - 1];
				divHtml += `<div class="gallery-cell"><input type="radio" value="${a}" class="optionCheck" id="myCheckbox${a}" name = "imgsel"><label for="myCheckbox${a}"><img id=${k} src="/filepath/${resFileName}/${resImageName}"></label></div>`
				a++;
			}

		}

	})
});
$('#resDiv').append(divHtml).trigger("create");

/* 라벨 수정 -> DB */
// img_id, image_path, result_path, result_label, edit_label
let editLabel = () => {


	// 선택한 사진의 이미지 아이디값 가져와야함
	let img_id = checkedImgID()[0]
	let image_path = "";
	let result_path = "";
	let result_label = "";
	let edit_label = $('#inputstyle').val();

	let editJson = new Object();

	jsonRes.forEach(i => { // json 리스트
		// 아이디 값이 일치하면 json에서 값 꺼내고 db로 보낼 json 생성하기
		let imageArr = i.images
		let annoArr = i.annotations

		for (var j = 0; j < imageArr.length; j++) {
			if (annoArr[j].original_id == img_id) {
				console.log(annoArr[j].original_id)
				editJson.img_id = img_id
				editJson.image_path = annoArr[j].original_img
				editJson.result_path = imageArr[j].file_name
				editJson.result_label = annoArr[j].label_name
				editJson.edit_label = edit_label
			}

		}

	})

	console.log(editJson)


	$.ajax({
		url: "editLabel",
		type: "post",
		contentType: "application/json",
		dataType: "text",
		data: JSON.stringify(editJson),
		success: function(d) {
			console.log(d)
			alert("수정 완료")
		},
		error: function(e) {
			console.log("수정 실패")
			alert("보관소 저장 실패")
		}

	});




}
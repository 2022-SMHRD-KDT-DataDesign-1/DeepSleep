console.log("js 연결")


document.getElementById('downloadBtn').addEventListener('click', () =>{
	// 체크된 이미지 목록 가져오기
	let checkBox = $('.optionCheck') // 체크박스 클래스
	let checkArr = []; // 체크된 input태크 id값 담을 배열

	for (var i = 0; i < checkBox.length; i++) {
		// checked 여부 확인
		if (checkBox[i].checked) {
			checkArr.push(checkBox.eq(i).attr('id')) // 체크된 input태크 id값 추가
		}
	}

	console.log(getDataUrl(img))

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
let jsonRes = JSON.parse(localStorage.getItem('jsonRes')); // 로컬스토리지에 저장된 결과 json 불러오기

let test1 = `<div id="resDiv${1}" class="gallery js-flickity" data-flickity-options='{ "wrapAround": true }'>`
$('#cellDiv').append(test1).trigger("create");
let test2 = '<div class="gallery-cell"><input type="checkbox" class="optionCheck" id="myCheckbox2" /><label for="myCheckbox2"><img id="resImg2" src="/filepath/new_20230609095127/person1.jpg"></label></div><div class="gallery-cell"><input class="optionCheck" type="checkbox" id="myCheckbox3" /><label for="myCheckbox3"><img id="resImg3" src="/filepath/new_20230609095127/person2.jpg"></label></div><div class="gallery-cell"><input class="optionCheck" type="checkbox" id="myCheckbox4" /><label for="myCheckbox4"><img id="resImg4" src="/filepath/new_20230609095127/person3.jpg"></label></div><div class="gallery-cell"><input class="optionCheck" type="checkbox" id="myCheckbox5" /><label for="myCheckbox5"><img id="resImg5" src="/filepath/new_20230609095127/person4.jpg"></label></div>'
$('#resDiv1').append(test2).trigger("create");

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

	imageArr.forEach(e => {
		let arr = e.file_name.split("\\"); // \ 기준으로 경로 나누기
		resImageName = arr[arr.length - 1]; // 결과 이미지명
		resFileName = arr[arr.length - 2]; // 결과 이미지가 저장되는 파일명

		htmlDiv2 += `<div class="gallery-cell"><input type="checkbox" id="myCheckbox${b}" class="optionCheck" /><label for="myCheckbox${b}"><img id="resImg${b}" src="/filepath/${resFileName}/${resImageName}"></label></div>`

		b++;
	});
	$(`#resDiv${a}`).append(htmlDiv2).trigger("create");

	a++;

});
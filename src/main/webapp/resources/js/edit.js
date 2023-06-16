// 라벨 입력 함수
$(document).ready(function() {
	$('#key1').one('click', function() {
		$('.addInput').append(
			'<input placeholder="  영어만 입력해주세요!" type="text" value="" id="inputstyle"><button type="submit" value="입력" class="btn btn-outline-primary" id = "key" onclick="keywordInput()">입력</button>'
		);
	});
});
//  



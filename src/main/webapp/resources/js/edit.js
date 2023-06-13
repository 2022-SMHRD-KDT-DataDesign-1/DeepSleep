// 키워드 입력 함수
$(document).ready (function () {
  $('#key1').one('click', function() {
    $('.addInput').append(
      '<input type="text" value="" id="inputstyle"><button type="submit" value="입력" class="btn btn-outline-primary" id = "key">입력</button>'
    );
  });
});
//  
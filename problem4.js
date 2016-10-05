//앞에서부터 읽을 때나 뒤에서부터 읽을 때나 모양이 같은 수를 대칭수(palindrome)라고 부릅니다.
//두 자리 수를 곱해 만들 수 있는 대칭수 중 가장 큰 수는 9009 (= 91 × 99) 입니다.
//세 자리 수를 곱해 만들 수 있는 가장 큰 대칭수는 얼마입니까?
var max = 0;
for(var i = 100; i < 1000; i++){
  for(var j = 100; j < 1000; j++ ){
    var k = i * j;
    // console.log(k);
    if( k < 100000 ){
      // 5자리
      var a = k % 100;
      var b = parseInt(k / 1000);
      var c = parseInt(b / 10);
      var d = b % 10
      var e = d * 10 + c;
      if( a == e && k > max){
        max = k;
      }

    } else {
      // 6자리
      var a = k % 1000;
      var b = parseInt(k / 1000);

      var c = parseInt(b / 100);
      var d = parseInt(b / 10) % 10;
      var e = b % 10;

      var f = e * 100 + d * 10 + c
      if( a == f && k > max){
        console.log( i + " " + j);
        max = k;

      }
    }
  }
}

console.log(max);


// 소인수 구하는 함수
var arr = [];
var next = false;
function getMin( num ){
  for(var i = 2; i < num; i++ ){

    for(var j = 0; j < arr.length; j++){
      var k = arr[j];
      if( i % k == 0 ){
        next = true;
        break;
      }
    }

    if( !next ){
      var a = num % i;

      if ( a == 0 ){
          console.log(i);
        arr.push(i);
      }
    }
    next = false;
    
  }

  // console.log(a);
}

getMin(600851475143);

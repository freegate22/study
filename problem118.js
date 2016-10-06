// 집합갯수
checkArr = [];
// 다음소수 찾기
function nextss( num ){
  var arr = [];

  for( i = 2; i <= 100 ; i++ ){
    var blnSosu = true;
    for( j = 0; j < arr.length; j++){
      if( Math.sqrt(i) < arr[j] ){
        break;
      }
      if( i % arr[j] == 0 ){
        blnSosu = false;
        break;
      }
    }

    if( blnSosu ){
      if( i > num && check(i) ) {
        return i;
      } else {
        arr.push(i);
      }
    }
  }
}

function check( num ){
  var txtNum = num + '';
  for( k = 0; k < checkArr.length; k++){
    if( txtNum.indexOf(checkArr[k]) > -1 ){
      return false;
    }
  }
  return true;
}

// function checkSameNum( num ){
//   var sameArr = [];
//   var count = (num + '').length;
//   for( var l = count ; count > 0; count--){
//       var result = (next + '').substring(count-1, count);
//       if( result.indexOf())
//       console.log("push" + parseInt(result));
//       sameArr.push(parseInt(result));
//   }
// }

checkArr.push(2);
var prev = 2;
var next = 0;

while(true){
  next = nextss( prev );
  console.log(next);
  var count = (next + '').length;

  var tmpArr = [];
  var dup = false;
  for( var l = count ; count > 0; count--){
      var result = (next + '').substring(count-1, count);

      if( tmpArr.indexOf(parseInt(result)) > -1 ){
        console.log("중복" + next);
        dup = true;
        break;
      }
      tmpArr.push(parseInt(result));
  }

  if( !dup ){
    checkArr = checkArr.concat(tmpArr);
    console.log( checkArr );
    prev = next;
  } else {
    prev = next + 1;
  }

  if(checkArr.length >= 9){
    break;
  }

}

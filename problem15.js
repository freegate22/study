// 경우의수
//
// 1 > 2
// 2 > 6
// 3
//
// 1 * 1 > 2
// 1 * 2 > 3
// 2 * 1 > 3
// 2 * 2 > 6
// 1 * 3 > 4
// 2 * 3 > 10
// 3 * 3 > 20
// 1 * 4 > 5
//
// 피라미드
// 1
// 1 1
// 1 2 1 > 1 * 1
// 1 3 3 1
// 1 4 6 4 1 > 2 * 2
// 1 5 10 10 5 1
// 1 6 15 20 15 6 1 > 3 * 3
// 137846528820
var arr = [1,1];
var num = 0;
while( num < 20 ){
  var tmpArr = [];
  tmpArr.push(1);
  for( var j = 1; j < arr.length; j++ ){
    tmpArr.push(arr[j-1] + arr[j]);
  }
  arr = tmpArr.slice();
  arr[arr.length] = 1;
  // console.log(arr);
  num = (arr.length - 1) / 2;
  if( num % 1 == 0){
      console.log(num + " " + arr[num]);
  }
}

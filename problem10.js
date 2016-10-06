var arr = [];
var sum = 0;
var blnSosu = true;
var start = new Date().getTime();

for( i = 2; i <= 2000000 ; i++ ){
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
      arr.push(i);
      sum += i;
  }
  blnSosu = true;
}
var el = (new Date().getTime() - start) / 1000 ;
console.log( el + " 초");
console.log(sum);

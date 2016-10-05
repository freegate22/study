
var i = 2;
var count = 0;
while(true){

  for( j = i-1 ; j >= 1; j --){
    if( j == 1 ){
        count++;
        // console.log(i);
    } else if( i % j == 0 ){
      break;
    }

  }
  if( count == 10001){
    break;
  }
  i++;

}
console.log(i);

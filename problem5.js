
var a = 1;
var x = 0;
var max = 20;
while(true){

  for(var i = 1; i <= max; i++){
    if( a % i != 0 ){
      break;
    }
    if( i == max ){
      x = a;
    }
  }
  if( x != 0 ){
    break;
  }
  a++;
}
console.log("result " + x);

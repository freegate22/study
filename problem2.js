var a = 1;
var b = 2;
var sum = 0;
while ( b <= 4000000 ){
  if( b % 2 == 0 ){
    sum += b;
  }
  var tmp = a + b;
  a = b;
  b = tmp;
}

console.log( sum );

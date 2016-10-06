
var sum1 = 0;
var sum2 = 0;

for(var i = 1; i <=100; i++ ){
  sum1 += i * i;
  sum2 += i;
}

console.log( sum2 * sum2 - sum1 );

var maxnum = 0;
var maxcount = 0;
var count = 1;

for(var i = 1; i < 1000000; i++){
  var x = i;
  while( x != 1 ){
    if( x % 2 == 0 ){
      x = x / 2;
    } else {
      x = 3 * x + 1;
    }
    // console.log(x);
    count++;
  }
  // console.log(i + " " + count);
  // console.log("________________");
  if( maxcount < count ){
    maxcount = count;
    maxnum = i;
  }
  count = 1;
}

console.log(maxnum);

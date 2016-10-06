var a = 1;
var sam = 0;
var start = new Date().getTime();
while(true){
  sam += a;
  var sqrt = Math.sqrt(sam);
  var ycount = 0;
  for(var i = 1; i <= sqrt; i++){
    if( i == sqrt ){
      ycount++;
    } else if( sam % i == 0 ){
      ycount = ycount + 2;
    }

  }
  console.log(sam + " " + ycount);

  if(ycount >= 500){
    break;
  }
  a++;
}
var el = (new Date().getTime() - start) / 1000 ;
console.log( el + " 초");
console.log(sam);

var result = 0;
for(var a = 3; a < 1000; a++){
  for(var b = a+1; b < 1000; b++){
    cc = a*a + b*b;
    var c = Math.sqrt(cc);
    if( a + b + c == 1000){
      console.log(a + " " + b + " " + c);
      result = a * b * c;
      break;
    }
  }
  if( result != 0 ){
    break;
  }
}
console.log( result );

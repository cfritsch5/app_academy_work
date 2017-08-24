console.log("test js");

const madLib = (verb, adj, noun) => {
  return (`we shall ${verb} ${adj} ${noun}`);
};

const madLib2 = (verb, adj, noun) => (
  `we shall ${verb.toUpperCase()} ${adj} ${noun}`
);

// console.log(madLib('create','nice','cakes'));
// console.log(madLib2('enjoy','terrible','movies'));

function isSubstring(phrase, subphrase) {
  return phrase.includes(subphrase);
}
// console.log(isSubstring("testing","test"));


function fizzBuzz(array) {
  let newArr = [];
  for(let i = 0 ; i < array.length ; i++){
    if(array[i]%3 === 0 ^ array[i]%5 === 0 ){
      newArr.push(array[i]);
    }
  }
  return newArr;
}

// console.log(fizzBuzz([1,2,3,4,5,10,15,18]));

const isPrime = (n) => {
  for(let i = 2 ; i < n; i++){
    if(n%i === 0) {
      return false;
    }
  }
  return true;
};

// console.log(isPrime(3));
// console.log(isPrime(4));


const sumOfNPrimes = (n) => {
  let sum = 0;
  let count = 0;
  let i = 2;
  while (count < n) {
    if(isPrime(i)){
      console.log("i",i);
      sum += i;
      console.log("sum",sum);
      count++;
    }
    i++;
  }
  return sum;
};

// console.log(sumOfNPrimes(4));
// ----------------------------
// Part II


const titleize = function (array, callback) {
  array.forEach((word)=> word[1].toUpperCase()+word.substring(1));
};

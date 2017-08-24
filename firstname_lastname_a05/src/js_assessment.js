// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.

Array.prototype.quickSort = function() {
  if (this.length  <= 1) {
    return this;
  }
  let left =[];
  let right = [];
  pivot = this[0]
  this.forEach((el)=>{
    console.log(el)
    if (el < pivot) {
      left.push(el);
    }else{
      right.push(el);
    }
  })
  return left.quickSort().concat(right.quickSort());
}

// write myFind(array, callback). It should return the first element for which
// // callback returns true, or undefined if none is found.
//
const myFind = function (arr, callback) {
  let element;
   arr.forEach( (el)=>{
     console.log(el);
      if (callback(el)){
        console.log("true")
        element = el;
        }
      })
    return element;
  };

function iseven(num) {
  console.log("iseven:" + num)
  if (num % 2 === 0) {
    return true;
  } else {
    return false;
  }
}


// write sumNPrimes(n)
const sumNPrimes = function (n) {
// Function.prototype.sumNPrimes = function (n) {
  let primes_sum = 0;
  let count = 0;
  let i = 2
  while (count < n) {
    if (isprime(i)) {
      primes_sum += i;
      count++;
    }
    i++;
  }
  return primes_sum;
};

function isprime(num) {
  for(let i = 2 ; i< num - 1 ;i++){
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}


// write Function.prototype.myBind.

Function.prototype.myBind = function (context, ...restArgs) {
  return(...callArgs) => {
    console.log(callArgs)
    return this.apply(context, restArgs.concat(callArgs))
  }
};
// why do we have callArgs? it works without it just using restArgs``

// write Function.prototype.inherits.
// Function.prototype.inherits = function (BaseClass) {
//   function Surrogate () {}
//   Surrogate.prototype = BaseClass.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };

Function.prototype.inherits = function (BaseClass) {
  this.prototype = Object.create(BaseClass.prototype);
  this.prototype.constructor = this;
};

// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = function (start, endidx) {
  let newStr = "";
  if (endidx === undefined || endidx > this.length){
    endidx = this.length;
  }

  if (start < endidx) {
    for(let i = start; i < endidx; i++){
      newStr += this[i];
    }
  }
  return newStr;
}

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

Array.prototype.myReduce = function (callback, accum) {
  if (accum === undefined) {
    accum = this.shift();
  }

  for(let i = 0 ; i < this.length ; i++ ) {
    accum = callback(accum, this[i]);
  }

  return accum;
}

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.

Array.prototype.quickSort = function (comparator) {
  if (this.length < 2) return this;

  if (comparator === undefined) {
    comparator = (x, y) => {
      if (x === y) {
        return 0;
      } else if (x > y) {
        return 1;
      } else {
        return -1;
      }
    }
  }

  let pivot = this[0];
  let left = [];
  let right = [];

  for(let i = 1; i < this.length; i++) {
    if (comparator(this[i], pivot) < 0) {
      left.push(this[i]);
    } else {
      right.push(this[i]);
    }
  }
  return left.quickSort(comparator).concat(pivot, right.quickSort(comparator));
}





// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

// write sumNPrimes(n)

// write Function.prototype.myBind.

Function.prototype.myBind = function (ctx, ...bindArgs) {
  const fn = this;
  return (...callArgs)=>{
      return this.apply(ctx, bindArgs.concat(callArgs));
  }
};


// write Function.prototype.inherits.


Function.prototype.inherits = function (baseClass) {
  this.prototype = Object.create(baseClass.prototype);
};

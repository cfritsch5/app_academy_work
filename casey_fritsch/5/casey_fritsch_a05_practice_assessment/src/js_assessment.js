// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = function (startidx, endidx) {

    let newStr = "";

    if (!endidx){
      endidx = this.length;
    }
    if (endidx > this.length) {
      endidx = this.length;
    }
    if (endidx <= startidx) {
      return "";
    }



    for(let i = startidx; i < endidx; i++) {
      // console.log(this[i]);
      newStr = newStr + this[i];
    };

    return newStr;
};

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

Array.prototype.myReduce = function (callback, accum) {
  const arr = this;
  if (!accum) {
    accum = arr.shift(1);
  }

  for(let i = 0 ; i < arr.length; i++) {
    accum = callback(accum, arr[i]);
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
  // if (!comparator) {
  //   comparator = (x, y) => {
  //   };
  // }
  // let pivot = this[0];
  // let left = [];
  // let right = [];
  // for (let i = 1 ; i < this.length; i++) {
  //     if (this[i] < pivot) {
  //     left.push(this[i]);
  //   } else {
  //     right.push(this[i]);
  //   }
  // }
  // return left.quickSort().concat(right.quickSort());
};


// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

Array.prototype.myFind = function (array, callback) {
  for(let i = 0 ; i < array.length ; i++) {
    if (callback(this[i])) {
      return this[i];
    }
  };
  return undefined;
};

// write sumNPrimes(n)

const sumNPrimes = function (n) {
  const primeArr = [];
  let i = 0;
  while (primeArr.length < n ) {
      let factors = 0;

      for(let j = 0 ; j < i ; j++) {
        if (i % j === 0 ) {
          factors++;
        }
      }

      if (factors == 1) {
        primeArr.push(i)
      }
      i++;
  }
}

// write Function.prototype.myBind.

// write Function.prototype.inherits.

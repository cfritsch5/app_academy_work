// Write a function, `shuffledSentenceDetector(sentence1, sentence2)`, that
// returns true if the words in `sentence1` can be rearranged to form
// `sentence2`.
function shuffledSentenceDetector(sen1, sen2) {
  sen1 = sen1.split(" ");
  sen2 = sen2.split(" ");

  if (sen1.length !== sen2.length) return false;

  for(let i = 0 ; i < sen1.length; i++) {
    if (sen2.includes(sen1[i]) && sen1.includes(sen2[i])) {
    } else {
      return false;
    }
  }
  return true;
}

// Write an Array function, myEach(callback), that passes each element to
// `callback` and does not modify the original array. Do NOT call the built-in
// Array#forEach method in your implementation.

Array.prototype.myEach = function (callback) {
  for(let i = 0 ; i < this.length; i++) {
    callback(this[i]);
  }
};

// Write an Array method, myFilter(callback), that returns an array made up of
// the elements in the original array for which `callback` returns `true`.
// Use the Array#myEach method you defined above. Do NOT call the built-in
// Array#forEach or Array#filter methods in your implementation.

Array.prototype.myFilter = function (callback) {
  let filtered = [];
  this.myEach((el)=>{
    if (callback(el)) {
      filtered.push(el);
    }
  })
  return filtered
  }


// Write a function `pairMatch(array, callback)`. It should return all pairs
// of indices ([i, j]) for which `callback(array[i], array[j])` returns true.

// NB: Keep in mind that the order of the arguments to the callback may matter.
// e.g., callback = function(a, b) { return a < b }

function pairMatch(array, callback) {
  let pairs = [];
  let length = array.length
  for(let i = 0 ; i < length; i++) {
    for(let j = 0 ; j < length; j++) {
      if (i === j) continue;
      if(callback(array[i], array[j])) {
        // console.log(i,j);
        pairs.push([i, j]);
      }
    }
  }
  return pairs;
}

// Write an Array method that merge sorts an array. It should take an optional
// callback that compares two elements, returning -1 if the first element should
// appear before the second, 0 if they are equal, and 1 if the first element
// should appear after the second. Define and use a helper method,
// merge(left, right, comparator), to merge the halves. Make sure that merge is
// defined on the window. Do NOT call the built-in Array#sort method in your
// implementation.
//
// Here's a summary of the merge sort algorithm:
//
// Split the array into left and right halves, then merge sort them recursively
// until a base case is reached. Use a helper method, merge, to combine the
// halves in sorted order, and return the merged array.

Array.prototype.mergeSort = function (callback) {
  if (callback === undefined) {
    callback = function(x, y) {
      if (x === y) {
        return 0;
      } else if (x > y) {
        return 1;
      } else {
        return -1;
      }
    };
  }

  if (this.length < 2) return this;

  let mid = Math.floor(this.length/2);
  let left = this.slice(0,mid);
  let right = this.slice(mid);

  return merge(left.mergeSort(callback), right.mergeSort(callback), callback);
};

function merge(left, right, callback) {
  let merged = [];
  // while (left.length > 0 && right.length > 0){
  //   // console.log(left,right,i,j)
    if (callback(left[0], right[0]) < 0 ) {
      merged.push(left[0]);
      // i++;
    } else {
      merged.push(right[0]);
      // j++;
    // }
  }
  return merged.concat(left,right);
}


// write a Function method, myBind(context). It should return a copy of the
// original function, where `this` is set to `context`.
Function.prototype.myBind = function (ctx, ...bArgs) {
  let fn = this;
  return (...cArgs) => {
    fn.apply(ctx, bArgs.concat(cArgs));
  };
};

// write a Function method, inherits(ParentClass). It should extend the methods
// of `ParentClass.prototype` to the constructor function it is called on.
Function.prototype.inherits = function (baseClass) {
  this.prototype = Object.create(baseClass.prototype);
};
// write a method, `myCurry(fn, object, numArgs)`, that curries the
// function. Remember that a curried function is invoked with one argument at a
// time. For example, the curried form of `sum(1, 2, 3)` would be written as
// `curriedSum(1)(2)(3)`. After `numArgs` have been passed in, invoke the
// original `fn` with the accumulated arguments, using `object` as the
// context.

function myCurry(fn, obj, numArgs) {
  let args = [];
  let fn = this;
  function _curriedfn(arg) {
    args.push(arg);

    if (args === numArgs){
      return obj.fn(args);
    } else {
      return _curriedfn;
    }
  }
  return _curriedfn;
};

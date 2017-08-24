//Write an Array#merge_sort method; it should not modify the original array.
// If a comparator is passed, it should sort according to that callback.


Array.prototype.mergeSort = function(comparator) {
  if (this.length < 2) return this;

  let mid = Math.floor(this.length/2);

  let left = this.slice(0,mid);
  let right = this.slice(mid);

  return left.mergeSort().concat(right.mergeSort());

};

function merge(left, right, comparator) {
  let sorted =[];
  while ( left.length > 0 && right.length > 0){
    if (comparator(left[0], right[0]) < 0) {
      sorted.push(left.shift);
    } else {
      sorted.push(right.shift);
    }
  }
  return sorted;
}






const compA = (a,b) => {

  if (a > b) {
    return -1;
  } else if (a < b){
    return 1;
  } else {
    return 0;
  }

};

console.log([1,9,2,3,0,5,6,43,24].mergeSort(compA)); // ONE WITH COMPARATOR
console.log([1,9,2,3,0,5,6,43,24].mergeSort()); // ONE WITHOUT

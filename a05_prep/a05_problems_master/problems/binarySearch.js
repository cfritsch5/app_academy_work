function myBsearch(array, target) {
  if (array.length === 0) {
    return -1;
  }

  const mid = Math.floor(array.length/2);
  //mid is an index

  if (array[mid] === target) {
    const left = array.slice(0,mid);
    return myBsearch(left,target);
  } else {
    const right = array.slice(mid + 1);
    const subproblem = myBsearch(right, target)
    return subproblem === -1 ? -1 : subproblem + (mid + 1);
  }
}

console.log(myBsearch([1,2,3,4,5], 2) ); // 1
console.log(myBsearch([1,2,3,4,5], 5)); // 4
console.log(myBsearch([1,2,3,4,5], 6)); // -1

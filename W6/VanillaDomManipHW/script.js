document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });


  // adding SF places as list items

  // --- your code here!

  const addPlace = (e) => {
    const places = document.getElementByClassName("list-container form");
    places.addEventListener("submit", _e => {
      _e.preventDefault();
      const place = document.getElementById("favorite-input").value;
    });
  };



  // adding new photos

  // --- your code here!



});

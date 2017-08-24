
//----------------------------
// Using Surrogates
//----------------------------

Function.prototype.inherits1 = function (BaseClass) {
  function Surrogate() {};
  Surrogate.prototype = BaseClass.prototype;
  this.prototype = new Surrogate;
  this.constructor = this.constructor;
};


//----------------------------
// Using Object.Create
//----------------------------

// After you have written Function.prototype.inherits
// using the surrogate trick, refactor your solution using
// Object.create. Make sure to test that your updated solution works.

Function.prototype.inherits2 = function (BaseClass) {
this.prototype = Object.create(BaseClass.prototype);
this.prototype.constructor = this;
};

//----------------------------
// Test
//----------------------------


function Dog (name) {
  this.name = name;
}

Dog.prototype.bark = function () {
  console.log(this.name + " barks!");
};

function Corgi (name) {
  Dog.call(this, name);
}

Corgi.inherits2(Dog); // change to inherits2 to test your second method

Corgi.prototype.waddle = function () {
  console.log(this.name + " waddles!");
};

const blixa = new Corgi("Blixa");
blixa.bark();
blixa.waddle();
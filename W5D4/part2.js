function titleize(array,callback) { 
  let titleized = array.map(array => `Mx. ${array} Jingleheimer Schmidt`);
  callback(titleized);
}

titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});

function elephant(name,height,tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

elephant.prototype.trumpet = function(){
  return `${name} the elephant goes \'phrRRRRR!!!\'`;
}

elephant.prototype.grow = function() {
  this.height += 12;
}

elephant.prototype.addTricks = function(new_trick) {
  this.tricks.push(new_trick);
}

elephant.prototype.play = function () {
  trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};


elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};

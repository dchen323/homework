function madLib(verb,adj,noun) {
  console.log(`We shall ${verb} the ${adj.toUpperCase()} ${noun.toUpperCase()}`);
};

// madLib('make', 'best', 'guac')

function isSubstring(sentence, string) {
  return sentence.includes(string);
};

// console.log(isSubstring("time to program", "time"))

// console.log(isSubstring("Jump for joy", "joys"))

function fizzBuzz(input) {
  let new_arr = [];
  for (let i = 0; i < input.length; i++){
    if (input[i] % 3 === 0 || input[i] % 5 === 0) {
      new_arr.push(input[i]);
    };
  };
  return new_arr;
};


// fizzBuzz([1,2,3,4,5,6]);

function isPrime(input){
  if (input < 2) {
    return false;
  }
  for (let i = 2; i < input; i++) {
    if (input % i === 0){
      return false;
    }
  }
  return true;
}

// console.log(isPrime(5))


function sumOfNPrimes(n) {
  let count = 0;
  let sum = 0;
  let i = 2
  while (count < n) {
    if (isPrime(i)){
      count ++;
      sum += i;
    }
    i++;
  }
  return sum;
}

console.log(sumOfNPrimes(5))

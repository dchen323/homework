const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaBiscuits() {
  let first, second;
  reader.question("Would you like some tea?", function(answer){
    first = answer;
    console.log(`${answer}`);
    reader.question("Would you like some biscuits?", function(answer2){
      second = answer2;
      console.log(`${answer}`);
      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${firstRes} want tea and ${secondRes} want biscuits.`);
      reader.close();
    });
  });

}

teaBiscuits ();

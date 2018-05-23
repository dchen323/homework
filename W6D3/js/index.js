console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather'+
  '?q=new%20york,US&appid=45547291aa96d91ea3bd7494b257d5b8',
  success(data) {
    console.log("We have your weather");
    console.log(data);
  },
  error(){
    console.error("Error!");
  },
});
// Add another console log here, outside your AJAX request
console.log("AJAX complete");


/*
$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather' +
  	'?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b',
  success(data) {
    console.log("We have your weather!");
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  },
});
*/

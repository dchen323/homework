window.setTimeout(function(){
  alert('HAMMERTIME');
},5000);

// setTimeout();

function hammerTime(time) {
  window.setTimeout(function(){
    alert(`${time/1000} is HaMeRtImE`);
  },time);
}

// hammerTime(2000);

document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;
  let ctx = canvas.getContext('2d');

  ctx.fillStyle = 'rgb(0, 0, 255)';
  ctx.fillRect(60, 60, 80, 120);

  ctx.beginPath();
  ctx.arc(300,200,80,0, 2 * Math.PI, true);
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = 'black';
  ctx.fill();

  ctx.lineWidth = 10;
  ctx.lineJoin = 'round';
  ctx.strokeStyle = 'green';
  ctx.beginPath();
  ctx.moveTo(218,200);
  ctx.lineTo(300,280);
  ctx.lineTo(300,120);
  ctx.lineTo(218,206);
  ctx.moveTo(300,120);
  ctx.lineTo(380,206);
  ctx.lineTo(300,280);
  ctx.moveTo(380,206);
  ctx.lineTo(220,204);
  ctx.stroke();
});

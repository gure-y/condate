document.addEventListener('DOMContentLoaded', function(){
  if ( !document.getElementById('open')){ return false; }

  const open = document.getElementById('open');
  const close = document.getElementById('close-btn');
  const background = document.getElementById('background');
  const praise = document.getElementById('praise');

  open.addEventListener('click', function() {
    background.removeAttribute("class", "hidden");
    praise.removeAttribute("class", "hidden");
  });

  close.addEventListener('click', function() {
    background.setAttribute("class","hidden");
    praise.setAttribute("class", "hidden");
  });

  background.addEventListener('click', function(){
    close.click();
  })

});
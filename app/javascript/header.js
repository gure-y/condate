window.addEventListener('load', function(){
  if ( !document.getElementById('current-user-name')){ return false; }
  const pullDownButton = document.getElementById("current-user-name")
  const pullDownParents = document.getElementById("pulldown")

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;"){
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
    pullDownParents.setAttribute("style", "display:block;")
    }
  })
})
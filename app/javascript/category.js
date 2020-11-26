window.addEventListener('load', function(){
  const Pulldown = document.getElementById("category")
  const Pulldownlist = document.getElementById("category-lists")
  Pulldown.addEventListener('click', function(){
    if (Pulldownlist.getAttribute("style") == "visibility: visible;") {
      Pulldownlist.removeAttribute("style", "visibility: hidden;")
    } else {
      Pulldownlist.setAttribute("style", "visibility: visible;")
    }
  })
})
// setInterval(check, 1000);
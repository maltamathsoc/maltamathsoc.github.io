function openNav(ext) {
  document.getElementById("side_nav").style.width = String(document.getElementById("mms_logo").width + ext) + "px";
  document.getElementById("main").style.marginLeft = String(document.getElementById("mms_logo").width + ext) + "px";
}

function closeNav() {
  document.getElementById("side_nav").style.width = "0";
  document.getElementById("side_nav").style.paddingRight = "0";
  document.getElementById("main").style.marginLeft = "0";
}

function openTree(chevron) {
  if (chevron.style.transform === "rotate(-90deg)") {
    chevron.style.transform = "rotate(0deg)";
    chevron.parentElement.parentElement.querySelector(".sub_opt").style.height = "0px";
  } else {
    chevron.style.transform = "rotate(-90deg)";
    chevron.parentElement.parentElement.querySelector(".sub_opt").style.height = "300px";
  }
}

/* function openNav(ext, grad_offset, mult) */

/* var mms_logo = document.getElementById("mms_logo"); */
  /* var side_nav = document.getElementById("side_nav"); */
  /* var main = document.getElementById("main"); */
  /* var close_container = document.getElementById("close_container"); */
  /* var menu = document.getElementById("menu"); */

  /* var width = mms_logo.width + ext; */

  /* side_nav.style.width = String(width) + "px"; */
  /* main.style.marginLeft = String(width) + "px"; */

  /* side_nav.style.background = "linear-gradient(to right, #f5f5f5 " + String(width - grad_offset) + "px, #c7c6c1)"; */
  /* side_nav.style.paddingRight = String(grad_offset) + "px"; */

  /* close_container.style.paddingRight = String(mult * grad_offset) + "px"; */
  /* close_container.style.paddingTop = "10px"; */

  /* menu.style.paddingRight = String(mult * grad_offset) + "px"; */

  /* var height_mms_logo = parseInt(window.getComputedStyle(document.getElementById("mms_logo"), null).getPropertyValue("height")); */
  /* var height_close_container = parseInt(window.getComputedStyle(document.getElementById("close_container"), null).getPropertyValue("height")); */
  /* var height_menu = parseInt(window.getComputedStyle(document.getElementById("menu"), null).getPropertyValue("height")); */
  /* var height_sidenav = parseInt(window.getComputedStyle(document.getElementById("sidenav"), null).getPropertyValue("height")); */

  /* console.log(height_sidenav, height_mms_logo, height_close_container, height_menu); */

  /* var padd = (height_sidenav - height_mms_logo - height_close_container) / 2 - height_menu; */

  /* var padd = height_sidenav / 2 - height_menu - height_mms_logo - height_close_container; */

  /* menu.style.paddingTop = String(padd) + "px"; */


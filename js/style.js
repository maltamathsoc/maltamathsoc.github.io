function openNav(ext) {
  var mms_logo = document.getElementById("mms_logo");
  var sidenav = document.getElementById("sidenav");
  var main = document.getElementById("main");
  var close_container = document.getElementById("close_container");
  var menu = document.getElementById("menu");

  var width = mms_logo.width + ext;

  sidenav.style.width = String(width) + "px";
  main.style.marginLeft = String(width) + "px";

  var gradient_offset = 5;

  sidenav.style.background =
    "linear-gradient(to right, #f5f5f5 " +
    String(width - gradient_offset) +
    "px, #c7c6c1)";
  sidenav.style.paddingRight = String(gradient_offset) + "px";

  close_container.style.paddingRight = String(3 * gradient_offset) + "px";

  /* mms_logo.style.paddingTop = String(ext / 8) + "px"; */
  /* mms_logo.style.paddingBottom = String(ext / 8) + "px"; */
}

function closeNav() {
  document.getElementById("sidenav").style.width = "0";
  document.getElementById("sidenav").style.paddingRight = "0";
  document.getElementById("main").style.marginLeft = "0";
}

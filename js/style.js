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
    chevron.parentElement.parentElement.querySelector(".sub_opt").style.height =
      String(
        chevron.parentElement.parentElement
          .getElementsByClassName("sub_opt")[0]
          .getElementsByTagName("a")[0]
          .getBoundingClientRect().height *
          document.getElementsByClassName("sub_opt")[0].getElementsByTagName("a").length +
          3
      ) + "px";
  }
}
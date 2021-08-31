function openNav(ext) {
  document.getElementById("side_nav").style.width = String(document.getElementById("mms_logo").width + ext) + "px";
  document.getElementById("main").style.marginLeft = String(document.getElementById("mms_logo").width + ext) + "px";
}

function closeNav() {
  document.getElementById("side_nav").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
}

function openTree(chevron) {
  const opt = chevron.parentElement.parentElement;

  if (chevron.style.transform === "rotate(-90deg)") {
    chevron.style.transform = "rotate(0deg)";
    opt.querySelector(".sub_opt").style.height = "0px";
    opt.querySelector(".sub_opt").style.padding = "0px 0px 0px 0px";
  } else {
    chevron.style.transform = "rotate(-90deg)";
    opt.querySelector(".sub_opt").style.height =
      String(
        opt.getElementsByClassName("sub_opt")[0].getElementsByTagName("a")[0].getBoundingClientRect().height *
          opt.querySelector(".sub_opt").getElementsByTagName("a").length
      ) + "px";
    opt.querySelector(".sub_opt").style.padding = "8px 0px 8px 0px";
  }
}

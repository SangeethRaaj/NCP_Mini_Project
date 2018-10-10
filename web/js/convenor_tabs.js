
var navbar = document.getElementById("navbar");
var sidbar = document.getElementById("sidenav");
var sticky = navbar.offsetTop;

window.onscroll = function() {
    if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky")
        sidbar.classList.add("sticky1")
    } else {
        navbar.classList.remove("sticky");
        sidbar.classList.remove("sticky1")
    }
} ;

function opentab(t, elmnt) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(t).style.display = "block";
    elmnt.style.backgroundColor = 'red';
}
document.getElementById("defaultOpen").click(); 


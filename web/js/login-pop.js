var modal = document.getElementById('loginn');
var btn = document.getElementById("lbt");


btn.onclick = function() {
    modal.style.display = "block";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
} 
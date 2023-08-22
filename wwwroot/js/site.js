// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

const bar = document.querySelector('.bar');
const countdownElement = document.getElementById('countdown');
const countdownDuration = 30; // Duración del contador en segundos
let remainingTime = countdownDuration;

function updateBar() {
    const progress = (countdownDuration - remainingTime) / countdownDuration;
    const barWidth = `${progress * 100}%`;
    bar.style.width = barWidth;
}

function elegirDificultad(id, lista) {
    alert(1);
    document.getElementById("dificultad").value = id;
    document.getElementById("D-1").class = "btn btn-primary btnCate";
    for (let i = 1; i < lista.length; i++) {
        alert(i);
        if (document.getElementById(lista[i].IDDificultad) != id)
        document.getElementById("D+" + lista[i].IDDificultad).class = "btn btn-primary btnCate"
    }
    
}
function elegirCategoria(id, lista) {
    document.getElementById("categoria").value = id;
    document.getElementById("C-1").class = "btn btn-primary btnCate";
    for (let i = 1; i <= lista.length; i++) {
        if (document.getElementById("C+" + lista[i].IDCategoria) != "C+" + id)
        document.getElementById("C+" + lista[i].IDCategoria).class = "btn btn-primary btnCate"
    }
   
}

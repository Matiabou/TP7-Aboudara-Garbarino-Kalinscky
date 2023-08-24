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
    document.getElementById("D-1").className = "btn btn-primary btnCate";
    for (let i = 1; i < lista.length; i++) {
        alert(i);
        if (lista[i].IDDificultad !== id)
        document.getElementById("D+" + lista[i].IDDificultad).className = "btn btn-primary btnCate"
    }
    
}
function elegirCategoria(id, lista) {
    alert(1);
    document.getElementById("categoria").value = id;
    document.getElementById("C-1").className = "btn btn-primary btnCate";
    for (let i = 1; i < lista.length; i++) {
        if (lista[i].IDCategoria !== id)
        document.getElementById("C+" + lista[i].IDCategoria).className = "btn btn-primary btnCate"
    }
   
}

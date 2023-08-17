// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function elegirDificultad(id)
const bar = document.querySelector('.bar');
const countdownElement = document.getElementById('countdown');
const countdownDuration = 30; // Duración del contador en segundos
let remainingTime = countdownDuration;

function updateBar() {
    const progress = (countdownDuration - remainingTime) / countdownDuration;
    const barWidth = `${progress * 100}%`;
    bar.style.width = barWidth;
}

function updateCounter() {
    if (remainingTime > 0) {
        remainingTime--;
        updateBar();
        countdownElement.textContent = remainingTime;
        setTimeout(updateCounter, 1000); // Actualizar cada segundo
    }
}

updateCounter();
function elegirDificultad(id, lista) {
    document.getElementById("D-1").class = "btn btn-primary btnCate";
    for (let i = 1; i <= lista.length; i++) {
        if (document.getElementById(lista[i].IDDificultad) != id)
        document.getElementById("D+" + lista[i].IDDificultad).class = "btn btn-primary btnCate"
    }
    document.getElementById("dificultad").value = id;
}
function elegirCategoria(id, lista) {
    document.getElementById("C-1").class = "btn btn-primary btnCate";
    for (let i = 1; i <= lista.length; i++) {
        if (document.getElementById("C+" + lista[i].IDCategoria) != "C+" + id)
        document.getElementById("C+" + lista[i].IDCategoria).class = "btn btn-primary btnCate"
    }
    document.getElementById("categoria").value = id;
}

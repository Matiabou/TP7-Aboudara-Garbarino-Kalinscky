﻿// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function onclickDificultad(id, lista) {
    if (document.getElementById("D" + lista[i].IDDificultad).active == true) {
        for (let i = 0; i < lista.length; i++) {
            if (lista[i].IDDificultad != id)
                document.getElementById("D" + lista[i].IDDificultad).active = false;
        }
    }

}
function onclickCategoria(id, lista) {
    for (let i = 0; i < lista.length; i++) {
        if (lista[i].IDCategoria != id)
            document.getElementById("C" + lista[i].IDCategoria).active = false;
    }
}
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
function elegirDificultad(id) {
    document.getElementById("dificultad").value = id;
}
function elegirCategoria(id) {
    document.getElementById("categoria").value = id;
}

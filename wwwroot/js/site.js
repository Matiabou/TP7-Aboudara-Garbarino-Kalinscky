﻿// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
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

function elegirDificultad(id) {
    document.getElementById("dificultad").value = id;
    document.getElementById("D-1").className = "btn btn-primary btnCate";
    for (let i = 1; i <= 4; i++) {
        if (i !== id){
        document.getElementById("D+" + i).className = "btn btn-primary btnCate";
        }
    }
    
}
function elegirCategoria(id) {
    document.getElementById("categoria").value = id;
    document.getElementById("C-1").className = "btn btn-primary btnCate";
    for (let i = 1; i <= 6; i++) {
        if (i !== id){
        document.getElementById("C+" + i).className = "btn btn-primary btnCate";
        }
    }
   
}

// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.


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
function respuesta(id){
    document.getElementById('Respuesta').value = id;
    document.getElementById('V').style = "background-color: rgb(45, 226, 9); color: white;";
    document.getElementById('F').style = "background-color: red; color: white;";
    document.getElementById('F').id = "F1";
    document.getElementById('F').style = "background-color: red; color: white;";
    document.getElementById('F').id = "F2";
    document.getElementById('F').style = "background-color: red; color: white;";
    document.getElementById('Continuar').hidden = false;
}
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
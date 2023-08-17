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

  function updateCounter() {
    if (remainingTime > 0) {
      remainingTime--;
      updateBar();
      countdownElement.textContent = remainingTime;
      setTimeout(updateCounter, 1000); // Actualizar cada segundo
    }
  }

  updateCounter();
function elegirdificultad(id)
{
    document.getElementById("dificultad").value = id;
}
function elegircategoria(id)
{
    document.getElementsByName("categoria").value = id;
}

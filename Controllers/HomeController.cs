using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP7_Aboudara_Garbarino_Kalinscky.Models;

namespace TP7_Aboudara_Garbarino_Kalinscky.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
    public IActionResult ConfigurarJuego(){
        ViewBag.listaCategorias = Juego.obtenerCategorias();
        ViewBag.listaDificultades = Juego.obtenerDificultades();
        return View();
    }
    public IActionResult Comenzar(string username, int dificultad, int categoria){
        if (!Juego.CargarPartida(username, dificultad, categoria)){
            return RedirectToAction("ConfigurarJuego");
        }
        return RedirectToAction("Jugar");
    }
    public IActionResult Jugar(){
        ViewBag.pregunta = Juego.obtenerProximaPregunta();
        if (ViewBag.pregunta.IDPregunta == null || ViewBag.pregunta.IDPregunta == 0)
            return View("Fin");
        ViewBag.respuestas = Juego.obtenerProximasRespuestas(ViewBag.pregunta.IDPregunta);
        ViewBag.username = Juego._username;
        ViewBag.puntajeActual = Juego._puntajeActual;
        return View("Juego");
    }
    [HttpPost] public IActionResult VerificarRespuesta(int IDPregunta, int IDRespuesta){
        ViewBag.correcto = Juego.verificarRespuesta(IDPregunta, IDRespuesta);
        var nashe = Juego.obtenerProximasRespuestas(IDPregunta);
        foreach (var item in nashe)
        {
            if (item.correcta)
            ViewBag.respuestaCorrecta = item.contenido;
        }
        return View("Respuesta");
    }
    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

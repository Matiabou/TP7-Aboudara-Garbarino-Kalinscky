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
        return Jugar();
    }
    public IActionResult Jugar(int IDPregunta = 0, int IDRespuesta = 0){
        if (IDRespuesta != 0)
            Juego.verificarRespuesta(IDPregunta, IDRespuesta);
        ViewBag.pregunta = Juego.obtenerProximaPregunta();
        if (ViewBag.pregunta.IDPregunta == null || ViewBag.pregunta.IDPregunta == 0)
            return View("Fin");
        ViewBag.respuestas = Juego.obtenerProximasRespuestas(ViewBag.pregunta.IDPregunta);
        ViewBag.username = Juego._username;
        ViewBag.puntajeActual = Juego._puntajeActual;
        return View("Juego");
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

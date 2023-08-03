static class Juego{
    private static string _username;
    private static int _puntajeActual = 0;
    private static int _cantidadPreguntasCorrectas = 0;
    private static List<Pregunta> _preguntas = new List<Pregunta>();
    private static List<Respuesta> _respuestas = new List<Respuesta>();
    public static List<Categoria> obtenerCategorias(){
        return BD.ObtenerCategorias();
    }
    public static List<Dificultad> obtenerDificultades(){
        return BD.ObtenerDificultades();
    }
    public static bool CargarPartida(string username, int dificultad, int categoria){
        _username = username;
        _preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        _respuestas = BD.ObtenerRespuestas(_preguntas)
    }
    public static Pregunta obtenerProximaPregunta(){
        if (_preguntas.Count() > 0){
            Random r = new Random();
            return r.Next(_respuestas.Count() - 1);
        }
        else
            return new Pregunta();
        
    }
    public static List<Respuesta> obtenerProximasRespuestas(int IDPregunta){
        List<Respuesta> respuestas = new List<Respuesta>();
        for (int i = 0; i < _respuestas.Count(); i++)
        {
            if (_respuestas[i].IDPregunta == IDPregunta)
                respuestas.Add(_respuestas[i]);
        }
        return respuestas;
    }
    public static bool verificarRespuesta(int IDPregunta, int IDRespuesta){
        Pregunta pregunta;
        Respuesta respuesta;
        for (int i = 0; i < _respuestas.Count(); i++)
        {
            if (_respuestas[i].IDRespuesta == IDRespuesta){
                respuesta = _respuestas[i];
                break;
            }
        }
        for (int i = 0; i < _preguntas.Count(); i++){
            if (_preguntas[i].IDPregunta == IDPregunta){
                _preguntas.RemoveAt(i);
                break;
            }
        }
        if (respuesta.correcta){
            _puntajeActual += 100;
            _cantidadPreguntasCorrectas++;
            return true;
        }
        return false;
    }
}
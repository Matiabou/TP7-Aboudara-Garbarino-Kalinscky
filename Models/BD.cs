using System.Data.SqlClient;
using Dapper;

namespace TP7-Aboudara-Garbarino-Kalinscky.Models;

public static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=TP7-Aboudara-Garbarino-Kalinscky;Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias() 
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categorias";
            listaCategorias = db.Query<Categoria>(sql).ToList();
        }
    }

    public static List<Dificultad> ObtenerDificultades() 
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Dificultades";
            listaDificultades = db.Query<Dificultad>(sql).ToList();
        }
    }
    
     public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Preguntas WHERE FK_IdCategoria = @pCategoria AND FK_IdDificultad = @pDificultad";
            listaDificultades = db.Query<Dificultad>(sql,new {pCategoria = categoria, pDificultad = dificultad}).ToList();
        }
    }
    /*
        ObtenerPreguntas(int dificultad, int categoria): Recibe un id de dificultad y un id de categoría. Devuelve una lista con las preguntas que se van a utilizar en el juego.
        Aclaración:

        Si dificultad = -1, trae las preguntas de todas las dificultades.

        Si categoria = -1, trae las preguntas de todas las categorías.

        ObtenerRespuestas(List<Pregunta> preguntas): Recibe la lista de preguntas que se va a usar en el juego, y devuelve una lista con todas las respuestas para dichas preguntas.
        Ayuda 1 : Para conseguir las respuestas, hay que ir recorriendo la lista de preguntas!!

        Ayuda 2 : El método AddRange de cualquier lista, permite agregar varios objetos a una lista en una sola operación. Podría servirte para agregar todas las respuestas que vienen de cada pregunta a la lista general de respuestas…

        (Crear además todos los atributos y métodos privados que se requieran vistos en clase, para poder conectar el proyecto con la base de datos)
    */
}
using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

namespace TP7_Aboudara_Garbarino_Kalinscky.Models;


public static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=TP7-Aboudara-Garbarino-Kalinscky;Trusted_Connection=True;";

    public static List<Categoria> listaCategorias = new List<Categoria>();
    public static List<Categoria> ObtenerCategorias() 
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categoria";
            listaCategorias = db.Query<Categoria>(sql).ToList();
        }
        return listaCategorias;
    }

    public static List<Dificultad> listaDificultades = new List<Dificultad>();
    public static List<Dificultad> ObtenerDificultades() 
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Dificultad";
            listaDificultades = db.Query<Dificultad>(sql).ToList();
        }
        return listaDificultades;
    }

    public static List<Pregunta> listaPreguntas = new List<Pregunta>();
     public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            
            if (dificultad == -1) {
                if (categoria == -1) {
                    string sql = "SELECT * FROM Pregunta";
                    listaPreguntas = db.Query<Pregunta>(sql).ToList();
                }
                else {
                    string sql = "SELECT * FROM Pregunta WHERE FKCategoria = @pCategoria";
                    listaPreguntas = db.Query<Pregunta>(sql,new {pCategoria = categoria}).ToList();
                }
            }
            else if(categoria == -1){
                string sql = "SELECT * FROM Pregunta WHERE FKDificultad = @pDificultad";
                listaPreguntas = db.Query<Pregunta>(sql,new {pDificultad = dificultad}).ToList();
            }
            else {
            string sql = "SELECT * FROM Pregunta WHERE FKCategoria = @pCategoria AND FKDificultad = @pDificultad";
            listaPreguntas = db.Query<Pregunta>(sql,new {pCategoria = categoria, pDificultad = dificultad}).ToList();
            }
            
        }
        return listaPreguntas;
    }

    private static List<Respuesta> listaRespuestas = new List<Respuesta>();
    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "";
            foreach (Pregunta preg in preguntas)
            {
                sql = "SELECT * FROM Respuesta WHERE FKPregunta = @pPregunta";
                listaRespuestas.Add(db.QueryFirstOrDefault<Respuesta>(sql, new {pPregunta = preg.IDPregunta}));
            }
        }
        return listaRespuestas;
    }
}
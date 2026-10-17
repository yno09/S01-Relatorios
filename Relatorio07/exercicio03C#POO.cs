using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class Grimorio {
    public string FeiticoFavorito {get; set;} = "Nenhum";

    public void Abrir() {
        Console.WriteLine($"Feitiço favorito: {FeiticoFavorito}");
    }
}

public class Companheiro {
    public string Nome {get; set;}
    public string Funcao {get; set;}

    //Constructor
    public Companheiro(string nome, string funcao) {
        this.Nome = nome;
        this.Funcao = funcao;
    }

    //método se apresentar
    public void SeApresentar() {
        Console.WriteLine($"Nome: {Nome}");
        Console.WriteLine($"Função: {Funcao}");
    }
}

public class Maga
{
    public string Nome { get; private set; }
    public Grimorio Grimorio { get; private set; }

    private List<Companheiro> companheiros = new List<Companheiro>();

    // Construtor
    public Maga(string nome)
    {
        Nome = nome;
        // COMPOSIÇÃO: a Maga cria seu próprio grimório ao ser construída.
        Grimorio = new Grimorio();
    }

    // AGREGAÇÃO: a Maga recebe companheiros que já existem.
    public void Recrutar(Companheiro c)
    {
        companheiros.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\n=== Grupo de {Nome} ===");

        Console.WriteLine("\nCompanheiros:");

        foreach (Companheiro companheiro in companheiros)
        {
            companheiro.SeApresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Jornada da Frieren ===");

        Companheiro fern = new Companheiro("Fern", "Maga");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");
        Companheiro sein = new Companheiro("Sein", "Clérigo");
        

        Maga frieren = new Maga("Frieren");

        frieren.Recrutar(fern);
        frieren.Recrutar(stark);
        frieren.Recrutar(sein);

        frieren.Grimorio.FeiticoFavorito = "Magia que cria um campo de flores";

        frieren.MostrarGrupo();

        Console.WriteLine("=== Grimório da Frieren ===");
        frieren.Grimorio.Abrir();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System;
using System.Collections.Generic;

public class CombatenteDeGondor {
    public string Nome {get; private set;}

    public string Posto {get; private set;}

    public string Povo {get; private set;}

    public string Armamento {get; private set;} = "Desarmado";

    // método de equipar arma
    public void Equipar(string arma) {
        Armamento = arma;
    }

	// construtor
	public CombatenteDeGondor(string nome, string povo, string posto) {
		this.Nome = nome;
		this.Povo = povo;
		this.Posto = posto;

		Console.WriteLine($"Combatente {Nome} criado com sucesso!");
	}

    // método de apresentar unidade
    public void ApresentarUnidade() {
        Console.WriteLine($"--- Dados dos Combatentes --- ");
        Console.WriteLine($"Nome: {Nome}");
        Console.WriteLine($"Posto: {Posto}");
        Console.WriteLine($"Povo: {Povo}");

        if (Armamento != "Desarmado") {
            Console.WriteLine($"Arma: {Armamento}");
        }
    }
}

public class Program {
    public static void Main (string[] args) {
        Console.WriteLine($"=== Exército de Gondor ===");
        
        CombatenteDeGondor combatente1 = new CombatenteDeGondor("Boromir", "Homem", "Capitão");

        CombatenteDeGondor combatente2 = new CombatenteDeGondor("Faramir", "Homem", "Comandante");

        CombatenteDeGondor combatente3 = new CombatenteDeGondor("Beregond", "Homem", "Soldado");
		
		/*
		tentativa de mudança de posto:
		combatente1.Posto = "General";

		mensagem de erro:
		exercicio01C#.cs(5,1): warning CS0105: The using directive for `System' appeared previously in this namespace
		exercicio01C#.cs(6,1): warning CS0105: The using directive for `System.Collections.Generic' appeared previously in this namespace
		exercicio01C#.cs(54,15): error CS0272: The property or indexer `CombatenteDeGondor.Posto' cannot be used in this context because the set accessor is inaccessible
		exercicio01C#.cs(11,39): (Location of the symbol related to previous error)
		*/
		
 	    combatente1.Equipar("espada");
        combatente2.Equipar("adaga");

        combatente1.ApresentarUnidade();
        combatente2.ApresentarUnidade();
        combatente3.ApresentarUnidade();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class EntidadeCosmica {
    public string Nome {get; set;} = "Desconhecida";
    public string Origem {get; set;} = "Desconhecida";

    public EntidadeCosmica(string nome, string origem) {
        Nome = nome;
        Origem = origem;
    }

    public virtual void Manifestar() {
        if (Origem != "Desconhecida") {
            Console.WriteLine($"{Origem}");
        } else {
            Console.WriteLine("Origem desconhecida.");
        }
    }

}

public class Profundo : EntidadeCosmica {
    public Profundo(string nome, string origem) : base(nome, origem) {
        
    }
    public override void Manifestar() {
        Console.WriteLine($"O profundo se manifesta!");
    }
}

public class MiGo : EntidadeCosmica {
    public MiGo(string nome, string origem) : base(nome, origem) {
        
    }
    public override void Manifestar() {
        Console.WriteLine("O Mi-Go se manifesta!");
        base.Manifestar();
    }
}

public class Pesquisador {
    public string Nome {get; set;}
    private List<EntidadeCosmica> entidadesCosmicas = new List<EntidadeCosmica>();

    public Pesquisador(string nome) {
        Nome = nome;
    }
    public void Catalogar(EntidadeCosmica e) {
        entidadesCosmicas.Add(e);
        Console.WriteLine($"{e.Nome} foi catalogado.");
    }
    public void LerCatalogo() {
        Console.WriteLine($"=== Catálogo de {Nome} ===");

        foreach (EntidadeCosmica entidade in entidadesCosmicas) {
            Console.WriteLine($"\nEntidade: {entidade.Nome}");
            entidade.Manifestar();
        }
    }
}

public class Program {
    public static void Main(string[] args) {
        Console.WriteLine("=== Catálogo de Entidades Cósmicas ===");

        EntidadeCosmica visitante = new EntidadeCosmica("Visitante", "Desconhecida");

        MiGo miGo = new MiGo("Mi-Go", "Yuggoth");

        Profundo cthulhu = new Profundo("Cthulhu", "Profundezas do oceano");

        Pesquisador pesquisador = new Pesquisador("Armitage");

        pesquisador.Catalogar(visitante);
        pesquisador.Catalogar(miGo);
        pesquisador.Catalogar(cthulhu);

        pesquisador.LerCatalogo();
    }
}
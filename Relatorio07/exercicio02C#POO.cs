using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class Pokemon {
    public string Especie {get; private set;}
    public int Nivel {get; private set;}

    // construtor
    public Pokemon (string especie, int nivel) {
        this.Especie = especie;
        this.Nivel = nivel;
    }
    // método ataque genérico
    public virtual void Atacar() {
        Console.WriteLine($"{Especie} usou um ataque!");
    }
}

public class TipoEletrico : Pokemon {
    public TipoEletrico (string especie, int nivel) : base (especie, nivel) {
        
    }
    // override ataque tipo elétrico
    public override void Atacar() {
        Console.WriteLine($"{Especie} usou Thunder Wave");
    }
}

public class TipoPlanta : Pokemon {
    public TipoPlanta (string especie, int nivel) : base (especie, nivel) {
        
    }
    // override ataque tipo planta
    public override void Atacar() {
        Console.WriteLine($"{Especie} usou Razor Leaf");
    }
}

public class Program {
    public static void Main (string[] args) {
        Console.WriteLine($"== Batalha Pokemon ===");

        List<Pokemon> pokemons = new List<Pokemon>();

        pokemons.Add(new TipoPlanta("Rowlet", 15));
        pokemons.Add(new TipoEletrico("Joltik", 10));

        foreach (Pokemon pokemon in pokemons)
        {
            Console.WriteLine($"\nPokémon: {pokemon.Especie}");
            Console.WriteLine($"Nível: {pokemon.Nivel}");

            pokemon.Atacar();
        }
    }
}
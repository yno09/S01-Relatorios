using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System;
using System.Collections.Generic;

public class Grimorio {
    public string FeiticoFavorito {get; set;} = "Nenhum";

    public void Abrir() {
        Console.WriteLine($"Feitiço favorito: {FeiticoFavorito}");
    }
}

public class Companheiro {
    public string Nome {get; set;}
    public string Funcao {get; set;}

    
}
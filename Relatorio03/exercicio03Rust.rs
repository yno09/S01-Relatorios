use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32)
{
    for i in limite_inferior..=limite_superior {
        if i % 10 == digito {
            println!("{}", i);
        }
    }
}

fn main()
{
    let mut limite_inferior = String::new();
    let mut limite_superior = String::new();
    let mut digito = String::new();

    println!("Digite o digito final desejado (0 a 9): ");
    io::stdin().read_line(&mut digito).expect("Erro ao ler o digito");

    println!("Digite o limite inferior: ");
    io::stdin().read_line(&mut limite_inferior).expect("Erro ao ler o limite inferior");

    println!("Digite o limite superior: ");
    io::stdin().read_line(&mut limite_superior).expect("Erro ao ler o limite superior");

    let digito: i32 = digito.trim().parse().expect("Digite um numero valido");
    let limite_inferior: i32 = limite_inferior.trim().parse().expect("Digite um numero valido");
    let limite_superior: i32 = limite_superior.trim().parse().expect("Digite um numero valido");

    println!("--- Numeros no intervalo terminados em {} ---", digito);

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}
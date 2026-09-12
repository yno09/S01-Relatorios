use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> (bool, i32)
{
    let diferenca = (palpite - numero_secreto).abs();

    if diferenca <= 5 {
        (true, diferenca)
    } else {
        (false, diferenca)
    }
}

fn main()
{
    loop
    {
        let numero_secreto: i32 = 13;
        let mut entrada = String::new();

        println!("Digite seu palpite:");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Erro ao ler o palpite");

        let palpite: i32 = entrada
            .trim()
            .parse()
            .expect("Digite um numero valido");

        let (acertou, diferenca) = acertou_o_alvo(palpite, numero_secreto);

        if acertou {
            println!("Parabens, voce acertou o alvo!");
            println!("Ficou a apenas {} numeros", diferenca);
            break;
        } else {
            println!("Voce passou longe! Tente novamente.");
        }
    }
}
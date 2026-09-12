use std::io;

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> (f64, bool)
{
    let mut NPT = 0.0;
    let mut PF = 0.0;

    NPT = (prova1 + prova2) / 2.0;

    PF = 0.6 * NPT + 0.4 * redacao;

    if PF >= 60.0 {
        (PF, true)
    } else {
        (PF, false)
    }
}

fn main()
{
    let mut p1 = String::new();
    let mut p2 = String::new();
    let mut redacao = String::new();

    println!("Digite a nota da Prova Teorica 1: ");
    io::stdin().read_line(&mut p1).expect("Erro ao ler a nota");

    println!("Digite a nota da Prova Teorica 2: ");
    io::stdin().read_line(&mut p2).expect("Erro ao ler a nota");

    println!("Digite a nota da Redacao: ");
    io::stdin().read_line(&mut redacao).expect("Erro ao ler a nota");

    let p1: f64 = p1.trim().parse().expect("Digite um numero valido");
    let p2: f64 = p2.trim().parse().expect("Digite um numero valido");
    let redacao: f64 = redacao.trim().parse().expect("Digite um numero valido");

    let (PF, aprovado) = calcular_pontuacao(p1, p2, redacao);

    if aprovado {
        println!("Parabens! Candidato aprovado no processo seletivo.");
        println!("Nota final: {}", PF);
    } else {
        println!("Mais sorte da proxima vez");
        println!("Nota final: {}", PF);
    }
}
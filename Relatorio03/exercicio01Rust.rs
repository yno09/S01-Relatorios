use std::io;

fn validar_placa(placa: &str) -> bool {
    let mut letras_maiusculas = 0;
    let mut numeros = 0;

    for c in placa.chars() {
        if c.is_ascii_uppercase() {
            letras_maiusculas += 1;
        }

        if c.is_numeric() {
            numeros += 1;
        }
    }

    placa.len() >= 7 && letras_maiusculas >= 4 && numeros >= 2
}

fn main() {
    loop {
        let mut entrada = String::new();

        println!("Digite a placa do veiculo:");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Erro ao ler a placa");

        let placa = entrada.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
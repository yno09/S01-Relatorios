class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} usa aura para atacar ${alvo.nome}!`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} concentra sua aura no punho e desfere um soco poderoso contra ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transforma sua aura em eletricidade e lança um choque contra ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} materializa uma corrente e ataca ${alvo.nome}!`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`\nA Trupe Fantasma foi avistada em ${this.cidade}!`);

        this.#aranhas.forEach(aranha => {
            console.log(`Aranha Nº ${aranha.numero}: ${aranha.nome}`);
        });
    }

    buscarAranha(numero) {
        return this.#aranhas.find(aranha => aranha.numero === numero);
    }
}

// --- Main ---

const aranha1 = new Aranha("Feitan", 2);
const aranha2 = new Aranha("Machi", 3);

const trupe = new TrupeFantasma("Yorknew", [aranha1, aranha2]);

trupe.revelarAranhas();

const alvo = trupe.buscarAranha(2);

console.log(`Aranha escolhida como alvo: ${alvo.nome}`);

const usuarios = [
    new Intensificador("Gon"),
    new Transmutador("Killua"),
    new Materializador("Kurapika")
];

console.log("=== Início do combate! ===");

usuarios.forEach(usuario => {
    usuario.atacar(alvo);
});
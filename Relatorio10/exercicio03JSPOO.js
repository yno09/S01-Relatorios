class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `Criatura: ${this.criatura} | Nível de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas;

    constructor(numero) {
        this.numero = numero;
        this.#fichas = [];
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`=== Diário Misterioso Nº ${this.numero} ===`);

        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios;

    constructor(dono) {
        this.dono = dono;
        this.#funcionarios = [];
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n=== A Cabana do Mistério, de ${this.dono} ===`);

        this.#funcionarios.forEach(funcionario => {
            console.log(`Funcionário: ${funcionario.nome} | Cargo: ${funcionario.cargo}`);
        });
    }
}

// --- Main ---

const diario = new DiarioMisterioso(3);

diario.anotar('Sósia', 'Alto');
diario.anotar('Gnomo', 'Baixo');
diario.anotar('Bill Cipher', 'Extremo');

diario.exibirFichas();

const funcionario1 = new Funcionario('Stanley Pines', 'Dono');
const funcionario2 = new Funcionario('Wendy', 'Recepcionista');

const cabana = new CabanaDoMisterio('Stanley Pines');

cabana.contratar(funcionario1);
cabana.contratar(funcionario2);

cabana.abrirAsPortas();

/*

AGREGAÇÃO: Na classe CabanasDeMisterio, objeto funcionário é criado antes da cabana e adcionados
ao array privado de #funcionarios no metodo contratar, ou seja, o array funcionarios existem independentemente
da classe cabana.

COMPOSIÇÃO: Na classe CabanasDeMisterio, o metodo anotar cria FichaDeCriatura dentro
do proprio metodo e é adcionado a #fichas, ou seja, diário é responsavel por criar ficha de criaturas.

*/
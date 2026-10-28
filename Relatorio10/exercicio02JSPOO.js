class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error('Habilidade não implementada para esta classe!');
    }

    entrarEmCombate() {
        const habilidade = this.usarHabilidade();

        console.log(
            `${this.codinome} entrou em combate com a pistola ${this.#pistola.modelo}. Habilidade: ${habilidade}`
        );
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Cortina de fumaça';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Reconhecimento da área';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'Investida agressiva';
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes = []) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`=== Esquadrão ${this.nome} iniciou a partida! ===`);

        this.#agentes.forEach(agente => {
            agente.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.#agentes.filter(
            agente => agente instanceof Controlador
        );
    }
}

// --- Main ---

const controlador1 = new Controlador('Omen', 'Classic');
const controlador2 = new Controlador('Brimstone', 'Ghost');
const iniciador1 = new Iniciador('Sova', 'Sheriff');
const duelista1 = new Duelista('Jett', 'Frenzy');

const agentes = [
    controlador1,
    controlador2,
    iniciador1,
    duelista1
];

const esquadrao = new Esquadrao('Alpha', agentes);

esquadrao.iniciarPartida();

console.log('---Controladores do esquadrão ---');

esquadrao.listarControladores().forEach(agente => {
    console.log(agente.codinome);
});

/*
const agenteTeste = new AgenteProtocolo('Agente Base', 'Classic');

agenteTeste.entrarEmCombate();

--- mensagem de erro --- 

Error: Habilidade não implementada para esta classe!
    at AgenteProtocolo.usarHabilidade (/home/vitorynoguti/Área de trabalho/S01 Relatorios/S01-Relatorios/Relatorio10/exercicio02JSPOO.js:16:15)
    at AgenteProtocolo.entrarEmCombate (/home/vitorynoguti/Área de trabalho/S01 Relatorios/S01-Relatorios/Relatorio10/exercicio02JSPOO.js:20:33)
    at Object.<anonymous> (/home/vitorynoguti/Área de trabalho/S01 Relatorios/S01-Relatorios/Relatorio10/exercicio02JSPOO.js:95:13)
    at Module._compile (node:internal/modules/cjs/loader:1929:14)
    at Object..js (node:internal/modules/cjs/loader:2060:10)
    at Module.load (node:internal/modules/cjs/loader:1651:32)
    at Module._load (node:internal/modules/cjs/loader:1443:12)
    at wrapModuleLoad (node:internal/modules/cjs/loader:261:19)
    at Module.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:154:5)
    at node:internal/main/run_main_module:33:47

Node.js v24.22.1

*/
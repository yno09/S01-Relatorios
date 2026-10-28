class Pokemon {
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida(){
        return this.#vida;
    }

    sofrerDano(pontos){
        this.#vida = this.#vida - pontos;

        // tratamento de exceções pra n dar merda
        if (this.#vida < 0) {
            this.#vida = 0;
        }
    }

    atacar(alvo){
        console.log(`${this.apelido} atacou ${alvo.apelido}`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    atacar(alvo) {
        console.log('Hydro Pump');
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo) {
        console.log('Leaf Storm'); 
        alvo.sofrerDano(15);
    }
}

// --- Main ---

const squirtle = new Squirtle('Guelinha', 30);
const bulbasaur = new Bulbasaur('febre do rato', 30);

bulbasaur.atacar(squirtle);

squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

console.log(`${squirtle.apelido} está com: ${squirtle.vida} de vida.`);
console.log(`${bulbasaur.apelido} está com: ${bulbasaur.vida} de vida.`);
/*
console.log(squirtle.#vida);

-- mensagem de erro --

SyntaxError: Private field '#vida' must be declared in an enclosing class
    at wrapSafe (node:internal/modules/cjs/loader:1861:18)
    at Module._compile (node:internal/modules/cjs/loader:1903:20)
    at Object..js (node:internal/modules/cjs/loader:2060:10)
    at Module.load (node:internal/modules/cjs/loader:1651:32)
    at Module._load (node:internal/modules/cjs/loader:1443:12)
    at wrapModuleLoad (node:internal/modules/cjs/loader:261:19)
    at Module.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:154:5)
    at node:internal/main/run_main_module:33:47
    
*/
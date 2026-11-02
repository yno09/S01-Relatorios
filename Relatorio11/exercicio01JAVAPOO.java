abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " é um mago e possui o feitiço: " + feitico);
    }
}

class DemonioDoFogo extends Morador {

    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " é um demônio do fogo e faz o castelo andar!");
    }
}
// MAIN
public class exercicio01JAVAPOO {
    public static void main(String[] args) {

        Morador mago = new Mago("Howl", "Magia de transformação");

        Morador demonio = new DemonioDoFogo("Calcifer");

        mago.apresentar();
        demonio.apresentar();

        // Tentativa de instanciar a classe abstrata:
        // Morador morador = new Morador("Sophie");
    }
}
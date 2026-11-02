import java.util.ArrayList;

// ABSTRAÇÃO
// Monstro é uma classe abstrata que representa os ingredientes do banquete
abstract class Monstro {

    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {

    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Cozinhar em fogo baixo por 20 minutos com temperos mágicos.";
    }
}

class Mandragora extends Monstro {

    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Ferver com ervas encantadas e deixar descansar por 10 minutos.";
    }
}

// COMPOSIÇÃO
// Panela representa um objeto que será criado dentro do Cozinheiro
class Panela {

    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {

    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;

        // COMPOSIÇÃO:
        // A Panela é criada dentro do Cozinheiro.
        // O cozinheiro é responsável por criar sua panela.
        this.panela = new Panela(materialDaPanela);

        // AGREGACÃO:
        // A lista recebe monstros que já foram criados fora do cozinheiro.
        // Os monstros podem existir independentemente dele.
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        this.ingredientes.add(monstro);
    }

    public void servirBanquete() {

        System.out.println("Cozinheiro: " + nome);
        System.out.println("Material da panela: " + panela.getMaterial());

        System.out.println("\n--- Ingredientes do Banquete ---");

        for (Monstro monstro : ingredientes) {

            System.out.println("Monstro: " + monstro.getNome());
            System.out.println("Receita: " + monstro.receita());
            System.out.println();
        }
    }
}

public class exercicio04JAVAPOO {

    public static void main(String[] args) {
        Slime slime = new Slime("Slime Azul");

        Mandragora mandragora = new Mandragora("Mandragora Selvagem");
        Cozinheiro cozinheiro = new Cozinheiro("Remy", "Ferro");
        cozinheiro.adicionarIngrediente(slime);

        cozinheiro.adicionarIngrediente(mandragora);
    }
}       
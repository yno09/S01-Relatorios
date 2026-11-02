import java.util.ArrayList;

class ItemDoCardapio {

    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}

class ComboLeblanc extends ItemDoCardapio {

    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}

class CafeLeblanc {

    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        this.cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        this.cardapio.add(item);

        System.out.println("[Cardápio] Item adicionado: " + item.getNome());
    }

    public void mostrarCardapio() {

        for (ItemDoCardapio item : cardapio) {
            System.out.println(item.getNome() + " - R$ " + item.precoFinal());
        }
    }
}

public class exercicio02JAVAPOO {

    public static void main(String[] args) {

        ItemDoCardapio cafe = new ItemDoCardapio("Café", 5.00);

        ItemDoCardapio bolo = new ItemDoCardapio("Bolo", 8.00);

        ComboLeblanc combo = new ComboLeblanc("Combo Café + Bolo", 13.00);

        CafeLeblanc cafeLeblanc = new CafeLeblanc();

        cafeLeblanc.adicionar(cafe);
        cafeLeblanc.adicionar(bolo);
        cafeLeblanc.adicionar(combo);

        cafeLeblanc.mostrarCardapio();
    }
}
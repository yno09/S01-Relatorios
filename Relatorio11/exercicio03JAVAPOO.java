import java.util.HashMap;

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {

    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " se manifestou");
    }
}

class EspiritoYoukai implements Sobrenatural {

    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " se manifestou");
    }
}

class MapaDeAvistamentos {

    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        this.avistamentos.put(local, ser);

        System.out.println("[Registro] Avistamento registrado: " + local);
    }

    public void investigar(String local) {
        Sobrenatural ser = this.avistamentos.get(local);

        if (ser == null) {
            System.out.println("[Investigação] " + local + " está tranquilo.");
        } else {
            System.out.println("[Investigação] Encontrado em " + local + ":");
            ser.manifestar();
        }
    }
}

public class exercicio03JAVAPOO {

    public static void main(String[] args) {

        Alienigena alienigena = new Alienigena("Camarao");
        EspiritoYoukai youkai = new EspiritoYoukai("Veiaturbo");
        MapaDeAvistamentos mapa = new MapaDeAvistamentos();

        mapa.registrar("Área 51", alienigena);
        mapa.registrar("Casa do dudu", youkai);
        mapa.investigar("Área 51");
        mapa.investigar("Casa do dudu");
        mapa.investigar("ETEfmc");
    }
}
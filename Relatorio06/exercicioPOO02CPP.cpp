#include <iostream>
#include <string>
using namespace std;

class LinkSocial {
private:
    string nome;
    string arcana;
    int rank;

public:
    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    void setNome(string n) {
        nome = n;
    }

    void setArcana(string a) {
        arcana = a;
    }

    void setRank(int r) {
        rank = r;
    }

    void subirRank() {
        rank++;
    }
};

int main() {
    LinkSocial link;
    // nao entendo de persona, foi mal pedro persona :(
    link.setNome("Dante");
    link.setArcana("devilmaycry");
    link.setRank(1);

    cout << "=== Link Social ===" << endl;
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank inicial: " << link.getRank() << endl;

    link.subirRank();

    cout << endl;
    cout << "=== Rank atual ===" << endl;
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank atual: " << link.getRank() << endl;

    return 0;
}
#include <iostream>
using namespace std;

class banda {
    public:
        string nome;
        int integrantes;
        float potenciaSom;
        int energia;

        void duelar (banda & rival) {
            cout << "Banda " << nome << " duelando com a banda " << rival.nome << endl;
            rival.energia -= potenciaSom;

            cout << "Banda " << nome << " causou " << potenciaSom << " de dano na banda " << rival.nome << endl;
        }
        void status () {
            cout << "Banda: " << nome << endl;
            cout << "Integrantes: " << integrantes << endl;
            cout << "Potência do som: " << potenciaSom << endl;
            cout << "Energia: " << energia << endl;
        }
};

int main () {
    banda b1;
    banda b2;

    b1.nome = "Siousxie and the Banshees";
    b1.integrantes = 3;
    b1.potenciaSom = 100.0;
    b1.energia = 500;

    b2.nome = "The Cure";
    b2.integrantes = 5;
    b2.potenciaSom = 80.0;
    b2.energia = 400;

    cout << "=== Status Iniciais ===" << endl;

    cout << "Status da Banda 1:" << endl;
    b1.status();
    cout << endl;

    cout << "Status da Banda 2:" << endl;
    b2.status();
    cout << endl;

    cout << "=== Duelo ===" << endl;
    b1.duelar(b2);
    cout << endl;

    cout << "=== Status Final ===" << endl;
    cout << "Status da Banda 1:" << endl;
    b1.status();
    cout << endl;

    cout << "Status da Banda 2:" << endl;
    b2.status();
    cout << endl;

    return 0;
}
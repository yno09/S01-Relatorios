#include <iostream>
#include <string>
using namespace std;


class membroInatel {
    public:
        string nome;
        void seApresentar() {
            cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
        }
};

class aluno : public membroInatel {
    public:
        string curso;
        void seApresentar() {
            cout << "Meu nome é " << nome << " e estudo no curso de " << curso << "." << endl;
        }
};

class professor : public membroInatel {
    public:
        string disciplina;
        void seApresentar() {
            cout << "Meu nome é " << nome  << " e leciono a discplina de " << disciplina << "." << endl;
        }
};

int main () {
    aluno a1;
    a1.nome = "Vitor Nolasco Ynoguti";
    a1.curso = "Engenharia de Software";

    professor p1;
    p1.nome = "Carlos Alberto Ynoguti";
    p1.disciplina = "Algoritimos e Estruturas de Dados";

    cout << "=== Apresentação do Aluno ===" << endl;
    a1.seApresentar();
    cout << endl;

    cout << "=== Apresentação do Professor ===" << endl;
    p1.seApresentar();  
    cout << endl;

    return 0;
}
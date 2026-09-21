#include <iostream>
#include <vector>
using namespace std;

class hobbit {
    public:
        string nome;
        virtual void fazerAtividade() {
            cout << "O hobbit " << nome << " está aproveitando um dia tranquilo na Comarca." << endl;
        }
};

class jardineiro : public hobbit {
    public:
        virtual void fazerAtividade() {
            cout << "O jardineiro " << nome << " está cuidando das flores e plantas ao redor das tocas!" << endl;
        }
};

class cozinheiro : public hobbit {
    public:
        virtual void fazerAtividade() {
            cout << "O cozinheiro " << nome << " está preparando o segundo café da manhã para os convidados!" << endl;
        }
};

class fazendeiro : public hobbit {
    public:
        virtual void fazerAtividade() {
            cout << "O fazendeiro " << nome << " está colhendo vegetais e hortaliças em suas terras!" << endl;
        }
};

int main () {
    vector<hobbit*> hobbits;

    jardineiro j1; 
    j1.nome = "Samwise"; 
    cozinheiro c1;
    c1.nome = "Peregrin";
    fazendeiro f1;
    f1.nome = "Merry";

    hobbits.push_back(&j1);
    hobbits.push_back(&c1);
    hobbits.push_back(&f1);

    cout << "=== Atividades dos Hobbits ===" << endl;
    for (hobbit* h : hobbits) {
        h->fazerAtividade();
    }

    return 0;
}
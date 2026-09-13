#include <iostream>
using namespace std;

int main ()
{
    int matriz[5][5] = {
        {0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0}
    };
    int f, c = 0;
    int op;
    int ativas = 0;
    int inativas = 0;

    do {
        cout << "=== TELEMETRIA DO PAINEL SOLAR ===" << endl;
        cout << "1. Ativar Celulas" << endl;
        cout << "2. Ver o Mapa da Matriz" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opção: " << endl;
        cin >> op;

        switch (op) {
            case 1:
                cout << "Digiite a fileira (0-4): ";
                cin >> f;

                cout << "Digite a coluna (0-4): ";
                cin >> c;

                if (matriz[f][c] == 0) {
                    matriz[f][c] = 1;
                    cout << "Celula ativada com sucesso " << endl;
                } else {
                    cout << "Erro: Celula solar ja esta em operacao" << endl;
                }   
                break;

            case 2:
                cout << "Mapa da Matriz:" << endl;
                for (f = 0; f < 5; f++) {
                    for (c = 0; c < 5; c++) {
                        cout << "[" << matriz[f][c] << "]";
                    }
                    cout << endl;
                }
                break;

            case 3:
                cout << "Encerrando sistema de telemetria..." << endl;
                break;

            default:
                cout << "opção inválida" << endl;
        }
    } while(op != 3);

    for (int f = 0; f < 5; f++) {
        for (int c = 0; c < 5; c++) {
            if (matriz[f][c] == 1) {
                ativas++;
            } else {
                inativas++;
            }
        }
    }

    float percentual = (ativas * 100.0) / 25;
    
    cout << "=== RELATORIO FINAL DE OPERACAO ===" << endl;
    cout << "Total de celulas ATIVAS: " << ativas << endl;
    cout << "Total de celulas INATIVAS: " << inativas << endl;
    cout << "Capacidade Operacional: " << percentual << "%" << endl;

    return 0;
}
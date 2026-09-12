#include <iostream>
using namespace std;

int main () {
    float capacidadeMax;
    int op;
    float pesoAtual = 0;
    float pesoCarregado;

    cout << "Informe a capacidade maxima de carga do drone (kg): " << endl;
    cin >> capacidadeMax;

    do {
        cout << "=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;

        cout << "Escolha uma opção: " << endl;
        cin >> op;

        switch (op) {
            case 1:
                cout << "Carga atual: " << pesoAtual << "/" << capacidadeMax << endl;
                break;

            case 2:
                cout << "Digite o peso do pacote a ser carregado (kg): " << endl;
                cin >> pesoCarregado;
                pesoAtual += pesoCarregado;

                if (pesoAtual > capacidadeMax) {
                    cout << "Alerta: Peso maximo de decolagem excedido! Operação cancelada." << endl;
                    pesoAtual -= pesoCarregado;
                    break;
                } else {
                    cout << "Pacote adicionado com sucesso!" << endl;
                    break;
                }
            
            case 3:
                pesoAtual = 0;
                cout << "Pacote descarregado com sucesso!" << endl;
                break;

            case 4:
                cout << "Encerrando sistema de telemetria...";
                break;

            default:
                cout << "opção inválida" << endl;
        }
    } while (op != 4);

    return 0;
}
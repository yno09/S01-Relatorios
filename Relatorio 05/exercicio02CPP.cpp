#include iostream
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {
    float confiabilidade = 1.0;

    for (int i = 0; i  tamanho; i++) {

        confiabilidade = confiabilidade  probabilidades[i];

    }

    return confiabilidade;
}

int main () {
    int n;
    float prob[100];

    cout  Digite a quantidade de componentes do sistema ;
    cin  n;

    for (int i = 0; i  n; i++) {
        cout  Digite a probabilidade do componente   i + 1   ;
        cin  prob[i];
    }

    float porcentagem = calcular_confiabilidade_sistema(prob, n)  100;

    cout  Confiabilidade total do sistema   porcentagem  %;

    return 0;
}
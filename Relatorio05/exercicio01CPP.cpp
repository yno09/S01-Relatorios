#include <iostream>
using namespace std;

int combinar_equipes(int n)
{    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else if (n > 1) {
        return combinar_equipes(n-1) + combinar_equipes(n-2);
    }
}



int main() 
{
    int n;

    cout << "Digite o tamanho do chaveamento (n): " << endl << endl;
    cin >> n;

    cout << "Total de cenários de confrontos possíveis: " << endl << endl;
    cout << combinar_equipes(n);
    return 0;
}
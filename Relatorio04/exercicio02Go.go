package main
import "fmt"

func main() {
	var n1 int
	var n2 int
	var n3 int

	fmt.Println("Digite as vendas do 1º trimestre: ")
	fmt.Scanln(&n1)

	fmt.Println("Digite as vendas do 2º trimestre: ")
	fmt.Scanln(&n2)

	fmt.Println("Digite as vendas do 3º trimestre: ")
	fmt.Scanln(&n3)

	var soma = n1 + n2 + n3

	if soma < 100 {
		fmt.Println("Meta mínima anual não atingida!")
	}

	switch {
    case soma >= 250:
        fmt.Println("Classificação: Categoria Top Seller")
    case soma >= 180 && soma <= 249:
        fmt.Println("Classificação: Categoria Senior")
    case soma >= 100 && soma <= 179:
        fmt.Println("Classificação: Categoria Pleno")
  	}

	fmt.Println("Total de Vendas:",soma,"unidades")
}
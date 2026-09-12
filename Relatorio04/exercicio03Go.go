package main
import "fmt"

/*

a cada 4 dias
inciando no dia 1

ex:
01-02
05-02
09-02
...

se i > 30
reseta o contador
e adciona 1 no mes m++

se m > 12
reseta m para 1

*/

func gerarEscalaPlantao(n int) {
	i := 1
	j := 1
	m := 1

	for j <= n {
		fmt.Println("Plantão",j,":","Dia",i,"do mês",m)
		i+=4
		j++

		if i > 30 {
			i = i - 30
			m++
		}

		if m > 12 {
			m = 1
		}
	}
}

func main() {
	var n int
	fmt.Println("Digite a quantidade de plantões necessários:")
	fmt.Scanln(&n)

	fmt.Println("--- Escala de Plantão Técnico ---")
	gerarEscalaPlantao(n)
}
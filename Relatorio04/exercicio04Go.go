package main
import "fmt"

func validarIngresso(setor string, codigo int) bool {
	if setor == "VIP" && codigo == 2026 {
		return true
	} else {
		return false
	}
}

func main() {
	var setor string
	var codigo int

	for {
		fmt.Println("Digite o setor do ingresso:")
		fmt.Scanln(&setor)

		fmt.Println("Digite o codigo do ingresso:")
		fmt.Scanln(&codigo)

		if validarIngresso(setor, codigo) {
			fmt.Println("Acesso liberado à área VIP!")
			break
		} else {
			fmt.Println("Ingresso ou setor inválido. Tente novamente.")
		}
	}
}
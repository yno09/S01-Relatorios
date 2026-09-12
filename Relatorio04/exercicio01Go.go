package main
import "fmt"

func ValidarCodigoRastreio(codigo string) bool {
	if len(codigo) == 10 {
		return true 
	} else {
		return false
	}
}

func main() {
	var codigo string

	for {
		fmt.Println("Digite o código de rastreio:")
		fmt.Scanln(&codigo)

		if ValidarCodigoRastreio(codigo) {
			fmt.Println("Código de rastreio registrado no sistema!")
			break
		} else {
			fmt.Println("Erro: O código de rastreio deve ter exatamente 10 caracteres.")
		}
	}
}
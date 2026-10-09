class MortoVivo:
    def __init__(self, nome, _almas, __estus):
        self.nome = nome
        self._almas = _almas
        self.__estus = __estus

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus inválida!")

    def mostrar_status(self):
        return f"MortoVivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"


class Clerigo(MortoVivo):
    def __init__(self, nome, _almas, __estus, milagre):
        super().__init__(nome, _almas, __estus)
        self.milagre = milagre

    def mostrar_status(self):
        return f"{super().mostrar_status()} | Milagre: {self.milagre}"


# Main
clerigo = Clerigo("Petrus", 1000, 5, "Cura")

# print(clerigo.__estus)
# Mensagem de erro: AttributeError: 'Clerigo' object has no attribute '__estus'. Did you mean: 'get_estus'?

clerigo = Clerigo("Petrus", 1000, 5, "Cura")

print(clerigo.mostrar_status())

clerigo.set_estus(6)

clerigo.set_estus(7)

print(clerigo.mostrar_status())
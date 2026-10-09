from abc import ABC, abstractmethod


class IUnidades(ABC):
    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:
    def __init__(self, modelo):
        self.modelo = modelo


class OperadorNetrunner(IUnidades):
    def __init__(self, nome, modelo_cyberdeck):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(f"Netrunner: {self.nome}")
        print(f"Cyberdeck: {self.cyberdeck.modelo}")
        print("Executando invasão . . .")


class DroneDeVigilancia(IUnidades):
    def __init__(self, codigo):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"Drone: {self.codigo}")
        print("Interceptando sinais da rede . . .")


class CelulaHacker:
    def __init__(self, nome, membros: list[IUnidades]):
        self.nome = nome
        self.membros = membros

    def iniciar_ataque(self):
        print(f"\n=== Célula {self.nome} iniciando ataque ===")

        for membro in self.membros:
            membro.executar_invasao()


# Main
if __name__ == "__main__":

    netrunner = OperadorNetrunner("Lucy", "Arasaka Cyberdeck")
    drone = DroneDeVigilancia("6767")

    celula = CelulaHacker("Phantom", [netrunner, drone])

    celula.iniciar_ataque()

    # Tentativa de instanciar diretamente uma classe abstrata:
    # unidade = IUnidades()
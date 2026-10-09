class Persona:
    def __init__(self, nome, arcano):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona invocada: {self.nome} | arcano: {self.arcano}")

class Aliado:
    def __init__(self, nome, codinome):
        self.nome = nome
        self.codinome = codinome
        

class Lider:
    def __init__(self, codinome):
        self.codinome = codinome
        # COMPOSIÇÃO:
        # A Persona é criada dentro do Lider e pertence a ele.
        self.persona = Persona("Arsène", "Louco")

        # AGREGACÃO:
        # A equipe começa vazia e recebe aliados que já existiam
        # independentemente do Lider.
        self._equipe = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"{aliado.codinome} foi recrutado para os Phantom Thieves!")

    def infiltrar(self, palacio):
        print(f"\n{self.codinome} invadiu o Palácio de {palacio}!")

        self.persona.invocar()

        print("--- Equipe dos Phantom Thieves ---")

        if not self._equipe:
            print("A equipe está vazia.")
        else:
            for aliado in self._equipe:
                print(f"{aliado.codinome} ({aliado.nome})")

#Main

aliado1 = Aliado("Ryuji Sakamoto", "Skull")
aliado2 = Aliado("Ann Takamaki", "Panther")

joker = Lider("Joker")

joker.recrutar(aliado1)
joker.recrutar(aliado2)

joker.infiltrar("Kamoshida")
class HeroiOverwatch:
    def __init__(self, codinome, funcao):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} usou sua suprema!")

class HeroiTanque(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} usou sua suprema de tanque!")

class HeroiSuporte(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} usou sua suprema de suporte!")

    def curar_equipe(self):
        print(f"{self.codinome} curou equipe")

#Main

equipe : list[HeroiOverwatch] = [
    HeroiOverwatch("Reaper", "Dano"),
    HeroiTanque("Reinhardt","Tanque"),
    HeroiSuporte("Ana","Suporte")
]

for heroi in equipe:
    heroi.usar_suprema()

    if isinstance(heroi, HeroiSuporte):
        heroi.curar_equipe()
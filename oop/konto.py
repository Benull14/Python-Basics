class Bankkonto:
    def __init__(self, inhaber, kontostand):
        self.inhaber = inhaber
        self.kontostand = kontostand

    def einzahlen(self, betrag):
        self.kontostand += betrag     

    def info(self):
        return "Der Inhaber ist " + self.inhaber + " und der Kontostand ist: " + str(self.kontostand)   


konto_1 = Bankkonto("Max Mustermann", 200)

print(konto_1.info())

konto_2 = Bankkonto("Anna", 300)

print(konto_2.info())

konto_1.einzahlen(50)

print(konto_1.info())
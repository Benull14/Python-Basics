class Bankkonto:
    def __init__(self, inhaber, kontostand):
        self.__inhaber = inhaber
        self.__kontostand = kontostand

    def einzahlen(self, betrag):
        self.__kontostand += betrag         

    def abheben(self, betrag):
        if self.__kontostand >= betrag:
            self.__kontostand = self.__kontostand - betrag # self.__kontostand -= betrag
        else:
            print("Nicht genügend Guthaben auf dem Konto!")
            print(self.info())     

    def info(self):
        return "Der Inhaber ist " + self.__inhaber + " und der Kontostand ist: " + str(self.__kontostand)  


konto_1 = Bankkonto("Max Mustermann", 200)

konto_1.abheben(200)

print(konto_1.info())


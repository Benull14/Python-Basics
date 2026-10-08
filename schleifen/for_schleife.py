for zahl in range(1, 5, 2):
    print(zahl)

warenkorb = ["Tastatur", "Maus", "Headset"]

for produkt in warenkorb:
    print(produkt)

eingabe = ""
while eingabe != "stop":
    eingabe = input("Wert: ")
    print("Deine Eingabe ist: " + eingabe)    
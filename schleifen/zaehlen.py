

liste_zahlen = [1, 1, 1, 1, 2, 3, 4, 6, 4, 2, 1, 3, 1, 2, 4]

anzahl = 0

for zahl in liste_zahlen:
    if zahl == 1:
        anzahl = anzahl + 1 # anzahl += 1

print(anzahl)
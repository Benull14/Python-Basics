aufgabenliste = ["Unterricht", "Meeting", "Vorstellungsgespräch"]

print("\n")
print(aufgabenliste)

print("\n")
print("----------append----------")

aufgabenliste.append("Email")
print(aufgabenliste)

print("\n")
print("----------ersetzen----------")

aufgabenliste[1] = "Protokoll"
print(aufgabenliste)

print("\n")
print("----------remove----------")

aufgabenliste.remove("Unterricht")
print(aufgabenliste)

print("\n")
print("----------pop----------")

aufgabenliste.pop(0)
print(aufgabenliste)

print("\n")
print("----------sort----------")

aufgabenliste.sort()
print(aufgabenliste)

print("\n")
print("----------insert----------")

aufgabenliste.insert(1, "Bericht")
print(aufgabenliste)
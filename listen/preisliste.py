preisliste = [20.00, 30.00, 19.99, 5.99, 10.99]

for preis in preisliste:
    print(preis)

print ("--------------------")

for i in range(len(preisliste)):
    print(preisliste[i]) # Werte werden ausgegeben

print ("--------------------")
for i in range(len(preisliste)):
    print(i) # indizes werden ausgegeben

print ("--------------------")

for i, preis in enumerate(preisliste):
    print(i, preis)  # Wert und Index werden ausgegeben


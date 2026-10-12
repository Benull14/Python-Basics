

def zaehle_vorkommen(liste, wert):
    zaehler = 0

    for element in liste:
        if element == wert:
            zaehler += 1 # zaehler = zaehler + 1

    return zaehler



assert zaehle_vorkommen([1,1,1,2,3,5,23,"1"], 1) == 3
assert zaehle_vorkommen([], 5) == 0
assert zaehle_vorkommen([1,1,1,2,3,4,23,"5"], 5) == 0

print("Alle Tests bestanden!")

print(zaehle_vorkommen(["ba", "a", "b", "b","b","b","B"], "b"))
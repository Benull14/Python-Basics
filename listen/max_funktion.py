

def maximum(liste):

    max_wert = liste[0] # Erster Wert der Liste als Startwert speichern
    for zahl in liste:
        if zahl > max_wert:
            max_wert = zahl
    
    return max_wert


print(maximum([1, 555, 232, 5122, 11, 23, 32]))    
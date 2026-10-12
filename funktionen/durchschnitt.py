

def durchschnitt(zahlen):
    summe = sum(zahlen)
    anzahl = len(zahlen)

    try:
        return summe / anzahl
    except ZeroDivisionError:
        print("Es ist eine Leere Liste: Division durch null")

# return durchschnitt

def durchschnitt_2(zahlen):
    return sum(zahlen) / len(zahlen)


assert durchschnitt([2,4,6]) == 4.0
assert durchschnitt_2([2,4,6]) == 4.0

print("Tests bestanden!!!")

print(durchschnitt([]))

print(durchschnitt([1,4,5]))

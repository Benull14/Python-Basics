
def zaehle_gerade(zahlen):
    anzahl = 0

    for zahl in zahlen:
        if zahl % 2 == 0:
            anzahl += 1 # anzahl = anzahl + 1
    return anzahl

assert zaehle_gerade([]) == 0
assert zaehle_gerade([1, 3, 5, 7, 9]) == 0
assert zaehle_gerade([2, 4, 6, 8, 10]) == 5

print("Alle Tests bestanden!")


# print(zaehle_gerade([4, 7, 10, 11, 32, 314, 22, 12, 321]))


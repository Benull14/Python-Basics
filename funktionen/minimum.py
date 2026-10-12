

def min(zahlen):
    kleinste = zahlen[0]
    
    for element in zahlen: 
        if kleinste > element:
            kleinste = element

    return kleinste



print(min([2, 32, 31,2,1321,321,32,3,123,21,3123,21321, 0]))             
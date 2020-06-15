"""
# Programación  Lógica



# Modus ponendo ponens

"el modo que, al afirmar, afirma"

P → Q. P ∴ Q


Se puede encadenar usando algunas variables

P → Q. 
Q → S. 
S → T. P ∴ T

Ejercicio 
Defina una funcion que resuelva con verdadero o falso segun corresponada

Laura esta en Queretaro
Alena esta en Paris
Claudia esta en San Francisco
Queretaro esta en Mexico
Paris esta en Francia
San Francisco esta en EUA
Mexico esta en America
Francia esta en Europa
EUA esta en America

def esta(E1,E2):
	pass


print(esta("Alena","Europa"))
# true

print(esta("Laura","América"))
# true

print(esta("Laura","Europa"))
# false



"""

Base = [
	["Laura","Querétaro"],
	["EUA","América"],
    ["Alena","París"],
    ["Claudia","San Francisco"],
    ["Querétaro","México"],
    ["París","Francia"],
    ["San Francisco","EUA"],
    ["México","América"],
    ["Francia","Europa"]
]

def encuentra(a,B,pos):
    if not a:
        return -1
    C = a[0][0]
    if B == C:
        return pos
    else:
        return encuentra(a[1:],B,pos+1)
    
def buscar(Num,a,L):
    print(Num)
    if Num[0] < 0:
        return False
    else:
        lugar = a[Num[0]][1]
        if L == lugar:
            return True
        else:
            return buscar([encuentra(Base,lugar,0)],Base,L)

def esta(P,L):
    return buscar([encuentra(Base,P,0)],Base,L)
    
print(esta("Alena","Europa"))
# true

print(esta("Laura","América"))
# true

print(esta("Laura","Europa"))
# false

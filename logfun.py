"""
	https://www.computrabajo.com.mx/ofertas-de-trabajo/oferta-de-trabajo-de-desarrollador-batch-exp-sistemas-abiertos-en-queretaro-601BC72F6CEBB0F761373E686DCF3405
	En una empresa solicitan Lic./Ing. en Sistemas, Computación o afín.
	con los siguientes requisitos:
	• Oracle BBDD

	• SQL y PL/SQL

	• Linux

	• Unix

	• Shell (Linux - Unix)

	• C++, Proc*C y Tuxedo V12 o anteriores

	• Visual Basic 6.0

	• Java (Frameworks) , Web Services y Micro Servicios APIs
	
	Realizar un programa que realice preguntas al usuario
	y que apartir de sus respuestas evalue si es cadidato o no
	
	(usen conjuntos)

"""

Requisitos = {
	"Oracle","SQL/PL","Linux","Unix","Shell","C++",
	"Proc*C","TuxedoV12", "VB6", "Java","WebServices","MicroServicios"
} 

ps = set()
def pregunta(a):
    print(a)
    if a != "NO":
        print("¿Que lenguaje de programacion conoces/BD/SO?")
        l = input()
        ps.add(l)
        print("Si ya terminaste de escribir los lenguajes que conoces escribe NO")
        p = input()
        pregunta(p)
pregunta("SI")

if(len(Requisitos & ps) == 12):
    print("Felicidades eres candidato")
else:
    print("Lo sentimos pero no eres candidato")
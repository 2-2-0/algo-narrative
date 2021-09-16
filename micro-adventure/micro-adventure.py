# micro adventure
# algorithmic narrative lab
# Text adventure mechanism
# by 220 & AA (2019) GPLv3 license
# uses map, objects and text catalogs, as well as basic states

import random

mapa_casa = [
    ("estudio", None, 2, None, None, "Estás en un estudio muy pequeño"),
    ("recámara", None, 4, 2, None, "La recámara es pequeña y húmeda"),
    ("sala", 0, 5, 3, 1, "La sala es acogedora pero oscura"),
    ("entrada", None, None, None, 2, "La recepción es pequeña y sombría"),
    ("baño", 1, None, 5, None, "El baño está sucio y frio"),
    ("comedor", 2, None, 6, 4, "El comedor está vacío"),
    ("cocina", None, None, None, 5, "Hay muchas cucarachas en la cocina")
]
objetos_casa = [
    # descripcion, ubicación, estado
    #ha sido leído?
    ("libro", 0, False, 'l', "hay un misterioso libro viejo\n(leer)"),
    #se puede abrir
    ("puerta", 3, False, 'a', "hay una macabra puerta frente a ti\n(abrir)"),
    ("tocadiscos", 2, False, 'p', "hay un tocadiscos girando\n(oprimir)")
]
quejidos = ["Ouch!", "Bump!", "Klunk!", "Tunk!", "Ow!", "Duh!", "Ay!"]

ubicacion = 2
cuarto = None
posibilidades = None
opciones = None

def describeLocacion ():
    global ubicacion
    global cuarto
    global posibilidades
    global opciones

    posibilidades = ""
    opciones = ""

    cuarto = mapa_casa [ubicacion]
    pnorte = cuarto [1]
    psur = cuarto [2]
    peste = cuarto [3]
    poeste = cuarto [4]
    desc = cuarto [5]

    print (desc)

    for objeto in objetos_casa:
        if objeto [1]==ubicacion:
            opciones=opciones+objeto [3]
            desc_objeto = objeto [4]
            print (desc_objeto)


    status_tocadiscos = objetos_casa [2][2]
    if (status_tocadiscos==True):
        print ("Se escucha música macabra...")

    if (pnorte!=None):
        posibilidades=posibilidades+"n"
    if (psur!=None):
        posibilidades=posibilidades+"s"
    if (peste!=None):
        posibilidades=posibilidades+"e"
    if (poeste!=None):
        posibilidades=posibilidades+"o"

    posibilidades = posibilidades+opciones


def cambiarLocacion (direccion):
    global ubicacion
    global cuarto

    siguiente_destino = None

    # obtener siguiente destino del mapa
    if direccion=='n':
        siguiente_destino = cuarto [1]

    if direccion=='s':
        siguiente_destino = cuarto [2]

    if direccion=='e':
        siguiente_destino = cuarto [3]

    if direccion=='o':
        siguiente_destino = cuarto [4]

    if (siguiente_destino==None):
        indice_quejido = random.randint (0, len (quejidos)-1)
        quejido = quejidos [indice_quejido]
        print (quejido)
    else:
        ubicacion = siguiente_destino


def interaccionesCuarto (comando):
    global ubicacion
    global opciones

    # personalizar al gusto
    for objeto in objetos_casa:
        if (comando==objeto [3] and ubicacion==objeto [1]):
            print ("Activas {0}".format (objeto [0]))


def interprete (comando):
    global opciones

    # cambiar de cuarto
    if comando in ['n', 's', 'e', 'o']:
        cambiarLocacion (comando)

    # opciones de objetos
    if comando in opciones:
        interaccionesCuarto (comando)



while True:
    describeLocacion ()

    #posibilidades = "n/s/e/o"
    posibilidades = "({0}): ".format (posibilidades)
    eleccion = input (posibilidades)
    interprete (eleccion)

from queue import Queue as Cola
def copia_cola(cola:Cola[tuple[str,str]])->Cola[tuple[str,str]]:
    copia_c:Cola[tuple[str,str]]=Cola()
    elementos:list[tuple[str,str]]=[]
    while cola.empty()==False:
        elementos.append(cola.get())
    for i in range(len(elementos)-1,-1,-1):
        copia_c.put(elementos[i])
        cola.put(elementos[i])
    return copia_c

def lista_a_cola(lista:list[tuple[str,str]])->Cola[tuple[str,str]]:
    cola:Cola[tuple[str,str]]=Cola()
    for i in range(len(lista)-1,-1,-1):
        cola.put(lista[i])
    return cola

# diccionario1={1:2,3:4}
# print(copia_dict(diccionario1))
# print(diccionario1)
# cola1=lista_a_cola([1,2,3,4,5,6])
# cola2=lista_a_cola([7,8,9,0,1,2])
# print(ver_cola(cola1))
# print(ver_cola(cola2))
# print(ver_cola(copia_cola(cola1)))
# print(ver_cola(copia_cola(cola2)))
# Ejercicio 1
def es_vip(tupla:tuple[str,str])->bool:
    res:bool=False
    if tupla[1]=="vip":
        res=True
    return res

def reordenar_cola_priorizando_vips(fila_clientes: Cola[tuple[str,str]]) -> Cola[tuple[str,str]]:
    copia_c:Cola[tuple[str,str]]=copia_cola(fila_clientes)
    elementos:list[tuple[str,str]]=[]
    lista_vip:list[str]=[]
    lista_comun:list[str]=[]
    while copia_c.empty()==False:
        elementos.append(copia_c.get())
    for i in range(len(elementos)):
        if es_vip(elementos[i]):
            lista_vip.append(elementos[i])
        else:
            lista_comun.append(elementos[i])
    cola_reordenada:Cola[tuple[str,str]]=lista_a_cola(lista_comun+lista_vip)
    return cola_reordenada

#cola1=lista_a_cola([("Juan","vip"),("pepe","vip"),("maria","comun"),("Lucas","vip"),("Marta","comun")])
#print(ver_cola(reordenar_cola_priorizando_vips(cola1)))
def jugador1_versus_jugador2(jugador1:str,jugador2:str,puntos_jugador1:int)->int:
    if jugador1[1]=="me desvio siempre" and jugador2[1]=="me desvio siempre":
        puntos_jugador1=-10
    elif jugador1[1]=="me desvio siempre" and jugador2[1]=="me la banco y no me desvio":
        puntos_jugador1=-15
    elif jugador2[1]=="me desvio siempre" and jugador1[1]=="me la banco y no me desvio":
        puntos_jugador1=10
    else:
        puntos_jugador1=-5
    res:int=puntos_jugador1
    return res

def todos_contra_mi(jugador:tuple[str,str],lista_jugadores:list[tuple[str,str]])->int:
    puntos_jugador:int=0
    jugadores_menos_jugador:list[str,str]=[]
    for i in range(len(lista_jugadores)):
        if lista_jugadores[i]!=jugador:
            jugadores_menos_jugador.append(lista_jugadores[i])
    for i in range(len(jugadores_menos_jugador)):
        puntos_jugador+=jugador1_versus_jugador2(jugador,jugadores_menos_jugador[i],puntos_jugador)
    return puntos_jugador

# Ejercicio 2
def torneo_de_gallinas(estrategias: dict[str,str]) -> dict[str,int]:
    res:dict[str,int]={}
    lista_jugadores_y_estrategias:list[tuple[str,str]]=list(estrategias.items())
    for i in range(len(lista_jugadores_y_estrategias)):
        res[lista_jugadores_y_estrategias[i][0]]=todos_contra_mi(lista_jugadores_y_estrategias[i],lista_jugadores_y_estrategias)
    return res

#diccionario={"Shrek":"me la banco y no me desvio","Sonic":"me desvio siempre","Higuaín":"me la banco y no me desvio","BuzzLightyear":"me desvio siempre","Pepe":"me la banco y no me desvio","Messi":"me desvio siempre","Kaká":"me la banco y no me desvio","cr7":"me desvio siempre"}
#diccionario={"Shrek":"me la banco y no me desvio","Sonic":"me desvio siempre","Higuaín":"me la banco y no me desvio","Pelé":"me la banco y no me desvio"}
#print(torneo_de_gallinas(diccionario))

# Ejercicio 3
def quien_gano_el_tateti_facilito(tablero: list[list[str]]) -> int:
    contador_X_ganadora:int=0
    contador_O_ganadora:int=0
    i:int=0
    j:int=0
    res:int=0
    while i+2<=len(tablero)-1:
        condicion_ganadora=False
        while j<len(tablero[i]):
            if tablero[i][j]=="X" and tablero[i+1][j]=="X" and tablero[i+2][j]=="X":
                contador_X_ganadora+=1
                j+=1
                condicion_ganadora=True
            elif tablero[i][j]=="O" and tablero[i+1][j]=="O" and tablero[i+2][j]=="O":
                contador_O_ganadora+=1
                j+=1
                condicion_ganadora=True
            else:
                j+=1
        j=0
        i+=1
    if contador_X_ganadora>contador_O_ganadora and contador_O_ganadora==0:
        res=1
    elif contador_O_ganadora>=contador_X_ganadora and contador_X_ganadora>=1:
        res=3
    elif contador_O_ganadora>contador_X_ganadora and contador_X_ganadora==0:
        res=2
    return res
#[
# ["X","O","X","O","X"]
# ["O","X","O","X","X"]
# ["X","O","O","X","O"]
# ["X","O","X","O","O"]
# ["X","X","O","X","X"]
# ["O","X","O","X","X"]
# ]
#[
# ["X","O","X","O","X"]
# ["O","X","O","X","X"]
# ["X","O","O","X","O"]
# ["O","O","X","O","O"]
# ["X","X","O","X","O"]
# ["O","X","O","X","X"]
# ]
#[
# ["X","O","X","O","X"]
# ["O","X","O","X","X"]
# ["X","O","O","X","O"]
# ["X","O","X","O","O"]
# ["X","X","O","X","O"]
# ["O","X","O","X","X"]
# ]
#[
# ["X","O","X","O","X"]
# ["O","X","O","X","X"]
# ["X","O","O","X","O"]
# ["O","O","X","O","O"]
# ["X","X","O","X","X"]
# ["O","X","O","X","X"]
# ]
#tablero=[["X","O","X","O","X"],["O","X","O","X","X"],["X","O","O","X","O"],["O","O","X","O","O"],["X","X","O","X","O"],["X","X","O","X","O"]]
#print(quien_gano_el_tateti_facilito(tablero))
# Ejercicio 4
def es_palindromo(string:str)->bool:
    der_a_izq:str=""
    for j in range(len(string)-1,-1,-1):
        der_a_izq+=string[j]
    res:bool = string==der_a_izq
    return res
#print(es_palindromo("neuquen"))
def crear_palabra_a_partir(posicion:int,string:str)->str:
    string_nuevo=""
    while posicion<len(string):
        string_nuevo+=string[posicion]
        posicion+=1
    return string_nuevo
#print(crear_palabra_a_partir(1,"Diego"))
def sufijos(string:str)->list[str]:
    lista_sufijos:list[str]=[]
    for i in range(len(string)):
        lista_sufijos.append(crear_palabra_a_partir(i,string))
    return lista_sufijos
#print(sufijos("Diego"))
def cuantos_sufijos_son_palindromos(texto: str) -> int:
    contador:int=0
    for i in range(len(sufijos(texto))):
        if es_palindromo(sufijos(texto)[i])==True:
            contador+=1
    return contador
#print(cuantos_sufijos_son_palindromos("Diego"))



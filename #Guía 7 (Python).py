#Guía 7 (Python)
# para especificaciones:
# in : es solo de lectura, NO PUEDO MODIFICAR SU VALOR.
# out: es solo de salida , NO ME INTERESA SU VALOR INICIAL, ME INTERESA CAMBIARLO NADA MÁS.
# inout: es de entrada y salida, ME INTERESA SU VALOR INICIAL Y LO CAMBIO.
#Ejercicio 1.3
import random
import numpy as np
def suma_total(s:list[int])->int:
    x=0
    for i in range (len(s)):
        x+=s[i]
    return x
suma_total([1,2,3])

#Ejercicio 1.1
#primera forma de implementación
def pertenece (s:list[int],e:int)->bool:
    res:bool = True
    i=0
    while i<=len(s)-1:
        if e==s[i]:
            return res
        else:
            i+=1
    return not res

#segunda forma de implementación
def pertenece_2 (s:list[int],e:int)->bool:
    res:bool = True
    for i in range (len (s)):
        if e==s[i]:
            return res
    return not res

#tercera forma de implementación
def pertenece_3(s:list[int],e:int)->bool:
    res:bool = True
    i=1
    while e!=s[i-1] and i<=len(s)-1:
        i+=1
    if i>len(s)-1:
        return not res
    else: 
        return res
    
#Respuesta a la pregunta de implementar esta función con tipos genéricos:
def pertenece_generico(s,e):
    res:bool = True
    for i in range (len(s)):
        if e==s[i]:
            return res
    return not res
#print(pertenece_generico("pena"))

#Ejercicio 1.7
abecedario_min =['a','b','c','d','e','f','g','h','i','j','k','l','m','n','ñ','o','p','q','r','s','t','u','v','w','x','y','z']
abecedario_may =['A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O','P','Q','R','S','T','U','V','W','X','Y','Z']
def hay_numero(s:str)->bool:
    i=0
    while i<len(s) and not (s[i]>= '0' and s[i]<='9'): 
        i+=1
    res:bool = i<len(s)
    return res
#print(hay_numero("mam"))

def hay_mayuscula(s:str)->bool:
    i=0
    while i<len(s) and not (s[i]>= 'A' and s[i]<='Z'): 
        i+=1
    res:bool = i<len(s)
    return res

#print(hay_mayuscula("Mama"))
def hay_minuscula(s:str)->bool:
    i=0
    while i<len(s) and not (s[i]>= 'a' and s[i]<='z'): 
        i+=1
    res:bool = i<len(s)
    return res
    
# Nota: ESTÁ BUENÍSIMO EL USO DEL CÓDIGO ASCII!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# MUY BUEN DATO: si quiero hacer debugging en una línea <-> se cumple una condición -> click derecho en el breakpoint y "editar punto de interrupción" (es la segunda opción).
# NOTA: a los profes no les gusta mucho meter varios return en las funciones, luego vuelvo a hacer todas las implementaciones sin los return.

def fortaleza (c:str)->str:
    res:str = "VERDE"
    if len (c) >8 and hay_mayuscula(c) and hay_minuscula(c) and hay_numero(c):
        res=res
    elif len (c)<5:
        res = "ROJA"
    else: 
        res = "AMARILLO"
    return res
    
#print (fortaleza("ALAKLSJFJASGFJKEKAHGFJKSF"))

def ordenados (s:list [int]) -> bool:
    res:bool = True
    i=0
    while res and i+1 <len(s):
        if s[i] < s[i+1]:
            res=res
            i+=1
        else:
            res=False
    return res

#print(ordenados([1,2,3,1]))

def lenMayorA7(s:list[str])->bool:
    res:bool = False
    i=0
    while res==False and i<len(s):
        if len(s[i])<=7:
            res=res
            i+=1
        else:
            res=True
    return res

#print(lenMayorA7(["mama","papa","1234567","12345678"]))
# def posicion(c,s:str)->int:
#     res:int =0
#     while res<len(s) and s[res]!=c:
#         res+=1
#     return res
# #print(posicion('s',"papas"))
# def pasarAMinuscula(s:str)->str:
#     res:str = "MAMA"
#     i=0
#     while i<len(s):
#         if pertenece_generico(abecedario_may,res[i]):
#             res[i]=abecedario_min[posicion(res[i],abecedario_may)]
#             i+=1
#         else:
#             i+=1
#     return res

# print(pasarAMinuscula("MAMA"))
def esPalindromo(s:str)->bool: # ojo que no reconoce a mayusculas y minusculas por igual.
    res:bool = True
    i=0
    j=1
    while res==True and i<len(s):
        if s[i]==s[len(s)-j]:
            res=res
            i+=1
            j+=1
        else:
            res=False
    return res
#print(esPalindromo("mafam"))

def saldo_actual(movimientos:list[tuple])->int:
    res:int = 0
    i=0
    j=0
    while i<len(movimientos):
        if movimientos[i][j]=='I':
            res+=movimientos[i][j+1]
            i+=1
        else:
            res-=movimientos[i][j+1]
            i+=1
    return res
#print(saldo_actual([('I',1000),('R',2000)]))
vocales=['a','e','i','o','u','A','E','I','O','U']
# def esVocal(s):
#     i=0
#     if pertenece_generico(vocales,s):
#         i+=1
#     else:
#         i=i
#     return i==1
#print(esVocal("moma"))
# def extraerVocales(s):
#     vocales=[]
#     for i in range (len(s)):
#         if esVocal(s[i]):
#             vocales.append(s[i])
#     return vocales

def cantidadRepeticiones(e,l):
    contador=0
    for i in range (len(l)):
        if l[i]==e:
            contador+=1
        else:
            contador+=0
    return contador
def seRepite(e,l):
    condicion=True
    if cantidadRepeticiones(e,l)>1:
        condicion=condicion
    else:
        condicion=False
    return condicion

def quitar_todos(e,l):
    lista=[]
    palabra_sin_el_elemento=""
    for i in range (len(l)):
        lista.append(l[i])
    for j in range (len(lista)):
        if lista[j]==e:
            lista[j]=""
    for k in range (len(lista)):
        palabra_sin_el_elemento+=lista[k]
    return palabra_sin_el_elemento

def sacarRepetidos(l):
    lista=[]
    for i in range (len(l)):
        if pertenece_generico(lista,l[i])==False:
            lista.append(l[i])
    return lista

def tresvocales(s:str)->bool:
    res:bool =False
    if len(sacarRepetidos(s))>=3:
        res=True
    else:
        res=res
    return res
#print(tresvocales("alksjdhfvnalkwjeth vfnqlaseidhflsvdrjkg dqvthad"))

# segunda parte
def par_a_cero(l:list[float])->list[float]:
    res:list[float] = l
    for i in range (0,len(res),2):
        res[i]=0.0
    return res

# print(f"estado de l con par a cero: {l}, resultado de par_a_cero(l): {par_a_cero(l)}, estado de l luego de hacer par_a_cero(l): {l}")

def par_a_cero_copy(l:list[float])->list[float]:
    res:list[float] = l.copy()
    for i in range (0,len(res),2):
        res[i]=0.0
    return res
# print()
# print(f"estado de l1 con par a cero: {l1}, resultado de par_a_cero_copy(l1): {par_a_cero_copy(l1)}, estado de l1 luego de hacer par_a_cero(l1): {l1}")

def sacar_vocales(s:str):
    res:str = ""
    for i in range (len(s)):
        if pertenece_generico(vocales,s[i])==False:
            res+=s[i]
    return res
#print(sacar_vocales("mama"))

def reemplaza_vocales(s:str)->str:
    res:str = ""
    for i in range (len(s)):
        if pertenece_generico(vocales,s[i])==True:
            res+="-"
        else:
            res+=s[i]
    return res
#print(reemplaza_vocales("pepito"))

def da_vuelta_str(s:str)->str:
    res:str = ""
    for i in range (len(s)-1,-1,-1):
        res+=s[i]
    return res
#print(da_vuelta_str("supercalifragilisticoespiralidoso"))

def eliminar_repetidos(l):
    palabra_sin_repetidos=""
    for i in range (len(l)):
        if pertenece_generico(palabra_sin_repetidos,l[i])==False:
            palabra_sin_repetidos+=l[i]    
    return palabra_sin_repetidos

def aprobado(notas:list[int])->int:
    res:int = 0
    todas_las_notas_mayores_a_4=True
    promedio=suma_total(notas)/len(notas)
    i=0
    while todas_las_notas_mayores_a_4==True and i<len(notas):
        if notas[i]>=4:
            todas_las_notas_mayores_a_4=True
            i+=1
        else:
            todas_las_notas_mayores_a_4=False    
    if todas_las_notas_mayores_a_4 and promedio>=7:
        res+=1
    elif todas_las_notas_mayores_a_4 and promedio<7 and promedio>=4:
        res+=2
    else:
        res+=3
    return res
#print(aprobado([10,10,4,4,4,6,7,8,9,10]))

def construir_lista():
    lista=[]
    estudiante=input("Ingrese el nombre del estudiante a agregar a la lista: ")
    while estudiante!="listo":
        lista.append(estudiante)
    return lista

def historial_monedero():
    historial=[]
    print("Bienvenido al historial de su cuenta")
    print()
    print("Le ofrecemos las siguientes opciones: ")
    print()
    print("Si quiere cargar créditos ingrese 'C'")
    print("Si quiere descontar créditos ingrese 'D'")
    print("Si quiere finalizar la simulación ingrese 'X'")
    print()
    condicion=True
    while condicion!=False:
        operacion=input("Indique la operación a realizar en su cuenta: ")
        if operacion=='C':
            print()
            monto_a_cargar=int(input("Ingrese  la cantidad de créditos a cargar en su cuenta: "))
            historial.append((operacion,monto_a_cargar))
        elif operacion=='D':
            print()
            monto_a_descontar=int(input("Ingrese la cantidad de créditos a descontar de su cuenta: "))
            historial.append((operacion,monto_a_descontar))
        else:
            condicion=False
    if historial==[]:
        devolver="No tiene movimiento en su cuenta"
    else:
        devolver=historial
    return devolver
#print(historial_monedero())

def siete_y_medio():
    print("¡Bienvenido al juego 7 y medio!")
    print()
    print("Por favor indique si quiere sacar una carta")
    condicion=True
    valores_cartas=[]
    suma_puntos=0
    for i in range (0,13):
        if i!=8 and i!=9:
            valores_cartas.append(i)
    while condicion==True:
        print()
        sacar_carta_cond=input("¿Desea sacar una carta o plantarte? (S/p): ")
        if sacar_carta_cond!='p':
            carta=random.choice(valores_cartas)
            if carta!=10 and carta!=11 and carta!=12:
                valor_carta=carta
            else:
                valor_carta=0.5
            suma_puntos+=valor_carta
            print()
            print(f"Has sacado la carta número {carta}, que tiene un  valor de {valor_carta}, llevas acumulados {suma_puntos} puntos")
            if suma_puntos>7.5:
                print()
                print(f"¡PARÁ! Has acumulado un total de {suma_puntos} puntos, eso significa que has perdido, pues te has pasado del límite de 7.5 puntos.")
                print()
                print("¡Muchas gracias por jugar!")
                print()
                seguir_juego=input("¿Deseas volver a jugar? (S/n): ")
                if seguir_juego!='n':
                    condicion=True
                    suma_puntos=0
                else:
                    condicion=False
        else:
            condicion=False
    print()
    return f"El total de puntos que sacaste en tu partida fue de {suma_puntos}"
#print(siete_y_medio())

def pertenece_a_cada_uno_version_1(s:list[list[int]],e:int)->list[bool]:
    res:list[bool] = []
    for i in range (len(s)):
        if pertenece_generico(s[i],e):
            res.append(True)
        else:
            res.append(False)
    return res
#print(pertenece_a_cada_uno_version_1([[1,2,3],[8,2,1],[3,5,2]],3))
#me da demasiada flojera hacer la versión 2 porque es literalmente la versión 1 que yo hice. Me la salteo.

def es_matriz(s:list[list[int]])->bool:
    res:bool =True
    if len(s)>0 and len(s[0])>0:
        i=0
        while res==True and i<len(s):
            if len(s[i])==len(s[0]):
                res=True
                i+=1
            else:
                res=False
    else:
        res=False
    return res
#print(es_matriz([[1,2,3,4]]))

def filas_ordenadas(m:list[list[int]])->list[bool]:
    res:bool = []
    for i in range (len(m)):
        res.append(ordenados(m[i]))
    return res
#print(filas_ordenadas([[1,2,3],[3,2,1],[4,5,6]]))

def algo_calculo_valor_de_posicion(fila_1,columna_2):
    lista_productos=[]
    for i in range(len(fila_1)):
        lista_productos.append(fila_1[i]*columna_2[i])
    sumatoria=suma_total(lista_productos)
    return sumatoria

def producto_de_fila_por_columna(matriz_1,matriz_2):
    nueva_columna=[]
    columna_momentanea=[]
    for i in range(len(matriz_2)):
        columna_momentanea.append(matriz_2[i][0])
    for i in range(len(matriz_1)):
        nueva_columna.append(algo_calculo_valor_de_posicion(matriz_1[i],columna_momentanea))
    return nueva_columna

# def crear_matriz(columnas):
#     res=[]
#     fila_temporal=[]
#     for i in range(len(columnas)):
#         for j in range (len(columnas[i])):
#             fila_temporal.append(columnas[i][j])
#         res.append(fila_temporal)
#         fila_temporal=[]
#     return res

def multiplicar_matriz_dxd_por_si_misma_p_veces(d:int,p:int)->list[list[int]]:
    m= np.random.random((d,d))**2
    columnas=[]
    for t in range (p):
        for i in range(len(m)):
            columnas.append(producto_de_fila_por_columna(m,m))
    return m,columnas

print(multiplicar_matriz_dxd_por_si_misma_p_veces(2,1))



# |2 1| |3 1|
# |1 2| |4 2|

# |s[0][0]*t[0][0]+s[0][1]*t[1][0]     s[0][0]*t[0][1]+s[0][1]*t[1][1]|
# |c3                                  c4|  

#tratar de implementar de esta manera: dejo una fila fija y luego me muevo a la siguiente columna. Prestar atención a los índices!

#si es una lista de tipo "out" entonces tengo que hacer lista.clear()
#si es inout no hagas el lista.clear porque vas a perder todos los datos iniciales que necesitabas

#PARA INSTALAR MYPY.
# python -m mypy <nombre del archico> # ESTO ES PARA USAR MYOY EN LA TERMINAL
# pip3 -m pip install mypy (linux)
# python-m pip install mypy
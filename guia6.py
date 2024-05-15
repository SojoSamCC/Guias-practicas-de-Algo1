import math
# Ejericios de la clase práctica
# Ejercicio 1
# 1.1
def imprimir_hola_mundo():
    print ("Hola Mundo")
    return

#1.5
def perimetro():
    print (2*math.pi)
    return
#print(perimetro())

#Ejercicio 2
# 5
def es_multiplo_de(n: int,m: int) -> bool:
    return n%m==0
#print (es_multiplo_de(3,2))
# a los profes les gusta escribir todo con tipos
def es_multiplo_de_2(n:int,m:int):
    res:bool = (n%m==0)
    return res

#Ejercicio 3
def es_nombre_largo(nombre: str):
    return (len(nombre)>=3 and len(nombre)<=8)
#print(es_nombre_largo("Lerry"))

#Ejercicio 5
def devolver_el_doble_si_es_par(n:int):
    if n%2==0:
        return 2*n
    else:
        return n

#print(devolver_el_doble_si_es_par(3))

# Ejercicio 6
# 2
def pares_entre_10_y_40():
    i=10
    while i<=40:
        print(i)
        i+=2
    return 

#print(pares_entre_10_y_40())

# 4
def cuenta_regresiva(n:int):
    while n>=1:
        print(n)
        n-=1
    return "Despegue"

#print(cuenta_regresiva(10))

# Ejercicio 7
def pares_entre_10_y_40_for():
    for n in range (10,41,2):
        print(n)
    return
#print(pares_entre_10_y_40_for())
def cuenta_regresiva_for(num:int):
    for num in range (num,0,-1):
        print(n)
    return "Despegue"
#print(cuenta_regresiva_for(3))

# Ejercicios de la guía

#Ejercicio 1
# 2
def imprimir_un_verso():
    return "I know the pieces fit\n'Cause I watched them fall away\nMildewed and smouldering\nFundamental differingn\nPure intention juxtaposed\nWill set two lovers' souls in motion\nDisintegrating as it goes\nTesting our communication"
#print (imprimir_un_verso())

#3
def raizDe2():
    return math.sqrt(2)
#print(raizDe2())

#4
def factorial_de_dos():
    return 2

#Ejercicio 2
def imprimir_un_saludo(nombre:str):
    return f"Hola {nombre}"
#print (imprimir_un_saludo("Juan"))

def raiz_cuadrada_de_un_numero(n:int):
    return math.sqrt(n)
#print(raiz_cuadrada_de_un_numero(49))

def farenheit_a_celsius(temp_farenheit:int):
    return ((temp_farenheit-32)*5)/9

#print(farenheit_a_celsius(100))

def imprimir_dos_veces(estribillo:str):
    return 2*estribillo 
#print(imprimir_dos_veces("Tequila"))

def es_par(num:int):
    return es_multiplo_de(num,2)
#print(es_par(4))

def cantidad_de_pizzas(comensales:int,min_cant_de_porciones:int):
    return (comensales*min_cant_de_porciones)/8

#Ejercicio 3
def alguno_es_0(num1:int,num2:int):
    return num1==0 or num2==0

def ambos_son_0(num1:int,num2:int):
    return num1==0 and num2==0

def es_bisiesto(año:int):
    return es_multiplo_de (año,4) and (not es_multiplo_de(año,100))
#print(es_bisiesto(2023))

# Ejercicio 4
def peso_pino(altura_en_metros:int):
    if altura_en_metros<=3:
        return altura_en_metros*100*3
    else:
        return 900+(altura_en_metros-3)*100*2
#print (peso_pino(5))

def es_peso_util(peso:int):
    return peso>=min(400,1000) and peso<=max(400,1000)

def sirve_pino(altura:int):
    return es_peso_util(peso_pino(altura))
#print(sirve_pino(3))

#Ejercicio 5
# 2
def devolver_valor_si_es_par_sino_el_que_sigue(num1:int):
    if es_par(num1):
        return num1
    else:
        return num1+1
# 3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(num1:int):
    if es_multiplo_de (num1,3):
        return num1*2
    elif es_multiplo_de(num1,9):
        return num1*3
    else: 
        return num1

# 4
def lindo_nombre(nombre):
    if len (nombre)>=5:
        return "Tu nombre tiene muchas letras!"
    else: 
        return "Tu nombre tiene menos de 5 caracteres"

# 5
def el_rango(n:int):
    if n<5:
        return "Menor a 5"
    elif n>=10 and n<=20:
        return "Entre 10 y 20"
    else:
        return "Mayor a 20"
# a los profes no les gusta el elif, les gusta hacer un if dentro de un else
# ejemplo: if ...:
#          else:
#             if ...:

# 6
def vacaciones_o_trabajo(sexo:str,edad:int):
    if (sexo=="F" or sexo=="f" or sexo=="Femenino" or sexo=="fem") and (edad >=18 and edad<60):
        return "Te toca trabajar"
    elif (sexo=="M" or sexo=="m" or sexo=="Masculino" or sexo=="masc") and (edad>=18 and edad<65):
        return "Te toca trabajar"
    else:
        return "Andá de vacaciones"

# Ejericicio 6
def numeros_del_1_al_10() -> None:
    i=1
    while i<=10:
        print(i)
        i+=1
    return
#print(numeros_del_1_al_10())

def eco_por_10():
    i+=1
    while i<=10:
        print("eco")
        i+=1
    return



def viaje_en_el_tiempo(año_de_partida:int,año_de_llegada:int) -> None:
    año_de_partida_2=año_de_partida
    while año_de_partida_2!=año_de_llegada:
        print(f"Viajó un año al pasado, estamos en el año {año_de_partida_2-1}")
        año_de_partida_2-=1

#print(viaje_en_el_tiempo(2024,2020))

def viaje_en_el_tiempo_Aristoteles(año_de_partida:int) ->None:
    año_de_partida_2=año_de_partida
    while año_de_partida_2>=-384:
        print(f"Viajó 20 años al pasado, estamos en el año {año_de_partida_2-20}")
        año_de_partida_2-=20
print(viaje_en_el_tiempo_Aristoteles(2024))

"""def otra_funcion(x:int) -> int:
    return x+1
#otra_funcion(10)
x:int =otra_funcion(10)
print(x)"""

#Guía 7 (Python)
# para especificaciones:
# in : es solo de lectura, NO PUEDO MODIFICAR SU VALOR.
# out: es solo de salida , NO ME INTERESA SU VALOR INICIAL, ME INTERESA CAMBIARLO NADA MÁS.
# inout: es de entrada y salida, ME INTERESA SU VALOR INICIAL Y LO CAMBIO.
#Ejercicio 1.3
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
    
